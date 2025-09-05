;; configuration
(defconst font-size 140)
(defconst emacs-dir "/home/tjoly/.emacs.d/")
(defconst emacs-themes-dir (concat emacs-dir "/themes/"))
(defconst project-dir '("/home/tjoly/ledger/core"))
(defconst lib-to-load
  (list
   "package"
   "theme"
   "vertico"
   "binding"
   "python"
   "beta"
   "mermaid-mode"
   "cmake"
   "lsp"
   "json"
   "flycheck"
   "jenkinsfile"
   "dashboard"
   "projectile"))

(mapcar
 (lambda (name) (load (concat emacs-dir name ".el")))
 lib-to-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode rustic rust-mode graphviz-dot-mode dot-mode typescript-mode scala-mode pip-requirements dockerfile-mode treemacs lsp-treemacs dashboard all-the-icons zk yasnippet-classic-snippets wgrep vertico use-package rainbow-delimiters pyenv-mode projectile popwin orderless marginalia lsp-ui lsp-python-ms lsp-jedi json-mode jedi ivy-yasnippet groovy-mode flymake-python-pyflakes flycheck-pyflakes embark-consult elpy company-jedi beacon))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
