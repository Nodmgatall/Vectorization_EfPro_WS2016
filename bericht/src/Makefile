standart=-std=c++11
save_temp=#-save-temps
compiler=g++
output_mode= -fopt-info-vec-optimized #-fopt-info-vec-missed
march= -march=native
opti =-O1 #-funroll-loops
default:  main 
vectorizable:
	$(compiler) -c $(standart) $(opti) ${march}  -ftree-vectorize  vectorizable.cpp $(save_temp) $(output_mode) -g -pg 
aligned:
	$(compiler) -c $(standart) $(opti) ${march}  -ftree-vectorize  aligned.cpp $(save_temp) $(output_mode) -g -pg 

normal:
	$(compiler) -c $(standart) $(opti) ${march}  normal.cpp $(save_temp) $(output_mode) -g -pg 

normalvec:
	$(compiler) -c $(standart) $(opti) ${march}  -ftree-vectorize normalvec.cpp $(save_temp) $(output_mode) -g -pg 

no_alias:
	$(compiler) -c $(standart) $(opti) ${march}  -ftree-vectorize  no_alias.cpp $(save_temp) $(output_mode) -g -pg 

omp:
	$(compiler) -c $(standart) ${opti} ${march} -fopenmp-simd  omp.cpp $(save_temp) $(output_mode) -g -pg 
bench:
	g++ -c -std=c++11 simpbench.cpp -g -Ofast
main: vectorizable aligned no_alias normal omp normalvec
	g++ -save-temps -std=c++11 -ftree-vectorize -O0 -o main.x main.cpp omp.o normalvec.o simpbench.o vectorizable.o aligned.o no_alias.o normal.o -pg  
make_all:
	./make.sh

clean-results:
	rm main.txt
clean:
	rm -f *.ii
	rm -f *.o
	rm -f *.s
	rm -f *.x
	rm -f *.gch
