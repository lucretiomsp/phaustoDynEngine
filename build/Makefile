# Linux Makefile

CXX = g++
CXXFLAGS = -std=c++11 -O3 -DINTERP_DSP -DPORTAUDIO_DRIVER -DSOUNDFILE -DDAISY
SRC_DIR = architecture/faust/dsp
BUILD_DIR = build
LIB_DIR = librariesBundle

SRCS = $(SRC_DIR)/faust-dynamic-engine.cpp
TARGET = $(BUILD_DIR)/libdynamic-engine.so

LIBS = -lfaust -lrtaudio -lsndfile -ldl -lpthread
INCLUDES = -I./architecture/faust
LDFLAGS = -L$(LIB_DIR)

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRCS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(LDFLAGS) $(SRCS) $(LIBS) -shared -fPIC -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR) $(TARGET)
