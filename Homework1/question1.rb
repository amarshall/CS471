def power(base, exponent):
  exponent == 0 ? 1 : base * power(base, exponent - 1)
end
