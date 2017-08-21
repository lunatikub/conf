
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
 '(after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(require-final-newline t)
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote parenthesis))
 '(speedbar-frame-parameters (quote ((minibuffer)
                                     (width . 20)
                                     (border-width . 0)
                                     (menu-bar-lines . 0)
                                     (tool-bar-lines . 0)
                                     (unsplittable . t)
                                     (set-background-color "black")))))

(desktop-load-default)
(desktop-read)

; Affichage des colonnes
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
(set-background-color "black")
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

;; END C MODE

;; BINDINGS :: C

(global-set-key [(control c) (a)] 'align-current)
(global-set-key [(control c) (m)] 'compile)

(global-set-key [(control c) (h)] 'c-switch-c-h)
(global-set-key [(control h) (c)] 'c-switch-h-c)

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


;; shell
(defun insert-shell-shebang ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert "#!/bin/bash\n\n")))



;; HOOKS

;; Delete trailing whitespaces on save (just for c file)
(add-hook 'c-mode-hook
          (lambda ()
            (add-hook 'write-file-hooks 'delete-trailing-whitespace)))

;; (add-hook 'find-file-hooks
;;           (lambda ()
;;             (when (and (memq major-mode '(c-mode c++-mode))
;;                        (equal (point-min) (point-max))
;;                        (string-match ".*\\.hh?"
;;                                      (buffer-file-name)))
;;               (insert-header-guard)
;;               (goto-line 3)
;;               (insert "\n"))))

;; (add-hook 'find-file-hooks
;;           (lambda ()
;;               (when (and (memq major-mode '(c-mode c++-mode))
;;                          (equal (point-min) (point-max))
;;                          (string-match ".*\\.cc?" (buffer-file-name)))
;;                 (insert-header-inclusion))))

(add-hook 'sh-mode-hook
	    (lambda ()
	          (when (equal (point-min) (point-max))
		          (insert-shell-shebang)
              (goto-char (point-max)))))

; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1)))



;; file extensions
;;(add-to-list 'auto-mode-alist '("\\.sed$" . sh-mode))

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))

;; font

(defconst default-font-size 120)

(defun set-font-size (&optional size)
  "Set the font size to SIZE (default: default-font-size)."
  (interactive "nSize: ")
  (unless size
    (setq size default-font-size))
  (set-face-attribute 'default nil :height size))

(set-default-font "Terminus-9")
(set-font-size)

;; markdown
(load "~/conf/emacs-mode/markdown-mode.el")

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

