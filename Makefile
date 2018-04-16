LINKOBJ = main.o func64.o
BIN = prog
CFLAGS = -m64
CC = gcc
LFLAGS = -lGL -lGLU -lglut


$(BIN): $(LINKOBJ)
	$(CC) $(LINKOBJ) $(CFLAGS) $(LFLAGS) -o $(BIN)

main.o: main.c
	$(CC) $(CFLAGS) $(LFLAGS) -c main.c -o main.o

func64.o: func64.s
	nasm -f elf64 func64.s
