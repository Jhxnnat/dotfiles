
(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory t)))

(setq create-lockfiles nil)


(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(which-key-mode t)
;;(context-menu-mode)

(set-face-attribute 'default nil
		    :font "Iosevka NF"
		    :height 120)

(setq-default indent-tabs-mode nil)
(setq tab-stop-list nil)
(setq-default tab-width 4)
(setq-default inhibit-splash-screen t)

(global-display-line-numbers-mode)

;; cool shit (?
(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "C-,") 'duplicate-line)

;; org stuff
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;(set-frame-name "Emacs at Garmond")
(setq-default frame-title-format (concat "%b - Emacs at " system-name))

;; override theme
;;(set-background-color "black")
