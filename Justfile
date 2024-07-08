build:
	go mod tidy
	go build -o wakatime-lsp-client main.go

install:
	just build
	cp wakatime-lsp-client ~/.local/bin
