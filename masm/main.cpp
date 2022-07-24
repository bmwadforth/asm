// masm.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

extern "C" int GetValueFromASM();

int main()
{
    std::cout << GetValueFromASM() << std::endl;

    return 0;
}