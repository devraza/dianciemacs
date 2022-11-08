;; Disable Emacs' GTK decorations. Done in this file otherwise done too late.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable the modeline. Done in this file for the same reason above
(setq-default mode-line-format nil)

;; Straight.el bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package for simplicity, and use straight.el for it by default
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Always make sure packages are installed to the system
(setq use-package-always-ensure t)

;; Add external e-lisp files to the load-path
(add-to-list 'load-path (concat user-emacs-directory
        (convert-standard-filename "lisp/")))

;; Load the code of some external files
(require 'interface)
(require 'editor)
(require 'org-mode)
(require 'performance)
