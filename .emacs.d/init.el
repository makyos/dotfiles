;;;; <C-x> <RET> <f> 
;;;;



(global-font-lock-mode t)

;;;; LANG
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


;;;; PACKAGE
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;; (require 'melpa)

;;;; DISP(APP)
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(line-number-mode t) (column-number-mode t)
(set-scroll-bar-mode nil)

;;;; TRUNCATE
(setq-default truncate-lines 0)

;;;; LINE NUMBER
;; (global-linum-mode t)
;; (setq linum-format "%4d: ")

;;;; HILIGHT-LINE
;; (global-hl-line-mode)
;; ;; (custom-set-faces '(hl-line ((t (:background "gainsboro")))))
;; (custom-set-faces '(hl-line ((t (:background "gray70")))))



;;;; (){}[]
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq skeleton-pair 1)


;;;; THEME
;; (load-theme 'deeper-blue t)
;; (load-theme 'misterioso t)


;;;; SCROLL
(setq scroll-conservatively 44) (setq scroll-margin 5)

;;;; SEARCH
(setq completion-ignore-case t)

;;;; AUTOSAVE
(setq auto-save-default nil)
(setq make-backup-files nil)

;;;; BELL
(setq visible-bell t)
(setq kill-whole-line t)

;;;; GLOBAL SET KEY
(global-set-key "\C-z" 'undo)
(global-set-key "\C-t" 'other-window)
(global-set-key "\C-cp" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key "\C-cm" (lambda () (interactive) (find-file "~/memo/memo.md")))
(global-set-key "\C-cs" (lambda () (interactive) (switch-to-buffer "*scratch*")))
(global-set-key "\C-x9" 'follow-delete-other-windows-and-split)



(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("www" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\'"  . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'"  . web-mode))



;;;; C-a to col 0 & line head
(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)    
    (beginning-of-line)))
(global-set-key "\C-a" 'my-move-beginning-of-line)



;;;; SHELL MODE
(setq shell-mode-hook
      (function (lambda ()
                  (define-key shell-mode-map [up] 'comint-previous-input)
                  (define-key shell-mode-map [down] 'comint-next-input))))

(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color^for-comint-mode'to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;;;; GAUCHE
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(defun scheme-other-window ()
  "Run Gauche on other window"
  (interactive)
  (split-window-horizontally (/ (frame-width) 2))
  (let ((buf-name (buffer-name (current-buffer))))
    (scheme-mode)
    (switch-to-buffer-other-window
     (get-buffer-create "*scheme*"))
    (run-scheme scheme-program-name)
    (switch-to-buffer-other-window
     (get-buffer-create buf-name))))
(define-key global-map
  "\C-cg" 'scheme-other-window)


;;;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t)))


;;;; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

;;;; indent-guide
;; (indent-guide-global-mode)

;;;; magit
(require 'magit)
