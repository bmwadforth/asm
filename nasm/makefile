all: build link

build:  main.asm console.asm
	nasm -fwin32 .\main.asm -o ./build/main.obj
	nasm -fwin32 .\console.asm -o ./build/console.obj

link:   build
	link /subsystem:console /nodefaultlib kernel32.lib user32.lib /entry:main /out:./build/main.exe ./build/main.obj
	link /subsystem:console /nodefaultlib kernel32.lib user32.lib /entry:main /out:./build/console.exe ./build/console.obj

