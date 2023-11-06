(load "~/.emacs.d/init/appearance.el")
(load "~/.emacs.d/init/packages.el")
(load "~/.emacs.d/init/defaults.el")
(load "~/.emacs.d/init/al-d.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9b64a681308383067359cf06bfa6a1bc4fa75c5b68182e4d6ba4d1816277d70e" "3454885b915a176dce4b53e35053b7ee0aa9362fb9e934057ac44b6842a97453" "f84dbe5cfa80aa6774c57fef30d76bcdeb71bd0077665fb74f75728c42f5675d" "71acf47cc8cd4158e52ef63a9f8c4d128aa33d6772a0106b5a72757486047e08" "d31c3706f7c1b0520405c796b33f515bc481d2062cbc964f3c36925665999a6d" "65a1a112abd99456167df57ce2cfff42ed137c4f9146e75b2ae9812499689c3a" "69f7e8101867cfac410e88140f8c51b4433b93680901bb0b52014144366a08c8" "88cb0f9c0c11dbb4c26a628d35eb9239d1cf580cfd28e332e654e7f58b4e721b" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default))
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml"))
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "_")
 '(git-gutter:modified-sign "~")
 '(git-gutter:update-interval 0.2)
 '(org-agenda-files '("/home/aleena/code/emacs/test.org"))
 '(package-selected-packages
   '(web-mode pdf-tools ef-themes ligature haskell-mode evil marginalia slime editorconfig elfeed magit vertico material-theme git-gutter eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
