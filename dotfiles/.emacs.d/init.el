
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
; matlab major mode
(load "matlab")
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
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
(add-to-list 'auto-mode-alist '("BUCK\\'" . python-mode))
(add-to-list 'auto-mode-alist '("TARGETS\\'" . python-mode))

; Add Rust mode
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

; Configure Racer for Rust code completion to start when Rust mode does
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
