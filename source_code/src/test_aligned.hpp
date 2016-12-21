
#ifndef EXAMPLE_HPP
#define EXAMPLE_HPP
constexpr int float_size = sizeof(float) * 8;
typedef float a_float_32 __attribute__((__aligned__(float_size)));
static  const unsigned long vector_size = 100000;


void test(a_float_32 *__restrict vec1, a_float_32 *__restrict vec2, a_float_32 *__restrict res); 
#endif
