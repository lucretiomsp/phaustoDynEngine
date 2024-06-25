# Makefile.am
AUTOMAKE_OPTIONS = subdir-objects
ACLOCAL_AMFLAGS = -I m4

bin_PROGRAMS = libdynamic-engine
libdynamic_engine_SOURCES = architecture/faust/dsp/faust-dynamic-engine.cpp
libdynamic_engine_LDFLAGS = -L$(top_builddir)/librariesBundle -lportaudio -lfaust
libdynamic_engine_CPPFLAGS = -I/Users/domenicocipriani/MyStuff/coding/faust/architecture
libdynamic_engine_LDFLAGS += -shared -o librariesBundle/libdynamic-engine.dll
