;;; lisp/performance.el --- Performance improvements for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Emacs is widely known to be one of the slower editors - despite the
;; great 'native compilation' or the daemon-client relationship.  So that needs to change too.
;;
;;; Code:

;; Increase the threshold
(setq gc-cons-threshold (* 50 1000 1000))

;;; performance.el ends here
