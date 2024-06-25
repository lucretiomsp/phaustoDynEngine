# Makefile for compiling faust-dynamic-engine on Windows using MinGW

# Compiler
CXX = g++
# Compiler flags
CXXFLAGS = -std=c++11 -O3

# Directories
SRC_DIR = architecture/faust/dsp
BUILD_DIR = build
LIB_DIR = librariesBundle

# Source file
SRCS = $(SRC_DIR)/faust-dynamic-engine.cpp

# Target dynamic library
TARGET = $(LIB_DIR)/libdynamic-engine.dll

# Libraries and frameworks
LIBS = -lportaudio -lfaust
FRAMEWORKS = -lcorefoundation -laudiounit

# Includes and library paths
INCLUDES = -I/Users/domenicocipriani/MyStuff/coding/faust/architecture
LDFLAGS = -L$(LIB_DIR)

# Phony targets
.PHONY: all clean

# Default target
all: $(TARGET)

# Rule to build the dynamic library
$(TARGET): $(SRCS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) $(SRCS) $(LIBS) $(FRAMEWORKS) -shared -o $@

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean target
clean:
	rm -rf $(BUILD_DIR) $(TARGET)
