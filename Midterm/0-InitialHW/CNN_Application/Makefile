all: cnnSolver

cnnSolver: cnnSolver.cpp cnn.cpp model.cpp CAccelDriver.cpp CConv2DDriver.cpp util.cpp
	g++ -O3 -Wall cnnSolver.cpp cnn.cpp model.cpp CAccelDriver.cpp CConv2DDriver.cpp util.cpp -o cnnSolver -lm -lcma -lpthread

clean:
	rm -f cnnSolver

