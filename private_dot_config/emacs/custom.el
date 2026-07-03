
(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory t)))

(setq create-lockfiles nil)


(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(set-face-attribute 'default nil
		    :font "Iosevka NF"
		    :height 120)

;; (setq indent-tabs-mode t)
(setq-default tab-width 4
			  inhibit-splash-screen t)

(global-display-line-numbers-mode)

;; cool shit
(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "C-,") 'duplicate-line)

