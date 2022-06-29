;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(use-package ligature
  :load-path "~/.emacs.d/ligature.el"
  :config
  ;; Enable the "www" ligature in every possible mjor mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  (global-ligature-mode 't))

(straight-use-package '(nano-theme :type git :host github
                                   :repo "rougier/nano-theme"))
(setq doom-theme 'nano-light)
(setq doom-font (font-spec :family
                           "Iosevka"
                           ;; "Roboto Mono"
                           ;; "Fira Code"
                           :size 18
                           ;; :weight 'light
                           ))

(setq user-full-name "Krivosheev Svyatoslav"
      user-mail-address "svyatoslav.krivosheev@health-samurai.io")

(setq org-directory "~/org/")
(setq display-line-numbers-type t)

;; Maxiimize Emacs frame on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun my/kill-insert ()
  (interactive)
  (sp-kill-sexp)
  (evil-insert 1))

(defun my/kill-insert-hybrid ()
  (interactive)
  (sp-kill-hybrid-sexp 1)
  (evil-insert 1))
(defun clj-insert-persist-scope-macro ()
  (interactive)
  (insert
   "(defmacro persist-scope
              \"Takes local scope vars and defines them in the global scope. Useful for RDD\"
              []
              `(do ~@(map (fn [v] `(def ~v ~v))
                  (keys (cond-> &env (contains? &env :locals) :locals)))))"))
(defun persist-scope ()
  (interactive)
  (let ((beg (point)))
    (clj-insert-persist-scope-macro)
    (cider-eval-region beg (point))
    (delete-region beg (point))
    (insert "(persist-scope)")
    (cider-eval-defun-at-point)
    (delete-region beg (point))))
;; HS
(map! (:localleader
       (:map (clojure-mode-map clojurescript-mode-map)
        "=" #'cider-format-defun
        "+" #'clojure-align
        (:prefix ("e" . "eval")
         "f" #'cider-eval-defun-at-point
         "F" #'cider-insert-defun-in-repl
         ";" #'cider-pprint-eval-last-sexp)
        (:prefix ("i")
         "p" #'cider-inspector-pop))
       (:map (sql-mode-map)
        "e" #'run-sql))
      (:leader
       (:map (clojure-mode-map clojurescript-mode-map emacs-lisp-mode-map)
        (:prefix ("r" . "lisp")
         "t" #'sp-transpose-sexp
         "j" #'paredit-join-sexps
         "c" #'paredit-split-sexp
         "s" #'paredit-split-sexp

         "g" #'er/expand-region
         "d" #'sp-kill-sexp
         "D" #'paredit-kill
         "i" #'my/kill-insert
         "I" #'my/kill-insert-hybrid

         "<" #'paredit-backward-barf-sexp
         ">" #'paredit-backward-slurp-sexp
         "." #'paredit-forward-slurp-sexp
         "," #'paredit-forward-barf-sexp
         "r" #'paredit-raise-sexp
         "w" #'paredit-wrap-sexp
         "(" #'paredit-wrap-round
         "[" #'paredit-wrap-square
         "'" #'paredit-meta-doublequote
         "{" #'paredit-wrap-curly
         "y" #'sp-copy-sexp
         "n" #'sp-clone-sexp
         "v" #'sp-indent-defun
         "l" #'clojure-move-to-let
         "a" #'avy-goto-word-1
         )))

      (:after ivy
       :map ivy-minibuffer-map
       "C-d" #'ivy-switch-buffer-kill))

;; (map! :leader
;;       "SPC" #'fzf-projectile)
;; copy sexp with shift y
(map! :after evil
      :map evil-normal-state-map
      "Y"    #'sp-copy-sexp)

(map! :leader
      (:prefix-map ("p" . "project")
       :desc "Add new project"              "A" #'projectile-add-known-project
       :desc "implementation <-> test"      "a" #'projectile-toggle-between-implementation-and-test))

;; Show Cider in the right side of screen
(after! cider
  (set-popup-rules!
   '(("^\\*cider-repl"
      :side right
      :width 100
      :quit nil
      :ttl nil))))

;; Toggle between unit test and implementation
(map! :leader
      (:prefix-map ("t" . "toggle")
       :desc "implementation <-> test"
       "a" #'projectile-toggle-between-implementation-and-test))

(require 'winum)
(winum-mode)
(map! (:leader
       (:prefix ("w" . "window")
        "1" #'winum-select-window-1
        "2" #'winum-select-window-2
        "3" #'winum-select-window-3
        "4" #'winum-select-window-4)))

(use-package! beacon)
(after! beacon (beacon-mode 1))



(global-evil-colemak-minimal-mode)
(evil-select-search-module 'evil-search-module 'isearch)
;; (add-hook 'magit-mode-hook
;;   (lambda () (evil-colemak-minimal-mode -1)))

(map! (:leader
       "k" #'evil-colemak-minimal-mode))

(setq mode-line-format nil)
(nano-modeline-mode 1)


(require 'hide-mode-line)
(global-hide-mode-line-mode)


(add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1)))

(define-key evil-normal-state-map "x" 'delete-forward-char)     ; delete to the black hole
(define-key evil-normal-state-map "X" 'delete-backward-char)


(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
