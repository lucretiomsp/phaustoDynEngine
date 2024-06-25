# Makefile for compiling faust-dynamic-engine on Windows using MinGW

# Compiler
CXX = g++
# Compiler flags
CXXFLAGS = -std=c++11 -O3 -DINTERP_DSP -DPORTAUDIO_DRIVER -DSOUNDFILE -DDAISY

# Directories
SRC_DIR = architecture/faust/dsp
BUILD_DIR = build
LIB_DIR = librariesBundle

# Source file
SRCS = $(SRC_DIR)/faust-dynamic-engine.cpp

# Target dynamic library
TARGET = $(LIB_DIR)/libdynamic-engine.dll

# Libraries
LIBS = -lportaudio -lfaust
# Include paths
INCLUDES = -I/Users/domenicocipriani/MyStuff/coding/faust/architecture
# Library paths
LDFLAGS = -L$(LIB_DIR)

# Phony targets
.PHONY: all clean

# Default target
all: $(TARGET)

# Rule to build the dynamic library
$(TARGET): $(SRCS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) $(SRCS) $(LIBS) -shared -o $@

# Create build directory
$(BUILD_DIR):
	@if not exist $(BUILD_DIR) mkdir $(BUILD_DIR)

# Clean target
clean:
	@if exist $(BUILD_DIR) rmdir /S /Q $(BUILD_DIR)
	@if exist $(TARGET) del $(TARGET)
