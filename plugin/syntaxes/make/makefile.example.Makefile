# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -O2

# Source files
SOURCES = main.c utils.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Executable name
EXECUTABLE = myprogram

# Default target
all: $(EXECUTABLE)

# Compile source files into object files
%.o: %.c
   $(CC) $(CFLAGS) -c $< -o $@

# Link object files into the executable
$(EXECUTABLE): $(OBJECTS)
   $(CC) $(CFLAGS) $(OBJECTS) -o $(EXECUTABLE)

# Clean up generated files
clean:
   rm -f $(OBJECTS) $(EXECUTABLE)
