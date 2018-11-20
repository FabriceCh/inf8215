from TP3.SoftmaxClassifier import SoftmaxClassifier


def testOneHot():
    values = [1, 2, 4, 3, 2, 2, 5, 3]
    classifier = SoftmaxClassifier()
    print(classifier._one_hot(values))

def testSoftMax():
    values = [2, 3, 4]
    classifier = SoftmaxClassifier()
    print(classifier._softmax(values))

testSoftMax()