;; basics setup
;; 

;; use emacs for gpg pin entry
(setq epa-pinentry-mode 'loopback)

;; follow symlinks by default
(setq vc-follow-symlinks t)

;; some base settings for gui
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; ========== Multiple Cursors =============================
(require 'multiple-cursors)
;; This is globally useful, so it goes under `C-x', and `m'
;; for "multiple-cursors" is easy to remember.
(define-key ctl-x-map "\C-m" #'mc/mark-all-dwim)
;; Usually, both `C-x C-m' and `C-x RET' invoke the
;; `mule-keymap', but that's a waste of keys. Here we put it
;; _just_ under `C-x RET'.
(define-key ctl-x-map (kbd "<return>") mule-keymap)

;; Remember `er/expand-region' is bound to M-2!
(global-set-key (kbd "C-#") #'mc/mark-next-like-this)
(global-set-key (kbd "C-$") #'mc/mark-previous-like-this)

(global-set-key (kbd "M-#") #'mc/unmark-next-like-this)
(global-set-key (kbd "M-$") #'mc/unmark-previous-like-this)

(global-set-key (kbd "C->") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; add cursor to each line of an active region
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; ========== End Multiple Cursors ==========================

;; use "C-;" for er/expand-region
(global-set-key (kbd "C-;") 'er/expand-region)

;; org mode shortcuts
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq visible-bell t)

(set-face-attribute 'default nil :font "Iosevka")

(load-theme 'gruvbox-dark-medium)

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-alwasy-ensure t)

;; Use C-c a to open org agenda
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key [3 97] (quote org-agenda))
            (local-set-key (kbd "C-#") #'mc/mark-next-like-this)))

;; setup ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
