;;; This file improves the performance of Emacs, startup or otherwise

;; Reduce garbage collection at startup
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; Provide this file to init.el
(provide 'performance)
