(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))

  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)

  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default use-package-always-ensure t)
(add-to-list 'load-path "~/.emacs.d/scripts/")

(use-package ob-async)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (editorconfig hcl-mode sed-mode nginx-mode elixir-mode typescript-mode edit-indirect floobits docker-compose-mode graphviz-dot-mode zzz-to-char yasnippet-snippets yaml-mode which-key vala-mode use-package sudo-edit spaceline solarized-theme smex rainbow-mode rainbow-delimiters racer quick-peek projectile paredit org-bullets ob-async neotree meson-mode meghanada markdown-mode linum-relative ido-vertical-mode hungry-delete flycheck-rust flycheck-popup-tip flycheck-irony flycheck-inline fish-mode fish-completion evil-magit ein ediprolog dot-mode dockerfile-mode diminish dashboard counsel company-quickhelp company-jedi company-irony company-go company-c-headers cider better-defaults beacon))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :height 80 :weight normal :width normal :family "Go Mono")))))
