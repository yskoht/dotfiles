#!/bin/sh

#
# Global
#

# ブート時のサウンドを無効化する
sudo nvram SystemAudioVolume=" "

# tabなどでMacのボタンのフォーカスを変えられるフルコントロールを設定
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# スクロールバーを常時表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# 保存ダイアログを詳細設定で表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# 印刷ダイアログを詳細設定で表示 (10.6 and before, Key name is PMPrintingExpandedStateForPrint)
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true


#
# Finder
#

# ~/Library ディレクトリを見えるようにする
chflags nohidden ~/Library

# /Volumes ディレクトリを見えるようにする
sudo chflags nohidden /Volumes

# USB やネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 不可視ファイルを表示する
defaults write com.apple.finder AppleShowAllFiles YES

# 検索時にデフォルトでカレントディレクトリを検索する
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# 拡張子変更時の警告を無効化する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# デフォルトはカラムビュー表示
defaults write com.apple.finder FXPreferredViewStyle clmv

# タイトルバーにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

killall Finder

#
# Screensaver
#

# スリープとスクリーンセーバの解除にパスワードを要求
defaults write com.apple.screensaver askForPassword -bool true

# パスワードを要求するまでの秒数
defaults write com.apple.screensaver askForPasswordDelay -int 5


#
# Menubar
#

# バッテリー残量を％表記に
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# 日付と時刻のフォーマット（24時間表示、秒表示あり、日付・曜日を表示）
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm"


#
# Keyboard & Mouse
#

# キーリピートの高速化
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# キー連続押下時、リピートする
defaults write -g ApplePressAndHoldEnabled -bool false

# マウスの速度
defaults write -g com.apple.mouse.scaling 2.5

# カーソルの移動速度を変更 （1〜15）
defaults write -g com.apple.trackpad.scaling 1

# タップしたときに、クリックとする
defaults write -g com.apple.mouse.tapBehavior -int 1


#
# Dock
#

# 自動的に隠す
defaults write com.apple.dock autohide -bool true

# dockを左にする
defaults write com.apple.dock orientation left

# Dock に標準で入っている全てのアプリを消す
defaults write com.apple.dock persistent-apps -array

# アイコンサイズの設定
defaults write com.apple.dock tilesize -int 30

killall Dock


#
# Screen Capture
#

# キャプチャの保存場所を変更
defaults write com.apple.screencapture location ~/Desktop

# キャプチャのプレフィックスを変更
defaults write com.apple.screencapture name "SS_"

# キャプチャに影を付けない
defaults write com.apple.screencapture disable-shadow -bool true

killall SystemUIServer


#
# Sound
#

# 効果音を消す
defaults write "Apple Global Domain" com.apple.sound.uiaudio.enabled -int 0
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int 0

# フィードバックをON
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true


#
# その他
#

# 「システム環境設定」 → 「キーボード」 → 「キーボードショートカット」
#   → 「キーボード」 → 次のウィンドウを操作対象にする ： option + tab
#   → 「入力ソース」 → 「前の入力ソースを選択」: command + space
#   → 「入力ソース」 → 「入力メニューの次のソースを選択」: disable
#   → 「Spotlight」 → 「Spotlight検索を表示」: disable
# 「システム環境設定」 → 「キーボード」 → 「ユーザ辞書」: 文頭を自動的に大文字にする、スマート引用符とスマートダッシュを使用をOFF
# 「Finder」 -> 「環境設定」 -> 「サイドバー」 : home