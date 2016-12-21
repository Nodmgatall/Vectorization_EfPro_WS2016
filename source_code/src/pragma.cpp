#include "test.hpp"
#include <omp.h>

void test(float *vec1, float *vec2, float *res)
{
#pragma omp simd aligned(vec1, vec2, res:32)
    for(unsigned long i = 0; i < vector_size; i++)
    {
        res[i] += vec1[i] * vec2[i];
    }
}
