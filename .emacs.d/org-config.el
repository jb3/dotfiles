(setq org-agenda-files '("~/org/agenda.org"))

;; Not directly org, but used for HTML export + open

(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "google-chrome-unstable")

(setq org-file-apps (quote ((auto-mode . emacs)
("\\.mm\\'" . default)
("\\.x?html?\\'" . "/usr/bin/google-chrome-unstable %s")
("\\.pdf\\'" . default))))

;; Functions to handle reading list

(defun get-reading-list-item-details ()
`((title . ,(org-element-property :title (org-element-at-point)))
(tags . ,(mapcar #'substring-no-properties (org-element-property :tags (org-element-at-point)))))
)

(defun get-items-toread ()
(with-current-buffer (find-file-noselect "~/org/reading-list.org")
(org-map-entries 'get-reading-list-item-details "LEVEL=3+TODO=\"TOREAD\"")))
