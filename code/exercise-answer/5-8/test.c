unsigned int square(unsigned int i)
{
  return i * i;
}

unsigned int sum_squares(unsigned int i)
{
  unsigned int sum = 0;
  for (int j = 1; j <= i; j++) {
    sum += square(j);
  }
  return sum;
}

void _start()
{
  sum_squares(3);
}