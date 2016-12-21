
#include "test_aligned.hpp"

void test(a_float_32 *__restrict vec1, a_float_32 *__restrict vec2, a_float_32 *__restrict res) {
    for (unsigned long i = 0; i < vector_size; i++) {
        res[i] = res[i] + vec2[i] * vec1[i];
    }
}
