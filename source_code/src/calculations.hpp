#include <iostream>
#include <vector>

void calculate(std::vector<short> &vec1, std::vector<short> &vec2, std::vector<short> &result) {
    unsigned long size1 = vec1.size();
    unsigned long size2 = vec2.size();
    if (size1 != size2) {
        std::cout << "Error: vectors vary in length " << __LINE__ << __FILE__ << std::endl;
    }
    for (unsigned long i = 0; i < size1; i++) {
        result[i] = vec1[i] * vec2[i];
    }
}

void calculate(std::vector<int> &vec1, std::vector<int> &vec2, std::vector<int> &result) {
    unsigned long size1 = vec1.size();
    unsigned long size2 = vec2.size();
    if (size1 != size2) {
        std::cout << "Error: vectors vary in length " << __LINE__ << __FILE__ << std::endl;
    }
    for (unsigned long i = 0; i < size1; i++) {
        result[i] = vec1[i] * vec2[i];
    }
}
void calculate(std::vector<float> &vec1, std::vector<float> &vec2, std::vector<float> &result) {
    unsigned long size1 = vec1.size();
    unsigned long size2 = vec2.size();
    if (size1 != size2) {
        std::cout << "Error: vectors vary in length " << __LINE__ << __FILE__ << std::endl;
    }
    for (unsigned long i = 0; i < size1; i++) {
        result[i] = vec1[i] * vec2[i];
    }
}
void calculate(std::vector<double> &vec1, std::vector<double> &vec2, std::vector<double> &result) {
    unsigned long size1 = vec1.size();
    unsigned long size2 = vec2.size();
    if (size1 != size2) {
        std::cout << "Error: vectors vary in length " << __LINE__ << __FILE__ << std::endl;
    }
    for (unsigned long i = 0; i < size1; i++) {
        result[i] = vec1[i] * vec2[i];
    }
}
