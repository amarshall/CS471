def power(base, exponent):
  if exponent == 0:
    return 1
  else:
    return base * power(base, exponent - 1)
