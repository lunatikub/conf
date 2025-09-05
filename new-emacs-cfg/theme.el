;;
;; theme
;; https://github.com/bbatsov/zenburn-emacs
;; Load them and customize frame.
;;

;;
;; theme
;;

(add-to-list 'custom-theme-load-path emacs-themes-dir)
(load-theme 'zenburn t)

;;
;; frame tweak
;;

(defun my-frame-tweaks (&optional frame)
  (unless frame
    (setq frame (selected-frame)))
  (when frame
    (with-selected-frame frame
      (when (display-graphic-p)
        (scroll-bar-mode -1)               ; no scroll bar
        (menu-bar-mode -1)                 ; no menu bar
        (tool-bar-mode -1)                 ; no tool bar
        (mouse-wheel-mode t)))))           ; enable mouse wheel

;; For the case that the init file runs after the frame has been created.
;; Call of emacs without --daemon option.
(my-frame-tweaks)
;; For the case that the init file runs before the frame is created.
;; Call of emacs with --daemon option.
(add-hook 'after-make-frame-functions #'my-frame-tweaks t)


;;
;; font
;;

(defun set-font-size (&optional size)
  (unless size
    (setq size default-font-size))
  (set-face-attribute 'default nil :height size))

(set-font-size font-size)

;;
;; custom
;;

(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)        ; Don't show the splash screen
(setq frame-title-format "%b")          ; titlebar shows buffer's name
(global-font-lock-mode t)               ; syntax highlighting
(setq font-lock-maximum-decoration t)   ; max decoration for all modes
(setq transient-mark-mode 't)           ; highlight selection
;;(setq line-number-mode 't)              ; line number
(global-display-line-numbers-mode)
(setq column-number-mode 't)            ; column number
(setq delete-auto-save-files t)         ; delete unnecessary autosave files
(setq delete-old-versions t)            ; delete oldversion file
(setq-default normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)           ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)    ; change default major mode to text
(setq ring-bell-function 'ignore)       ; turn the alarm totally off
(setq make-backup-files nil)            ; no backupfile

(setq column-number-mode t)             ; display of the columns
(setq mouse-wheel-follow-mouse t)       ; La molette affecte le buffer sous la souris
(setq tab-width 4)                      ; tab = 2 spaces
(setq standard-indent 4)
(transient-mark-mode 1)                 ; Hilight de la region selectionne au clavier
(setq visible-bell t)                   ; Pour etre sur de ne pas beeper
(setq show-paren-face 'modeline)        ; option pour l'affichage des parentheses

(setq global-font-lock-mode t)
(setq global-auto-revert-mode t)

(show-paren-mode t)                     ; match parenthesis
(setq-default indent-tabs-mode nil)     ; don't use fucking tabs to indent

;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(custom-set-variables

 '(tab-stop-list (quote (4 8 12)))
 '(tab-width 4))
