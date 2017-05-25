(defalias 'yes-or-no-p 'y-or-n-p)
(prefer-coding-system 'utf-8)
(setq system-time-locale "C")
(setq text-quoting-style 'grave)
(setq-default indent-tabs-mode nil)

;; Server
(when (require 'server nil t)
  (unless (server-running-p) (server-start)))

;; Package
(setq package-user-dir (locate-user-emacs-file "vendor")
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . ace-jump-mode)))

(use-package ace-window
  :ensure t
  :bind (("M-p" . ace-window)))

(use-package auto-complete
  :ensure t
  :init (ac-config-default))

(use-package auto-save-buffers-enhanced
  :ensure t
  :init (auto-save-buffers-enhanced t))

(use-package bm
  :ensure t
  :bind (("M-1" . bm-toggle)
         ("M-2" . bm-previous)
         ("M-3" . bm-next)))

(use-package coffee-mode
  :ensure t)

(use-package crontab-mode
  :ensure t)

(use-package direx
  :ensure t
  :bind (("C-x C-j" . direx:jump-to-directory-other-window)))

(use-package dockerfile-mode
  :ensure t)

(use-package e2wm
  :ensure t)

(use-package emmet-mode
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package flycheck-package
  :ensure t)

(use-package flycheck-color-mode-line
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package helm
  :ensure t
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-s" . helm-occur)
         ("C-x ;" . helm-mini)
         ("C-x b" . helm-buffers-list)))

(use-package helm-gtags
  :ensure t
  :bind (:map helm-gtags-mode-map ("C-x g" . helm-gtags-select)))

(use-package helm-projectile
  :ensure t
  :init (projectile-mode))

(use-package helm-swoop
  :ensure t)

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")

(use-package json-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package multi-web-mode
  :ensure t)

(use-package org
  :ensure t)

(use-package origami
  :ensure t
  :bind (("C-c h c" . origami-toggle-node)
         ("C-c h h" . origami-close-node)
         ("C-c h s" . origami-open-node)
         ("C-c h H" . origami-close-all-nodes)
         ("C-c h S" . origami-open-all-nodes)))

(use-package plantuml-mode
  :ensure t
  :init
  (setq plantuml-jar-path "~/bin/plantuml.jar"))

(use-package php-eldoc
  :ensure t)

(use-package php-mode
  :ensure t
  :init
  (setq php-mode-coding-style 'psr2))

(use-package popwin
  :ensure t
  :config (popwin-mode 1)
  (push '(direx:direx-mode :position left :width 50 :dedicated t)
        popwin:special-display-config))

(use-package protobuf-mode
  :ensure t)

(use-package scss-mode
  :ensure t)

(use-package tumblesocks
  :ensure t
  :init (setq oauth-nonce-function 'oauth-internal-make-nonce))

(use-package web-mode
  :ensure t)

(use-package yagist
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package git-timemachine
  :ensure t)

;; Customize
(setq custom-file (locate-user-emacs-file "customize.el"))
(load custom-file t)

;;
(defun xcezx/make-scratch-buffer (&optional arg)
  "ARG is boolean."
  (set-buffer (get-buffer-create "*scratch*"))
  (funcall initial-major-mode)
  (erase-buffer)
  (when initial-scratch-message (insert initial-scratch-message))
  (when arg (switch-to-buffer "*scratch*"))
  (message "*scratch* is created.")
  nil)

;;
(defun xcezx/make-scratch-buffer-on-kill-buffer-query-functions ()
  (if (string= "*scratch*" (buffer-name))
      (xcezx/make-scratch-buffer t)
    t))
(add-hook 'kill-buffer-query-functions 'xcezx/make-scratch-buffer-on-kill-buffer-query-functions)

(defun xcezx/make-scratch-buffer-on-after-save-hook ()
  (unless (member "*scratch*" (mapcar 'buffer-name (buffer-list)))
    (xcezx/make-scratch-buffer)))
(add-hook 'after-save-hook 'xcezx/make-scratch-buffer-on-after-save-hook)

;;
(defun xcezx/make-messages-buffer ()
  (set-buffer (get-buffer-create "*Messages*"))
  (fundamental-mode)
  (erase-buffer)
  (message "*Messages* is created.")
  nil)
(defun xcezx/make-messages-buffer-on-kill-buffer-query-functions ()
  (if (string= "*Messages*" (buffer-name))
      (xcezx/make-messages-buffer)
    t))
(add-hook 'kill-buffer-query-functions 'xcezx/make-messages-buffer-on-kill-buffer-query-functions)

;;
(defun kill-region-or-backward-kill-word (arg)
  (interactive "p")
  (if mark-active
      (call-interactively 'kill-region)
    (backward-kill-word arg)))
(define-key global-map (kbd "C-w") 'kill-region-or-backward-kill-word)

(define-key global-map (kbd "C-x ,") (lambda () (interactive) (find-file user-init-file)))
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'dabbrev-expand)
(define-key global-map (kbd "C-x .") (lambda () (interactive) (eval-current-buffer) (message "Evaluated current buffer")))
(define-key global-map (kbd "C-c C-a") 'align-regexp)
(define-key global-map (kbd "C-x C-b") 'electric-buffer-list)
(define-key global-map (kbd "C-x C-d") 'dired-jump-other-window)
(define-key global-map (kbd "C-x p") (lambda () (interactive) (other-window -1)))
(define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)

(defadvice move-beginning-of-line (around adviced-beginning-of-line (arg) activate)
  (if (bolp)
      (back-to-indentation)
    ad-do-it))

(defadvice beginning-of-visual-line (around adviced-beginning-of-visual-line (&optional N) activate)
  (if (bolp)
      (back-to-indentation)
    ad-do-it))

(defadvice after-find-file (before adviced-after-find-file activate)
  "Make the directory containing the visited file."
  (make-directory (file-name-directory (buffer-file-name)) t))

(defun xcezx/hs-config ()
  (define-key hs-minor-mode-map (kbd "C-c h c") 'hs-toggle-hiding)
  (define-key hs-minor-mode-map (kbd "C-c h h") 'hs-hide-block)
  (define-key hs-minor-mode-map (kbd "C-c h s") 'hs-show-block)
  (define-key hs-minor-mode-map (kbd "C-c h H") 'hs-hide-all)
  (define-key hs-minor-mode-map (kbd "C-c h S") 'hs-show-all)
  (define-key hs-minor-mode-map (kbd "C-c h l") 'hs-hide-level))

(when (require 'wdired nil t)
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))

;;; @FIXME
(add-hook 'makefile-mode-hook
          (function (lambda ()
                      (fset 'makefile-warn-suspicious-lines 'ignore))))

(defun xcezx/php-enable-psr2-coding-style (f &rest args)
  (apply f args)
  (remove-hook 'before-save-hook 'delete-trailing-whitespace t))
(advice-add 'php-enable-psr2-coding-style :around #'xcezx/php-enable-psr2-coding-style)

;;; init.el ends here.
