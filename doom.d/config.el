;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Thomas Joly"
      user-mail-address "joly.th@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; projectile
(setq
 projectile-project-search-path '("~/git")
 projectile-enable-caching t)

;; BINDINGS :: isearch

(global-unset-key [(control s)])
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

;; BINDINGS :: windows

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

;; BINDINGS :: foo

(global-set-key [(control c) (w)] 'delete-trailing-whitespace)
(setq compile-command "make -C ~/git/bolos-ng --file=Makefile.perso")
(global-set-key [(control c) (b)] 'compile)

;; dev mode

(add-hook 'c-mode-hook 'lsp)
(add-hook 'python-mode 'lsp)

(setq company-backends '((company-clang
                          company-shell
                          company-capf
                          company-dabbrev-code)))

(setq company-dabbrev-minimum-length 2)
(setq company-dabbrev-ignore-case 'keep-prefix)

;; sed
(add-to-list 'auto-mode-alist '("\\.sed$" . sh-mode))

;; makefile
(add-to-list 'auto-mode-alist '("Makefile.*\\'" . makefile-mode))

;; BINDINGS :: lsp

(global-set-key [(control c) (d)] 'lsp-find-definition)
(global-set-key [(control c) (D)] 'lsp-find-declaration)
(global-set-key [(control c) (r)] 'lsp-find-references)

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

(require 'whitespace)
(setq whitespace-line-column 100) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; BINDINGS :: C

(global-set-key [(control c) (a)] 'align-current)
(global-set-key [(control c) (h)] 'c-switch-c-h)
(global-set-key [(control h) (c)] 'c-switch-h-c)


;; Indentation
;;
(setq-default indent-tabs-mode nil) ;; don't use fucking tabs to indent
(electric-indent-mode 1) ;; auto indentafter RET
(setq sh-basic-offset 2)
(setq c-basic-offset 2)

(add-hook 'python-mode-hook
          #'(lambda () (setq electric-indent-mode nil)))

