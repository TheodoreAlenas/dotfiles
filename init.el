;; tab characters
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(editorconfig-mode)

;; saves
(setq backup-directory-alist `((".*" . "~/.cache/emacs/saves")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/saves" t)))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(set-face-attribute 'default nil :family "Source Code Pro" :height 150)
(set-face-attribute 'fixed-pitch nil :family "Source Code Pro" :height 150)
(set-frame-parameter nil 'alpha-background 99)
(add-to-list 'default-frame-alist '(alpha-background . 99))

;; buffer look
(setq-default show-trailing-whitespace t)
(setq column-number-mode t)
(load-theme 'ef-night t)
(vertico-mode)
(marginalia-mode)
(require 'git-gutter)
(global-git-gutter-mode 1)

;; for dired painted things, you may want to append to
;; dired-font-lock-keywords
;; https://www.emacswiki.org/emacs/dired%2B.el

;; org
(require 'org)
(add-hook 'text-mode-hook #'variable-pitch-mode)
;;(setq org-src-block-faces 'fixed-pitch)
(set-face-attribute 'org-table       nil :inherit 'fixed-pitch)
(set-face-attribute 'org-agenda-date nil :inherit 'fixed-pitch)
(set-face-attribute 'org-date        nil :inherit 'fixed-pitch)
(set-face-attribute 'org-block       nil :inherit 'fixed-pitch)
(custom-set-faces
 '(org-code ((t (:family "Monospace")))))

;; eglot
(setq eglot-confirm-server-initiated-edits nil)
(require 'eglot)
(add-to-list
 'eglot-server-programs
 '(prolog-mode
   "sh" "-c"
   "(echo $0; echo $1) > /tmp/to-swipl && swipl /tmp/to-swipl"
   "?- use_module(library(prolog_lsp))."
   "?- run_stdio_language_server."))

;; Haskell ligatures

(defun al/prepare-for-ligatures ()
  "For Haskell (ligatures are from a package)"
  (set-face-attribute 'default nil :font "Hasklug Nerd Font"))

(use-package haskell-mode :config
  (add-to-list 'haskell-mode-hook 'al/prepare-for-ligatures)
  (add-to-list 'haskell-mode-hook 'ligature-mode))

(setq al/haskell-ligature-strings
      '("<*" "<*>" "<+>" "<$>" "***" "<|" "|>" "<|>" "!!" "||" "==="
        "==>" "<<<" ">>>" "<>" "+++" "<-" "->" "=>" ">>" "<<" ">>="
        "=<<" ".." "..." "::" "-<" ">-" "-<<" ">>-" "++" "/=" "=="))

(use-package ligature :config
  (ligature-set-ligatures '(haskell-mode) al/haskell-ligature-strings))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e8ab68ce371f48623dab9658d7910458e98affec3e09585a39552dbd3fd1ecda" "6c01b5d4faa0f143055e63c9fba8e23e9160f181e54b14b46d56410811edbc9e" "d9c038dc91688c433de8e83709449563ec6475b900a21d7016856035ae4dcd32" "cc0ea29f3e80c5c622cea5fd83686dd36963a9abcde5b21dfe6cee653b67d72f" "454e92bc5f22f690afce91cb6f92a3ccb638c57a89e84c55759fb16dfb2444e4" "f7b6b207d7a6318ea5d33ca2dea51483350d0c26beb986f008d63258b9c112ab" "7021d655cda2ed5476960e166350d6cf9ee8af874216a26bc5457591222bb330" "0d12b08dec64641c5df1a13d2c52ad678f6235a9b1c86041ea457fc1a71651dc" "46325e20421d2b4423cc90db5a35e0a45bd78a6f3e26c52314b189af3cc00733" "2ef84b2c7ad4810912a095993ca8bdf386e1fd7f97842b57aac62dddb2bba211" "ed6e47baf355da248c4de8953058234b82c8f838fc85f570f9fe1700e47b9426" "9b64a681308383067359cf06bfa6a1bc4fa75c5b68182e4d6ba4d1816277d70e" "3454885b915a176dce4b53e35053b7ee0aa9362fb9e934057ac44b6842a97453" "f84dbe5cfa80aa6774c57fef30d76bcdeb71bd0077665fb74f75728c42f5675d" "71acf47cc8cd4158e52ef63a9f8c4d128aa33d6772a0106b5a72757486047e08" "d31c3706f7c1b0520405c796b33f515bc481d2062cbc964f3c36925665999a6d" "65a1a112abd99456167df57ce2cfff42ed137c4f9146e75b2ae9812499689c3a" "69f7e8101867cfac410e88140f8c51b4433b93680901bb0b52014144366a08c8" "88cb0f9c0c11dbb4c26a628d35eb9239d1cf580cfd28e332e654e7f58b4e721b" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default))
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml"))
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "_")
 '(git-gutter:modified-sign "~")
 '(git-gutter:update-interval 0.2)
 '(org-agenda-files '("/home/aleena/code/emacs/test.org"))
 '(package-selected-packages
   '(gptel rust-mode graphviz-dot-mode docker-compose-mode systemd org-babel-eval-in-repl web-mode pdf-tools ef-themes ligature haskell-mode evil marginalia slime editorconfig elfeed magit vertico material-theme git-gutter eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
