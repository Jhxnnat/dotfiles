;; -*- lexical-binding: t; -*-
(setq custom-file "~/.config/emacs/custom.el")
(load-file custom-file)

(add-to-list 'load-path "~/.config/emacs/modes/")
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")

;; https://github.com/rexim/simpc-mode
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t))

(use-package corfu
  :custom
  (corfu-auto t)
  :bind
  :init
  (global-corfu-mode))

;; buffer completion
(orderless-define-completion-style orderless-literal-only
  (orderless-style-dispatchers nil)
  (orderless-matching-styles '(orderless-literal)))

(add-hook 'corfu-mode-hook
          (lambda ()
            (setq-local completion-styles '(orderless-literal-only basic)
                        completion-category-overrides nil
                        completion-category-defaults nil)))

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package treemacs
  :ensure t
  :defer t
  :init
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t t" . treemacs)))

(use-package affe
  :config
  (consult-customize affe-grep :preview-key "M-."))

(use-package consult
  :bind (
         ("C-c M-x" . consult-mode-command)
         ("M-g r" . consult-grep-match)
         ("M-s f" . affe-find)
         ("M-s g" . affe-grep)
         ("M-s r" . consult-ripgrep))
  :init)

(defun affe-orderless-regexp-compiler (input _type _ignorecase)
  (setq input (cdr (orderless-compile input)))
  (cons input (apply-partially #'orderless--highlight input t)))
(setq affe-regexp-compiler #'affe-orderless-regexp-compiler)

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)

  (doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-tomorrow-day t)

  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

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
(global-tab-line-mode t)

;; cool shit (?
;; (ido-mode 1)
;; (ido-everywhere 1)

(global-set-key (kbd "C-,") 'duplicate-line)

;; org stuff
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq-default frame-title-format (concat "%b - Emacs at " system-name))

