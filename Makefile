# Makefile for building all .c files in ./src into Atari ST TOS programs

# Compiler 
CC = m68k-atari-mint-gcc

# Directories
SRC_DIRECTORY = ./src
OBJ_DIRECTORY = ./target/obj
BUILD_DIRECTORY = ./target/build

# Target executable
TARGET = $(BUILD_DIRECTORY)/hello.tos

# Source files
SRCS = $(wildcard $(SRC_DIRECTORY)/*.c)

# Object files
OBJS = $(patsubst $(SRC_DIRECTORY)/%.c, $(OBJ_DIRECTORY)/%.o, $(SRCS))

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	@mkdir -p $(BUILD_DIRECTORY)
	$(CC) -o $@ $^

# Compile source files to object files
$(OBJ_DIRECTORY)/%.o: $(SRC_DIRECTORY)/%.c
	@mkdir -p $(OBJ_DIRECTORY)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(OBJ_DIRECTORY) $(BUILD_DIRECTORY)
