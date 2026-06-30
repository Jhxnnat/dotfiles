
(setq backup-directory-alist
      `((".*" . , temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*", temporary-file-directory t)))

(setq create-lockfiles nil)


(scroll-bar-mode -1)
(tool-bar-mode -1)
;; (menu-bar-mode -1)

(set-face-attribute 'default nil
		    :font "Iosevka NF"
		    :height 140)

