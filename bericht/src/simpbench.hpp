#ifndef SIMPBENCH_HPP
#define SIMPBENCH_HPP

#include <chrono>
#include <map>
#include <fstream>
#include <vector>
namespace SimpBench {
class Data {
  private:
    bool m_is_running;
    std::chrono::time_point<std::chrono::steady_clock> m_start;
    std::chrono::time_point<std::chrono::steady_clock> m_end;
    std::chrono::nanoseconds m_run_time;

  public:
    Data();
    void start();
    void stop();
    bool is_running();
    std::chrono::nanoseconds get_run_time();
};
class DataCollection{
    std::vector<Data> m_collection;
    std::vector<std::chrono::nanoseconds> m_sums;
    std::vector<std::chrono::nanoseconds> m_means;
    std::vector<std::chrono::nanoseconds> m_median;
};
class Benchmark {

  private:
    std::map<std::string, std::vector<Data>> m_benchmark_list;
    std::map<std::string, std::chrono::nanoseconds> m_sums;
    void add_benchmark(std::string p_name);
    void save_data();
    bool benchmark_name_exists(std::string p_benchmark_name);
    std::ofstream m_file;

  public:
    void start(std::string p_benchmark_name);
    void end(std::string p_benchmark_name);
    void print_time(std::string p_benchmark_name, unsigned long p_benchmark_index);
    void print_all_times(std::string p_benchmark_name);
    void print_sum_times(std::string p_benchmark_name);
    void print_sums();
    void sum_results(std::string p_benchmark_name);
    void sum_all_results();
    void reset_data(std::string p_benchmark_name);
    void reset_all_data();
    std::chrono::nanoseconds get_mean_time(std::string p_benchmark_name);
    std::chrono::nanoseconds get_max_time(std::string p_benchmark_name);
    std::chrono::nanoseconds get_min_time(std::string p_benchmark_name);
    void open_file(std::string p_filename);
    void close_file();
    void write(int i, std::string p_row_name);
};
class List{
    std::map<std::string,std::chrono::nanoseconds> m_list;

};

class Table{
    std::vector<List> m_table;
};

}
#endif
