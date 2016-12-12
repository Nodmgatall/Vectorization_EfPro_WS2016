#include <cstdlib>
#include <ctime>
#include <vector>

template <typename T>
void fill(std::vector<T> &vec, unsigned entry_count) {

    vec.resize(entry_count);
    for (unsigned i = 0; i < entry_count; i++) {
        vec[i] = (float)std::rand() / (float)std::rand();
    }
}
