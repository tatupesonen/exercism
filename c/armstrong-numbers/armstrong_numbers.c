#include "armstrong_numbers.h"
#include "math.h"
bool is_armstrong_number(int candidate) {
  int temp = candidate;
  int c = 0;
  while (temp > 0) {
    temp /= 10;
    c++;
  }
  temp = candidate;
  int sum = 0;
  while (temp > 0) {
    int d = temp % 10;
    sum += pow(d, c);
    temp /= 10;
  }
  return sum == candidate;
}