(show-paren-mode t)
(setq column-number-mode t)
(setq line-number-mode t)
(set-face-attribute 'fringe nil :background "black" :foreground "wheat")
;;(set-face-attribute 'fringe nil :background "red")
;;(setq-default left-fringe-width 11)
;;(setq-default right-fringe-width 0)
(setq linum-format "%3d \u2502 ")
(add-hook `find-file-hook (lambda () (linum-mode t)))
(setq delete-auto-save-files t)
(setq inhibit-startup-message t)
(blink-cursor-mode 0)
(add-hook 'emacs-startup-hook
	  (lambda () (delete-other-windows)) t)
;;(require 'crypt++)
(setq load-path (cons "/net/autre/LABRI/ramet/backup/.emacs.d/" load-path))
(load "python-mode")
(global-set-key (kbd "C-c C-e") 'py-execute-region)
;;(standard-display-european t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (whiteboard)))
 '(linum-format "%3d │ ")
 '(ps-use-face-background nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "black" :foreground "wheat" :weight bold))))
 '(linum ((t (:background "black" :foreground "yellow" :weight bold)))))
(put 'upcase-region 'disabled nil)
(set-background-color "#FFFFFF")
