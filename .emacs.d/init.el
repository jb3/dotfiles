
;; Dashboard Things {{{

(defun kanye-quote () 
  (cdr (assoc 'quote (request-response-data (request "https://api.kanye.rest" 
  :parser 'json-read 
  :sync t))))
)

;; }}}

;; =-=-=- LOAD PACKAGES HERE -=-=-=
(load "~/.emacs.d/org-config.el")
(load "~/.emacs.d/packages.el")

;; Theming & Appearance {{{

;; Some themeing is handled in packages.el (e.g. loading themes), anything that isn't tied to a package is here.

;; Disable X UI elements
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)


(set-frame-font "FiraCode Nerd Font 10" nil t)

;; }}}

;; Auto-save {{{

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; }}}

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(request all-the-icons projectile page-break-lines vimish-fold use-package dashboard avy atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
