#include <iostream>

extern "C" {
    void Windows_x64_PrintDialog(char* title, char* body);
    int Unconditional_Jumps();
}
int main() {
    //char* title = "x64-bit Dialog";
    //char* body = "Hello from C++";
    //Windows_x64_PrintDialog(title, body);


    auto x = Unconditional_Jumps();
    std::cout << "Assembly function returned: " << x << std::endl;
    return 0;
}

