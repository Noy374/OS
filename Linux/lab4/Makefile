name="lab4"
start: task.cpp
	g++ task.cpp -o ${name}
clean:
	rm -rf *.o ${name}
install: start
	mkdir -p ~/bin
	cp hello ~/bin
