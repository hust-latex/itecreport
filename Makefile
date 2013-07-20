# OS detected
ifeq ($(OS),Windows_NT)
	ifneq ($(findstring .exe,$(SHELL)),)
    OS_TYPE := Windows
	else
    OS_TYPE := Cygwin
	endif
else
    OS_TYPE := $(shell uname -s)
endif

all:unpack example doc
example:example-zh example-en

unpack:FORCE
	make -C ./itecreport unpack

example-zh ./itecreport/itecreport-zh-example.pdf:
	make -C ./itecreport example-zh

example-en ./itecreport/itecreport-en-example.pdf:
	make -C ./itecreport example-en

doc ./itecreport/itecreport.pdf:
	make -C ./itecreport doc

clean:
	make -C ./itecreport clean

reallyclean:
	make -C ./itecreport reallyclean

install:unpack ./itecreport/itecreport-zh-example.pdf ./itecreport/itecreport-en-example.pdf ./itecreport/itecreport.pdf
ifeq ($(OS_TYPE),Windows)
	./install/win32.bat install
else
	./install/unix.sh install
endif

uninstall:
ifeq ($(OS_TYPE),Windows)
	./install/win32.bat uninstall
else
	./install/unix.sh uninstall
endif

checksum:FORCE
	make -C ./itecreport checksum

FORCE:
.PHONY:all unpack example example-zh example-en doc install uninstall clean reallyclean checksum FORCE
