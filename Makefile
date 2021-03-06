OBJS = socksify.o connect_socks.o parse_arg.o
SO = my_connect.o connect_socks.o
CFLAGS = -Wall -c
EXTRAFLAG = -fPIC
SFLAGS = -fPIC -shared
LINKS = -ldl
CC = gcc

socksify : $(OBJS)
	$(CC) $(OBJS) -o socksify -ldl

libmyconnect.so: $(SO)
	$(CC) $(SFLAGS) $(SO) -o libmyconnect.so -ldl

socksify.o: 
	$(CC) $(CFLAGS) socksify.c 
my_connect.o: 
	$(CC) $(CFLAGS) $(EXTRAFLAG) my_connect.c -ldl
connect_socks.o: 
	$(CC) $(CFLAGS) $(EXTRAFLAG) connect_socks.c -ldl
parse_arg.o: 
	$(CC) $(CFLAGS) parse_arg.c 

clean:
	rm *.o socksify



