;;
;; Flycheck
;;

;;
;; Only show flycheck on errors 
;;

;; (defun flycheck-list-errors-only-when-errors ()
;;   (if flycheck-current-errors
;;       (when (not (get-buffer "*Flycheck errors*"))
;;         (flycheck-list-errors)
;;         )
;;     (when (get-buffer "*Flycheck errors*")
;;       ;; (switch-to-buffer "*Flycheck errors*")
;;       (kill-buffer "*Flycheck errors*")
;;       ;; (kill-buffer (current-buffer))
;;       ;; (delete-window)
;;       ))
;;   )
;; (add-hook 'flycheck-after-syntax-check-hook #'flycheck-list-errors-only-when-errors)
;; (add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

;; (global-unset-key [(control f)])
;; (global-set-key [(control f) (l)] 'flycheck-list-errors)
;; (global-set-key [(control f) (d)] 'flycheck-disable-checker)
;; (global-set-key [(control f) (n)] 'flycheck-next-error)
;; (global-set-key [(control f) (p)] 'flycheck-previous-error)
