;; basics setup
;; -> setup packages
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-alwasy-ensure t)

;; -> custom options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" default))
 '(electric-pair-mode t)
 '(org-agenda-files
   '("c:/Users/thomas.harris/OneDrive - Insurity, Inc/tommy_notebook.org.gpg"))
 '(package-selected-packages
   '(org-bullets window-numbering use-package swiper multiple-cursors gruvbox-theme expand-region))
 '(window-numbering-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

;; buffer switching
(setq-default minor-mode 'window-numberingmode)

;; default electric pair mode
(setq-default minor-mode 'electric-pair-mode)

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

;; org mode shortcuts and apps
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-file-apps
      (quote
       ((auto-mode . emacs)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . "C:\\Users\\thomas.harris\\AppData\\Local\\qutebrowser\\qutebrowser.exe %s")
        ("\\.pdf\\'" . default))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red3" :weight bold)
              ("IN-PROGRESS" :foreground "green" :weight bold)
              ("WAITING" :foreground "green" :weight bold)
              ("SCHEDULED" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; use emacs for gpg pin entry, not local gpg agent
(setq epa-pinentry-mode 'loopback)

;; follow symlinks by default
(setq vc-follow-symlinks t)

(setq visible-bell t)

(set-face-attribute 'default nil :font "Iosevka Extended"
		    :height 90
		    :weight 'normal
		    :width 'normal)

(load-theme 'gruvbox-dark-medium t)

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
