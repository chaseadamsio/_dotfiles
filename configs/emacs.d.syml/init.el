;;; init.el --- Summary
;;; Evaluate emacs-lisp code blocks in init.org.
;;;
;;; Commentary:
;;; Copied from https://github.com/john2x/emacs.d/blob/master/init.el
;;; which was copied from http://endlessparentheses.com/init-org-Without-org-mode.html
;;; See the blog post on why this is used instead of `org-babel-load-file'

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar endless/init.org-message-depth 4
  "What depth of init.org headers to message at startup.")

(with-temp-buffer
  (insert-file-contents "~/.emacs.d/init.org")
  (goto-char (point-min))
  (while (not (eobp))
    (forward-line 1)
    (cond
     ;; Report Headers
     ((looking-at
       (format "\\*\\{2,%s\\} +.*$"
               endless/init.org-message-depth))
      (message "%s" (match-string 0)))
     ;; Evaluate Code Blocks
     ((looking-at "^#\\+BEGIN_SRC +emacs-lisp *$")
      (let ((l (match-end 0)))
        (search-forward "\n#+END_SRC")
        (eval-region l (match-beginning 0)))))))

;;; init.el ends here
