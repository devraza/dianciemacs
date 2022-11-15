;; This file contains keybindings for Dianciemacs

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
 "m f" '(magit-status :wk "File Dispatch"))


;; Flymake & LSP
(general-create-definer diancite/lsp
  :prefix leader-key)

(diancite/lsp
 :keymaps 'normal
 "l" '(:wk "LSP")
 "l n" '(flymake-goto-next-error :wk "Next Error")
 "l p" '(flymake-goto-prev-error :wk "Previous Error")
 "l f" '(eglot-format :wk "Format Buffer")

 "l w" '(:wk "Server")
 "l w r" '(eglot-reconnect :wk "Restart Server")
 "l w q" '(eglot-shutdown :wk "Shutdown Server"))
