build:
	docker build -t jackmahoney/j2s3:latest .

publish: build
	docker push jackmahoney/j2s3:latest
