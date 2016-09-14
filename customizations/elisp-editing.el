;; Smartparens
;; (require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook       #'smartparens-strict-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-strict-mode)
;; (add-hook 'ielm-mode-hook             #'smartparens-strict-mode)
;; (add-hook 'lisp-mode-hook             #'smartparens-strict-mode)
;; (add-hook 'lisp-interaction-mode-hook #'smartparens-strict-mode)
;; (add-hook 'scheme-mode-hook           #'smartparens-strict-mode)
;; (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
;; (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
