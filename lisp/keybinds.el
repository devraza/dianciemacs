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
