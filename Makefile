.PHONY: all dev clean

all:
	hugo build -d dist --cleanDestinationDir

dev:
	hugo server -D -F -w

clean:
	rm -rf dist/
