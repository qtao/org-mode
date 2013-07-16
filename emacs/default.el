;;-----------------------------------------------------------------------------
;; Emacs config
;; ------------
;; Author: Qiushan Tao
;; Date: 2012.10.30
;; When Emacs is started, it normally tries to load a Lisp program from an initialization file, 
;; using the filenames ~/.emacs, ~/.emacs.el, or ~/.emacs.d/init.el; 
;; You can use the command line switch ��-q�� to prevent loading your init file, 
;; and ��-u�� (or ��--user��) to specify a different user's init file.
;; There can also be a default init file, which is the library named default.el, 
;; If this library exists, it is loaded whenever you start Emacs (except when you specify ��-q��). 
;; But your init file, if any, is loaded first; if it sets inhibit-default-init non-nil, 
;; then default is not loaded. 
;; 
;; Your site may also have a site startup file; this is named site-start.el, 
;; if it exists. Like default.el.
;; Emacs loads this library before it loads your init file. 
;; To inhibit loading of this library, use the option ��--no-site-file��. 
;; We recommend against using site-start.el for changes that some users may not like. 
;; It is better to put them in default.el, so that users can more easily override them. 
;; 
;;-----------------------------------------------------------------------------

;; һ�򿪾����� text ģʽ��
(setq initial-major-mode 'text-mode)

;; �﷨����
(global-font-lock-mode t)

;; �� y/n���� yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; ��ʾ����ƥ��
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; ��ʾʱ�䣬��ʽ����
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

(transient-mark-mode t)

;; ֧��emacs���ⲿ�����ճ��
(setq x-select-enable-clipboard t)

;; �Զ�����
;; (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 
;; �����Զ�����ģʽ
(setq-default truncate-lines nil)

;;�����Զ����
(defun my-common-mode-auto-pair ())

;;ϵͳ�������õ������Զ���ȫ����
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
;; ����set-buffer-process-coding-system������������ȷʹ��������.
(add-hook 'ess-post-run-hook (function (lambda ()
(set-buffer-process-coding-system 'cn-gb-2312 'cn-gb-2312))))

;; Ĭ����ʾ 80�оͻ���
(setq default-fill-column 80)

;; ȥ��������
(tool-bar-mode nil)

;;ȥ���˵���
;; (menu-bar-mode nil)

;; ȥ��������
;;(scroll-bar-mode nil)

;; ��������
;; ����Ϊ: emacs->options->Set Default Font->"M-x describe-font"�鿴��ǰʹ�õ��������ơ������С
(set-default-font "Courier New-14")

; emacs������������ʾΪ���������
(set-fontset-font "fontset-default"
    'unicode '("΢���ź�" . "unicode-bmp"))

;; ��ʾ�к�
;;(setq column-number-mode t)
;;(setq line-number-mode t)
;;��ʾ�к�
;(global-linum-mode t)

;;;;;---------------------------------------------------------------------------------------------
;;;
;;; ����� Emacs 22.3/Windows, ��һ������Ϊ Chinese-GB, ������������Ϊ euc-cn;
;;; ����� Emacs 22.3/Linux, ��һ������Ϊ Chinese-GB, ������������Ϊ utf-8;
;;; ����� Emacs 23.1/Windows �����µİ汾, ��һ�н�����Ϊ UTF-8 (��Ϊ Chinese-GB Ҳ�У�,
;;;        ������������Ϊ euc-cn;
;;; ����� Emacs 23.1/Linux �����µİ汾, ��һ�н�����Ϊ UTF-8 (��Ϊ Chinese-GB Ҳ�У�,
;;;        ������������Ϊ utf-8;
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
;;; �����ʺ�R��������ɫ����
;;; billw, black, dark-laptop, hober, lethe, taylor, tty-dark

;; load htmlize.el , which org-babel export syntax highlight source code need it
(require 'htmlize)


;; �����*.org�ļ������
;; #+LATEX_HEADER: \usepackage[UTF8,noindent]{ctex}
;; emacs�������Σ���ԭ�б���ʹ��latex����xelatex
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
        ("org-blog-content" ;; ��������
         ;; Path to your org files.
         :base-directory "d:/org/org/"
         :base-extension "org"
         ;; Path to your public_html project.
         :publishing-directory "d:/org/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :table-of-contents t ;; ����Ŀ¼
         ;; :body-only t ;; Only export section between <body></body>
         )
        ("org-blog-static" ;; ��̬�ļ�
         :base-directory "d:/org/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php\\|svg"
         :publishing-directory "d:/org/public_html/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("org-blog-content" "org-blog-static"))
        ))
