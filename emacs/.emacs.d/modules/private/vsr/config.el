;;; private/hlissner/config.el -*- lexical-binding: t; -*-

(when (featurep 'evil)
  (load! +bindings))

(defvar +hlissner-dir
  (file-name-directory load-file-name))

(defvar +hlissner-snippets-dir
  (expand-file-name "snippets/" +hlissner-dir))

(after! evil-mc
  ;; if I'm in insert mode, chances are I want cursors to resume
  (add-hook! 'evil-mc-before-cursors-created
    (add-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors nil t))
  (add-hook! 'evil-mc-after-cursors-deleted
    (remove-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors t)))


;; Don't use default snippets, use mine.
(after! yasnippet
  (setq yas-snippet-dirs (append (list '+hlissner-snippets-dir)
                                 (delete 'yas-installed-snippets-dir yas-snippet-dirs))))


;; ace-jump mode goodness
(def-package! ace-jump-mode
 :demand t)


;; Enable autocomplete suggestions as I type
(after! company
	(setq company-idle-delay 0.2))

(after! evil-escape
  ;; Change the evil escape sequence to fj instead of jk
  (setq evil-escape-key-sequence "fj"
	evil-escape-unordered-key-sequence t))
