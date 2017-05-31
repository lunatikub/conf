;;; pdd-mode.el --- Protocol data description mode
;;; Author: Joly Thomas

;; Define several class of keywords
(setq pdd-bool '("\"protocols\""))

(setq pdd-key '("\"name\"" "\"id\"" "\"tags\"" "\"compatibility\""
                "\"version\"" "\"altname\"" "\"description\"" "\"rules\""
                "\"cacheable\"" "\"defaultport\"" "\"maximumtransactions\""
                "\"supported_versions\"" "\http_reclassify\"" "\"basic_dpi\""
                "\"bottom_layers\"" "\"prefix\"" "\"suffix\"" "\"regular\""
))

(setq pdd-sub-key '("\"rule\""))

(setq pdd-tags-key '("\"category\"" "\"family\"" "\"en\"" "\"fr\""
                     "\"path\"" "\"deprecated\"" "\"risk\"" "\"subcategory\""
                     "\"characteristic\"" "\"ruleorder\"" "\"order\"" "\"fastpass\"" "\"rule-tags\""
                     "\"date\"" "\"device\"" "\"os\"" "\"client\"" "\"client_version\""
                     "\"os_version\"" "\"web_site\""
))

(setq pdd-rule-spe-key '("\"protocol\"" "\"chainorder\"" "\"cts-mindata\""
                         "\"stc-mindata\"" "\"mindata\""
))

(setq pdd-rule-attr-key '("\"server\"" "\"referer\"" "\"common_name\""
                          "\"cts-server\"" "\"cts-user_agent\"" "\"cts-referer\"" "\"cts-uri\""
                          "\"uri\"" "\"page_url\"" "\"user_agent\"" "\"cts-page_url\""
                          "\"port\"" "\"cts-stream\"" "\"stc-stream\"" "\"cts-host\""
                          "\"cookie\"" "\"host\"" "\"cts-uri\"" "\"cts-cookie\""
                          "\"mime_type\"" "\"cts-content_type\"" "\"stc-content_type\""
                          "\"cts-user_agent\"" "\"referer\"" "\"server_agent\""
                          "\"location\"" "\"cookie_full\"" "\"stc-cookie_full\""
                          "\"cts-post_variable_decoded\"" "\"cts-uri-param-parsed\""
                          "\"cts-uri_get_decoded\"" "\"cts-uri_post_decoded\""
                          "\"cts-common_name\"" "\"stc-common_name\"" "\"page_url\""
                          "\"stream\"" "\"stc-mime-type\"" "\"address\"" "\"typeval\""
                          "\"code\"" "\"protoid\"" "\"stc-subject_alt_name\"" "\"stc-mime_type\""
                          "\"stc-location\"" "\"resolv_name\"" "\"cts-mime_type\""
))

;; Create the regex string for each class of keywords
(setq pdd-key-regexp (regexp-opt pdd-key 'strings))
(setq pdd-sub-key-regexp (regexp-opt pdd-sub-key 'strings))
(setq pdd-tags-key-regexp (regexp-opt pdd-tags-key 'strings))
(setq pdd-rule-spe-key-regexp (regexp-opt pdd-rule-spe-key 'strings))
(setq pdd-rule-attr-key-regexp (regexp-opt pdd-rule-attr-key 'strings))
(setq pdd-bool-regexp (regexp-opt pdd-bool 'strings))

;; Create the list for font-lock.
;; Each class of keyword is given a particular face
(setq pdd-font-lock-keywords
  `((,pdd-key-regexp . font-lock-builtin-face)
    (,pdd-sub-key-regexp . font-lock-constant-face)
    (,pdd-tags-key-regexp . font-lock-variable-name-face)
    (,pdd-rule-spe-key-regexp . font-lock-function-name-face)
    (,pdd-rule-attr-key-regexp . font-lock-keyword-face)
    (,pdd-bool-regexp . font-lock-constant-face)
))

;; Insert a new rule
(defun insert-pdd-rule ()
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "      \"rule\": [\n")
    (insert "        {\n")
    (insert "          \"protocol\": \"\",\n")
    (insert "        }\n")
    (insert "      ]\n")))

;; Insert a new protocol
(defun insert-pdd-protocol (&optional name)
  (interactive "sProtocol name: ")
  (save-excursion
    (end-of-line)
    (insert "{\n")
    (insert "  \"name\": \"" name "\",\n")
    (insert "  \"id\": ,\n")
    (insert "  \"tags\": [\n")
    (insert "     { \"family\": \"\" },\n")
    (insert "     { \"category\": \"\" }\n")
    (insert "  \"compatibility\": [ \"\" ],\n")
    (insert "  \"version\": [ \"\" ],\n")
    (insert "  \"altname\": [ \"\" ],\n")
    (insert "  \"description\": {\n")
    (insert "     \"en\": \"\",\n")
    (insert "     \"fr\": \"\",\n")
    (insert "   },\n")
    (insert "  \"rules\": [\n")
    (insert "    {\n")
    (insert "    }\n")
    (insert "  ]\n")
    (insert "}\n")
))

;; Bindings
(global-set-key [(control c) (n)] 'insert-pdd-protocol)
(global-set-key [(control c) (r)] 'insert-pdd-rule)

;; Major protocol data description mode
(defun pdd-mode ()
  "Major mode for editing PDD (protocol data description)."
  ;; code for syntax highlighting
  (setq font-lock-defaults '((pdd-font-lock-keywords)))
  ;; Set major mode
  (setq major-mode 'pdd-mode)
  (setq mode-name "pdd")
  (run-hooks 'pdd-mode-hook)

  ;; add to the auto-completion list
  (add-to-list 'ac-modes 'pdd-mode)

  ;; clear memory
  (setq mylsl-keywords-regexp nil)
  (setq mylsl-types-regexp nil)
  (setq mylsl-constants-regexp nil)
  (setq mylsl-events-regexp nil)
  (setq mylsl-functions-regexp nil))

(add-to-list 'auto-mode-alist '("\\.pdd$" . pdd-mode))
(add-to-list 'auto-mode-alist '("\\.pdm$" . pdd-mode))
(add-to-list 'auto-mode-alist '("\\.psa$" . pdd-mode))

(provide 'pdd-mode)
;;; pdd-mode.el ends here
