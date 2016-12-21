
#include "test.hpp"

void test(float * vec1, float * vec2, float * res) {
    for (unsigned long i = 0; i < vector_size; i++) {
        res[i] = res[i] + vec2[i] * vec1[i];
    }
}
