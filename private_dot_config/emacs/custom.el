
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

(display-line-numbers-mode)

;; cool shit
(ido-mode 1)
(ido-everywhere 1)

(global-set-key (kbd "C-,") 'duplicate-line)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
