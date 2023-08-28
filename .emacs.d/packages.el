;; Package system initialisation {{{

;; Initialise use-package
(eval-when-compile
  (require 'use-package))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; }}}

;; Themes {{{

(use-package one-themes
  :ensure t
  :config
  (load-theme 'one-light t))

;; }}}

;; Editing {{{

(use-package vimish-fold
  :ensure t
  :config
  (vimish-fold-global-mode))

;; }}}

;; Dashboard and related plugins {{{

(use-package all-the-icons :ensure t)
(use-package page-break-lines :ensure t)
(use-package projectile :ensure t)

(defun open-reading-list ()
  (interactive)
  (find-file "~/org/reading-list.org" t)
)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)

  (defun dashboard-insert-reading (list-size)
    (dashboard-insert-heading "Reading List:"
			      nil
			      (all-the-icons-faicon "book"
						    :height 1.2
						    :v-adjust 0.0
						    :face 'dashboard-heading))
    (insert "\n\n")

    (let ((map (make-sparse-keymap)))
     (define-key map [mouse-1] 'open-reading-list
     (insert (propertize (format "%s Open Reading List" (all-the-icons-faicon "link" :height 1.2 :v-adjust 0.0)) 'keymap map 'mouse-face 'highlight 'help-echo "Click to open reading list") "\n\n")))
    
    (mapcar (lambda (arg) (progn			    
			     (insert "- " (propertize (string-fill (cdr (assoc 'title arg)) 60) 'face 'dashboard-footer))
			     (insert " (" (propertize (string-join (cdr (assoc 'tags arg)) ":") 'face 'dashboard-heading) ")\n")
			     )
			   ) (get-items-toread))

    )

  (defun dashboard-insert-kanye (list-size)
    (dashboard-insert-heading "Kanye Quote:"
                            nil
                            (all-the-icons-faicon "music"
                                                  :height 1.2
                                                  :v-adjust 0.0
                                                  :face 'dashboard-heading))
    (insert "\n\n")
    (insert (string-fill (kanye-quote) 50)))

  (add-to-list 'dashboard-item-generators '(kanye . dashboard-insert-kanye))
  (add-to-list 'dashboard-item-generators '(reading . dashboard-insert-reading))
  (add-to-list 'dashboard-items '(kanye) t)
  (add-to-list 'dashboard-items '(reading) t)
  :init
  
  
  (setq dashboard-icon-type 'all-the-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-startup-banner 'logo)

  )

;; }}}

;; Utility {{{

(use-package request
  :ensure t)

;; }}}

;; Elisp {{{

(use-package elisp-format
  :ensure t)

;;; }}}
