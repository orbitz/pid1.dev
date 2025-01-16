.PHONY: all dist dev deploy upload cache-invalidate clean

CLOUDFRONT_DIST_ID ?= E1R8HCRA8B5MFF

all: dist

dist:
	hugo build -d dist --cleanDestinationDir

dev:
	hugo server -D -F -w

upload: dist
	aws s3 sync --acl=public-read ./dist/ s3://pid1.dev/

cache-invalidate: upload
	aws cloudfront create-invalidation --distribution-id $(CLOUDFRONT_DIST_ID) --paths '/*'

deploy: upload cache-invalidate


clean:
	rm -rf dist/

