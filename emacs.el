;;;; <C-x> <RET> <f> 
;;;;

(setq vc-follow-symlinks t)
(global-font-lock-mode t)

;;;; LANG
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;;; PACKAGE
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
(package-initialize)

;;;; THEME
(load-theme 'tsdh-light t)

;;;; DISP(APP)
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(line-number-mode t) (column-number-mode t)

;;;; TRUNCATE
(setq-default truncate-lines 0)

;;;; TAB
(setq default-tab-width 2)

;;;; LINE NUMBER
;; (global-linum-mode t)
;; (setq linum-format "%4d: ")

;;;; HILIGHT-LINE
(global-hl-line-mode)
;(set-face-background 'hl-line "#000000")

;;;; (){}[]
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq skeleton-pair 1)

;;;; SCROLL
(setq scroll-conservatively 44) (setq scroll-margin 3)

;;;; SEARCH
(setq completion-ignore-case t)

;;;; AUTOSAVE
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)

;;;; SAVE-PLACE
(save-place-mode 1)

;;;; BELL
(setq visible-bell t)
(setq kill-whole-line t)

;;;; GLOBAL SET KEY
(global-set-key "\C-z" 'undo)
(global-set-key "\C-t" 'other-window)
(global-set-key "\C-cp" (lambda () (interactive) (find-file "~/.emacs.el")))
(global-set-key "\C-cm" (lambda () (interactive) (find-file "~/src/memo/memo.md")))
(global-set-key "\C-cs" (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key "\C-x9" 'follow-delete-other-windows-and-split)
(global-set-key "\C-b" 'set-mark-command)

;;;; C-a to col 0 & line head
(defun my-move-beginning-of-line ()
  (interactive) (if (bolp) (back-to-indentation) (beginning-of-line)))
(global-set-key "\C-a" 'my-move-beginning-of-line)


;;;; SHELL MODE
(setq shell-mode-hook
      (function (lambda ()
                  (define-key shell-mode-map [up] 'comint-previous-input)
                  (define-key shell-mode-map [down] 'comint-next-input))))

(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color^for-comint-mode'to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;;; RUST
(add-to-list 'exec-path(expand-file-name "~/.cargo/bin/"))
(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (racer-mode)
	    (flycheck-rust-setup)
	    (flycheck-mode)))

(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook
	  (lambda ()
	    (company-mode)
	    (set (make-variable-buffer-local 'company-idle-delay) 0)
	    (set (make-variable-buffer-local 'company-minimum-prefix-length) 2)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (web-mode svelte-mode racer flycheck-rust company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;; SVELTE
;(require 'svelte-mode)

;;;; WEB
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))
