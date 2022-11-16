;;; lisp/performance.el --- Performance improvements for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Emacs is widely known to be one of the slower editors - despite the
;; great 'native compilation' or the daemon-client relationship.  So that needs to change too.
;;
;;; Code:

;; Reduce garbage collection at startup
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;;; performance.el ends here
