#include <iostream>
#include <cassert>

extern "C" {
    const char* getLastError();
}

int main() {
    const char* err = getLastError();
    std::cout << "getLastError() returned: \"" << err << "\"\n";

    // Verify that it is empty
    assert(err != nullptr);
    assert(err[0] == '\0');

    std::cout << "Library linked correctly and getLastError() is empty!\n";
    return 0;
}
