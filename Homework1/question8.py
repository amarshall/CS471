def ack(m, n):
  if m == 0:
    return n + 1
  elif n == 0:
    return ack(m - 1, 1)
  else:
    return ack(m - 1, ack(m, n - 1))

n = 0
while True:
  ack(3, n)
  n += 1
  print(n)
# n => 7
