(require 'package)
(setq-default use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/scripts/")

(use-package ob-async)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "158013ec40a6e2844dbda340dbabda6e179a53e0aea04a4d383d69c329fba6e6" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(max-lisp-eval-depth 8000)
 '(org-agenda-files (quote ("~/.emacs.d/config.org")))
 '(package-selected-packages
   (quote
    (sudo-edit el-get skewer-mode ein quick-peek flycheck-inline edit-indirect dockerfile-mode docker yaml-mode racer flycheck-rust rust-mode paredit better-defaults cider clojure-mode company-go go-complete meghanada megahanada vala-mode go-mode flycheck-popup-tip flycheck-popup company-quickhelp company-jedi jedi-core markdown-mode ghub evil-magit magit elscreen company-c-headers epresent xterm-color neotree htmlize ox-twbs ranger symon dmenu deminish company projectile dashboard rainbow-mode rainbow-delimiters hungry-delete spaceline-all-themes spaceline switch-window avy smex ido-vertical-mode org-bullets beacon solarized-theme powerline-evil powerline use-package)))
 '(pos-tip-internal-border-width 10)
 '(semantic-mode t)
 '(tab-always-indent t))

(put 'scroll-left 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
