#include <cstdlib>
#include <ctime>
#include <vector>

template <typename T>
void fill(T *vec, unsigned int entry_count) {

    for (unsigned i = 0; i < entry_count; i++) {
        vec[i] = (float)std::rand() / (float)std::rand();
    }
}
template <typename T>
void fill(std::vector<T> &vec, unsigned int entry_count) {

    for (unsigned i = 0; i < entry_count; i++) {
        vec[i] = (float)std::rand() / (float)std::rand();
    }
}
