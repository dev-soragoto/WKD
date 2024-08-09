all: clean index.html generate-WKD

.PHONY: generate-WKD
generate-WKD:
	mkdir -p ./.well-known/openpgpkey
	cd ./.well-known && ./make.py ../staffs.json

index.html: index.md
	nix run nixpkgs#pandoc -- -c style.css --embed-resources --standalone index.md -o index.html --to=html5 --metadata title="Web Key Directory of Project Trans" -V lang=en-US

.PHONY: clean
clean:
	rm -rf index.html
	rm -rf ./.well-known/openpgpkey
