# helloworld

## reference 

* [Quick start](https://grpc.io/docs/languages/go/quickstart/)
  * 2022/01/16
  * [original](https://github.com/grpc/grpc-go/tree/a002994200f31f5b3e985e6b2cd2f12cb8b81389)

## Prerequires

* protoc
  * [reference](https://grpc.io/docs/protoc-installation/#install-pre-compiled-binaries-any-os)
  * [v3.19.3](https://github.com/protocolbuffers/protobuf/releases/tag/v3.19.3)
* protoc-gen-go
  * [site](https://pkg.go.dev/google.golang.org/protobuf/cmd/protoc-gen-go)
  * v1.27.1
* protoc-gen-go-grpc
  * [site](https://pkg.go.dev/google.golang.org/grpc/cmd/protoc-gen-go-grpc)
  * v1.2.0

```bash
$ go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.27
$ go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
```

```bash
$ protoc --version
libprotoc 3.19.3

$ protoc-gen-go --version
protoc-gen-go v1.27.1

$ protoc-gen-go-grpc --version
protoc-gen-go-grpc 1.2.0

$ go version
go version go1.17.6 linux/amd64
```

----

## Tutorials

### Tutorial 1

[reference](https://grpc.io/docs/languages/go/quickstart/#run-the-example)

terminal: server

```bash
$ go run greeter_server/main.go
```

terminal client

```bash
$ go run greeter_client/main.go
```

result

```bash
$ go run greeter_server/main.go 
2022/01/16 11:53:30 server listening at 127.0.0.1:50051
2022/01/16 11:53:38 Received: world
```

```bash
$ go run greeter_client/main.go 
2022/01/16 11:53:38 Greeting: Hello world
$
```

----

### Tutorial 2

#### Update the gRPC service

[reference](https://grpc.io/docs/languages/go/quickstart/#update-the-grpc-service)


```bash
$ vi proto/helloworld.proto
```

#### Regenerate gRPC code

[reference](https://grpc.io/docs/languages/go/quickstart/#regenerate-grpc-code)

```bash
cd proto
./gen_proto.sh
```

#### Update and run the application

[reference](https://grpc.io/docs/languages/go/quickstart/#update-and-run-the-application)


terminal: server

```bash
$ go run greeter_server/main.go
```

terminal client

```bash
$ go run greeter_client/main.go
```

result

```bash
$ go run greeter_server/main.go 
2022/01/16 12:20:07 server listening at 127.0.0.1:50051
2022/01/16 12:20:45 Received: world
```

```bash
$ go run greeter_client/main.go 
2022/01/16 12:20:45 Greeting: Hello world
2022/01/16 12:20:45 Greeting: Hello again world
$
```
