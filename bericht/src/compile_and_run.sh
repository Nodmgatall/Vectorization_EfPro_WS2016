make opti="-msse3 -O2 -funroll-loops -fpeel-loops"
./run.sh result_new_sse3_O2_unroll.txt
echo "\n"
make opti="-msse3 -O1 -funroll-loops"
./run.sh result_new_sse3_O1_unroll.txt

echo "\n"
echo "\n"

make opti="-msse2 -O2 -funroll-loops -fpeel-loops"
./run.sh result_new_sse2_O2_unroll.txt
echo "\n"
make opti="-msse2 -O1"
./run.sh result_new_sse2_O1_unroll.txt

echo "\n"
echo "\n"

make opti="-msse -O2 -funroll-loops -fpeel-loops"
./run.sh result_new_O2_unroll.txt
echo "\n"

make opti="-msse -O1 -funroll-loops"
./run.sh result_new_O1_unroll.txt 
