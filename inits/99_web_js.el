;;; 99_web_js.el --- An init script to configure html/css/js development environment


;;; Commentary:

;; TODO: integrate 'rainbow-mode' to 'sass-mode'


;;; Code:

;; Register to auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.htm$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

;; Register to interpreter-mode-alist
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; Register hook
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'sass-mode-hook 'rainbow-mode)

;; Define custom variables
(custom-set-variables
 ;; Web-mode indent/padding
 '(web-mode-markup-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-style-padding 2)
 '(web-mode-script-padding 2)
 '(web-mode-block-padding 2)

 ;; Web-mode functions
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-css-colorization t)

 ;; Emmet-mode indent/padding
 '(emmet-identation 2)

 ;; Emmet-mode functions
 '(emmet-mode-cursor-between-quotes t)
 '(emmet-self-closing-tag-style " /")

 ;; JS2-mode indent/padding
 '(js2-basic-offset 2)

 ;; JSON-mode indent/padding
 '(js-indent-level 2)
 '(json-reformat:indent-width 2))

(with-eval-after-load 'scss-mode
  ;; Remove flymake support for 'scss-mode'
  (delete '(".+\\.scss$" flymake-scss-init) flymake-allowed-file-name-masks)

  ;; Set flycheck checker for 'scss-mode'
  (setq flycheck-checker 'sass/scss-sass-lint))


;;; 99_web_js.el ends here
