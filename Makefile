default:
	go build

test:
	go test -v ./...

install:
	go get -t ./...