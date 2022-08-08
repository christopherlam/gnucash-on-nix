cd build
ninja
ninja install > /dev/null
cd ../install/bin

# gdb -ex run --args ./gnucash --logto stdout
./gnucash --extra --logto stdout
