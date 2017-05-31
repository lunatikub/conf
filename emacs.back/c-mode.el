;; Switch c source file to header file

(defun c-switch-r-c ()
  (interactive)
  (let ((other
         (let ((file (buffer-file-name)))
           (if (string-match "\\.regex.c$" file)
               (replace-regexp-in-string "\\.regex.c$" ".c" file)))))
    (find-file other)))

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

;; C insert debug
(defun c-insert-debug (&optional msg)
  (interactive)
  (when (not (looking-at "\W*$"))
    (beginning-of-line)
    (insert "\n")
    (line-move -1))
  (c-indent-line)
  (insert "fprintf(stderr, \"\");")
  (backward-char 3))

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
          (replace-regexp-in-string ".cc$" ".hh"
          (file-name-nondirectory buffer-file-name)))))
      (insert "#include \"" name "\"\n\n"))))

;; Generic FIXME insertion method. Works as soon as the mode posseses
;; a comment-region function.
(defun insert-fixme (&optional msg)
  (interactive "sFixme: ")
  (save-excursion
    (end-of-line)
    (when (not (looking-back "^\s*"))
      (insert " "))
    (setq start (point))
    (insert "FIXME")
    (when (not (string-equal msg ""))
      (insert ": " msg))
  (comment-region start (point))))

(defun insert-end-of-fix (&optional msg)
  (interactive "sEnd of fix: ")
  (save-excursion
    (end-of-line)
    (when (not (looking-back "^\s*"))
      (insert " "))
    (setq start (point))
    (insert "EOFX")
    (when (not (string-equal msg ""))
      (insert ": " msg))
  (comment-region start (point))))

;; (defun c-insert-include (name &optional r)
;;   (interactive "sInclude: \nP")
;;   (save-excursion
;;     (beginning-of-line)
;;     (when (not (looking-at "\W*$"))
;;       (insert "\n")
;;       (line-move -1))
;;     (insert "#include ")
;;     (if r
;;         (insert "<>")
;;       (insert "\"\""))
;;     (backward-char 1)
;;     (insert name)))

;; (defun c-insert-block (&optional r b a)
;;   (interactive "P")
;;   (unless b (setq b ""))
;;   (unless a (setq a ""))
;;   (if r
;;       (progn
;;         (save-excursion
;;           (goto-char (rbegin))
;;           (beginning-of-line)
;;           (insert "\n")
;;           (line-move -1)
;;           (insert b "{")
;;           (c-indent-line))
;;         (save-excursion
;;           (goto-char (- (rend) 1))
;;           (end-of-line)
;;           (insert "\n}" a)
;;           (c-indent-line)
;;           (line-move -1)
;;           (end-of-line))
;;         (indent-region (rbegin) (rend)))
;;     (progn
;;         (beginning-of-line)

;;         (setq begin (point))

;;         (insert b "{\n")
;;         (end-of-line)
;;         (insert "\n}" a)

;;         (indent-region begin (point))

;;         (line-move -1)
;;         (end-of-line))))

;; (defun c-insert-braces (&optional r)
;;   (interactive "P")
;;   (c-insert-block r))

;; (defun c-insert-ns (name r)
;;   (interactive "sName: \nP")
;;   (c-insert-block r (concat "namespace " name "\n")))

;; (defun c-insert-switch (value r)
;;   (interactive "sValue: \nP")
;;   (c-insert-block r (concat "switch (" value ")\n")))

;; (defun c-insert-if (c r)
;;   (interactive "sCondition: \nP")
;;   (c-insert-block r (concat "if (" c ")\n")))

;; C / C++ mode

(require 'cc-mode)
(add-to-list 'c-style-alist
             '("epita"
               (c-basic-offset . 4)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist     . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (substatement         . +)
                                   (substatement-open    . 0)
                                   (case-label           . +)
                                   (access-label         . -)
                                   (inclass              . +)
                                   (inline-open          . 0)))))

(setq c-default-style "epita")

(require 'whitespace)
(setq whitespace-line-column 100) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
