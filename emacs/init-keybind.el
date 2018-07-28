; -*- coding: utf-8-unix -*-

(global-set-key "\C-h" 'delete-backward-char)            ; 削除
(global-set-key "\C-z" 'undo)                            ; undo
(global-set-key "\C-x\C-z" nil)                          ; 中断をなくす
(global-set-key "\C-ci" 'indent-region)                  ; インデント
(global-set-key "\M-g" 'goto-line)                       ; 指定した行に移動
(global-set-key [f1] 'help)                              ; help を開く
(global-set-key "\M-0" 'delete-frame)                    ; フレームを閉じる
(global-set-key "\M-1" 'delete-other-windows)            ; 現在以外のウィンドウをすべて削除
(global-set-key "\M-2" 'make-frame)                      ; ウィンドウを開く
(global-set-key "\C-xO" 'other-frame)                    ; ウィンドウ移動
(global-set-key [home] 'beginning-of-buffer)             ; [Home]Key を従来の動作に戻す
(global-set-key [end] 'end-of-buffer)                    ; [End]Key を従来の動作に戻す

