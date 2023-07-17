;;
;; Font
;;

(defconst default-font-size 120)

(defun set-font-size (&optional size)
  "Set the font size to SIZE (default: default-font-size)."
  (interactive "nSize: ")
  (unless size
    (setq size default-font-size))
  (set-face-attribute 'default nil :height size))


(set-frame-font 'default "-CTDB-Fira Code-light-normal-normal-*-16-*-*-*-m-0-iso10646-1")
(set-font-size 140)
