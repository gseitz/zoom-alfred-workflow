.PHONY: clean build dist install

clean:
	cargo clean
	rm -rf dist

build:
	cargo build --release

dist:
	mkdir dist
	cp -R workflow dist
	cp target/release/zoom-alfred-workflow dist/workflow/
	cd dist/workflow && strip zoom-alfred-workflow
	cd dist/workflow && zip ../zoom-alfred-workflow.alfredworkflow *


install: dist
	open dist/zoom-alfred-workflow.alfredworkflow