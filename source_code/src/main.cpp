#ifndef MAIN_CPP
#define MAIN_CPP
#include "fill.hpp"
#include "calculations.hpp"
#include <chrono>
 

std::chrono::time_point<std::chrono::system_clock> start, end;
int main()
{
    unsigned long vector_size = 10000000;
    std::vector<float> vec1(vector_size);
    fill(vec1, vector_size);

    std::vector<float> vec2(vector_size);
    fill(vec2, vector_size);

    std::vector<float> result(vector_size);
    
    start = std::chrono::system_clock::now();
       calculate(vec1, vec2, result);
    calculate(result, vec2, vec1 );
    calculate(vec2, vec1, result);
   
    std::cout << result.size() << std::endl;
    end = std::chrono::system_clock::now();
    std::chrono::duration<double> time = end - start;
 std::cout << "Calculated " << vector_size << " additions"
        << vector_size << " times :in:" << std::endl;
    std::cout<<"    " << time.count() << std::endl; 
}
#endif
