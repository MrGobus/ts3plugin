CC=g++
CFLAGS=-Wall -Iinclude
LFLAGS=
TARGET=plugin_win64.dll

default: clear
	$(CC) $(CFLAGS) -c src/cJSON.c
	$(CC) $(CFLAGS) -c src/plugin.c
	$(CC) -shared -o ${TARGET} cJSON.o plugin.o -Wl,--out-implib,libplugin_win64.a

clear:
	rm -rf *.o
	rm -rf $(TARGET)
