;; Find info or man documentation
;; Reuben Thomas  31st July 2012
;; Based on a script by Tassilo Horn (tsdh@gnu.org) posted to gnu-prog-discuss@gnu.org 31st July 2012

(require 'man)
(require 'info)

;;;###autoload
(defun info-or-man (topic)
  "Show info or man documentation on TOPIC."
  (interactive "MTopic: ")
  (condition-case ierr (info topic)
    (error (condition-case ierr (progn
                                  (info)
                                  (Info-goto-node (Info-extract-menu-item topic)))
             (error (unless (man topic)
                      (user-error "No info or manual entry for %s" topic)))))))
