#ifndef VECTORIZABLE
#define VECTORIZABLE
#include "type_declaration.hpp"
void vectorizable(aligned_type *__restrict__ vec1, aligned_type *__restrict__ vec2,
                  unsigned long size, aligned_type *__restrict__ return_vec) {
    for (unsigned long i = 0; i < size; i++) {
        return_vec[i] = vec1[i] + vec2[i];
    }
}
#endif
