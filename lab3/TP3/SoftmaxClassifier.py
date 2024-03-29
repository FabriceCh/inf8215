from sklearn.base import BaseEstimator, ClassifierMixin
import numpy as np
import copy


class SoftmaxClassifier(BaseEstimator, ClassifierMixin):
    """A softmax classifier"""

    def __init__(self, lr=0.1, alpha=100, n_epochs=1000, eps=1.0e-5, threshold=1.0e-10, regularization=True,
                 early_stopping=True):

        """
            self.lr : the learning rate for weights update during gradient descent
            self.alpha: the regularization coefficient
            self.n_epochs: the number of iterations
            self.eps: the threshold to keep probabilities in range [self.eps;1.-self.eps]
            self.regularization: Enables the regularization, help to prevent overfitting
            self.threshold: Used for early stopping, if the difference between losses during
                            two consecutive epochs is lower than self.threshold, then we stop the algorithm
            self.early_stopping: enables early stopping to prevent overfitting
        """

        self.lr = lr
        self.alpha = alpha
        self.n_epochs = n_epochs
        self.eps = eps
        self.regularization = regularization
        self.threshold = threshold
        self.early_stopping = early_stopping

    """
        Public methods, can be called by the user
        To create a custom estimator in sklearn, we need to define the following methods:
        * fit
        * predict
        * predict_proba
        * fit_predict        
        * score
    """

    """
        In:
        X : the set of examples of shape nb_example * self.nb_features
        y: the target classes of shape nb_example *  1

        Do:
        Initialize model parameters: self.theta_
        Create X_bias i.e. add a column of 1. to X , for the bias term
        For each epoch
            compute the probabilities
            compute the loss
            compute the gradient
            update the weights
            store the loss
        Test for early stopping

        Out:
        self, in sklearn the fit method returns the object itself


    """

    def fit(self, X, y=None):

        prev_loss = np.inf
        self.losses_ = []

        self.nb_feature = X.shape[1]
        self.nb_classes = len(np.unique(y))

        X_bias = np.hstack((X, np.ones((X.shape[0], 1))))

        self.theta_ = np.random.rand(self.nb_feature + 1, self.nb_classes)

        for epoch in range(self.n_epochs):

            probabilities = self.predict_proba(X, y)

            loss = self._cost_function(probabilities, y)
            self.theta_ -= self.lr * self._get_gradient(X_bias, y, probabilities)

            self.losses_.append(loss)

            if self.early_stopping:
                if abs(prev_loss - loss) < self.threshold:
                    break

            prev_loss = loss

        return self

    """
        In: 
        X without bias

        Do:
        Add bias term to X
        Compute the logits for X
        Compute the probabilities using softmax

        Out:
        Predicted probabilities
    """

    def predict_proba(self, X, y=None):
        try:
            getattr(self, "theta_")
        except AttributeError:
            raise RuntimeError("You must train classifer before predicting data!")
        X_bias = np.hstack((X, np.ones((X.shape[0], 1))))
        logits_matrix = np.dot(X_bias, self.theta_)
        probabilities = np.empty((0, 3), float)
        for row in logits_matrix:
            probabilities = np.vstack([probabilities, self._softmax(row)])

        return probabilities

    """
        In: 
        X without bias

        Do:
        Add bias term to X
        Compute the logits for X
        Compute the probabilities using softmax
        Predict the classes

        Out:
        Predicted classes
    """

    def predict(self, X, y=None):
        probabilities = self.predict_proba(X)
        predicted_classes = np.empty(0)
        for row in probabilities:
            predicted_classes = np.append(predicted_classes, np.argmax(row))
        return predicted_classes

    def fit_predict(self, X, y=None):
        self.fit(X, y)
        return self.predict(X, y)

    """
        In : 
        X set of examples (without bias term)
        y the true labels

        Do:
            predict probabilities for X
            Compute the log loss without the regularization term

        Out:
        log loss between prediction and true labels

    """

    def score(self, X, y=None):
        probas = self.predict_proba(X)
        self.regularization = False
        return self._cost_function(probas, y)

    """
        Private methods, their names begin with an underscore
    """

    """
        In :
        y without one hot encoding
        probabilities computed with softmax

        Do:
        One-hot encode y
        Ensure that probabilities are not equal to either 0. or 1. using self.eps
        Compute log_loss
        If self.regularization, compute l2 regularization term
        Ensure that probabilities are not equal to either 0. or 1. using self.eps

        Out: cost (real number)
    """

    def _cost_function(self, probabilities, y):
        hot_y = self._one_hot(y)

        probabilities = np.clip(probabilities, self.eps, 1 - self.eps)

        log_loss = 0

        row_index = 0
        col_index = 0
        for row in probabilities:
            for probability in row:
                if hot_y[row_index][col_index]:
                    log_loss += np.log(probability)
                col_index += 1
            col_index = 0
            row_index += 1
        log_loss = (-1 * log_loss) / len(probabilities)

        if self.regularization:
            log_loss += self.alpha * np.sum(self.theta_[:-1] ** 2) / len(probabilities)

        return log_loss

    """
        In :
        Target y: nb_examples * 1

        Do:
        One hot-encode y
        [1,1,2,3,1] --> [[1,0,0],
                         [1,0,0],
                         [0,1,0],
                         [0,0,1],
                         [1,0,0]]
        Out:
        y one-hot encoded
    """

    def _one_hot(self, y):
        one_hot = np.zeros((len(y), max(y+1)))
        for i in range(len(y)):
            value = y[i]
            one_hot[i][value] = 1

        return one_hot

    """
        In :
        Logits: nb_examples * self.nb_classes 

        Do:
        Compute softmax on logits

        Out:
        Probabilities
    """

    def _softmax(self, z):
        p = np.empty(0)
        sum_exp = np.sum(np.exp(z))
        for logit in z:
            value = np.exp(logit) / sum_exp
            p = np.append(p, value)
        return p

    """
        In:
        X with bias
        y without one hot encoding
        probabilities resulting of the softmax step

        Do:
        One-hot encode y
        Compute gradients
        If self.regularization add l2 regularization term

        Out:
        Gradient

    """

    def _get_gradient(self, X, y, probas):
        hot_y = self._one_hot(y)

        grad_J = np.matmul(np.transpose(X), probas - hot_y) / probas.shape[0]

        if (self.regularization):
            derived_theta = copy.deepcopy(self.theta_)
            derived_theta[-1] = 0
            grad_J += self.alpha / len(X) * derived_theta

        return grad_J
