all: api_example

api_example: api_example.o zlm_binding.o zlm_fif.o libzlm.a
	gfortran -o $@ $^

api_example.o: zlm_binding.o
zlm_binding.o: zlm_fif.o

libzlm.a:
	$(error copy '$@' file into this directory)

%.o: %.f90
	gfortran -c $<

.PHONY: clean cleanup

clean:
	rm -f *.o *.mod

cleanup: clean
	rm -f api_example
