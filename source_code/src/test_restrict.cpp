
#include "test.hpp"
/* in main:
*/
void test(float *__restrict vec1, float *__restrict vec2, float *__restrict res) {
    for (unsigned long i = 0; i < vector_size; i++) {
        res[i] = res[i] + vec2[i] * vec1[i];
    }
}
