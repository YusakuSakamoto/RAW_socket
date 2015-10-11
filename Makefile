CC		=g++
OUT1	=sendRawEth
OUT2	=recvRawEth

.PHONY:clean
all:$(OUT1) $(OUT2)

$(OUT1):./src/$(OUT1).c
	g++ $< -o $@

$(OUT2):./src/$(OUT2).c
	g++ $< -o $@

clean:
	rm ./bin/* ./recvRawEth ./sendRawEth
