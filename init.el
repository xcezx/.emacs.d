(require 'cl)

;; Package
(setq package-user-dir (locate-user-emacs-file "vendor")
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'package+)
  (package-refresh-contents)
  (package-install 'package+))
(package-manifest
 'ace-jump-mode
 'ace-window
 'auto-complete
 'auto-save-buffers-enhanced
 'bm
 'coffee-mode
 'coffee-mode
 'crontab-mode
 'direx
 'dockerfile-mode
 'e2wm
 'emmet-mode
 'flycheck
 'flycheck-package
 'flycheck-color-mode-line
 'go-mode
 'groovy-mode
 'hcl-mode
 'helm
 'helm-gtags
 'helm-projectile
 'helm-swoop
 'js2-mode
 'json-mode
 'magit
 'markdown-mode
 'multi-web-mode
 'org
 'package+
 'php-eldoc
 'php-mode
 'popwin
 'protobuf-mode
 'scss-mode
 'theme-darktooth
 'tumblesocks
 'web-mode
 'yagist
 'yaml-mode
 )


;; Server
(when (require 'server nil t)
  (unless (server-running-p) (server-start)))

;; Customize
(setq custom-file (locate-user-emacs-file "customize.el"))
(load custom-file t)


(prefer-coding-system 'utf-8)
(setq system-time-locale "C")
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)

(defun xcezx/make-scratch-buffer (&optional arg)
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
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "M-p") 'ace-window)
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

;; 
(ac-config-default)

(auto-save-buffers-enhanced t)

(helm-mode 1)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-s") 'helm-occur)
(define-key global-map (kbd "C-x ;") 'helm-mini)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)

(defun xcezx/helm-gtags-mode-hook ()
  (define-key helm-gtags-mode-map (kbd "C-x g") 'helm-gtags-select))
(add-hook 'helm-gtags-mode-hook 'xcezx/helm-gtags-mode-hook)

(define-key global-map (kbd "M-1") 'bm-toggle)
(define-key global-map (kbd "M-2") 'bm-previous)
(define-key global-map (kbd "M-3") 'bm-next)

(when (require 'popwin nil t)
  (popwin-mode 1)
  (push '(direx:direx-mode :position left :width 50 :dedicated t)
        popwin:special-display-config))
(define-key global-map (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

(when (require 'js2-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;;; @FIXME
(add-hook 'makefile-mode-hook
          (function (lambda ()
                      (fset 'makefile-warn-suspicious-lines 'ignore))))

(defun xcezx/php-enable-psr2-coding-style (f &rest args)
  (apply f args)
  (remove-hook 'before-save-hook 'delete-trailing-whitespace t))
(advice-add 'php-enable-psr2-coding-style :around #'xcezx/php-enable-psr2-coding-style)

;;; for tumblesocks
(when (require 'tumblesocks nil t)
  (setq oauth-nonce-function 'oauth-internal-make-nonce))


;;; init.el ends here
