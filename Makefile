SUBDIRS=ex1 ex1.1 ex2

clean:
	$(foreach d, $(SUBDIRS), make -C $(d) clean;)
