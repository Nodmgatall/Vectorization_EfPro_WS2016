#ifndef NO_ALIAS
#define NO_ALIAS
#include "type_declaration.hpp"
void no_alias(type *__restrict__ vec1, type *__restrict__ vec2, unsigned long size,
              type *__restrict__ return_vec) {
    for (unsigned long i = 0; i < size; i++) {
        return_vec[i] = vec1[i] + vec2[i];
    }
}
#endif
