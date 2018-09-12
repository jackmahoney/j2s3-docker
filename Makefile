build:
	docker build --no-cache -t jackmahoney/j2s3:latest .

publish: build
	docker push jackmahoney/j2s3:latest
