for x in {0..100}; do
    echo "./main.x $(( (1280) + x * 128 )) 10000 \$1"
done
