;; HOOKS

; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
; '(ido-ignore-buffers (quote ("*Gnus*")))
; '(ido-ignore-buffers (quote ("*Mail*")))
; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
	    (lambda ()
	          (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
		          (insert-header-guard)
			        (goto-line 3)
				      (insert "\n"))))
(add-hook 'find-file-hooks
	    (lambda ()
	          (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.cc?" (buffer-file-name)))
		          (insert-header-inclusion))))

(add-hook 'sh-mode-hook
	    (lambda ()
	          (when (equal (point-min) (point-max))
		          (insert-shell-shebang)
              (goto-char (point-max)))))

; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1)))

;; Ruby
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/ruby-mode/")
;; (autoload 'ruby-mode "ruby-mode"
;;  "Mode for editing ruby source files" t)
