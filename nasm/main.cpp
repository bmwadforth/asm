#include <iostream>

extern "C" {
void x64_00_SystemCalls_Dialog(char *title, char *body);
int x64_03_Conditionals();
int x64_04_Procedures_Sum(int a, int b, int c, int d, int e);
void x64_05_Loops();
}

int main() {
    // 00_SystemCalls
    char *title = "00_SystemCalls";
    char *body = "Hello from C++!";
    x64_00_SystemCalls_Dialog(title, body);

    // 03_Conditionals
    auto x = x64_03_Conditionals();
    std::cout << "03_Conditionals: Unconditional_Jumps returned: " << x << std::endl;

    // 04_Procedures
    auto sum = x64_04_Procedures_Sum(1, 2, 3, 4, 5);
    std::cout << "04_Procedures: SumProcedure returned: " << sum << std::endl;

    // 05_Loops
    x64_05_Loops();

    return 0;
}