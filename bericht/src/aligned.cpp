#ifndef ALIGNED
#define ALIGNED
#include "type_declaration.hpp"

void aligned(aligned_type *vec1, aligned_type *vec2, unsigned long size, aligned_type *return_vec) {
    for (unsigned long i = 0; i < size; i++) {
        return_vec[i] = vec1[i] + vec2[i];
    }
}
#endif
