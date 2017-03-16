#define NORMAL
#include "type_declaration.hpp"
void normal(type *vec1, type *vec2, unsigned long size, type *return_vec) {
    for (unsigned long i = 0; i < size; i++) {
        return_vec[i] = vec1[i] + vec2[i];
    }
}
