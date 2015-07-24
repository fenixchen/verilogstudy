SUBDIRS=ex1

clean:
	$(foreach d, $(SUBDIRS), make -C $(d) clean)
