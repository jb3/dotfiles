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

;; Utility & Language Servers {{{

(use-package request
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

(use-package helm
  :ensure t
  :custom-face
  (helm-ff-file-extension ((t (:foreground "RosyBrown"))))

  :custom
  (helm-autoresize-max-height 0)
  (helm-autoresize-min-height 20)
  (helm-split-window-in-side-p t)
  (helm-move-to-line-cycle-in-source t)
  (helm-display-header-line nil)
  (helm-ff-auto-update-initial-value nil)
  (helm-find-files-doc-header nil)
  (helm-ff-lynx-style-map nil)
  (helm-display-buffer-default-width nil)
  (helm-display-buffer-default-height 0.25)
  (helm-ff-DEL-up-one-level-maybe t)
  (helm-ff-fuzzy-matching t)
  (helm-ff-newfile-prompt-p t)

  :config
  (helm-autoresize-mode 1)

  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z")  'helm-select-action)

  (helm-mode 1)
  )

(use-package treemacs
  :ensure t)

(use-package treemacs-projectile
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-minor-modes t)
  (doom-modeline-enable-word-count t)
  (doom-modeline-indent-info t)
  (doom-modeline-vcs-max-length 20)
  
  :hook (after-init . doom-modeline-mode))

(use-package nyan-mode
  :ensure t
  :custom
  (nyan-animate-nyancat t)
  (nyan-wavy-trail t)
  :init
  (nyan-mode))

;; }}}

;; Applications {{{

(use-package calfw
  :ensure t)

(use-package calfw-org
  :ensure t)

(use-package elcord
  :ensure t
  :custom
  (elcord-display-line-numbers nil)
  (elcord-editor-icon "emacs_material_icon")
  (elcord-display-buffer-details nil)
  
  :config
  (elcord-mode))

;; }}}

;; Elisp {{{

(use-package elisp-format
  :ensure t)

;;; }}}


;; Elixir {{{

(use-package elixir-mode
  :ensure t)

;; }}}
