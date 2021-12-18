(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq back-directory-alist '(("." . "~/.emacs.d/backups")))
(setq vc-follow-symlinks t)
(setq ring-bell-function 'ignore)
(setq coding-system-for-read 'utf-8)
(setq coding-system-write 'utf-8)
(setq sentence-end-double-space nil)
(setq default-fill-column 80)
(setq initial-scratch-message "Welcome to DianciEmacs")

(load (concat (file-name-directory load-file-name)
	      "keybindings.el")
      nil (not init-file-debug))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(use-package general :ensure t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula)

(defun always-use-fancy-splash-screens-p () 1)
  (defalias 'use-fancy-splash-screens-p 'always-use-fancy-splash-screens-p)

(add-hook 'text-mode-hook 'read-only-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#6272a4" "#bd93f9" "#8be9fd" "#f8f8f2"])
 '(buffer-read-only t t)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("18bec4c258b4b4fb261671cf59197c1c3ba2a7a47cc776915c3e8db3334a0d25" "1e635c22c23dbc541c395746b4846b8c4549d7157e1fe8b382278ab5b6d51ed5" default)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/.emacs.d/README.org")
 '(package-selected-packages (quote (org general use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
