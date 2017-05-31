;; Compilation
(setq compile-command "gmake")
(defun build ()
  (interactive)
  (if (string-equal compile-command "")
    (progn
      (while (not (or (file-readable-p "Makefile") (file-readable-p "Drakefile") (string-equal (cwd) "/")))
        (cd ".."))
      (if (string-equal (cwd) "/")
        (message "No Makefile or Drakefile found.")
          (if (file-readable-p "Makefile")
            (compile (concat "cd " (cwd) " && make"))
            (compile (concat "cd " (cwd) " && drake")))))
    (recompile)))
