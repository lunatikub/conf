(defun count-word (start end)
  (let ((begin (min start end))(end (max start end)))
    (save-excursion
      (goto-char begin)
      (re-search-forward "\\W*") ; skip blank
      (setq i 0)
      (while (< (point) end)
        (re-search-forward "\\w+")
        (when (<= (point) end)
          (setq i (+ 1 i)))
        (re-search-forward "\\W*"))))
  i)

(defun stat-region (start end)
  (interactive "r")
  (let
      ((words (count-word start end)) (lines (count-lines start end)))
    (message
     (concat "Lines: "
             (int-to-string lines)
             "  Words: "
             (int-to-string words)))
    )
  )

(defun ruby-command (cmd &optional output-buffer error-buffer)
  "Like shell-command, but using ruby."
  (interactive (list (read-from-minibuffer "Ruby command: "
					      nil nil nil 'ruby-command-history)
		          current-prefix-arg
			       shell-command-default-error-buffer))
  (shell-command (concat "ruby -e '" cmd "'") output-buffer error-buffer))

;; Shell

(defun cwd ()
  (replace-regexp-in-string "Directory " "" (pwd)))


(defun sandbox ()
  "Opens a C++ sandbox in current window."
  (interactive)
  (cd "/tmp")
  (let ((file (make-temp-file "/tmp/" nil ".cc")))
    (find-file file)
    (insert "int main()\n{\n\n}\n")
    (line-move -2)
    (save-buffer)
    (compile (concat "g++ -W -Wall -I /usr/include/qt4/ -I /usr/include/qt4/QtCore/ -L /usr/lib/qt4 -lQtCore " file " && ./a.out"))))

(defun rbegin ()
  (min (point) (mark)))

(defun rend ()
  (max (point) (mark)))

(defun c-insert-class (name)
  (interactive "sName: ")
  (c-insert-block () (concat "class " name "\n") ";")
  (insert "public:")
  (c-indent-line)
  (insert "\n")
  (c-indent-line))

;; Qt

(font-lock-add-keywords 'c++-mode
			'(("foreach\\|forever\\|emit" . 'font-lock-keyword-face)))


;; BINDINGS :: C/C++

(require 'cc-mode)

(define-key
  c-mode-base-map [f5] 'compile)
(define-key
  c-mode-base-map [f6] 'gdb)
(define-key
  c-mode-base-map [(control c) (a)] 'add-change-log-entry-other-window)
(define-key
  c-mode-base-map
  [(control c) (p)]
  'pdf-moisi)                                      ; switch between .hh and .cc
(define-key
  c-mode-base-map
  [(control c) (w)]
  'c-switch-hh-cc)                                      ; switch between .hh and .cc
(define-key
  c-mode-base-map
  [(control c) (q)]
  'c-switch-hh-hxx-cc)                                      ; switch between .hxx and .cc
(define-key
  c-mode-base-map
  [(control c) (f)]
  'hs-hide-block)                                       ; fold code
(define-key
  c-mode-base-map
  [(control c) (s)]
  'hs-show-block)                                       ; unfold code
(define-key
  c-mode-base-map
  [(control c) (control n)]
  'c-insert-ns)                                         ; insert namespace
(define-key
  c-mode-base-map
  [(control c) (control s)]
  'c-insert-switch)                                     ; insert switch
(define-key
  c-mode-base-map
  [(control c) (control i)]
  'c-insert-if)                                         ; insert if
(define-key
  c-mode-base-map
  [(control c) (control b)]
  'c-insert-braces)                                     ; insert braces
(define-key
  c-mode-base-map
  [(control c) (control f)]
  'insert-fixme)                                        ; insert fixme
(define-key
  c-mode-base-map
  [(control c) (control d)]
  'c-insert-debug)                                      ; insert debug
(define-key
  c-mode-base-map
  [(control c) (control l)]
  'c-insert-class)                                      ; insert class
(define-key
  c-mode-base-map
  [(control c) (control i)]
  'c-insert-include)                                    ; insert include

;; ;; BINDINGS :: C/C++ :: XRefactory

;; (define-key
;;   c-mode-base-map
;;   [(control c) (d)]
;;   'xref-push-and-goto-definition)                       ; goto definition
;; (define-key
;;   c-mode-base-map
;;   [(control c) (b)]
;;   'xref-pop-and-return)                                 ; go back
;; (define-key
;;   c-mode-base-map
;;   [C-return]
;;   'xref-completion)                                     ; complete

;; BINDINGS :: sgml

(require 'sgml-mode)

(define-key
  html-mode-map
  [(control c) (control c)]
  'comment-region)


;; Tuareg mode

;; (load "/usr/share/emacs/site-lisp/tuareg-mode/tuareg.el" t)
;; (add-to-list 'load-path "/usr/share/doc/tuareg-mode-1.44.3")



; Use UTF8 in tuareg mode

;; (add-hook 'tuareg-interactive-mode-hook
;;   (lambda ()
;;            (prefer-coding-system 'utf-8)
;;             ))




;; (setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))

; BINDINGS :: tuareg

; (define-key
;   tuareg-mode-map
;   [(control c) (control c)]
;   'comment-region)                                      ; comment
; (define-key
;   tuareg-mode-map
;   [(control c) (control f)]
;   'insert-fixme)                                      ; insert fixme

;; Sessions

;; mmm mode

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mmm-mode/")
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)


;; (defun foo ()
;;   (when (looking-back "^[ \t]*")
;;     (beginning-of-line)))

;; (mmm-add-classes
;;  '((cc-html
;;     :submode html-mode
;;     :face mmm-code-submode-face
;;     :front "\\('@\\|'@xml\\)\n?"
;;     :back "@'"
;;     :back-offset (foo))))


;; (mmm-add-classes
;;  '((ml-ext
;;     :submode text-mode
;;     :face mmm-code-submode-face
;;     :front "<:\\w*<"
;;     :back ">>"
;;     :back-offset (foo))))


;; (mmm-add-mode-ext-class 'c++-mode () 'cc-html)
; (mmm-add-mode-ext-class 'tuareg-mode () 'ml-ext)

;; (setq mmm-submode-decoration-level 1)

;; (set-face-background 'mmm-default-submode-face "gray16")

;(require 'flymake)
;(add-hook 'find-file-hooks 'flymake-find-file-hook)

;; ;; Xrefactory configuration part ;;
;; ;; some Xrefactory defaults can be set here
;; (defvar xref-current-project nil) ;; can be also "my_project_name"
;; (defvar xref-key-binding 'global) ;; can be also 'local or 'none
;; (setq load-path (cons "/tmp/xref/emacs" load-path))
;; (setq exec-path (cons "/tmp/xref" exec-path))
;; (load "xrefactory")
;; ;; end of Xrefactory configuration part ;;
;; (message "xrefactory loaded")

;; Save and restore window layout

;; (defvar winconf-ring ())

;; (defun push-winconf ()
;;   (interactive)
;;   (window-configuration-to-register ?%)
;;   (push (get-register ?%) winconf-ring))

;; (defun pop-winconf ()
;;   (interactive)
;;   (set-register ?% (pop winconf-ring))
;;   (jump-to-register ?%))

;; (defun restore-winconf ()
;;   (interactive)
;;   (set-register ?% (car winconf-ring))
;;   (jump-to-register ?%))

;; aller chercher les fichiers dans le bon repertoire
;; (setq load-path (cons (expand-file-name "~/emacs/tuareg-mode")
;;             load-path))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; append-tuareg.el - Tuareg quick installation: Append this file to .emacs.
;; (setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
;; (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;; (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;; (if (and (boundp 'window-system) window-system)
;;     (when (string-match "XEmacs" emacs-version)
;;         (if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
;;             (require 'sym-lock))
;;         (require 'font-lock)))
;; ;; Configuration de tuareg
;; (add-hook 'tuareg-mode-hook
;;   '(lambda ()
;;      (auto-fill-mode 1)
; turn on auto-fill minor mode
; (passage a la ligne automatique)
     ;; (define-key tuareg-mode-map [f4] 'goto-line)
     ;; (define-key tuareg-mode-map [f5] 'compile)
     ;; (define-key tuareg-mode-map [f6] 'recompile)
     ;; (define-key tuareg-mode-map [f7] 'next-error)
; quelques raccourcis
     ;; (setq tuareg-sym-lock-keywords nil)
; ne pas remplacer les mots cles par des symboles
     ;; ))


;; Don't switch to GDB-mode buffers
;;(add-to-list 'ido-ignore-buffers "locals")
