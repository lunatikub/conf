;; lsp
;; https://github.com/emacs-lsp/lsp-mode
;; Language Server Protocol
;;

(unless (package-installed-p 'lsp-mode) (package-install 'lsp-mode))

(use-package lsp-mode
             ;; :config
             ;; (lsp-register-custom-settings
             ;;  '(("pyls.plugins.pyls_mypy.enabled" t t)
             ;;    ("pyls.plugins.pyls_mypy.live_mode" nil t)
             ;;    ("pyls.plugins.pyls_black.enabled" t t)
             ;;    ("pyls.plugins.pyls_isort.enabled" t t)))
             ;; :init
             ;; ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
             ;; (setq lsp-keymap-prefix "C-c l")
             :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
                    (python-mode . lsp)
                    (c-mode . lsp)
                    ;; if you want which-key integration
                    (lsp-mode . lsp-enable-which-key-integration))
             :commands lsp)

;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; ;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; ;; optionally if you want to use debugger
;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; ;; optional if you want which-key integration
;; (use-package which-key
;;     :config
;;     (which-key-mode))

(with-eval-after-load 'lsp-mode
  (setq lsp-ruff-server-command nil))  ;; Disable the Ruff server

(require 'yasnippet)
(yas-global-mode 1)

(setq company-minimum-prefix-length 3)
(setq company-idle-delay 0)
(setq lsp-idle-delay 0)
;; (setq company-backends '((company-clang)))

(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-show-with-cursor nil)
(setq lsp-ui-doc-show-with-mouse nil)
(setq lsp-eldoc-enable-hover nil)
(setq lsp-signature-render-documentation nil)

(global-unset-key [(control v)])
(global-set-key [(control v) (d)] 'lsp-find-definition)
(global-set-key [(control v) (e)] 'lsp-find-declaration)
(global-set-key [(control v) (r)] 'lsp-find-references)
(global-set-key [(control v) (f)] 'lsp-format-buffer)
(global-set-key [(control v) (g)] 'lsp-format-region)
