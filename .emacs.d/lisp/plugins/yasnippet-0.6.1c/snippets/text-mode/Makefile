CFLAGS += -Wall -I/home/jwu/work/applications/jwu/include -L /home/jwu/work/applications/jwu/lib/ --static

objects = main.o

hello : \${objects}
	gcc \${CFLAGS} \${objects}  -o hello -ljwulib # or ../lib/libjwulib.a -lm

main.o : main.c
	gcc \${CFLAGS} -c main.c  -o main.o

.PHONY : clean
clean:
	rm -vf \${objects}
	rm -vf  hello
