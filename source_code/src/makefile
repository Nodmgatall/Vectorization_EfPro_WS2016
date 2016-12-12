all: default novec vec noopt onlyvec run_all

run_all:
	./novec.x
	./normal.x
	./vectorized.x
	./noopt.x
	./onlyvec.x
onlyvec:
	g++ -o onlyvec.x main.cpp -g -O0 -ftree-vectorize -funroll-loops -save-temps	
noopt:
	g++ -o noopt.x main.cpp -g -O0 -save-temps	
novec:
	g++ -o novec.x main.cpp -g -O2 -save-temps	
vec:    
	g++ -o vectorized.x main.cpp  -g -O2 -ftree-vectorize -funroll-loops
default:
	g++ -o normal.x main.cpp -g -O3
fopt:
	g++ -o vectorized.x main.cpp -g -O2 -ftree-vectorize -funroll-loops -fopt-info-vec
assm_test:
	mv test.cpp test_normal.cpp
	g++ -c -o test_normal.o -O2 test_normal.cpp -O0 -save-temps ;
	g++ -o assm_test.x test_normal.o test-main.cpp;
	mv test_normal.cpp test.cpp
assm_test_vec:
	mv test.cpp test_vec.cpp
	g++ -c test_vec.cpp -O2 -save-temps -ftree-vectorize -fopt-info-vec=vec.missed;
	g++ test_vec.o -o assm_test_vec.x test-main.cpp -save-temps; 
	mv test_vec.cpp test.cpp

assm_run: assm_test assm_test_vec
	./assm_test.x
	./assm_test_vec.x

clean: 
	rm -f *.x
	rm -f *.o
	rm -f *.ii
	rm -f *.s
	rm -f *.gch


assm:
