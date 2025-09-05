;; Delete trailing whitespaces on save
(add-hook 'c-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'sh-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'jenkinsfile-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'python-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))

;; Python indent
;; (add-hook 'python-mode-hook
;;           #'(lambda () (setq electric-indent-mode nil)))

(defun volatile-kill-buffer ()
   "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))

;;
;; Extensions
;;

;; (add-to-list 'auto-mode-alist '("\\.sed$" . sh-mode))
;; (add-to-list 'auto-mode-alist '("Makefile.*\\'" . makefile-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
;; (add-to-list 'auto-mode-alist '("\\.ld.template$" . ld-script-mode))
;; (global-so-long-mode 0)

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(unless (package-installed-p 'beacon)
  (package-install 'beacon))

(beacon-mode 1)
(setq beacon-blink-duration 1)

(rainbow-delimiters-mode 1)

(global-auto-revert-mode t)

(global-eldoc-mode -1)
(setq lsp-lens-enable nil)
(setq eldoc-mode nil)




;; NOTES ZK

(unless (package-installed-p 'zk) (package-install 'zk))

(use-package zk
  ;; :straight (zk :files (:defaults "zk-consult.el"))
  :custom
  (zk-directory "~/ledger/notes")
  (zk-file-extension "md")
  :config
  ;; (require 'zk-consult) 
  (zk-setup-auto-link-buttons)
  (zk-setup-embark)
  (setq zk-tag-grep-function #'zk-consult-grep-tag-search
        zk-grep-function #'zk-consult-grep))


;; # && .# files
(setq make-backup-files nil)
(defun auto-save-file-remove ()
  "Delete auto-save #file# if exist."
  (interactive)
  (let ((filename (make-auto-save-file-name)))
    (if (not (file-exists-p filename))
        (message (concat "File " filename " don't exist"))
      ;; else
      (delete-file filename nil) ; no trash
      (message (concat "File " filename " succesfully removed."))
      )))






;; Charger le package ansi-color
(require 'ansi-color)

;; Appliquer les couleurs ANSI au buffer de compilation
(defun my-apply-ansi-color-to-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))

(add-hook 'compilation-filter-hook 'my-apply-ansi-color-to-compilation-buffer)

;; Configuration pour ouvrir le buffer de compilation en bas
(setq display-buffer-alist
      '(("\\*compilation\\*"
         (display-buffer-reuse-window
          display-buffer-in-side-window)
         (side . bottom)
         (slot . 1)
         (window-height . 0.3))))

;; Activer le défilement automatique du buffer de compilation
(setq compilation-scroll-output t)

;; Redéfinir les raccourcis clavier pour naviguer entre les erreurs
(defun my-compilation-mode-keybindings ()
  "Custom keybindings for compilation mode."
  (define-key compilation-mode-map (kbd "C-s n") 'next-error)
  (define-key compilation-mode-map (kbd "C-s p") 'previous-error))

(add-hook 'compilation-mode-hook 'my-compilation-mode-keybindings)

;; Optionnel : Redéfinir la commande de compilation pour utiliser cette configuration
(defun my-compilation-mode-setup ()
  "Custom setup for compilation mode."
  (setq display-buffer-alist
        '(("\\*compilation\\*"
           (display-buffer-reuse-window
            display-buffer-in-side-window)
           (side . bottom)
           (slot . 1)
           (window-height . 0.3)))))

(add-hook 'compilation-mode-hook 'my-compilation-mode-setup)


