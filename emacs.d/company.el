;;
;; auto-completion company
;;

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)

(setq company-backends '((compagny-clang company-capf company-dabbrev-code)))
(setq company-dabbrev-minimum-length 2)
(setq company-dabbrev-ignore-case 'keep-prefix)
