(dolist (theme ef-themes-collection)
  (let ((palette (symbol-value (intern (concat (symbol-name theme) "-palette")))))
    (write-region
     (concat
      "base00: \"" (substring (car (alist-get 'bg-main palette)) 1) "\" # bg-main\n"
      "base01: \"" (substring (car (alist-get 'red palette)) 1) "\" # red\n"
      "base02: \"" (substring (car (alist-get 'green palette)) 1) "\" # green\n"
      "base03: \"" (substring (car (alist-get 'yellow palette)) 1) "\" # yellow\n"
      "base04: \"" (substring (car (alist-get 'blue palette)) 1) "\" # blue\n"
      "base05: \"" (substring (car (alist-get 'magenta palette)) 1) "\" # magenta\n"
      "base06: \"" (substring (car (alist-get 'cyan palette)) 1) "\" # cyan\n"
      "base07: \"" (substring (car (alist-get 'fg-alt palette)) 1) "\" # fg-alt\n"
      "base08: \"" (substring (car (alist-get 'bg-active palette)) 1) "\" # bg-active\n"
      "base09: \"" (substring (car (alist-get 'red-warmer palette)) 1) "\" # red-warmer\n"
      "base0A: \"" (substring (car (alist-get 'green-cooler palette)) 1) "\" # green-cooler\n"
      "base0B: \"" (substring (car (alist-get 'yellow-warmer palette)) 1) "\" # yellow-warmer\n"
      "base0C: \"" (substring (car (alist-get 'blue-warmer palette)) 1) "\" # blue-warmer\n"
      "base0D: \"" (substring (car (alist-get 'magenta-cooler palette)) 1) "\" # magenta-cooler\n"
      "base0E: \"" (substring (car (alist-get 'cyan-cooler palette)) 1) "\" # cyan-cooler\n"
      "base0F: \"" (substring (car (alist-get 'fg-main palette)) 1) "\" # fg-main\n"
      )
     nil
     (concat (file-name-directory (buffer-file-name)) (symbol-name theme) ".yaml"))))
