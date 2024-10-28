;; .emacs
;; (load "/home/tjoly/git/conf/emacs/emacs.el")

(defconst emacs-d "/home/tjoly/ledger/conf/emacs.d/")

(setq user-emacs-directory emacs-d)

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (package-initialize)

;; Working
(global-set-key [(control c) (w)] 'delete-trailing-whitespace)

;;
;; Close all buffers
;;
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;;
;; Compile
;;

(global-set-key [(control c) (b)] 'compile)

;;
;; Graphic
;;

(when (display-graphic-p)
  (progn
    (scroll-bar-mode -1)               ; no scroll bar
    (menu-bar-mode -1)                 ; no menu bar
    (tool-bar-mode -1)                 ; no tool bar
    (mouse-wheel-mode t)))             ; enable mouse wheel

(setq inhibit-startup-message t)        ; don't show the GNU splash screen
(setq frame-title-format "%b")          ; titlebar shows buffer's name
(global-font-lock-mode t)               ; syntax highlighting
(setq font-lock-maximum-decoration t)   ; max decoration for all modes
(setq transient-mark-mode 't)           ; highlight selection
(setq line-number-mode 't)              ; line number
(setq column-number-mode 't)            ; column number
(setq delete-auto-save-files t)         ; delete unnecessary autosave files
(setq delete-old-versions t)            ; delete oldversion file
(setq-default normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)           ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)    ; change default major mode to text
(setq ring-bell-function 'ignore)       ; turn the alarm totally off
(setq make-backup-files nil)            ; no backupfile


(set-face-attribute 'default nil :height 100)

(show-paren-mode t)                     ; match parenthesis
(setq-default indent-tabs-mode nil)     ; don't use fucking tabs to indent

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages (quote (auto-complete-c-headers auto-complete-clang)))
 '(require-final-newline t)
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote parenthesis))
 '(speedbar-frame-parameters
   (quote
    ((minibuffer)
     (width . 20)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (set-background-color "black")))))

;;(desktop-load-default)
(desktop-read)

; display of the columns
(setq column-number-mode t)
; La molette affecte le buffer sous la souris
(setq mouse-wheel-follow-mouse t)
; les tab font 2 espaces
(setq tab-width 2)
; indentation par pas de 2 espaces
(setq standard-indent 2)
; Hilight de la region selectionne au clavier
(transient-mark-mode 1)
; Pour etre sur de ne pas beeper
(setq visible-bell t)
; option pour l'affichage des parentheses
(setq show-paren-face 'modeline)
;; Color and revert
(setq global-font-lock-mode t)
(setq global-auto-revert-mode t)


;; COLORS
(set-background-color "grey23")
(set-foreground-color "white")
(set-cursor-color "Orangered")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (background dark)) (:foreground "Turquoise"))))
 '(font-lock-comment-face ((t (:foreground "MediumAquamarine"))))
 '(font-lock-constant-face ((((class color) (background dark)) (:bold t :foreground "DarkOrchid"))))
 '(font-lock-doc-string-face ((t (:foreground "green2"))))
 '(font-lock-function-name-face ((t (:foreground "SkyBlue"))))
 '(font-lock-keyword-face ((t (:bold t :foreground "CornflowerBlue"))))
 '(font-lock-preprocessor-face ((t (:italic nil :foreground "CornFlowerBlue"))))
 '(font-lock-reference-face ((t (:foreground "DodgerBlue"))))
 '(font-lock-string-face ((t (:foreground "LimeGreen"))))
 '(font-lock-type-face ((t (:foreground "#9290ff"))))
 '(font-lock-variable-name-face ((t (:foreground "PaleGreen"))))
 '(font-lock-warning-face ((((class color) (background dark)) (:foreground "yellow" :background "red"))))
 '(highlight ((t (:background "CornflowerBlue"))))
 '(list-mode-item-selected ((t (:background "gold"))))
 '(makefile-space-face ((t (:background "wheat"))))
 '(mode-line ((t (:background "Navy"))))
 '(paren-match ((t (:background "darkseagreen4"))))
 '(region ((t (:background "DarkSlateBlue"))))
 '(show-paren-match ((t (:foreground "black" :background "wheat"))))
 '(show-paren-mismatch ((((class color)) (:foreground "white" :background "red"))))
 '(speedbar-button-face ((((class color) (background dark)) (:foreground "green4"))))
 '(speedbar-directory-face ((((class color) (background dark)) (:foreground "khaki"))))
 '(speedbar-file-face ((((class color) (background dark)) (:foreground "cyan"))))
 '(speedbar-tag-face ((((class color) (background dark)) (:foreground "Springgreen"))))
 '(vhdl-speedbar-architecture-selected-face ((((class color) (background dark)) (:underline t :foreground "Blue"))))
 '(vhdl-speedbar-entity-face ((((class color) (background dark)) (:foreground "darkGreen"))))
 '(vhdl-speedbar-entity-selected-face ((((class color) (background dark)) (:underline t :foreground "darkGreen"))))
 '(vhdl-speedbar-package-face ((((class color) (background dark)) (:foreground "black"))))
 '(vhdl-speedbar-package-selected-face ((((class color) (background dark)) (:underline t :foreground "black"))))
 '(widget-field ((((class grayscale color) (background light)) (:background "DarkBlue")))))


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

(global-set-key [(control a)] 'mark-whole-buffer)       ; select whole buffer
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


;; shell
(defun insert-shell-shebang ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "#!/bin/bash\n\n")))

;; HOOKS

;; Delete trailing whitespaces on save
(add-hook 'c-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'sh-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'c++-mode-hook
          (lambda () (add-hook 'write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'sh-mode-hook
	    (lambda ()
	          (when (equal (point-min) (point-max))
		          (insert-shell-shebang)
              (goto-char (point-max)))))

; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1)))

;; each lib in the following list will be loaded
(defconst lib
  (list
   "extensions"
   "docker"
   "c"
   "markdown"
   "font"
   "cmake"))

;;    "cachefile"
;;    "company"
;;    "dot"
;;    "go"
;;    "meson"
;;    "xcscope"
;;    "yaml"))

(mapcar
 (lambda (name) (load (concat emacs-d name ".el")))
 lib)


(add-to-list 'default-frame-alist '(foreground-color . "#E0DFDB"))
(add-to-list 'default-frame-alist '(background-color . "#102372"))


