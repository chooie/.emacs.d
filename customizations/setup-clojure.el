;;;;
;; Clojure
;;;;

;; Enable auto indent
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'aggressive-indent-mode-hook
          (lambda ()
            (local-set-key (kbd "C-j") 'newline)))

;; Enable smartparens for Clojure
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; syntax hilighting for midje
(add-hook 'clojure-mode-hook
          (lambda ()
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))
            (setq clojure-indent-style :always-indent)
            (setq clojure-align-forms-automatically t)))

;;;;
;; Cider
;;;;

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; Don't open repl in buffer upon connect
(setq cider-repl-pop-to-buffer-on-connect nil)

;; When there's a cider error, show its buffer and (DON'T) switch to it
(setq cider-show-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Clear Buffer
(global-set-key (kbd "C-c c") 'cider-repl-clear-buffer)

(setq cider-repl-use-pretty-printing t)

;; enable paredit in your REPL
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)

;; enable smartparens in your REPL
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

;; colorize functions and variables from any namespace
(setq cider-font-lock-dynamically '(macro core function var))

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))

; Suppress prompt to rebuild AST - do so automatically
(setq cljr-warn-on-eval nil)

(defun my-clojure-mode-hook ()
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
