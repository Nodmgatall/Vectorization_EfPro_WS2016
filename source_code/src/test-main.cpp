#include "test.hpp"
#include "fill.hpp"
#include <iostream>
#include <chrono>
int main() {
 std::chrono::time_point<std::chrono::system_clock> start, end;

 std::cout << "sizeof float: " << sizeof(float) << std::endl;

    float float_vector1[vector_size];
    fill(float_vector1, vector_size);
    float float_vector2[vector_size];
    fill(float_vector2, vector_size);
    float float_result_vector[vector_size] = {0};

    start = std::chrono::system_clock::now();

    for(unsigned long i = 0 ;i < vector_size/100; i++)
    {
    test(float_vector1, float_vector2, float_result_vector);
    }
    std::cout << float_result_vector[234] << std::endl;

    end = std::chrono::system_clock::now();

    std::chrono::duration<double> time = end - start;
    std::cout << "Calculated " << vector_size << " additions"
        << vector_size/100 << " times :in:" << std::endl;
    std::cout<<"    " << time.count() << std::endl;    
}
