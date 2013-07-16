;;-----------------------------------------------------------------------------
;; Emacs config
;; ------------
;; Author: Qiushan Tao
;; Date: 2012.10.30
;; When Emacs is started, it normally tries to load a Lisp program from an initialization file, 
;; using the filenames ~/.emacs, ~/.emacs.el, or ~/.emacs.d/init.el; 
;; You can use the command line switch ‘-q’ to prevent loading your init file, 
;; and ‘-u’ (or ‘--user’) to specify a different user's init file.
;; There can also be a default init file, which is the library named default.el, 
;; If this library exists, it is loaded whenever you start Emacs (except when you specify ‘-q’). 
;; But your init file, if any, is loaded first; if it sets inhibit-default-init non-nil, 
;; then default is not loaded. 
;; 
;; Your site may also have a site startup file; this is named site-start.el, 
;; if it exists. Like default.el.
;; Emacs loads this library before it loads your init file. 
;; To inhibit loading of this library, use the option ‘--no-site-file’. 
;; We recommend against using site-start.el for changes that some users may not like. 
;; It is better to put them in default.el, so that users can more easily override them. 
;; 
;;-----------------------------------------------------------------------------

;; 一打开就起用 text 模式。
(setq initial-major-mode 'text-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(transient-mark-mode t)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 自动换行
;; (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 
;; 设置自动换行模式
(setq-default truncate-lines nil)

;;括号自动配对
(defun my-common-mode-auto-pair ())

;;系统本身内置的智能自动补全括号
(electric-pair-mode t)

;;;
;;; Use Aspell for spell checking
;;;
(setq-default ispell-program-name "D:/Emacs/aspell/bin/aspell.exe")

;; RORG-MODE 
;; Org - Babel: Configure active languages
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . nil)
   (sh . nil)
   (perl . t)
   (python .t)
   ))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
 
   
;;;
;;; AUCTeX
;;;
;; We assume that MiKTeX (http://www.miktek.org) is used for
;; TeX/LaTeX. Otherwise, change the (require ...) line as per the
;; AUCTeX documentation.
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(require 'tex-mik)

;;; ESS
;;;
;; Load ESS and activate the nifty feature showing function arguments
;; in the minibuffer until the call is closed with ')'.
(require 'ess-site)

;; Path to R executable.
(setq-default inferior-R-program-name
              "D:/R/bin/i386/rterm.exe")
;; 设置set-buffer-process-coding-system，这样就能正确使用中文了.
(add-hook 'ess-post-run-hook (function (lambda ()
(set-buffer-process-coding-system 'cn-gb-2312 'cn-gb-2312))))

;; 默认显示 80列就换行
(setq default-fill-column 80)

;; 去掉工具栏
(tool-bar-mode nil)

;;去掉菜单栏
;; (menu-bar-mode nil)

;; 去掉滚动栏
;;(scroll-bar-mode nil)

;; 设置字体
;; 方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
(set-default-font "Courier New-14")

; emacs极少数中文显示为方框的问题
(set-fontset-font "fontset-default"
    'unicode '("微软雅黑" . "unicode-bmp"))

;; 显示列号
;;(setq column-number-mode t)
;;(setq line-number-mode t)
;;显示行号
;(global-linum-mode t)

;;;;;---------------------------------------------------------------------------------------------
;;;
;;; 如果是 Emacs 22.3/Windows, 第一行请设为 Chinese-GB, 后面两行请设为 euc-cn;
;;; 如果是 Emacs 22.3/Linux, 第一行请设为 Chinese-GB, 后面两行请设为 utf-8;
;;; 如果是 Emacs 23.1/Windows 及更新的版本, 第一行建议设为 UTF-8 (设为 Chinese-GB 也行）,
;;;        后面两行请设为 euc-cn;
;;; 如果是 Emacs 23.1/Linux 及更新的版本, 第一行建议设为 UTF-8 (设为 Chinese-GB 也行）,
;;;        后面两行请设为 utf-8;
(set-language-environment 'UTF-8)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)

;;-----------------------------------------------------------------------------
;; color themes
;; ------------
;; Source: http://www.emacswiki.org/cgi-bin/wiki/ColorTheme
;; Usage:  M-x color-theme-select RET
;;-----------------------------------------------------------------------------
(require 'color-theme)
(color-theme-initialize)
(color-theme-hober)
;(color-theme-tty-dark)
;;; 其它适合R的主题配色名称
;;; billw, black, dark-laptop, hober, lethe, taylor, tty-dark

;; load htmlize.el , which org-babel export syntax highlight source code need it
(require 'htmlize)


;; 在你的*.org文件中添加
;; #+LATEX_HEADER: \usepackage[UTF8,noindent]{ctex}
;; emacs中添加这段，将原有编译使用latex换成xelatex
(setq texcmd "xelatex %f")

;; Gnuplot mode
;;(require 'gnuplot-mode)
;; specify the gnuplot executable (if other than /usr/bin/gnuplot)
;;(setq gnuplot-program "D:/Apps/gnuplot/bin/gnuplot.exe")
;; automatically open files ending with .gp or .gnuplot in gnuplot mode
;;(setq auto-mode-alist 
;;  (append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))

(require 'gnuplot)
(if window-system
    (progn
      (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
      (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
      (setq auto-mode-alist ( append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))
      (if (eq system-type 'windows-nt)
          (progn
            (add-hook 'gnuplot-load-hook
                      '(lambda ()
                         (setq gnuplot-program
                               "D:/Apps/gnuplot/bin/gnuplot.exe"))) 
            (setq gnuplot-program-version 4.6)
            (setq gnuplot-echo-command-line-flag nil)))))

(add-hook 'org-mode-hook 
          (lambda ()
           (local-set-key "\M-\C-g" 'org-plot/gnuplot)
))

;; load htmlize.el , which org-babel export syntax highlight source code need it
(require 'htmlize)
;; org-mode project define
(setq org-publish-project-alist
      '(
        ("org-blog-content" ;; 博客内容
         ;; Path to your org files.
         :base-directory "d:/org/org/"
         :base-extension "org"
         ;; Path to your public_html project.
         :publishing-directory "d:/org/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :table-of-contents t ;; 导出目录
         ;; :body-only t ;; Only export section between <body></body>
         )
        ("org-blog-static" ;; 静态文件
         :base-directory "d:/org/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php\\|svg"
         :publishing-directory "d:/org/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("org-blog-content" "org-blog-static"))
        ))
