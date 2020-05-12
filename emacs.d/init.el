(defun caio-setup-package-archives ()
  (setq package-enable-at-startup nil)
  (setq package-archives
	'(
	  ("elpa" . "https://elpa.gnu.org/packages/")
	  ("melpa" . "https://melpa.org/packages/")
	  ("marmalade" .  "http://marmalade-repo.org/packages/")
	  ))
  (package-initialize))
(caio-setup-package-archives)

(defun caio-setup-use-package ()
  "install use-package if it's not installed"
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))
(caio-setup-use-package)

(defun caio-setup-theme ()
  (use-package doom-themes
    :config
    (load-theme 'doom-outrun-electric t))
  (use-package hlinum
    :ensure t
    :init
    (hlinum-activate))
  (global-display-line-numbers-mode)
  (global-hl-line-mode 1))
(caio-setup-theme)

(defun caio-setup-better-defaults ()
  ;; disable creating backup~ files
  (setq make-backup-files nil)
  ;; disable creating #auto-saved# files
  (setq auto-save-default nil)
  ;; show matching parens
  (show-paren-mode 1)
  ;; auto add closing parens
 (add-hook 'prog-mode-hook 'electric-pair-local-mode)
  ;; don't word wrap lines
  (setq truncate-lines t word-wrap nil)
  ;; detach the UI customization that gets appended to the file every save
  ;; http://emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/
  (setq custom-file (make-temp-file "emacs-custom"))
  ;; disable the bell because it's annoying
  (setq ring-bell-function 'ignore))
(caio-setup-better-defaults)

(defun caio-pkg-evil ()
  "modal editing is a lot more intuitive for me"
  (use-package evil
    :ensure t
    :init
    (evil-mode 1)))
(caio-pkg-evil)

(defun caio-pkg-magit ()
  "interact with git"
  (use-package magit
    :ensure t
    :after '(evil magit)))
(caio-pkg-magit)

;;; begin language packages
(defun caio-pkg-markdown ()
  (use-package markdown-mode
    :ensure t
    :commands (markdown-mode gfm-mode)
    :init (setq markdown-command "multimarkdown")))
(caio-pkg-markdown)

(defun caio-pkg-lua ()
  (use-package lua-mode
    :ensure t))
(caio-pkg-lua)

(defun caio-pkg-json ()
  (use-package json-mode
    :ensure t))
(caio-pkg-json)

(defun caio-pkg-hcl ()
  (use-package hcl-mode
    :ensure t))
(caio-pkg-hcl)

(defun caio-pkg-dockerfile ()
  (use-package dockerfile-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("Dockerfile-?.+\\'" . dockerfile-mode))))
(caio-pkg-dockerfile)

(defun caio-pkg-yaml ()
  (use-package yaml-mode
    :ensure t))
(caio-pkg-yaml)

(defun caio-pkg-toml ()
  (use-package toml-mode
    :ensure t))
(caio-pkg-toml)

(defun caio-pkg-rust ()
  (use-package rust-mode
    :ensure t))
(caio-pkg-rust)

(defun caio-pkg-go ()
  (use-package go-mode
    :ensure t))
(caio-pkg-go)

(defun caio-pkg-ruby ()
  (use-package ruby-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("Brewfile" . ruby-mode))))
(caio-pkg-ruby)

(defun caio-pkg-jsx ()
  (use-package rjsx-mode
    :ensure t
    :mode "\\.js\\'"))
(caio-pkg-jsx)

(defun caio-setup-hl-todo ()
  (use-package hl-todo
    :ensure t
    :config
    (hl-todo-mode 1)
    (setq hl-todo-keyword-faces
    '(("TODO"   . "#e61f44")) ;; https://github.com/hlissner/emacs-doom-themes/blob/master/themes/doom-outrun-electric-theme.el#L51
    )))
(caio-setup-hl-todo)

(defun caio-setup-js ()
  (use-package add-node-modules-path
    :ensure t
    :config
    (add-hook 'json-mode-hook 'add-node-modules-path)
    (add-hook 'markdown-mode-hook 'add-node-modules-path)
    (add-hook 'web-mode-hook 'add-node-modules-path)
    (add-hook 'js-mode-hook 'add-node-modules-path))
    ;; TODO: get eslint --fix working with this (quotes should update to backticks)
  (use-package prettier-js
    :ensure t
    :after (rjsx-mode)
    :hook (rjsx-mode . prettier-js-mode))
  (use-package flow-minor-mode
    :ensure t
    :config
    (add-hook 'js2-mode-hook 'flow-minor-enable-automatically)
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'company-flow))))
(caio-setup-js)


(defun caio-setup-tide ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  
(defun caio-pkg-tide ()
  (use-package tide
    :ensure t
    :after (rjsx-mode company flycheck)
    :hook (rjsx-mode . caio-setup-tide)))
;;(caio-pkg-tide) ;; disabled because I don't know that I get much from tide for JS right now

(defun my-mmm-markdown-auto-class (lang &optional submode)
  "Define a mmm-mode class for LANG in `markdown-mode' using SUBMODE.
If SUBMODE is not provided, use `LANG-mode' by default."
  (let ((class (intern (concat "markdown-" lang)))
	(submode (or submode (intern (concat lang "-mode"))))
	(front (concat "^```" lang "[\n\r]+"))
	(back "^```"))
    (mmm-add-classes (list (list class :submode submode :front front :back back)))
    (mmm-add-mode-ext-class 'markdown-mode nil class)))

(defun caio-pkg-mmm ()
  "mmm is required for vue"
  (use-package mmm-mode
    :ensure t
    :config
    ;; Mode names that derive directly from the language name
    (mapc 'my-mmm-markdown-auto-class
	  '("awk" "css" "html" "lisp" "makefile"
	    "markdown" "python" "go" "ruby" "xml" "json" "yaml" "js"))
    (setq mmm-parse-when-idle 't)))
(caio-pkg-mmm)

(defun caio-pkg-vue ()
  (use-package vue-mode
    :ensure t))
(caio-pkg-vue)

(defun caio-pkg-k8s ()
  (use-package k8s-mode
    :ensure t))
(caio-pkg-k8s)

(defun caio-pkg-terraform ()
    (use-package terraform-mode
      :ensure t))
(caio-pkg-terraform)

(defun caio-pkg-hcl ()
    (use-package hcl-mode
      :ensure t))
(caio-pkg-hcl)

;;; end language packages

(defun caio-setup-arduino ()
  (use-package arduino-mode
    :ensure t))
(caio-setup-arduino)

(defun caio-setup-flycheck ()
  (use-package flycheck
    :ensure t
    :init
    (global-flycheck-mode)
    ))
(caio-setup-flycheck)

(defun caio-setup-modeline ()
  (use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  ))
(caio-setup-modeline)

(defun caio-setup-ui ()
  (fset 'yes-or-no-p 'y-or-n-p)
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  )
(caio-setup-ui)

(defun caio-setup-keybindings ()
  ;; bind escape to keyboard escape (so I don't have to gg when in the mini-buffer, acts more like vim
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit))
(caio-setup-keybindings)

(defun caio-setup-ivy ()
  (use-package ivy
    :ensure t
    :config
    (ivy-mode 1))
  (use-package counsel
    :ensure t
    :config
    (counsel-mode 1)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)))
(caio-setup-ivy)

(defun caio-setup-company ()
  (use-package company
    :ensure t
    :init
    (add-hook 'after-init-hook 'global-company-mode)))
(caio-setup-company)

(defun caio-setup-ripgrep ()
  (use-package rg
    :ensure t))
(caio-setup-ripgrep)

(defun caio-setup-gitignore ()
  (use-package gitignore-mode
    :ensure t))
(caio-setup-gitignore)

(defun caio-setup-projectile ()
  (use-package projectile
    :ensure t)

  (use-package counsel-projectile
    :ensure t
    :config
    (counsel-projectile-mode 1)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)))
(caio-setup-projectile)

