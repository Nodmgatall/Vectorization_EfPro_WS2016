#include "type_declaration.hpp"

void omp(type *vec1, type *vec2, unsigned long size, type *return_vec) {
#pragma omp simd aligned(vec1:16) aligned(vec2:16) aligned( return_vec:16)
    for (unsigned long i = 0; i < size; i++) {
       return_vec[i] =  vec2[i];
        return_vec[i] = return_vec[i] * vec1[i] / vec2[i];
    }
}
