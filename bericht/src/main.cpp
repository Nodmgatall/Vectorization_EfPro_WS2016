
#include "func_defs.hpp"
#include "type_declaration.hpp"
#include <cstdlib>
#include <ctime>
#include <iostream>
constexpr unsigned long SIZE = 100000;
void fill_array(type *vec, unsigned long size) {
    std::srand(std::time(0));
    for (unsigned long i = 0; i < size; i++) {
        type random_variable1 = std::rand();
        type random_variable2 = std::rand();
        type final_variable = random_variable1 / random_variable2;
        vec[i] = final_variable;
    }
}

int main() {
    std::cout << SIZE << std::endl;
    type vec1[SIZE];
    fill_array(vec1, SIZE);
    type vec2[SIZE];
    fill_array(vec2, SIZE);
    type ret_vec[SIZE];
    fill_array(ret_vec, SIZE);

    type vec1_aligned[SIZE] __attribute__((aligned(16)));
    fill_array(vec1_aligned, SIZE);
    type vec2_aligned[SIZE] __attribute__((aligned(16)));
    fill_array(vec2_aligned, SIZE);
    type ret_vec_alinged[SIZE] __attribute__((aligned(16)));
    fill_array(ret_vec_alinged, SIZE);

    for (int i = 0; i < 100000; i++) {
        normal(vec1, vec2, SIZE, ret_vec);
        aligned(vec1_aligned, vec2_aligned, SIZE, ret_vec_alinged);
        no_alias(vec1, vec2, SIZE, ret_vec);
        vectorizable(vec1_aligned, vec2_aligned, SIZE, ret_vec_alinged);
    }

    type result = 0;
    for (unsigned i = 0; i < SIZE; i++) {
        ret_vec_alinged[i] += ret_vec_alinged[i];
        result += ret_vec_alinged[i];
    }
    std::cout << result << std::endl;
}
