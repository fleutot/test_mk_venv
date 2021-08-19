venv:
	@echo VENV
	virtualenv $@ -p python2

foo_requirements: requirements.txt venv .FORCE
	@echo PIP
	( . venv/bin/activate && pip install -r $< )

.PHONY: foo_requirements

FOO_CMD_SCRIPT = foo.py

FOO_CMD = . venv/bin/activate && python2 $(FOO_CMD_SCRIPT)

$(FOO_CMD_SCRIPT): foo_requirements

#--- Usage ---
all: $(FOO_CMD_SCRIPT)
	$(FOO_CMD)

.FORCE:
