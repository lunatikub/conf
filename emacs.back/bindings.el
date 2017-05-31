;; BINDINGS :: C

(global-set-key [(control c) (a)] 'align-current)

(global-set-key [(control c) (m)] 'compile)

(global-set-key [(control c) (h)] 'c-switch-c-h)
(global-set-key [(control h) (c)] 'c-switch-h-c)
;;(global-set-key [(control c) (r)] 'c-switch-r-c)

;; BINDINGS :: font

(global-set-key [(control +)] 'inc-font-size)
(global-set-key [(control -)] 'dec-font-size)
(global-set-key [(control =)] 'reset-font-size)

;; BINDINGS :: windows

(global-unset-key [(control s)])
(global-set-key [(control s) (v)] 'split-window-horizontally)
(global-set-key [(control s) (h)] 'split-window-vertically)
(global-set-key [(control s) (d)] 'delete-window)
(global-set-key [(control s) (o)] 'delete-other-windows)
(global-set-key [(control s) (i)] 'windmove-up)
(global-set-key [(control s) (j)] 'windmove-left)
(global-set-key [(control s) (k)] 'windmove-down)
(global-set-key [(control s) (l)] 'windmove-right)

;; BINDINGS :: ido

(global-set-key [(control b)] 'ido-switch-buffer)

;; BINDINGS :: isearch

(global-set-key [(control f)] 'isearch-forward-regexp)  ; search regexp
(global-set-key [(control r)] 'query-replace-regexp)    ; replace regexp

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

;; BINDINGS :: Lisp

;; insert fixme
(define-key
  lisp-mode-map
  [(control c) (control f)]
  'insert-fixme)

;; insert fixme
(define-key
  lisp-mode-map
  [(control c) (control e)]
  'insert-end-of-fix)

;; Comment
(define-key
  lisp-mode-shared-map
  [(control c) (control c)]
  'comment-region)

(global-set-key [(control a)] 'mark-whole-buffer)       ; select whole buffer
(global-set-key [(control return)] 'dabbrev-expand)     ; auto completion
(global-set-key [C-home] 'beginning-of-buffer)          ; go to the beginning of buffer
(global-set-key [C-end] 'end-of-buffer)                 ; go to the end of buffer
(global-set-key [(meta g)] 'goto-line)                  ; goto line #
(global-set-key [A-left] 'windmove-left)                ; move to left windnow
(global-set-key [A-up] 'windmove-up)                    ; move to right window
(global-set-key [A-down] 'windmove-down)                ; move to upper window
(global-set-key [A-right] 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)                ; move to left windnow
(global-set-key (kbd "M-<down>") 'windmove-down)                ; move to upper window
(global-set-key (kbd "M-<up>") 'windmove-up)                ; move to upper window
(global-set-key (kbd "M-<right>") 'windmove-right)                ; move to upper window
(global-set-key [(control c) (c)] 'build)
(global-set-key [(control c) (d)] 'gen-doxy-com)
(global-set-key [(control c) (e)] 'next-error)
(global-set-key [(control tab)] 'other-window)          ; Ctrl-Tab = Next buffer
(global-set-key [(control backtab)]
                '(lambda () (interactive)
                   (other-window -1)))                  ; Ctrl-Shift-Tab = Previous buffer
(global-set-key [(control delete)]
                'kill-word)                             ; kill word forward
(global-set-key [(meta ~)] 'ruby-command)               ; run ruby command

(if (display-graphic-p)
    (global-set-key [(control z)] 'undo)                ; undo only in graphic mode
)

(global-set-key [(control x) (k)] 'kill-this-buffer)

;; BINDINGS :: misc

(global-set-key [(meta =)]
                'stat-region)
(global-set-key [(control c) (control c)]
                'comment-or-uncomment-region)
