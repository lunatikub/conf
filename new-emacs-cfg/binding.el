;; windows
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<right>") 'windmove-right)


;; buffer
(global-set-key [(control a)] 'mark-whole-buffer)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [C-end] 'end-of-buffer)

;; compile
(global-unset-key [(control b)])
(global-set-key [(control b)] 'compile)

;; kill buffer
;;(global-set-key [(control x) (k)] 'kill-this-buffer)

(defun bjm/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'bjm/kill-this-buffer)

;;
;; Misc
;;

(global-set-key [(meta =)] 'stat-region)
(global-set-key [(control c) (control c)] 'comment-or-uncomment-region)
(global-set-key [(control delete)] 'kill-word)
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(meta c)] 'recenter)
(global-set-key [(meta d)] 'delete-trailing-whitespace)

;;
;; isearch
;;

(global-set-key [(control f)] 'isearch-forward-regexp)
(global-set-key [(control r)] 'query-replace-regexp)

;; next occurence
(define-key
  isearch-mode-map
  [(control n)]
  'isearch-repeat-forward)

;; previous occurence
(define-key
  isearch-mode-map
  [(control p)]
  'isearch-repeat-backward)

;; quit and go back to start point
(define-key
  isearch-mode-map
  [(control z)]
  'isearch-cancel)

;; abort
(define-key
  isearch-mode-map
  [(control f)]
  'isearch-exit)

;; switch to replace mode
(define-key
  isearch-mode-map
  [(control r)]
  'isearch-query-replace)

;; paster
(define-key
  isearch-mode-map
  [S-insert]
  'isearch-yank-kill)

;; toggle regexp
(define-key
  isearch-mode-map
  [(control e)]
  'isearch-toggle-regexp)

;; yank line from buffer
(define-key
  isearch-mode-map
  [(control l)]
  'isearch-yank-line)

;; yank word from buffer
(define-key
  isearch-mode-map
  [(control w)]
  'isearch-yank-word)

;; yank char from buffer
(define-key
  isearch-mode-map
  [(control c)]
  'isearch-yank-char)
