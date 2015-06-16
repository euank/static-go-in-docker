.PHONY: all in-docker static-go-binary go-binary-in-docker clean

all: static-go-binary ./misc/ca-bundle.crt
	docker build -q -t ${USER}/my-docker-image:latest .

in-docker: go-binary-in-docker ./misc/ca-bundle.crt
	docker build -q -t ${USER}/my-docker-image:latest .

static-go-binary:
	@mkdir -p bin
	CGO_ENABLED=0 go build -a -installsuffix cgo -o ./bin/app main.go

go-binary-in-docker:
	@mkdir -p bin
	docker run -v "$(shell pwd)":/go/ golang:1.4 sh -c 'CGO_ENABLED=0 go build -a -installsuffix cgo -o /go/bin/app /go/main.go'

./misc/ca-bundle.crt:
	@mkdir -p misc
	curl -s https://raw.githubusercontent.com/bagder/ca-bundle/master/ca-bundle.crt > ./misc/ca-bundle.crt

clean:
	rm -rf ./bin ./misc/ca-bundle.crt
	-rmdir ./misc

