# EnvironmentToTestSimpleCandGDB
dockerfile and docker-sompose.yml to generate simple container to test c environment

# Environment 

My environment

- CPU : Intel(R) Core(TM) i7-9850H CPU @ 2.60GHz   2.59 GHz
- RAM : 32.0 GB (31.7 GB 使用可能)
- GPU : NVIDIA Quadro T100
- windows : windows11 Pro 22H2
- wsl2 :
  - Description:    Ubuntu 22.04.3 LTS
  - Release:        22.04
  - Codename:       jammy


# Need to install

- wsl2
- docker desktop

(optional)
- vscode

# How to start it

run next commands

```
$docker compoes up -d
$docker exec -it TestEnvForC /bin/bash
```

it will be done.

# How to run test.sh

prepare your code written in C.

- input
  - 1st input: path for source file
- output
  - the frequency (float)

run next commands in container

```bash
$./test.sh <source.c>
```

you can add original test file in tests folder as testi

- inut_i.txt : file path and term
- expected_i.txt : expect result
- text_i.txt : file to read

# Example

If you want to check the file a.c,
a.c require 2 inouts, 1st input is file path for count and 2nd input is word to count,
run like this.

```bash
$ ./test.sh ./a.c
test1
input file: ./tests/test1/text_1.txt # a.c's 1st input, written in input_1.c
count word: hoge # a.c's input, written in input_1.c
frequency: 0.5 # as a.c's result

0.5 # as expected result, written in expected_1.txt
test2
input file: ./tests/test2/text_2.txt
count word: 1
0.1

0.1
...
```

check the results.
