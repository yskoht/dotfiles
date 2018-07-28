; -*- coding: utf-8-unix -*-

;;; open-region-url
(defun open-region-url (start end)
  (interactive "r")
  (and (region-active-p) (browse-url (buffer-substring (mark) (point))))
  (keyboard-escape-quit))
(global-set-key "\C-c\C-o" 'open-region-url)

;;; move-frame
(defun move-frame-left ()
  (interactive)
  (set-frame-position (selected-frame) 0 0))

(defun move-frame-right ()
  (interactive)
  (set-frame-position (selected-frame) (- (x-display-pixel-width) (frame-width)) 0))

(define-key global-map [?\C-\M-1] 'move-frame-left)  ;; 左端に移動
(define-key global-map [?\C-\M-2] 'move-frame-right) ;; 右端に移動

