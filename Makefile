SRC=src
BUILD=resources

.PHONY: clean test

all: $(BUILD)/libmurmurhash.so

$(BUILD)/libmurmurhash.so: $(SRC)/libmurmurhash.o
	mkdir -p $(BUILD) && \
	gcc -Wall -fPIC -shared -O2 -I murmurhash $(SRC)/libmurmurhash.o -o $(BUILD)/libmurmurhash.so

$(SRC)/libmurmurhash.o:
	mkdir -p $(SRC) && \
	gcc -Wall -fPIC -O2 -c -I murmurhash murmurhash/murmurhash.c -o $(SRC)/libmurmurhash.o

test: $(BUILD)/libmurmurhash.so
	prove

clean:
	-rm -rf $(SRC) $(BUILD)
