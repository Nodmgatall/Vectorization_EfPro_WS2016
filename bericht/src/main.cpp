#include "func_defs.hpp"
#include "simpbench.hpp"
#include "type_declaration.hpp"
#include <chrono>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <math.h>

void fill_array(type *vec, unsigned long size) {
    std::srand(std::time(0));
    for (unsigned long i = 0; i < size; i++) {
        type random_variable1 = std::rand();
        type random_variable2 = std::rand();
        type final_variable = random_variable1 / random_variable2;
        vec[i] = final_variable;
    }
}
int main(int argc, char **argv) {
    std::string filename = "result.txt";
    if (argc > 3) {
        filename = argv[3];
    }
    SimpBench::Benchmark benchmark;
    unsigned long SIZE;
    unsigned long INTERATION_COUNT;
    if (argc > 2) {
        SIZE = std::stoul(argv[1], nullptr, 0);
        INTERATION_COUNT = std::stoul(argv[2], nullptr, 0);
    } else {
        SIZE = 40000;
        INTERATION_COUNT = 10000;
    }

    // for (int i = 1; i < 6; i++) {
    //     SIZE = 100 * std::pow(10, i);
    type vec1[SIZE];
    // fill_array(vec1, SIZE);
    type vec2[SIZE];
    // fill_array(vec2, SIZE);
    type ret_vec[SIZE];
    // fill_array(ret_vec, SIZE);

    type vec1_aligned[SIZE] __attribute__((aligned(32)));
    // fill_array(vec1_aligned, SIZE);
    type vec2_aligned[SIZE] __attribute__((aligned(32)));
    // fill_array(vec2_aligned, SIZE);
    type ret_vec_alinged[SIZE] __attribute__((aligned(32)));
    // fill_array(ret_vec_alinged, SIZE);

    fill_array(vec1, SIZE);
    fill_array(vec2, SIZE);

    fill_array(vec1_aligned, SIZE);
    fill_array(vec2_aligned, SIZE);

        benchmark.start("normal");
    for (unsigned long i = 0; i < INTERATION_COUNT; i++) {
        normal(vec1, vec2, SIZE, ret_vec);
    }
        benchmark.end("normal");

        benchmark.start("aligned");
    for (unsigned long i = 0; i < INTERATION_COUNT; i++) {
        aligned(vec1_aligned, vec2_aligned, SIZE, ret_vec_alinged);
    }
        benchmark.end("aligned");
        benchmark.start("noalias");
    for (unsigned long i = 0; i < INTERATION_COUNT; i++) {
        no_alias(vec1, vec2, SIZE, ret_vec);
    }
        benchmark.end("noalias");

        benchmark.start("vectorizable");
    for (unsigned long i = 0; i < INTERATION_COUNT; i++) {
        vectorizable(vec1_aligned, vec2_aligned, SIZE, ret_vec_alinged);
    }
        benchmark.end("vectorizable");
        benchmark.start("omp");
    for (unsigned long i = 0; i < INTERATION_COUNT; i++) {
        benchmark.end("omp");
    }
        omp(vec1_aligned, vec2_aligned, SIZE, ret_vec_alinged);

        benchmark.start("normalvec");
    for (unsigned long i = 0; i < INTERATION_COUNT; i++) {
        normalvec(vec1, vec2, SIZE, ret_vec);
    }

        benchmark.end("normalvec");
    benchmark.sum_all_results();
    benchmark.open_file(filename);
    benchmark.write(0, std::to_string(SIZE));
    benchmark.reset_all_data();
    //benchmark.print_sums();

    type result = 0;
    for (unsigned i = 0; i < SIZE; i++) {
        ret_vec_alinged[i] += ret_vec_alinged[i];
        result += ret_vec_alinged[i];
        //  }
        // std::cout << result << std::endl;
    }
    benchmark.close_file();
}
