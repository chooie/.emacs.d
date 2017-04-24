;; javascript / html
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js-mode))
(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)
(setq js-indent-level 2)

(defun next-line-tag ()
  (interactive)
  (newline-and-indent)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c C-j") 'next-line-tag))

(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
