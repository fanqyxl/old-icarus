setup-venv:
	python3 -m venv .venv
	exit
setup-python:
	mkdir -p gen/python
	protoc --python_out=gen/python crs.proto
	exit