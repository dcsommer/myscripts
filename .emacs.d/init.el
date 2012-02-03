(add-to-list 'load-path (file-name-directory load-file-name))
; my standard preferences
(load "misc")
; matlab major mode
(load "matlab")
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
