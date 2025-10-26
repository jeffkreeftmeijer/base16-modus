(dolist (theme ef-themes-collection)
  (let ((palette (symbol-value (intern (concat (symbol-name theme) "-palette")))))
    (write-region
     (concat
      "base00: \"" (substring (car (alist-get 'bg-main palette)) 1) "\" # bg-main\n"
      "base01: \"" (substring (car (alist-get 'bg-alt palette)) 1) "\" # bg-alt\n"
      "base02: \"" (substring (car (alist-get 'bg-region palette)) 1) "\" # bg-region\n"
      "base03: \"" (substring (car (alist-get 'bg-completion palette)) 1) "\" # bg-completion\n"
      "base04: \"" (substring (car (alist-get 'fg-alt palette)) 1) "\" # fg-alt\n"
      "base05: \"" (substring (car (alist-get 'fg-main palette)) 1) "\" # fg-main\n"
      "base06: \"" (substring (car (alist-get 'fg-dim palette)) 1) "\" # fg-dim\n"
      "base07: \"" (substring (car (alist-get 'bg-dim palette)) 1) "\" # bg-dim\n"
      "base08: \"" (substring (car (alist-get 'magenta-cooler palette)) 1) "\" # magenta-cooler\n"
      "base09: \"" (substring (car (alist-get 'red-cooler palette)) 1) "\" # red-cooler\n"
      "base0A: \"" (substring (car (alist-get 'magenta-warmer palette)) 1) "\" # magenta-warmer\n"
      "base0B: \"" (substring (car (alist-get 'yellow palette)) 1) "\" # yellow\n"
      "base0C: \"" (substring (car (alist-get 'yellow-warmer palette)) 1) "\" # yellow-wamer\n"
      "base0D: \"" (substring (car (alist-get 'blue-warmer palette)) 1) "\" # blue-warmer\n"
      "base0E: \"" (substring (car (alist-get 'blue-warmer palette)) 1) "\" # blue-warmer\n"
      "base0F: \"" (substring (car (alist-get 'cyan palette)) 1) "\" # cyan\n"
      )
     nil
     (concat (file-name-directory (buffer-file-name)) (symbol-name theme) ".yaml"))))
