.PHONY: all dist dev deploy clean

all: dist

dist:
	hugo build -d dist --cleanDestinationDir

dev:
	hugo server -D -F -w

deploy: dist
	aws s3 sync --acl=public-read ./dist/ s3://pid1.dev/

clean:
	rm -rf dist/

