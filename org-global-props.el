;;; org-global-props --- a standard way to access buffer-global keyword properties

;; Licensed under the same terms as Emacs and under the MIT license.

;; Author: Nathanael Gentry <ngentry1@liberty.edu>
;; URL: http://github.com/npjg/org-global-props
;; Package-Requires:
;; Version: 0.1
;; Created: 2020-03-15
;; By: Nathanael Gentry <ngentry1@liberty.edu>
;; Keywords: org, buffers

;;; Commentary:

;; This package provides a standard interface for accessing and modifying
;; buffer-global keyword properties in org files (e.g. `#+TITLE: Secrets')

(defun org--global-props (keyword func &rest args)
  "Get the value from a #+KEYWORD: value line in
BUFFER-OR-NAME or the current buffer. Return nil if there is
none.

Adapted from John Kitchin, \"Getting keyword options in org-files.\""
    (save-excursion
      (goto-char (point-min))
      (let ((case-fold-search t)
            (re (format "^#\\+%s:[ \t]+\\([^\t\n]+\\)" keyword)))
        (if (save-excursion
              (or (re-search-forward re nil t)
                  (re-search-backward re nil t)))
            (apply func args)))))

;;;###autoload
(defun org-global-prop-get (keyword &optional buffer-or-name)
  (interactive (list (read-string "Keyword: ")))
  (with-current-buffer (or buffer-or-name (current-buffer))
    (org--global-props keyword #'match-string-no-properties 1)))

;;;###autoload
(defun org-global-prop-set (keyword value &optional buffer-or-name)
  (interactive (list (read-string "Keyword: ") (read-string "Value: ")))
  (with-current-buffer (or buffer-or-name (current-buffer))
    (org--global-props keyword #'replace-match value nil nil nil 1)))

(provide 'org-global-props)
