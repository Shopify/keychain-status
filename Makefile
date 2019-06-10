SWIFTC=swiftc
CFLAGS=-O -gnone
BIN=keychain-status
INPUT=$(BIN).swift
PREFIX=/usr/local
TARGET=$(PREFIX)/bin/$(BIN)

all: $(BIN)

$(BIN): $(INPUT)
	$(SWIFTC) $(CFLAGS) $<

install: $(TARGET)

$(TARGET): $(BIN)
	install $< $@

clean:
	rm -f $(BIN)

.PHONY: all clean install test