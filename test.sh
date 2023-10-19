#!/usr/bin/bash

readonly FILENUM=2

function useage() {
  cat << _EOT_
  Usage: $0
  Description: test wordCount.c file with input_i.txt and output_i.txt
_EOT_
  exit 1
}

# Compile Check
# Wall option : turn on all error
# Werrror option: treat warning as error

gcc -Wall -Werror -o test_file wordCount.c

if [ $? -ne 0 ]; then
    echo "Compilation failed"
    exit 1
fi

echo "compile success"

# Input and Output Check
# prepare:
#    input_i.txt : formal input
#    text_i.txt  : formal text to read
#    expect_i.txt: formal result
# "$?" is a special parameter that expands to the exit status of 
# the most recently executed foreground pipeline. 
# It is the exit status of the last command that was executed.

for ((i=1;i<=FILENUM;i++)); do
    echo -e "test $i\n"
    ./test_file <tests/test$i/input_$i.txt > tests/test$i/output_$i.txt
    if [ $? -ne 0 ]; then
        echo "Tests failed for input_$i.txt"
        exit 1
    fi
    # diff output_$i.txt expected_$i.txt
    # if [ $? -ne 0 ]; then
    #     echo "Output does not match expected output for input_$i.txt"
    #     exit 1
    # fi
    cat tests/test$i/output_$i.txt
    cat tests/test$i/expected_$i.txt
    echo -e "\n"
done

# echo "All tests passed"
echo "all tests done"
exit 0