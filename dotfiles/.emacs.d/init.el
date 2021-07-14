
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

; Recursively add all subpaths to the load-path
(let ((default-directory "~/.emacs.d"))
    (normal-top-level-add-subdirs-to-load-path))

; my standard preferences, look and feel, etc. (can't be named plain
; "misc", since that conflicts with a built-in emacs package)
(load "my-misc")
; haskell major mode -- off for now, its not working
;(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; NOTE: Can only use 1 indentation mode at a time
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Configure Major Modes for FB/custom extensions
(add-to-list 'auto-mode-alist '("\\.td\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.bzl\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.cinc\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.cconf\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.sky\\'" . python-mode))
(add-to-list 'auto-mode-alist '("BUCK\\'" . python-mode))
(add-to-list 'auto-mode-alist '("TARGETS\\'" . python-mode))

; Add Rust mode
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (swift-mode php-mode string-inflection auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal)))))
