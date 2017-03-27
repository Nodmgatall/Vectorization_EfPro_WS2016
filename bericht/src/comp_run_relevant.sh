make opti="-msse3 -O3"
./run.sh result_new_sse3_O3.txt
make opti="-msse3 -O2"
./run.sh result_new_sse3_O2_nounroll.txt

make opti="-msse3 -O1"
./run.sh result_new_sse3_O1_nounroll.txt



make opti="-msse2 -O3"
./run.sh result_new_sse2_O3.txt
make opti="-msse2 -O2"
./run.sh result_new_sse2_O2_nounroll.txt

make opti="-msse2 -O1"
./run.sh result_new_sse2_O1_nounroll.txt



make opti="-msse -O3"
./run.sh result_new_O3.txt
make opti="-msse -O2"
./run.sh result_new_O2_nounroll.txt

make opti="-msse -O1"
./run.sh result_new_O1_nounroll.txt

