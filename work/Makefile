all: say_hello_c say_hello_cpp say_hello_rs say_hello_py

hello_c:
	gcc hello.c -o hello_c

hello_cpp:
	g++ hello.cpp -o hello_cpp

hello_rs:
	rustc hello.rs -o hello_rs

say_hello_c: hello_c
	./hello_c

say_hello_cpp: hello_cpp
	./hello_cpp

say_hello_rs: hello_rs
	./hello_rs

say_hello_py:
	python3 hello.py

clean:
	rm -f hello_c
	rm -f hello_cpp
	rm -f hello_rs
