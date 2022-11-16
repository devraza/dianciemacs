;;; early-init.el --- Early changes to Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; This file contains elisp code to be run as early as Emacs will allow - this
;; means before the frame is actually loaded, which is why this file isn't
;; used as a replacement for the init.el file - time taken for the window to load
;; is more painful than time taken for the editor to load.
;;
;;; Code:

;; Disable the menubar. Done in this file otherwise done too late.
(menu-bar-mode -1)

;;; early-init.el ends here
