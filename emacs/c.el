;; Switch c source file to header file
(defun c-switch-c-h ()
  (interactive)
  (let ((other
         (let ((file (buffer-file-name)))
           (if (string-match "\\.c$" file)
               (replace-regexp-in-string "\\.c$" ".h" file)))))
    (find-file other)))

;; Switch header file to c source file
(defun c-switch-h-c ()
  (interactive)
  (let ((other
         (let ((file (buffer-file-name)))
           (if (string-match "\\.h$" file)
               (replace-regexp-in-string "\\.h$" ".c" file)))))
    (find-file other)))

;; Insert header guard
(defun insert-header-guard ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
        (let*
            ((name (file-name-nondirectory buffer-file-name))
             (macro (replace-regexp-in-string
                     "\\." "_"
                     (replace-regexp-in-string
                      "-" "_"
                      (upcase name)))))
          (goto-char (point-min))
          (insert "#ifndef " macro "_\n")
          (insert "# define " macro "_\n\n")
          (goto-char (point-max))
          (insert "\n#endif /* !" macro "_ */\n")))))

;;Insert header inclusion
(defun insert-header-inclusion ()
  (interactive)
  (when (buffer-file-name)
    (let
        ((name
          (replace-regexp-in-string ".c$" ".h"
          (file-name-nondirectory buffer-file-name)))))
      (insert "#include \"" name "\"\n\n")))

(require 'cc-mode)

(add-to-list 'c-style-alist
             '("tj"
               (c-basic-offset . 2)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist     . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (substatement         . +)
                                   (substatement-open    . 0)
                                   (case-label           . +)
                                   (access-label         . -)
                                   (inclass              . +)
                                   (inline-open          . 0)))))

(setq c-default-style "tj")

(require 'whitespace)
(setq whitespace-line-column 100) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; BINDINGS :: C

(global-set-key [(control c) (a)] 'align-current)
(global-set-key [(control c) (m)] 'compile)

(global-set-key [(control c) (h)] 'c-switch-c-h)
(global-set-key [(control h) (c)] 'c-switch-h-c)
