;;
;; projectile
;; https://github.com/bbatsov/projectile
;; This library provides easy project management and navigation
;;

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)

(projectile-mode)

(setq projectile-project-search-path project-dir)

;; projectile
(global-unset-key [(control s)])
(global-set-key [(control s) (d)] 'projectile-discover-projects-in-search-path)
(global-set-key [(control s) (i)] 'projectile-invalidate-cache)
(global-set-key [(control s) (f)] 'projectile-find-file)
(global-set-key [(control s) (p)] 'projectile-switch-project)
(global-set-key [(control s) (c)] 'projectile-cleanup-known-projects)
