#!/usr/bin/bash

readonly FILENUM=2

function usage() {
  cat << _EOT_
  Usage: $0 <source_file.c>
  Description: Test the specified .c file with input_i.txt and output_i.txt
_EOT_
  exit 1
}

# Check if a C file is provided as an argument
if [ $# -ne 1 ]; then
    usage
fi

SOURCE_FILE=$1

# Check if the provided file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File $SOURCE_FILE not found."
    exit 1
fi

# Compile Check
#gcc -Wall -Werror -o test_file "$SOURCE_FILE"
gcc -Wall -o test_file "$SOURCE_FILE"

if [ $? -ne 0 ]; then
    echo "Compilation failed for $SOURCE_FILE"
    exit 1
fi

echo "Compile success"

# Input and Output Check
for ((i=1;i<=FILENUM;i++)); do
    echo -e "test $i\n"
    ./test_file <tests/test$i/input_$i.txt > tests/test$i/output_$i.txt
    if [ $? -ne 0 ]; then
        echo "Tests failed for input_$i.txt"
        exit 1
    fi
    cat tests/test$i/output_$i.txt
    cat tests/test$i/expected_$i.txt
    echo -e "\n"
done

echo "All tests done"
exit 0
