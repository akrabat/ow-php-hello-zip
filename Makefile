
# ------------------------------------------------------------------------------
# Package name to place the actions in
PACKAGE=hello

# list of actions to build (space separated)
ACTIONS = hello

ZIPS=$(ACTIONS:%=build/%.zip)



# ------------------------------------------------------------------------------
.PHONY: all upload
all: $(ZIPS)

# force an upload to OpenWhisk
upload: $(ZIPS)
	./bin/updateAction.sh $(PACKAGE) $?


# build an action's zip file from it's action directory
build/%.zip: actions/%/*
	pushd actions/$(@F:.zip=) && \
	if [ -a composer.json ] ; \
	then \
	     composer install ; \
	fi; \
	zip -q -r ../../$@ * && \
	popd && \
	./bin/updateAction.sh $(PACKAGE) $@


# ------------------------------------------------------------------------------
# Misc targets
.PHONY: lastlog setup clean distclean

lastlog:
	wsk activation list -l1 | tail -n1 | cut -d ' ' -f1 | xargs wsk activation logs

setup:
	# Create package, setting params from settings.json if it exists
	if [ -a settings.json ] ; \
	then \
	     wsk package update $(PACKAGE) --param-file settings.json ; \
	else \
		wsk package update $(PACKAGE) ; \
	fi;

clean:
	rm -rf build/*

distclean: clean
	./bin/deleteActions.sh $(PACKAGE) $(ACTIONS)
	wsk package delete $(PACKAGE)
