GNATMAKEFLAGS= -p -P ../test.gpr

TEST_FILES=\
 test_xti_tcp_listen.adb\
 test_xti_tcp_connect.adb

TESTS=\
 test_xti_tcp_listen\
 test_xti_tcp_connect

all: $(TESTS)

tcp: test_xti_tcp_listen test_xti_tcp_connect

$(TESTS): $(TEST_FILES) $(POSIX_FILES)
	gnatmake $@ $(GNATMAKEFLAGS)

neat:
	co -l RCS/*

clean:
	rm -f *.o *.ali test_tcp_connect test_tcp_listen
