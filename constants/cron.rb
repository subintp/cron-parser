SYNTAX_houREGEX = /^(?:[1-9]?\d|\*)(?:(?:[\/-][1-9]?\d)|(?:,[1-9]?\d)+)?$/

MINUTES_RANGE = *(0..59)
HOURS_RANGE =  *(0..23)
MONTHS_RANGE = *(1..12)
DAYS_OF_MONTH_RANGE = *(1..31)
DAYS_OF_WEEK_RANGE = *(0..6)
ALLOWED_OPERATORS = [ '*', '/' , '-']

RANGE_BY_POSITION = [MINUTES_RANGE, HOURS_RANGE, DAYS_OF_MONTH_RANGE, MONTHS_RANGE, DAYS_OF_WEEK_RANGE ]

COMMAND_TYPES = {
  0 => 'minute',
  1 => 'hour',
  2 => 'day of month',
  3 => 'month',
  4 => 'day of week',
  5 => 'command'
}

COMMAND_VALUES = COMMAND_TYPES.invert