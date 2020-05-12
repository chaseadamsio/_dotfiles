;;; argon-theme.el --- yet another theme for emacs -*- lexical-binding: t; -*-
;;; Commentary:
;; Argon themes is a pseudo-port from a theme made for VS Code
;;
;;; Code:


(setq debug-on-error t)

(deftheme argon
  "Argon theme")

(let ((c '((class color)))
      (black "#272B34")
      (red "#F86F65")
      (red-subtle "#A61207")
      (green "#A1EF9D")
      (green-subtle "#22AA1B")
      (blue "#6CA9FF")
      (blue-d "#234E79")
      (magenta "#D983F5")
      (magenta-subtle "#860EAD")
      (cyan "#67DCF9")
      (white "#C7C8FF")
      (grey "#757694")
      (grey-00 "#20242D")
      (grey-01 "#2B2E3B")
      (grey-04 "#52606B")
      (grey-05 "#969DAC")
      )
  (custom-theme-set-faces
   'argon
   `(default ((,c (:background ,black :foreground ,white))))
   `(fringe ((,c (:background ,black))))
   `(region ((,c (:background ,blue :foreground ,white))))
   `(lazy-highlight ((,c (:background ,black))))
   `(hl-line ((,c (:background ,grey-01))))
   `(cursor ((,c (:background ,blue :foreground ,white))))
   `(trailing-whitespace ((,c (:background ,red))))
   ;; for display-line-number mode
   `(line-number ((,c (:background ,black :foreground ,grey-04))))
   `(isearch ((,c (:background ,blue-d))))
   `(mode-line ((,c (:background  ,grey-00 :foreground ,white :inherit nil :box (:line-width 4 :color ,grey-00)))))
   `(mode-line-inactive ((,c (:background ,grey-00 :foreground ,grey :box (:line-width 4 :color ,grey-00)))))
   `(minibuffer ((,c (:background ,grey-00 :foreground ,white ))))
   `(minibuffer-prompt ((,c (:background ,grey-00 :foreground ,grey-05))))
   ;; separator
   `(vertical-border ((,c (:foreground ,grey-00))))
   `(link ((,c (:foreground ,cyan))))

   ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html
   `(font-lock-warning-face ((,c (:foreground ,red))))
   `(font-lock-function-name-face  ((,c (:foreground ,blue :inherit nil))))
   `(font-lock-variable-name-face ((,c (:foreground ,white ))))
   `(font-lock-keyword-face ((,c (:foreground ,magenta))))
   `(font-lock-comment-face ((,c (:foreground ,grey-04))))
   `(font-lock-comment-delimiter-face ((,c (:foreground ,grey-04))))
   `(font-lock-type-face ((,c (:foreground ,blue))))
   `(font-lock-constant-face ((,c (:slant italic :foreground ,white))))
   `(font-lock-builtin-face ((,c (:slant italic :foreground ,magenta))))
   `(font-lock-string-face  ((,c (:foreground ,green :inherit nil))))
   `(font-lock-doc-face ((,c (:foreground ,green :slant italic))))
   `(font-lock-negation-char-face ((t (:slant italic))))
   `(show-paren-match ((,c (:foreground ,blue))))
   `(show-paren-mismatch ((,c (:foreground ,red))))

   `(dired-flagged ((,c (:foreground ,red))))
   `(dired-marked ((,c (:foreground ,magenta))))

   ;; doom-modeline
   ;; un-faced
   ;; doom-modeline-panel: https://github.com/seagle0128/doom-modeline/blob/master/doom-modeline.el#L263
   ;; doom-modeline-eldoc-bar
   `(doom-modeline-buffer-path ((,c (:foreground ,magenta))))
   `(doom-modeline-buffer-file ((,c (:foreground ,magenta))))
   `(doom-modeline-buffer-modified ((,c (:foreground ,magenta))))
   `(doom-modeline-inactive-bar ((,c (:foreground ,grey-04))))
   `(doom-modeline-buffer-major-mode ((,c (:foreground ,blue))))
   `(doom-modeline-buffer-minor-mode ((,c (:foreground ,cyan))))
   `(doom-modeline-project-root-dir ((,c (:foreground ,grey-04))))
   `(doom-modeline-highlight ((,c (:foreground ,green))))
   `(doom-modeline-info ((,c (:foreground ,green))))
   `(doom-modeline-urgent ((,c (:foreground ,red))))
   `(doom-modeline-warning ((,c (:foreground ,green))))
   `(doom-modeline-evil-emacs-state ((,c (:foreground ,green))))
   `(doom-modeline-evil-insert-state ((,c (:foreground ,red))))
   `(doom-modeline-evil-motion-state ((,c (:foreground ,grey-04))))
   `(doom-modeline-evil-normal-state ((,c (:foreground ,green))))
   `(doom-modeline-evil-operator-state ((,c (:foreground ,blue))))
   `(doom-modeline-evil-replace-state ((,c (:foreground ,magenta))))

   ;; git-gutter
   `(git-gutter:modified         ((,c (:foreground ,magenta-subtle))))
   `(git-gutter:added            ((,c (:foreground ,green-subtle))))
   `(git-gutter:deleted          ((,c (:foreground ,red-subtle))))
   `(git-gutter+-modified        ((,c (:foreground ,magenta))))
   `(git-gutter+-added           ((,c (:foreground ,green))))
   `(git-gutter+-deleted         ((,c (:foreground ,red))))

   ;; Rainbow delimiters
   `(rainbow-delimiters-depth-1-face   ((,c (:foreground ,magenta))))
   `(rainbow-delimiters-depth-2-face   ((,c (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face   ((,c (:foreground ,green))))
   `(rainbow-delimiters-depth-4-face   ((,c (:foreground ,magenta))))
   `(rainbow-delimiters-depth-5-face   ((,c (:foreground ,blue))))
   `(rainbow-delimiters-unmatched-face ((,c (:foreground ,red :inverse-video t))))

   ;; Company
   `(company-tooltip ((,c (:background ,black :foreground ,white))))
   `(company-tooltip-selection ((,c (:background ,grey-00))))
   `(company-preview ((,c (:foreground ,blue))))
   `(company-tooltip-common ((,c (:foreground ,blue))))
   `(company-scrollbar-fg ((,c (:background ,grey-00))))
   `(company-scrollbar-bg ((,c (:background ,black))))
   `(company-preview-common ((,c (:foreground ,blue))))
   `(company-tooltip-annotation ((,c (:foreground ,cyan))))

   ;; Magit
   `(magit-branch-current    ((,c (:foreground ,red))))
   `(magit-branch-local ((,c (:foreground ,magenta))))
   `(magit-branch-remote ((,c (:foreground ,blue))))
   `(magit-filename ((,c (:foreground ,white))))
   `(magit-section-heading ((,c (:foreground ,blue))))
   `(magit-section-highlight ((,c (:background ,grey-00))))
   `(magit-diff-hunk-heading ((,c (:background ,grey-00 :foreground ,white))))
   `(magit-diff-hunk-heading-highlight ((,c (:background ,grey-00 :foreground ,white))))
   `(magit-diff-context-highlight ((,c (:background ,grey-00 :foreground ,white))))
   `(magit-diff-base ((,c (:background ,grey-00 :foreground ,white))))
   `(magit-diff-added ((,c (:background ,green :foreground ,black))))
   `(magit-diff-added-highlight ((,c (:background ,green :foreground ,black :weight bold))))
   `(magit-diff-removed ((,c (:background ,red :foreground ,black))))
   `(magit-diff-removed-highlight ((,c (:background ,red :foreground ,black :weight bold))))
   `(magit-diffstat-added ((,c (:background ,black :foreground ,green))))
   `(magit-diffstat-removed ((,c (:background ,black :foreground ,red))))
   `(magit-log-author ((,c (:foreground ,magenta))))
   `(magit-log-date ((,c (:foreground ,blue))))
   `(magit-hash ((,c (:foreground ,grey-04))))
   `(magit-header-line ((,c (:foreground ,blue))))

   ;; helm custom faces https://github.com/emacs-helm/helm/blob/4c9f2da8d85a087278b41e934bfecff8e0b04fb6/helm.el
   `(helm-selection ((,c (:background ,grey-00))))
   `(helm-source-header ((,c (:foreground ,cyan :line-width: 4 :height 1.2))))
   `(helm-match ((,c (:foreground ,magenta))))
   `(helm-header ((,c (:background ,black :foreground ,white))))
   `(helm-candidate-number ((,c (:background nil :foreground ,magenta))))
   `(helm-action ((,c (:foreground ,cyan))))

   `(org-document-title ((,c (:foreground ,magenta))))
   `(org-document-info ((,c (:foreground ,magenta))))
   `(org-document-info-keyword ((,c (:foreground ,grey :slant italic))))

   `(org-level-1 ((,c (:foreground ,magenta))))
   `(org-level-2 ((,c (:foreground ,magenta))))
   `(org-level-3 ((,c (:foreground ,magenta))))
   `(org-level-4 ((,c (:foreground ,magenta))))
   `(org-level-5 ((,c (:foreground ,magenta))))
   `(org-level-6 ((,c (:foreground ,magenta))))
   `(org-level-7 ((,c (:foreground ,magenta))))
   `(org-level-8 ((,c (:foreground ,magenta))))
   `(org-block ((,c (:foreground ,white ))))
   `(org-verbatim ((,c (:foreground ,white ))))

   ;; eshell
   `(eshell-prompt ((,c (:foreground ,magenta :weight bold))))
   `(eshell-ls-archive ((,c (:foreground ,magenta))))
   `(eshell-ls-clutter ((,c (:foreground ,red))))
   `(eshell-ls-directory ((,c (:foreground ,blue))))
   `(eshell-ls-executable ((,c (:foreground ,green))))
   `(eshell-ls-missing ((,c (:foreground ,red))))
   `(eshell-ls-symlink ((,c (:foreground ,cyan))))
   ;; (eshell-ls-backup     :foreground yellow)
   ;; (eshell-ls-product    :foreground orange)
   ;; (eshell-ls-readonly   :foreground orange)
   ;; (eshell-ls-special    :foreground violet)
   ;; (eshell-ls-unreadable :foreground base5)

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'argon)

;;; argon-theme.el ends here
