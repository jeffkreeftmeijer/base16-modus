.PHONY: generate

generate:
	emacs --batch --load base16-modus.el --funcall base16-themes-generate
