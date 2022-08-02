#include <iostream>
#include <iostream>     // std::cout, std::endl
#include <iomanip>      // std::setw

extern "C" {
    void Windows_x64_PrintDialog(char* title, char* body);
    int Unconditional_Jumps();
    int SumProcedure(int a, int b, int c, int d, int e);
}

int main() {
    // 00_SystemCalls
    char* title = "00_SystemCalls";
    char* body = "Hello from C++!";
    Windows_x64_PrintDialog(title, body);

    // 03_Conditionals
    auto x = Unconditional_Jumps();
    std::cout << "03_Conditionals: Unconditional_Jumps returned: " << x << std::endl;

    // 04_Procedures
    auto sum = SumProcedure(1, 2, 3, 4, 5);
    std::cout << "04_Procedures: SumProcedure returned: " << sum << std::endl;

    return 0;
}