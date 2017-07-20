CFLAGS+= `pkg-config --cflags opencv`
LDFLAGS+=`pkg-config --libs opencv`

DIR_MXNET=mxnet

# Added for mxnet
CFLAGS+=-Wall -I$(DIR_MXNET)/include -std=c++11
LDFLAGS+=-L${DIR_MXNET}/lib -lmxnet -lopenblas

image-classification-predict: image-classification-predict.o
	$(CXX) -O3 -o image-classification-predict image-classification-predict.o $(LDFLAGS)

image-classification-predict.o: image-classification-predict.cc
	$(CXX) -O3 -c image-classification-predict.cc ${CFLAGS}

clean:
	rm -f *.d *.o
	rm -f image-classification-predict
