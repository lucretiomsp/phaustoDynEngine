# configure.ac
AC_INIT([faust-dynamic-engine], [1.0], [support@example.com])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_MACRO_DIRS([m4])
AC_PROG_CXX
LT_INIT

# Checks for libraries.
AC_CHECK_LIB([portaudio], [Pa_Initialize])
AC_CHECK_LIB([faust], [main])

# Checks for header files.
AC_CHECK_HEADERS([portaudio.h faust/dsp/faust-dynamic-engine.h])

# Output files
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
