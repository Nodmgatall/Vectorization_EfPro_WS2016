#ifndef MAIN_CPP
#define MAIN_CPP
#include "fill.hpp"

#include "calculations.hpp"
int main()
{
    unsigned long vector_size = 10000000;
    std::vector<float> vec1;
    fill(vec1, vector_size);

    std::vector<float> vec2;
    fill(vec2, vector_size);

    std::vector<float> result(vector_size);
    
       calculate(vec1, vec2, result);
    calculate(result, vec2, vec1 );
    calculate(vec2, vec1, result);
    
}
#endif
