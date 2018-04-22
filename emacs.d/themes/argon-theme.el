(deftheme argon
  "Argon theme")

;; getting initial values from https://github.com/juba/color-theme-tangotango/blob/master/tangotango-theme.el
(custom-theme-set-faces
 'argon
 `(default ((t (:weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#C7C8FF" :background "#272B34" :stipple nil :inherit nil))))
 `(cursor ((t (:foreground "#C7C8FF" :background "#6CA9FF"))))
 `(region ((t (:background "#20242D"))))
 `(isearch ((t (:background "#234E79"))))
 `(lazy-highlight ((t (:background "#234E79"))))
 `(linum ((t (:background "#272B34" :foreground "#52606B"))))
 `(mode-line ((t (:background "#20242D" :foreground "#C7C8FF" :inherit nil :box (:line-width 4 :color "#20242d")))))
 `(mode-line-inactive ((t (:background "#20242D" :foreground "#757694" :box (:line-width 4 :color "#20242d")))))
 `(minibuffer-prompt ((t (:background "#20242D" :foreground "#969DAC"))))
 `(fringe ((t (:background "#272B34"))))
 `(hl-line ((t (:background "#20242D"))))
 `(vertical-border ((t (:foreground "#757694"))))
 `(link ((t (:foreground "#67DCF9" :weight bold))))

 ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
 `(font-lock-warning-face ((t (:weight bold :foreground "#F86F65"))))
 `(font-lock-function-name-face  ((t (:foreground "#6CA9FF" :inherit nil))))
 `(font-lock-variable-name-face ((t (:foreground "#C7C8FF" :weight bold))))
 `(font-lock-keyword-face ((t (:weight bold :foreground "#D983F5"))))
 `(font-lock-comment-face ((t (:foreground "#52606B"))))
 `(font-lock-comment-delimiter-face ((t (:foreground "#52606B"))))
 `(font-lock-type-face ((t (:foreground "#6CA9FF"))))
 `(font-lock-constant-face ((t (:slant italic :foreground "#f0f0f0"))))
 `(font-lock-builtin-face ((t (:slant italic :foreground "#D983F5"))))
 `(font-lock-string-face  ((t (:foreground "#A1EF9D" :inherit nil))))
 `(font-lock-doc-face ((t (:foreground "#A1EF9D" :slant italic))))
 `(font-lock-negation-char-face ((t (:slant italic))))

 `(dired-flagged ((t (:foreground "#F86F65"))))
 `(dired-marked ((t (:foreground "#D983f5"))))

 `(company-tooltip ((t (:background "#272B34" :foreground "#C7C8ff"))))
 `(company-tooltip-selection ((t (:background "#20242D"))))
 `(company-preview ((t (:foreground "#6CA9FF"))))
 `(company-tooltip-common ((t (:foreground "#6CA9FF"))))
 `(company-scrollbar-fg ((t (:background "#20242D"))))
 `(company-scrollbar-bg ((t (:background "#272B34"))))
 `(company-preview-common ((t (:foreground "#6CA9ff"))))
 `(company-tooltip-annotation ((t (:foreground "#67DCf9"))))

 ;; helm custom faces https://github.com/emacs-helm/helm/blob/4c9f2da8d85a087278b41e934bfecff8e0b04fb6/helm.el
 `(helm-selection ((t (:background "#20242d"))))
 `(helm-source-header ((t (:foreground "#67DCF9" :weight bold :line-width: 4 :height 1.2))))
 `(helm-match ((t (:foreground "#D983f5"))))
 `(helm-header ((t (:background "#272B34" :foreground "#C7C8FF"))))
 `(helm-candidate-number ((t (:background nil :foreground "#D983F5"))))
 `(helm-action ((t (:foreground "#67Dcf9"))))

 `(org-document-title ((t (:foreground "#D983F5" :weight bold))))
 `(org-document-info ((t (:foreground "#D983F5" :weight bold))))
 `(org-document-info-keyword ((t (:foreground "#757694" :slant italic))))

 `(org-level-1 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-2 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-3 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-4 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-5 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-6 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-7 ((t (:foreground "#67DCF9" :weight bold))))
 `(org-level-8 ((t (:foreground "#67DCF9" :weight bold))))
 )

(provide-theme 'argon)

