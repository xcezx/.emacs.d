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
(setq use-package-always-ensure t)

(use-package ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode)))

(use-package ace-window
  :bind (("M-p" . ace-window)))

(use-package auto-complete
  :init (ac-config-default))

(use-package auto-save-buffers-enhanced
  :init (auto-save-buffers-enhanced t))

(use-package bm
  :bind (("M-1" . bm-toggle)
         ("M-2" . bm-previous)
         ("M-3" . bm-next)))

(use-package coffee-mode)

(use-package crontab-mode)

(use-package direx
  :bind (("C-x C-j" . direx:jump-to-directory-other-window)))

(use-package dockerfile-mode)

(use-package e2wm)

(use-package emmet-mode)

(use-package flycheck)

(use-package flycheck-package)

(use-package flycheck-color-mode-line)

(use-package go-mode)

;; (use-package groovy-mode)

;; (use-package hcl-mode)

(use-package helm
  :init (helm-mode 1)
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-s" . helm-occur)
         ("C-x ;" . helm-mini)
         ("C-x b" . helm-buffers-list)))

(use-package helm-gtags
  :bind (:map helm-gtags-mode-map ("C-x g" . helm-gtags-select)))

(use-package helm-projectile
  :init (projectile-mode))

(use-package helm-swoop)

(use-package js2-mode
  :mode "\\.js\\'")

(use-package json-mode)

(use-package magit)

(use-package markdown-mode)

(use-package multi-web-mode)

(use-package org)

(use-package php-eldoc)

(use-package php-mode)

(use-package popwin
  :config (popwin-mode 1)
  (push '(direx:direx-mode :position left :width 50 :dedicated t)
        popwin:special-display-config))

(use-package protobuf-mode)

(use-package scss-mode)

(use-package tumblesocks
  :init (setq oauth-nonce-function 'oauth-internal-make-nonce))

(use-package web-mode)

(use-package yagist)

(use-package yaml-mode)

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
