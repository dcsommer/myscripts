(add-to-list 'load-path (file-name-directory load-file-name))
(let ((default-directory (file-name-directory load-file-name)))
     (normal-top-level-add-subdirs-to-load-path))
; my standard preferences, look and feel, etc
(load "misc")
; matlab major mode
(load "matlab")
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
; TODO figure out why above doesn't work in -nw mode