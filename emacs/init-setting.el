; -*- coding: utf-8-unix -*-

(show-paren-mode t)                                         ; 対応する括弧を光らせる
(setq delete-auto-save-files t)                             ; 終了時にオートセーブファイルを消す
(blink-cursor-mode 0)                                       ; カーソルの点滅を止める
(column-number-mode t)                                      ; カラム番号表示を有効にする
(line-number-mode t)                                        ; カーソルの位置が何行目かを表示する
(setq inhibit-startup-message t)                            ; 起動時の画面を表示しない
(fset 'yes-or-no-p 'y-or-n-p)                               ; yes or no をy or nへ
(setq transient-mark-mode t)                                ; リージョン部に色を付ける & リージョン部のみ置換
(delete-selection-mode t)                                   ; BS or Del でリージョン内の文字を削除
(setq-default indicate-empty-lines t)                       ; バッファ端の空行にフリンジを表示
(setq kill-whole-line t)                                    ; \C−kで改行文字も含める
(windmove-default-keybindings)                              ; Shift+カーソルキーで，分割したバッファへカーソル移動
(setq-default indent-tabs-mode nil)                         ; タブでなくスペースを使う
(setq initial-scratch-message "")                           ; *scratch*メッセージを消す
(toggle-scroll-bar nil)                                     ; スクロールバーいらない
(tool-bar-mode -1)                                          ; ツールバーを消す
(menu-bar-mode -1)                                          ; メニューバーを消す
(setq backup-directory-alist '(("" . "~/.emacs.d/backup"))) ; バックアップファイルを指定ディレクトリへ
(setq-default cursor-in-non-selected-windows nil)           ; 他のウィンドウにはカーソルを表示しない
(setq ring-bell-function 'ignore)                           ; 警告音、画面フラッシュをなくす
(global-linum-mode t)                                       ; 行数を表示

;;; encode
(prefer-coding-system 'utf-8-unix)
(setq coding-system-for-read 'utf-8-unix)
(setq coding-system-for-write 'utf-8-unix)

