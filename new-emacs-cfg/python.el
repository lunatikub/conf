;;
;; python
;;

(unless (package-installed-p 'pyenv-mode)
  (package-install 'pyenv-mode))

(require 'pyenv-mode)

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(lsp)))


