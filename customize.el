(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ad-redefinition-action (quote accept))
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
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
 '(global-auto-revert-mode t)
 '(history-delete-duplicates t)
 '(hs-minor-mode-hook (quote (xcezx/hs-config)))
 '(html-mode-hook (quote (emmet-mode)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(js2-init-hook (quote (hs-minor-mode)))
 '(kill-do-not-save-duplicates t)
 '(kill-whole-line t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(multi-web-global-mode t nil (multi-web-mode))
 '(package-selected-packages
   (quote
    (docker-compose-mode git-timemachine yaml-mode yagist web-mode tumblesocks scss-mode protobuf-mode popwin php-mode php-eldoc plantuml-mode origami multi-web-mode markdown-mode magit json-mode js2-mode helm-swoop helm-projectile helm-gtags helm go-mode flycheck-color-mode-line flycheck-package flycheck emmet-mode e2wm dockerfile-mode direx crontab-mode coffee-mode bm auto-save-buffers-enhanced auto-complete ace-window ace-jump-mode use-package)))
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
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
 '(yaml-mode-hook (quote (yaml-set-imenu-generic-expression origami-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :background "brightblack" :foreground "green"))))
 '(diff-removed ((t (:background "brightblack" :foreground "red"))))
 '(mode-line ((t (:background "black" :foreground "red")))))
