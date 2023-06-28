;;; init.el --- This file contains user configuration. You're completely free to *safely* work with Dianciemacs here.

;;; Commentary:
;;
;; All user configuration should be done from this file,
;; In order to keep user code clean and manageable
;;
;;; Code:

(add-to-list 'custom-theme-load-path "~/Projects/hazakura-emacs")
(load-theme 'hazakura t)

(with-eval-after-load 'org
  ;; Faces for the font sizes of org-mode headings
  (set-face-attribute 'org-level-8 nil :weight 'bold :family "Urbanist")
  (set-face-attribute 'org-level-7 nil :weight 'bold :family "Urbanist")
  (set-face-attribute 'org-level-6 nil :weight 'bold :family "Urbanist")
  (set-face-attribute 'org-level-5 nil :weight 'bold :family "Urbanist")
  (set-face-attribute 'org-level-4 nil :weight 'bold :family "Urbanist")
  (set-face-attribute 'org-level-3 nil :weight 'bold :height 1.05 :family "Urbanist")
  (set-face-attribute 'org-level-2 nil :weight 'bold :height 1.1 :family "Urbanist")
  (set-face-attribute 'org-level-1 nil :weight 'bold :height 1.2 :family "Urbanist")
  (set-face-attribute 'org-document-title nil
                    :height 1.65
                    :foreground 'unspecified
                    :weight 'bold
		    :family "Urbanist"))

;;; init.el ends here
