;;; turn on auto-fill (emacs 19)
(setq-default auto-fill-function 'do-auto-fill)

;;; Allow extra space at the end of the line
(setq-default fill-column 74)

;;; Soft Tabs ;;;
(setq-default indent-tabs-mode nil)

;;; If using hard tabs, make them 2 spaces ;;;
(setq-default tab-width 2)

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
(if (boundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; For tags
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))

;; Auto refresh of the tags file
  ;;;  Jonas.Jarnestrom<at>ki.ericsson.se A smarter
  ;;;  find-tag that automagically reruns etags when it cant find a
  ;;;
  ;;;  requested item and then makes a new try to locate it.
  ;;;
  ;;;  Fri Mar 15 09:52:14 2002

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.

   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "etags *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
                                        ;
    (visit-tags-table default-directory nil)))
