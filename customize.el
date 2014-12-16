(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.3)
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(column-number-mode t)
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
 '(helm-buffer-max-length 64)
 '(history-delete-duplicates t)
 '(hs-minor-mode-hook (quote (xcezx/hs-config)))
 '(html-mode-hook (quote (emmet-mode)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(kill-do-not-save-duplicates t)
 '(kill-whole-line t)
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
 '(php-mode-coding-style (quote psr2))
 '(php-mode-hook
   (quote
    ((lambda nil
       (remove-hook
        (quote before-save-hook)
        (quote delete-trailing-whitespace)))
     helm-gtags-mode hs-minor-mode)))
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
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "green" :foreground "black"))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :background "red" :foreground "yellow" :weight normal))) t)
 '(helm-selection ((t (:background "brightred" :underline t))))
 '(mode-line ((t (:background "#212931" :foreground "black" :box (:line-width -1 :style released-button))))))
