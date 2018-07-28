; -*- coding: utf-8-unix -*-

(setq auto-mode-alist
      (append '(("\\.h$" . c-mode)
                ) auto-mode-alist))

(add-hook 'c-mode-common-hook
          '(lambda ()
             ;;(require 'vc-hooks)
             (setq completion-mode t)

             ;; インデントスタイル
             (c-set-style "linux")
             ;; make のオプションは聞いてこない
             (setq compilation-read-command nil)
             ;; makeするとき全バッファを自動的にsave
             (setq compilation-ask-about-save nil)
             ;; Tab幅
             (setq tab-width 4)
             (setq c-basic-offset tab-width)
             ;; + で揃える
             ;; http://www.bookshelf.jp/soft/meadow_41.html#SEC607
             (let () (c-set-offset 'statement-cont 'c-lineup-math))
             (c-set-offset 'cpp-macro 0)
             (c-set-offset 'innamespace 0)
             (c-set-offset 'namespace-open 0)
             (c-set-offset 'namespace-close 0)
             ))

