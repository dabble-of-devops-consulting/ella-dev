# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build -c .
APP ?= /app
SOURCEDIR     = _source
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Build, watch and serve docs with live reload
livehtml:
	sphinx-autobuild -b html --host 0.0.0.0 --port 7000 --watch $(SOURCEDIR) $(SOURCEDIR) $(BUILDDIR)/html
        #sphinx-autobuild --host -0.0.0.0 --port 7000  _source html --watch _source


.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
