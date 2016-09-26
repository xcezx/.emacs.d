(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.3)
 '(ad-redefinition-action (quote accept))
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("a507b9ca4a605d5256716da70961741b9ef9ec3246041a4eb776102e8df18418" default)))
 '(delete-selection-mode t)
 '(delete-trailing-lines t)
 '(dired-dwim-target t)
 '(dired-isearch-filenames t)
 '(dired-recursive-copies (quote always))
 '(dired-use-ls-dired nil)
 '(electric-pair-mode t)
 '(electric-pair-pairs (quote ((34 . 34))))
 '(emacs-lisp-mode-hook (quote (hs-minor-mode turn-on-eldoc-mode)))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-mode-hook
   (quote
    (flycheck-mode-set-explicitly flycheck-color-mode-line-mode)))
 '(global-auto-revert-mode t)
 '(go-mode-hook (quote (hs-minor-mode)))
 '(helm-buffer-max-length 64)
 '(history-delete-duplicates t)
 '(hs-minor-mode-hook (quote (xcezx/hs-config)))
 '(html-mode-hook (quote (emmet-mode)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 4)
 '(js2-init-hook (quote (hs-minor-mode)))
 '(kill-do-not-save-duplicates t)
 '(kill-whole-line t)
 '(magit-auto-revert-mode nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(multi-web-global-mode t nil (multi-web-mode))
 '(mweb-default-major-mode (quote html-mode))
 '(mweb-filename-extensions (quote ("html" "twig" "tpl" "erb")))
 '(mweb-submode-indent-offset 4)
 '(mweb-tags
   (quote
    ((php-mode "<\\?php\\|<\\?=" "\\?>")
     (js-mode "<script[^>]*>" "</script>")
     (css-mode "<style[^>]*>" "</style>"))))
 '(package-selected-packages
   (quote
    (theme-darktooth yaml-mode yagist web-mode tumblesocks scss-mode protobuf-mode popwin php-mode php-eldoc package+ multi-web-mode magit json-mode js2-mode helm-swoop helm-projectile helm-gtags hcl-mode groovy-mode go-mode flycheck-package flycheck-color-mode-line emmet-mode e2wm dockerfile-mode direx crontab-mode coffee-mode bm auto-save-buffers-enhanced auto-complete ace-window ace-jump-mode)))
 '(php-mode-coding-style (quote psr2))
 '(php-mode-hook (quote (helm-gtags-mode hs-minor-mode flycheck-mode)))
 '(projectile-completion-system (quote helm))
 '(projectile-global-mode t)
 '(read-buffer-completion-ignore-case t)
 '(recentf-mode t)
 '(ruby-deep-indent-paren-style nil)
 '(safe-local-variable-values (quote ((py-indent-offset . 4))))
 '(scroll-bar-mode nil)
 '(sgml-basic-offset 2)
 '(sgml-mode-hook (quote (emmet-mode)))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode t)
 '(split-width-threshold nil)
 '(tumblesocks-blog "xcezx-log.tumblr.com")
 '(tumblesocks-post-default-state "ask")
 '(tumblesocks-token-file "~/Dropbox/Private/tumblr-oauth-token")
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-jump-face-background ((t (:foreground "brightcyan"))))
 '(bm-face ((t (:background "green" :foreground "black"))))
 '(diff-added ((t (:inherit diff-changed :background "brightblack" :foreground "green"))))
 '(diff-removed ((t (:background "brightblack" :foreground "red"))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "red" :foreground "yellow" :weight normal))))
 '(helm-selection ((t (:background "brightred" :underline t))))
 '(magit-diff-added-highlight ((t (:inherit diff-added))))
 '(magit-diff-removed-highlight ((t (:inherit diff-removed))))
 '(mode-line ((t (:background "cyan" :foreground "green")))))
