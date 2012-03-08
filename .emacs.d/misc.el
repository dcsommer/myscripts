;;; turn on auto-fill (emacs 19)
(setq-default auto-fill-function 'do-auto-fill)

;;; Allow extra space at the end of the line
(setq-default fill-column 74)

;;; Soft Tabs ;;;
(setq-default indent-tabs-mode nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal)))))
; shortcut to make goto-line easier and faster
(global-set-key "\C-cl" 'goto-line)

(column-number-mode 1)
(set-cursor-color "red")
(blink-cursor-mode -1)
(show-paren-mode 1)
(setq show-paren-delay 0)

; turn off menubar, toolbar, and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; keyboard scroll one line at a time
(setq scroll-step 1)

; easy window switching
(defun select-next-window ()
  "Switch to the next window" 
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))

(global-set-key (kbd "M-<right>") 'select-next-window)
(global-set-key (kbd "M-<left>")  'select-previous-window)

