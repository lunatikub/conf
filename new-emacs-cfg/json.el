;;
;; json
;;

(unless (package-installed-p 'json-mode)
  (package-install 'json-mode))

(require 'json-mode)

