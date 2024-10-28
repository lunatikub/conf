;; Delete trailing whitespaces on save
(add-hook 'c-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'sh-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'jenkins-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'python-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))

;; Python indent
(add-hook 'python-mode-hook
          #'(lambda () (setq electric-indent-mode nil)))

(defun volatile-kill-buffer ()
   "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))

;;
;; Extensions
;;

(add-to-list 'auto-mode-alist '("jenkinsfile" . jenkinsfile-mode))
(add-to-list 'auto-mode-alist '("\\.sed$" . sh-mode))
(add-to-list 'auto-mode-alist '("Makefile.*\\'" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.ld.template$" . ld-script-mode))
(global-so-long-mode 0)
