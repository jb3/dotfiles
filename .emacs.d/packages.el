;; Package system initialisation {{{

;; Initialise use-package
(eval-when-compile
  (require 'use-package))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; }}}

;; Themes {{{

(use-package atom-one-dark-theme
  :ensure t
  :config
  (load-theme 'atom-one-dark t))

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

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
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

;;; Elisp {{{

(use-package elisp-format
  :ensure t)

;;; }}}
