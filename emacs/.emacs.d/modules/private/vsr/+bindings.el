;;; private/hlissner/+bindings.el -*- lexical-binding: t; -*-

(map!
   :nvm "ga" "0"
   :nvm "gl" "$"

 ;; Ace-jump mode keybindings
  :nvm "S-SPC" #'evil-ace-jump-word-mode
  :nvm "C-SPC" #'evil-ace-jump-char-mode
  (:leader
    :desc "Ace-jump-word-mode" :nvm "j" #'evil-ace-jump-word-mode
    :desc "Ace-jump-char-mode" :nvm "J" #'evil-ace-jump-char-mode))
