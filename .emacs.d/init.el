(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t
      use-package-compute-statistics t
      use-package-minimum-reported-time 0
	  use-package-verbose t
	  use-package-always-ensure t)
(setq load-prefer-newer t)

(add-to-list 'load-path "~/.emacs.d/scripts/")

(use-package ob-async)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
