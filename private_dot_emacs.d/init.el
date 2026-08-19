(setq custom-file "~/.config/emacs/custom.el")
(load-file custom-file)

(add-to-list 'load-path "~/.config/emacs/modes/")
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")

;; https://github.com/rexim/simpc-mode
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(use-package vertico
  :init
  (vertico-mode))
(use-package marginalia
  :init
  (marginalia-mode))
(use-package corfu
  :init
  (global-corfu-mode))
(use-package treemacs
  :ensure t
  :defer t
  :init
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t t" . treemacs)))

(use-package consult
  :bind (
         ("C-c M-x" . consult-mode-command)
         ("M-g r" . consult-grep-match)
         ("M-s f" . consult-fd)
         ("M-s g" . consult-grep)
         ("M-s r" . consult-ripgrep))
  :init)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory t)))
(setq create-lockfiles nil)
(setq tab-always-indent 'complete)
(setq  text-mode-ispell-word-completion nil)
(setq read-extended-command-predicate #'command-completion-default-include-p)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list nil)
(setq-default tab-width 4)
(setq-default inhibit-splash-screen t)

(set-face-attribute 'default nil
		    :font "Iosevka NF"
		    :height 120)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(which-key-mode t)
;;(context-menu-mode)
(global-display-line-numbers-mode)

;; cool shit (?
;; (ido-mode 1)
;; (ido-everywhere 1)

(global-set-key (kbd "C-,") 'duplicate-line)

;; org stuff
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;(set-frame-name "Emacs at Garmond")
(setq-default frame-title-format (concat "%b - Emacs at " system-name))

(load-theme 'monokai-pro t)
