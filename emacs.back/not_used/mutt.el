(add-to-list 'auto-mode-alist '(".*mutt.*" . message-mode))
(add-hook 'mail-mode-hook          'turn-on-auto-fill)
(add-hook 'mail-mode-hook          'mail-abbrevs-setup)
(setq mail-yank-prefix "> "
      mail-signature "\n\n-- \nhttp://www.emacswiki.org/cgi-bin/wiki/AlexSchroeder"
      mail-default-headers "FCC: ~/SENT\n")
  (add-hook 'mail-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
               '(("^[ \t]*>[ \t]*>[ \t]*>.*$"
                  (0 'mail-multiply-quoted-text-face))
                 ("^[ \t]*>[ \t]*>.*$"
                  (0 'mail-double-quoted-text-face))))))
