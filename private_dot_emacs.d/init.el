(setq custom-file "~/.config/emacs/custom.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("851da27a89bcef42d165e29012ef43a0392b78544095aea36e42d4486f6a74fc"
	 default))
 '(org-agenda-files
   '("~/Documentos/org/code.org"
	 "/home/jhxnt/Documentos/org/cheat-set.org"
	 "/home/jhxnt/Documentos/org/school.org"
	 "/home/jhxnt/Documentos/org/chores.org"))
 '(package-selected-packages '(anti-zenburn-theme zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn t)

(load-file custom-file)
