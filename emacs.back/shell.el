(defun insert-shell-shebang ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "#!/bin/bash\n\n")))
