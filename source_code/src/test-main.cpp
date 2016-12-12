#include "test.hpp"
#include <iostream>
#include <chrono>
int main() {
 std::chrono::time_point<std::chrono::system_clock> start, end;

    start = std::chrono::system_clock::now();

    float float_vector1[vector_size] = {
        1.f,
    };
    float float_vector2[vector_size] = {
        2.f,
    };
    float float_result_vector[vector_size] = {0};
    for(int i = 0 ;i < 1000; i++)
    test(float_vector1, float_vector2, float_result_vector);
    std::cout << float_result_vector[234] << std::endl;
    end = std::chrono::system_clock::now();
    std::chrono::duration<double> time = end - start;
    std::cout << "Calculated " << vector_size << " additions"
        << vector_size << " times :in:" << std::endl;
    std::cout<<"    " << time.count() << std::endl;    
}
