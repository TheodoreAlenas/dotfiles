;; License at the bottom

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'aleena
   `(default ((,class (:background "#102834" :foreground "#f8f8f8"))))
   `(cursor ((,class (:background "#656565"))))
   ;; Highlighting faces
   `(fringe ((,class (:background "#303030"))))
   `(highlight ((,class (:background "#454545" :foreground "#ffffff"
			 :underline t))))
   `(region ((,class (:background "#444444"))))
   `(secondary-selection ((,class (:background "#333366" :foreground "#f6f3e8"))))
   `(isearch ((,class (:background "#343434" :foreground "#857b6f"))))
   `(lazy-highlight ((,class (:background "#384048" :foreground "#a0a8b0"))))
   ;; Mode line faces
   `(mode-line ((,class (:background "#444444" :foreground "#f6f3e8"))))
   `(mode-line-inactive ((,class (:background "#444444" :foreground "#857b6f"))))
   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:foreground "#e5786d"))))
   `(escape-glyph ((,class (:foreground "#ddaa6f" :weight bold))))
   `(homoglyph ((,class (:foreground "#ddaa6f" :weight bold))))
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground "#e5786d"))))
   `(font-lock-comment-face ((,class (:foreground "#99968b"))))
   `(font-lock-constant-face ((,class (:foreground "#e5786d"))))
   `(font-lock-function-name-face ((,class (:foreground "#cae682"))))
   `(font-lock-keyword-face ((,class (:foreground "#8ac6f2" :weight bold))))
   `(font-lock-string-face ((,class (:foreground "#95e454"))))
   `(font-lock-type-face ((,class (:foreground "#92a65e" :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground "#cae682"))))
   `(font-lock-warning-face ((,class (:foreground "#ccaa8f"))))
   ;; Help faces
   `(help-key-binding ((,class (:background "#333333" :foreground "#f6f3e8"))))
   ;; Button and link faces
   `(link ((,class (:foreground "#8ac6f2" :underline t))))
   `(link-visited ((,class (:foreground "#e5786d" :underline t))))
   `(button ((,class (:background "#333333" :foreground "#f6f3e8"))))
   `(header-line ((,class (:background "#303030" :foreground "#e7f6da"))))
   ;; Gnus faces
   `(gnus-group-news-1 ((,class (:weight bold :foreground "#95e454"))))
   `(gnus-group-news-1-low ((,class (:foreground "#95e454"))))
   `(gnus-group-news-2 ((,class (:weight bold :foreground "#cae682"))))
   `(gnus-group-news-2-low ((,class (:foreground "#cae682"))))
   `(gnus-group-news-3 ((,class (:weight bold :foreground "#ccaa8f"))))
   `(gnus-group-news-3-low ((,class (:foreground "#ccaa8f"))))
   `(gnus-group-news-4 ((,class (:weight bold :foreground "#99968b"))))
   `(gnus-group-news-4-low ((,class (:foreground "#99968b"))))
   `(gnus-group-news-5 ((,class (:weight bold :foreground "#cae682"))))
   `(gnus-group-news-5-low ((,class (:foreground "#cae682"))))
   `(gnus-group-news-low ((,class (:foreground "#99968b"))))
   `(gnus-group-mail-1 ((,class (:weight bold :foreground "#95e454"))))
   `(gnus-group-mail-1-low ((,class (:foreground "#95e454"))))
   `(gnus-group-mail-2 ((,class (:weight bold :foreground "#cae682"))))
   `(gnus-group-mail-2-low ((,class (:foreground "#cae682"))))
   `(gnus-group-mail-3 ((,class (:weight bold :foreground "#ccaa8f"))))
   `(gnus-group-mail-3-low ((,class (:foreground "#ccaa8f"))))
   `(gnus-group-mail-low ((,class (:foreground "#99968b"))))
   `(gnus-header-content ((,class (:foreground "#8ac6f2"))))
   `(gnus-header-from ((,class (:weight bold :foreground "#95e454"))))
   `(gnus-header-subject ((,class (:foreground "#cae682"))))
   `(gnus-header-name ((,class (:foreground "#8ac6f2"))))
   `(gnus-header-newsgroups ((,class (:foreground "#cae682"))))
   ;; Message faces
   `(message-header-name ((,class (:foreground "#8ac6f2" :weight bold))))
   `(message-header-cc ((,class (:foreground "#95e454"))))
   `(message-header-other ((,class (:foreground "#95e454"))))
   `(message-header-subject ((,class (:foreground "#cae682"))))
   `(message-header-to ((,class (:foreground "#cae682"))))
   `(message-cited-text ((,class (:foreground "#99968b"))))
   `(message-separator ((,class (:foreground "#e5786d" :weight bold))))
   ;; ANSI colors
   `(ansi-color-black ((,class (:background "#242424" :foreground "#242424"))))
   `(ansi-color-red ((,class (:background "#b85149" :foreground "#b85149"))))
   `(ansi-color-green ((,class (:background "#92a65e" :foreground "#92a65e"))))
   `(ansi-color-yellow ((,class (:background "#ccaa8f" :foreground "#ccaa8f"))))
   `(ansi-color-blue ((,class (:background "#5b98c2" :foreground "#5b98c2"))))
   `(ansi-color-magenta ((,class (:background "#64619a" :foreground "#64619a"))))
   `(ansi-color-cyan ((,class (:background "#3f9f9e" :foreground "#3f9f9e"))))
   `(ansi-color-white ((,class (:background "#f6f3e8" :foreground "#f6f3e8"))))
   `(ansi-color-bright-black ((,class (:background "#444444" :foreground "#444444"))))
   `(ansi-color-bright-red ((,class (:background "#e5786d" :foreground "#e5786d"))))
   `(ansi-color-bright-green ((,class (:background "#95e454" :foreground "#95e454"))))
   `(ansi-color-bright-yellow ((,class (:background "#edc4a3" :foreground "#edc4a3"))))
   `(ansi-color-bright-blue ((,class (:background "#8ac6f2" :foreground "#8ac6f2"))))
   `(ansi-color-bright-magenta ((,class (:background "#a6a1de" :foreground "#a6a1de"))))
   `(ansi-color-bright-cyan ((,class (:background "#70cecc" :foreground "#70cecc"))))
   `(ansi-color-bright-white ((,class (:background "#ffffff" :foreground "#ffffff"))))))

;; Copyright (c) 2023 Dimakopoulos Theodoros
;; 
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; 
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;; 
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
