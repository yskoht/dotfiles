; -*- coding: utf-8-unix -*-

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat))))

(setq default-frame-alist
      '((top . 0)
        (left . 0)
        (width . 120)
        (height . 63)
        (cursor-color . "pink")))

(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "orange red")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "pink")))

;(add-to-list 'default-frame-alist
;             '(font . "-*-MyricaM M-normal-normal-normal-*-12-*-*-*-*-*-iso10646-1"))

