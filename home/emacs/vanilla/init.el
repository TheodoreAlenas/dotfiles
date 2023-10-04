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
   '("e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default))
 '(elfeed-feeds '("https://www.di.uoa.gr/rss.xml"))
 '(git-gutter:added-sign "║")
 '(git-gutter:deleted-sign "_")
 '(git-gutter:modified-sign "│")
 '(git-gutter:update-interval 0.2)
 '(org-agenda-files '("/home/aleena/code/emacs/test.org"))
 '(package-selected-packages
   '(evil marginalia slime editorconfig elfeed magit vertico material-theme git-gutter eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)
