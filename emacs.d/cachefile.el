(require 'filecache)

;; (defun file-cache-save-cache-to-file (file)
;;   "Save contents of `file-cache-alist' to FILE.
;; For later retrieval using `file-cache-read-cache-from-file'"
;;   (interactive "FFile: ")
;;   (with-temp-file (expand-file-name file)
;;     (prin1 file-cache-alist (current-buffer))))

(defun file-cache-read-cache-from-file (file)
  "Clear `file-cache-alist' and read cache from FILE.
The file cache can be saved to a file using
`file-cache-save-cache-to-file'."
  (interactive "fFile: ")
  (file-cache-clear-cache)
  (let ((buf (find-file-noselect file)))
    (setq file-cache-alist (read buf))
    (kill-buffer buf)))

;; TODO
;; update-file-cache
;; (exec create_cache_file.sh repo)

;; (eval-after-load
;;     "filecache"
;;   '(progn
;;      (message "Loading file cache...")
;;      (file-cache-add-directory-using-find "~/projects")
;;      (file-cache-add-directory-list load-path)
;;      (file-cache-add-directory "~/")
;;      (file-cache-add-file-list (list "~/foo/bar" "~/baz/bar"))
;;      ))

(when (file-exists-p ".cache_file")
  (file-cache-read-cache-from-file ".cache_file"))

(defun file-cache-ido-find-file (file)
  "Using ido, interactively open file from file cache'.
First select a file, matched using ido-switch-buffer against the contents
in `file-cache-alist'. If the file exist in more than one
directory, select directory. Lastly the file is opened."
  (interactive (list (file-cache-ido-read "File: "
                                          (mapcar
                                           (lambda (x)
                                             (car x))
                                           file-cache-alist))))
  (let* ((record (assoc file file-cache-alist)))
    (find-file
     (expand-file-name
      file
      (if (= (length record) 2)
          (car (cdr record))
        (file-cache-ido-read
         (format "Find %s in dir: " file) (cdr record)))))))

(defun file-cache-ido-read (prompt choices)
  (let ((ido-make-buffer-list-hook
	 (lambda ()
	   (setq ido-temp-list choices))))
    (ido-read-buffer prompt)))

(global-set-key [(control c) (f)] 'file-cache-ido-find-file)
