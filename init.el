;; Initial frame size...
(when window-system
  (set-frame-size (selected-frame) 82 40))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("d008dcedb7540ac6c3faf1749cdc8a1a79b91777da1ad061f734fd9f27c9025b" default)))
 '(package-selected-packages (quote (ggtags markdown-mode)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; Markdown Mode (https://jblevins.org/projects/markdown-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;
;; cscope

(require 'xcscope)

;;
;; Make C usable
(defun my-c-mode-hook () (c-set-style "linux" "free-group-style"))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;;
;; Load the zenburn theme when in a terminal.
;(unless (display-graphic-p) (load-file "~/.emacs.d/themes/zenburn-theme.el"))

;; Add all your customizations prior to loading the themes
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil
      modus-themes-region '(bg-only no-extend))

;; Load the theme of your choice:
(load-theme 'modus-operandi) ;; OR (load-theme 'modus-vivendi)

(define-key global-map (kbd "<f8>") #'modus-themes-toggle)

;;
;; gtags setup
(setq ggtags-executable-directory "/usr/bin")
