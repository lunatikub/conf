;; dashboard
;; https://github.com/emacs-dashboard/emacs-dashboard
;; An extensible emacs startup screen showing you what’s most important.
;;

(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))

(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))

;; Getting pretty icons
(use-package all-the-icons)

(use-package dashboard
  :after (all-the-icons)
  :init
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome TJO !"
	; dashboard-startup-banner 'logo
        dashboard-startup-banner "~/ledger/images/sangoku.jpeg"
        dashboard-projects-backend 'projectile
	dashboard-center-content t
	dashboard-set-heading-icons t
	dashboard-set-file-icons t
	dashboard-items '((projects . 5)
			  (recents . 5))))

;; for emacsclient
(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
