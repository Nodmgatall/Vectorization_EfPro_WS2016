standart=-std=c++11
save_temp=-save-temps
compiler=g++
opti=-O3
output_mode=-fopt-info-vec-optimized
default: vectorizable aligned no_alias normal main
vectorizable:
	$(compiler) -c $(standart) $(opti) vectorizable.cpp $(save_temp) $(output_mode) -g -pg

aligned:
	$(compiler) -c $(standart) $(opti) aligned.cpp $(save_temp) $(output_mode) -g -pg

normal:
	$(compiler) -c $(standart) $(opti) normal.cpp $(save_temp) $(output_mode) -g -pg

no_alias:
	$(compiler) -c $(standart) $(opti) no_alias.cpp $(save_temp) $(output_mode) -g -pg

main:
	g++ -std=c++11 -O3 -o main.x main.cpp vectorizable.o aligned.o no_alias.o normal.o -pg

clean:
	rm -f *.ii
	rm -f *.o
	rm -f *.s
	rm -f *.x
	rm -f *.gch
