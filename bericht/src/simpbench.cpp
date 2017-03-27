#include "simpbench.hpp"

#include <chrono>
#include <fstream>
#include <iostream>

namespace SimpBench {

Data::Data() {
    m_is_running = false;
}
inline void Data::start() {
    m_is_running = true;
    m_start = std::chrono::steady_clock::now();
}

inline void Data::stop() {
    m_end = std::chrono::steady_clock::now();
    m_is_running = false;
    m_run_time = std::chrono::duration_cast<std::chrono::nanoseconds>(m_end - m_start);
}

std::chrono::nanoseconds Data::get_run_time() {
    return m_run_time;
}
bool Data::is_running() {
    return m_is_running;
}
bool Benchmark::benchmark_name_exists(std::string p_benchmark_name) {
    return m_benchmark_list.find(p_benchmark_name) == m_benchmark_list.end();
}
void Benchmark::start(std::string p_benchmark_name) {
    if (benchmark_name_exists(p_benchmark_name)) {
        m_benchmark_list.emplace(p_benchmark_name, std::vector<Data>());
    }
    m_benchmark_list[p_benchmark_name].push_back(Data());
    if (m_benchmark_list[p_benchmark_name].back().is_running()) {
        std::cout << "Waring: Benchmark " << p_benchmark_name
                  << " is still running. Did not start new Benchmark" << std::endl;
        return;
    }

    m_benchmark_list[p_benchmark_name].back().start();
}
void Benchmark::end(std::string p_benchmark_name) {
    m_benchmark_list[p_benchmark_name].back().stop();
}
void Benchmark::print_time(std::string p_benchmark_name, unsigned long p_benchmark_index = 0) {
    std::cout << p_benchmark_name << ": "
              << m_benchmark_list[p_benchmark_name][p_benchmark_index].get_run_time().count() /
                     1000000000.0
              << std::endl;
}
void Benchmark::print_all_times(std::string p_benchmark_name) {
    std::cout << "Times " << p_benchmark_name << ": ";
    for (auto data : m_benchmark_list[p_benchmark_name]) {
        std::cout << data.get_run_time().count() / 1000000000.0 << " ";
    }
    std::cout << std::endl;
}
void Benchmark::print_sum_times(std::string p_benchmark_name) {
    auto sum = 0;
    for (auto data : m_benchmark_list[p_benchmark_name]) {
        sum += data.get_run_time().count();
    }
    std::cout << p_benchmark_name << " sum: " << sum / 1000000000.0 << std::endl;
}
std::chrono::nanoseconds Benchmark::get_mean_time(std::string p_benchmark_name) {
    std::chrono::nanoseconds sum = std::chrono::nanoseconds(0);
    for (auto data : m_benchmark_list[p_benchmark_name]) {
        sum += data.get_run_time();
    }
    return sum /= m_benchmark_list[p_benchmark_name].size();
}
std::chrono::nanoseconds Benchmark::get_max_time(std::string p_benchmark_name) {
    std::chrono::nanoseconds cur_max = std::chrono::nanoseconds(0);
    for (auto data : m_benchmark_list[p_benchmark_name]) {
        if (cur_max > data.get_run_time()) {
            cur_max = data.get_run_time();
        }
    }
    return cur_max;
}
std::chrono::nanoseconds Benchmark::get_min_time(std::string p_benchmark_name) {
    std::chrono::nanoseconds cur_min = std::chrono::nanoseconds(std::chrono::nanoseconds::max());
    for (auto data : m_benchmark_list[p_benchmark_name]) {
        if (cur_min < data.get_run_time()) {
            cur_min = data.get_run_time();
        }
    }
    return cur_min;
}
void Benchmark::sum_results(std::string p_benchmark_name) {
    std::chrono::nanoseconds sum = std::chrono::nanoseconds(0);
    for (auto data : m_benchmark_list[p_benchmark_name]) {
        sum += data.get_run_time();
    }
    m_sums[p_benchmark_name] = sum;
}
void Benchmark::reset_data(std::string p_benchmark_name) {
    m_benchmark_list[p_benchmark_name].clear();
}

void Benchmark::reset_all_data() {
    for (auto bench : m_benchmark_list) {
        bench.second.clear();
    }
}
void Benchmark::sum_all_results() {
    for (auto bench : m_benchmark_list) {
        sum_results(bench.first);
    }
}
void Benchmark::print_sums() {
    for (auto bench : m_sums) {
        std::cout << bench.first << ": " << bench.second.count() / 1000000000.0 << " " << std::endl;
    }
    std::cout << std::endl;
}
void Benchmark::open_file(std::string p_filename) {
    std::ifstream test(p_filename);
    if (!test) {
        std::cout << "ol" << std::endl;
        test.close();
        m_file.open(p_filename, std::fstream::app);
        if (m_file.is_open())
            std::cout << "IS P{EN" << std::endl;
        std::string line = "rowname,";
        for (auto data : m_benchmark_list) {
            line += data.first + ",";
        }
        line.erase(line.end() - 1);
        m_file << line << std::endl;
    } else {
        m_file.open(p_filename, std::fstream::app);
    }
}
void Benchmark::close_file() {
    m_file.close();
}
void Benchmark::write(int i, std::string p_row_name) {
    std::string line = p_row_name + ",";
    for (auto bench : m_sums) {
        line += std::to_string(bench.second.count() / 1000000000.0) + ",";
    }
    line.erase(line.end() - 1);
    m_file << line << std::endl;
}
}
