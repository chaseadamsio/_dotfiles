(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

;; auto-install use-package. SRC: http://cachestocaches.com/2015/8/getting-started-use-package/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package homebrew-mode :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-org
  :ensure t
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode
	    (lambda() (
		       evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package exec-path-from-shell :ensure t)

(use-package fiplr :ensure t)

(use-package fzf :ensure t)

(use-package flycheck :ensure t)

(use-package lua-mode :ensure t)
(use-package python-mode :ensure t)

(use-package go-mode
  :ensure t
  :init
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet"))
  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook (lambda ()
			    (set (make-local-variable 'company-backends) '(company-go))
			    (company-mode)))
  )

(use-package ivy :ensure t)
(use-package smex :ensure t)
(use-package counsel :ensure t :after (ivy smex))
(use-package counsel-projectile :ensure t :after (counsel))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  :init
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))

(use-package nlinum
  :ensure t
  :config
  (nlinum-mode 1)
  :init
  (add-hook 'prog-mode-hook 'nlinum-mode)
  (setq linum-format "4d \u2502 "))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode))

(use-package magit :ensure t)
(use-package undo-tree
  :ensure t
  :after evil)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package rainbow-mode
  :ensure t
  :init
  (rainbow-mode 1))

;; https://github.com/noctuid/general.el
(use-package general
  :ensure t
  :init
  (general-define-key :prefix "SPC"
		      :keymaps 'normal
		      ;; unbind SPC and give it a title for which-key (see echo area)
		      "" '(nil :which-key "my lieutenant general prefix")
		      "p" '(counsel-projectile-switch-project :which-key "switch project"))
  )

;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay .3)
  ) 

(use-package toml-mode :ensure t)

(use-package markdown-mode :ensure t)

(use-package ob-http :ensure t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((http       . t)
   (sh      . t)
   (js         . t)
   (emacs-lisp . t)
   (python . t)
   ))

;;(use-package multiple-cursors :ensure t)

;; misc
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1))

(setq ring-bell-function 'ignore) ;; the bell annoys the h*ck out of me, turn it off
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(add-hook 'prog-mode-hook 'electric-pair-local-mode)

(show-paren-mode 1)

(set-face-attribute 'default nil :family "Fira Mono" :height 120)

(setq-default line-spacing 4)

(setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "chromium-browser")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)

(add-hook 'prog-mode-hook '(lambda ()
    (setq truncate-lines t
          word-wrap nil)))

(add-hook 'text-mode-hook '(lambda ()
    (setq truncate-lines nil
          word-wrap t)))

(add-to-list 'load-path "~/.emacs.d/argon.el")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'argon t)


(global-hl-line-mode 1)

;; eshell
(setq eshell-prompt-function
  (lambda nil
    (concat
     (propertize "λ " 'face `(:foreground "#C7C8FF"))
     (propertize (eshell/pwd) 'face `(:foreground "#67DCF9"))
     " "
     )))

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(defalias 'yes-or-no-p 'y-or-n-p)

;;(setq mode-line-format (list "   %m" "   " "%b")) 
(setq org-src-fontify-natively t)

(use-package diminish
  :ensure t
  :config
  (diminish 'company-mode)
  (diminish 'projectile-mode)
  (diminish 'undo-tree-mode)
  (diminish 'which-key-mode)
  (diminish 'evil-org-mode)
  (diminish 'rainbow-mode)
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("80c53a5fb8b3d9996d109dec9bb34aa1188fcb482831c54d5fccbcabe2abce56" "8a18ded397d870a0cc71ce728fda00be7dd782ae0c022f202b780fe622f4ed4d" "8f306c528fa72c9055484a966eb809e900c0db51ae329319eff97fe8e7d4a725" "2c41713ab209c0b27d17ac519e40348e216468b870c0b3e92192a32ba050026a" "b2e373770e2915f308bbe309c79b13f5df9e2f0d6eb6533f4a6710585d115c07" "7d98d6dcd44f4b43764a333beb6775a354d51564880fc51dad42506523516d06" "618dcdba1ccb0a7be7749c28f7744f9979b1e328bdab333e8c78a601b90ac2e0" "0cdc405cd95da3689bfc21928258c7d5df4fb1958e310388c9ba36fc8f76f369" "bc54b0856f833056ef55e3155b75ed099c1874d2fa87ebf73df7a2c306695da4" "d5df89a58bb4fa03131c9e2b9c4c731c9660caace74c38a0277c2da60eb82666" "e97ade8edf11d2e07d1deb5d31f143334a59101560a9249823e49a4b3955148d" "aa0a998c0aa672156f19a1e1a3fb212cdc10338fb50063332a0df1646eb5dfea" "0598de4cc260b7201120b02d580b8e03bd46e5d5350ed4523b297596a25f7403" "22a8982c2827722deba0d54dbc4f95511392979ffbb158b241fdcdbb604262a9" "8c6a201d32cf95a8de853b859d323f8dc9618ebebdeb8aaeea0ced416cd1c038" "d42e984e77728e2d6c7af14f42c6b60c333d352a2bfcb0a2721823335c394084" default)))
 '(package-selected-packages
   (quote
    (homebrew-mode diminish counsel-projectile evil-org-agenda smex ivy-smex counsel ivy which-key general python-mode lua-mode evil-org multiple-cursors ob-http projectile markdown-mode toml-mode flycheck company-mode auto-complete-mode fzf exec-path-from-shell doom-themes doom rainbow-mode rainbow color-theme nlinum magit use-package key-chord go-mode json-mode monokai-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
   
 
