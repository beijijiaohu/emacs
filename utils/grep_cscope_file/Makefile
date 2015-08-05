objects = main.o

grep_cscope_file : ${objects}
	gcc ${objects} -o grep_cscope_file

main.o : main.c
	gcc -c main.c -o main.o

.PHONY : clean
clean:
	rm -vf ${objects}
	rm -vf  hello
