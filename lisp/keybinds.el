;;; This file contains keybindings for Dianciemacs

;; Files
(general-create-definer diancite/file
  :prefix leader-key)

(diancite/file
 :keymaps 'normal
 "f f" '(find-file :wk "Find File")
 "f s" '(save-buffer :wk "Save Buffer"))

;; Provide file file init.el
(provide 'keybinds)
