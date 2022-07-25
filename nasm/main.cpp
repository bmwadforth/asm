#include <iostream>

extern "C" void Windows_User32_SysCall();
int main() {
    Windows_User32_SysCall();
    std::cout << "Hello, World!" << std::endl;
    return 0;
}

