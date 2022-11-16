;;; lisp/keybinds.el --- Some default keybinds for Dianciemacs' -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; There's not much to say about this section.  Keybinds are a very important
;; part of an editor's editing experience, and in Dianciemacs keys are bound to
;; leader-key (SPC by default).  Changing the leader-key can be easily done by
;; changing the `leader-key' constant in the `init.el' at the project root.
;;
;;; Code:

;; Files
(general-create-definer diancite/file
  :prefix leader-key)

(diancite/file
 :keymaps 'normal
 "f f" '(find-file :wk "Find File")
 "f s" '(save-buffer :wk "Save Buffer"))

;; Magit
(general-create-definer diancite/magit
  :prefix leader-key)

(diancite/magit
 :keymaps 'normal
 "m s" '(magit-status :wk "Status")
 "m d" '(magit-dispatch :wk "Dispatch")
 "m f" '(magit-file-dispatch :wk "File Dispatch"))

;; Flymake & LSP
(general-create-definer diancite/lsp
  :prefix leader-key)

(diancite/lsp
 :keymaps 'normal
 "l" '(:wk "LSP")
 "l n" '(flycheck-next-error :wk "Next Error")
 "l p" '(flycheck-previous-error :wk "Previous Error")
 "l f" '(eglot-format :wk "Format Buffer")

 "l w" '(:wk "Server")
 "l w r" '(eglot-reconnect :wk "Restart Server")
 "l w q" '(eglot-shutdown :wk "Shutdown Server"))

;;; keybinds.el ends here
