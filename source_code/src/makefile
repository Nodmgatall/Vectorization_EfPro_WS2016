all: default novec vec noopt onlyvec run_all

run_all:
	./novec.x
	./vectorized.x
	./onlyvec.x
onlyvec:
	g++ -o onlyvec.x main.cpp -g -O0 -ftree-vectorize 	
noopt:
	g++ -o noopt.x main.cpp -g -O0 -save-temps	
novec:
	g++ -o novec.x main.cpp -g -O1 -save-temps	
vec:    
	g++ -o vectorized.x main.cpp  -g -O1 -ftree-vectorize -funroll-loops
default:
	g++ -o normal.x main.cpp -g -O3
fopt:
	g++ -o vectorized.x main.cpp -g -O1 -ftree-vectorize -funroll-loops -fopt-info-vec
assm_test:
	mv test.cpp test_normal.cpp
	g++ -c -o test_normal.o -O1 test_normal.cpp -O0 -save-temps ;
	g++ -o assm_test.x test_normal.o test-main.cpp -O3;
	mv test_normal.cpp test.cpp
assm_test_vec:
	mv test.cpp test_vec.cpp
	g++ -c test_vec.cpp -O1 -save-temps -ftree-vectorize -fopt-info-vec=vec.missed;
	g++ test_vec.o -o assm_test_vec.x test-main.cpp -save-temps -O3; 
	mv test_vec.cpp test.cpp

O1:
	g++ -c test.cpp -O1 -save-temps -fopt-info-vec
	g++ -o test.x -O1 test.o test-main.cpp -save-temps
vectorized:
	mv test.cpp test_vectorize.cpp
	g++ -c -o test_vectorize.o test_vectorize.cpp -O1 -save-temps -ftree-vectorize -fopt-info-vec
	g++ -o vectorized.x -O1 test_vectorize.o test-main.cpp -save-temps
	mv test_vectorize.cpp test.cpp
restrict:
	g++ -c test_restrict.cpp -O1 -save-temps -ftree-vectorize -fopt-info-vec
	g++ -o restrict.x -O1 test_restrict.o test-main.cpp -save-temps
aligned:
	g++ -c test_aligned.cpp -O1 -save-temps -ftree-vectorize -fopt-info-vec
	g++ -o aligned.x -O1 test_aligned.o test-main.cpp -save-temps
comparison: O1 vectorized restrict aligned
run_compartison: comparison
	./test.x
	./vectorized.x
	./restrict.x
	./aligned.x
	
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
