(use-package autothemer)

(autothemer-deftheme
 graphite
 "A neon, shimmering theme for Emacs"

 ;; The color classes used by the theme. Theme supports GUI Emacs only.
 ((((class color) (min-colors #xFFFFFF))
  
  ;; Specify the color palette, color columns correspond to each of the classes above.
  (red "#781210")
  (green "#69f961")
  (blue "#64c7fc")
  (magenta "#e572c8")
  (lilac "#7b6b97")
  (yellow "#f9ef61")
  (cyan "#50fcce"))
 
 ;; Specifications for Emacs faces.
 ((default (:foreground example-cyan))
  (error  (:foreground example-red))))
    
(provide-theme 'graphite)
