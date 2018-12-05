
#todo: might still need to process null values

def GetAgeInDays(text):
    DAYS_IN_YEAR = 365.25
    MONTHS_IN_YEAR = 12
    DAYS_IN_WEEK = 7

    age_text_array = text.split(' ')
    # text is '# unit' like '1 year' or '3 months'
    value = int(age_text_array[0])
    unit = age_text_array[1]
    multiplier = 0
    if unit == 'year' or unit == 'years':
        multiplier = DAYS_IN_YEAR
    elif unit == 'month' or unit == 'months':
        multiplier = DAYS_IN_YEAR / MONTHS_IN_YEAR
    elif unit == 'week' or unit == 'weeks':
        multiplier = DAYS_IN_WEEK

    value_in_days = value * multiplier

    return value_in_days

print(GetAgeInDays('1 year'))
print(GetAgeInDays('2 years'))
print(GetAgeInDays('3 years'))

print(GetAgeInDays('1 month'))
print(GetAgeInDays('2 months'))
print(GetAgeInDays('3 months'))

print(GetAgeInDays('1 week'))
print(GetAgeInDays('2 weeks'))
print(GetAgeInDays('3 weeks'))
