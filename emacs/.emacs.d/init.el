;;; init.el -*- lexical-binding: t; -*-
;;
;; Author:  Henrik Lissner <henrik@lissner.net>
;; URL:     https://github.com/hlissner/.emacs.d
;;
;;   =================     ===============     ===============   ========  ========
;;   \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
;;   ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
;;   || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
;;   ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
;;   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
;;   ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
;;   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
;;   ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
;;   ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
;;   ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
;;   ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
;;   ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
;;   ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
;;   ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
;;   ||.=='    _-'                                                     `' |  /==.||
;;   =='    _-'                                                            \/   `==
;;   \   _-'                                                                `-_   /
;;    `''                                                                      ``'
;;
;; These demons are not part of GNU Emacs.
;;
;;; License: MIT

(require 'core (concat user-emacs-directory "core/core"))

(doom! :feature
       evil            ; come to the dark side, we have cookies
       jump            ; helping you get around
       snippets        ; my elves. They type so I don't have to
       file-templates  ; auto-snippets for empty files
       spellcheck      ; tasing you for misspelling mispelling
       syntax-checker  ; tasing you for every semicolon you forget
       version-control ; remember, remember that commit in November
       workspaces      ; tab emulation, persistence & separate workspaces
       eval            ; repls, runners 'n builders; run code, run
      ;debug           ; FIXME stepping through code, to help you add bugs

       :completion
       company         ; code completion backend
       ivy             ; a search engine for love and life
      ;helm            ; the *other* search engine for love and life
      ;ido             ; the other *other* search engine...

       :ui
       doom            ; what makes DOOM look the way it does
       doom-dashboard  ; a nifty splash screen for Emacs
       doom-modeline   ; a snazzy Atom-inspired mode-line
       doom-quit       ; DOOM quit-message prompts when you quit Emacs
       hl-todo         ; highlight TODO/FIXME/NOTE tags
       nav-flash       ; blink the current line after jumping
       evil-goggles    ; display visual hints when editing in evil
      ;unicode         ; extended unicode font support for various languages

       :tools
       dired           ; making dired pretty [functional]
       electric-indent ; smarter, keyword-based electric-indent
       eshell          ; a consistent, cross-platform shell (WIP)
       gist            ; interacting with github gists
       macos           ; macos-specific commands
       neotree         ; a project drawer, like NERDTree for vim
       rotate-text     ; cycle region at point between text candidates
       password-store
       term            ; terminals in Emacs
       tmux            ; an API for interacting with tmux
       upload          ; map local to remote projects via ssh/ftp

       :lang
       cc              ; C/C++/Obj-C madness
       data            ; config/data formats
       emacs-lisp      ; drown in parentheses
       org             ; for organized fearless leader (WIP)

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They should be loaded last.
       :app
      ;crm             ; TODO org-mode for client relations management
       email           ; Emacs as an email client
      ;finance         ; TODO keeping track of my shekels
      ;irc             ; TODO how neckbeards socialize
       present         ; showing off presentations in emacs
      ;regex           ; TODO emacs as a regexp IDE
       rss             ; emacs as an RSS reader
       twitter         ; twitter client https://twitter.com/vnought

       ;; Private modules named after your username are loaded automatically.
       ;; Leaving this here is harmless though. Also, they are omitted from
       ;; source control (except for mine; use it as a reference).
       :private hlissner)

