
# base16-ef-themes

A [base16](https://github.com/chriskempson/base16) representation of prot's [ef-themes](https://protesilaos.com/emacs/ef-themes).


## Generate base16 YAML representations of the ef-themes

The `base16-ef-themes-generate` function loops over each theme in `ef-themes-collection`. In each iteration, it loads the theme to make sure the palette is available, then writes a representation of the theme to a YAML file named after the theme.

```emacs-lisp
(require 'ef-themes)

(defun base16-ef-themes-generate ()
  (dolist (theme ef-themes-collection)
    (load-theme theme t t)
    (let ((palette (symbol-value (intern (concat (symbol-name theme) "-palette")))))
      (write-region
       (concat
        "base00: \"" (substring (car (alist-get 'bg-main palette)) 1) "\" # bg-main\n"
        "base01: \"" (substring (car (alist-get 'bg-dim palette)) 1) "\" # bg-dim\n"
        "base02: \"" (substring (car (alist-get 'bg-alt palette)) 1) "\" # bg-alt\n"
        "base03: \"" (substring (car (alist-get 'bg-active palette)) 1) "\" # bg-active\n"
        "base04: \"" (substring (car (alist-get 'blue-warmer palette)) 1) "\" # blue-warmer\n"
        "base05: \"" (substring (car (alist-get 'fg-main palette)) 1) "\" # fg-main\n"
        "base06: \"" (substring (car (alist-get 'fg-dim palette)) 1) "\" # fg-dim\n"
        "base07: \"" (substring (car (alist-get 'fg-alt palette)) 1) "\" # bg-alt\n"
        "base08: \"" (substring (car (alist-get 'red-cooler palette)) 1) "\" # red-cooler\n"
        "base09: \"" (substring (car (alist-get 'magenta-cooler palette)) 1) "\" # magenta-cooler\n"
        "base0A: \"" (substring (car (alist-get 'yellow palette)) 1) "\" # yellow\n"
        "base0B: \"" (substring (car (alist-get 'yellow-warmer palette)) 1) "\" # yellow-warmer\n"
        "base0C: \"" (substring (car (alist-get 'cyan-cooler palette)) 1) "\" # cyan-cooler\n"
        "base0D: \"" (substring (car (alist-get 'blue-warmer palette)) 1) "\" # blue-warmer\n"
        "base0E: \"" (substring (car (alist-get 'magenta-cooler palette)) 1) "\" # magenta-cooler\n"
        "base0F: \"" (substring (car (alist-get 'yellow palette)) 1) "\" # yellow\n"
        )
       nil
       (concat (symbol-name theme) ".yaml")))))
```

The `Makefile` has a `generate` function switch loads the `base16-ef-themes.el` script and runs the `base16-ef-themes-generate` function.

```makefile
.PHONY: generate

generate:
        emacs --batch --load base16-ef-themes.el --funcall base16-ef-themes-generate
```

To regenerate all themes, or to generate new ones when they're added, run `make generate` and commit the results.