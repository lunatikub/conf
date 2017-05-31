
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

;(pc-selection-mode)                    ; selection with shift
;(dynamic-completion-mode)              ; dynamic completion

(auto-image-file-mode)                  ; to see picture in emacs
(when (string-match "^22." emacs-version)
  (ido-mode t))
(show-paren-mode t); match parenthesis
(setq-default indent-tabs-mode nil); don't use fucking tabs to indent

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
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (set-background-color "black")))))

(desktop-load-default)
(desktop-read)


;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; (setq-default ispell-program-name "aspell")

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

(setq delete-auto-save-files t)

(defun my-load-file (file)
  (if (file-exists-p file)
      (load-file file)))

;; (if (>= emacs-major-version 21)
;;   (setq selection-coding-system 'compound-text-with-extensions))

;; delete the selected text on insert
(delete-selection-mode 1)

;; Ido

;; tab means tab, i.e. complete. Not "open this file", stupid.
(setq ido-confirm-unique-completion t)
;; If the file doesn't exist, do try to invent one from a transplanar
;; directory. I just want a new file.
(setq ido-auto-merge-work-directories-length -1)

;; ;; Compilation
(setq compilation-window-height 12)
(setq compilation-scroll-output t)
