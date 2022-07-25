OSFLAG :=
ifeq ($(OS),Windows_NT)
	OSFLAG += WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += OSX
	endif
		UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		OSFLAG += AMD64
	endif
		ifneq ($(filter %86,$(UNAME_P)),)
	OSFLAG += IA32
		endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG += ARM
	endif
endif
.PHONY: all clean build link
.DEFAULT_GOAL := all

all: clean build link

clean:
ifeq ($(findstring WIN32,$(OSFLAG)),WIN32)
	del /q /S .\build\*.obj
endif

build: src/main.asm src/console.asm
ifeq ($(findstring WIN32,$(OSFLAG)),WIN32)
	if not exist build mkdir build
	nasm -fwin32 ./src/main.asm -o ./build/main.obj
	nasm -fwin32 ./src/console.asm -o ./build/console.obj
endif

link: build
ifeq ($(findstring WIN32,$(OSFLAG)),WIN32)
	link /subsystem:console /nodefaultlib kernel32.lib user32.lib /entry:main /out:./build/main.exe ./build/main.obj
	link /subsystem:console /nodefaultlib kernel32.lib user32.lib /entry:main /out:./build/console.exe ./build/console.obj
endif




# Use as reference

#TARGET = app
#
#SRCS  = $(shell find ./src     -type f -name *.asm)
#HEADS = $(shell find ./include -type f -name *.h)
#OBJS = $(SRCS:.cpp=.o)
#DEPS = Makefile.depend

#INCLUDES = -I./include
#CXXFLAGS = -O2 -Wall $(INCLUDES)
#LDFLAGS = -lm


#all: $(TARGET)

#$(TARGET): $(OBJS) $(HEADS)
#	$(CXX) $(LDFLAGS) -o $@ $(OBJS)

#run: all
#	@./$(TARGET)

#.PHONY: depend clean
#depend:
#	$(CXX) $(INCLUDES) -MM $(SRCS) > $(DEPS)
#	@sed -i -E "s/^(.+?).o: ([^ ]+?)\1/\2\1.o: \2\1/g" $(DEPS)

#clean:
#	$(RM) $(OBJS) $(TARGET)

#-include $(DEPS)