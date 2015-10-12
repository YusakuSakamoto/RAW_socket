CC		=g++
OUT1	=sendRawEth
OUT2	=recvRawEth

.PHONY:clean
all:$(OUT1) $(OUT2)

# compile ./src/*.o to Executable file
#===========================================
$(OUT1):./bin/$(OUT1).o
	@g++ $< -o $@

$(OUT2):./bin/$(OUT2).o
	@g++ $< -o $@
#===========================================

# compile ./src/*.c to ./bin/*.o
#===========================================
./bin/$(OUT1).o:./src/$(OUT1).c
	@g++ -c $< -o $@

./bin/$(OUT2).o:./src/$(OUT2).c
	@g++ -c $< -o $@
#===========================================



clean:
	rm ./bin/* ./recvRawEth ./sendRawEth
