;; C-h k 
;; to see the keybonding of the key you press
;; so we can thought the old keybongding to create new keybongding

;; C-x 1 : to keep current frame, close all the other frames 
;; C-x 0 : to close current frame
;; C-x o : to move to next frame
;; C-x 2 : to split a new frame vertically
;; C-x 3 : to split a new frame horizontally

;; global short cut set

;; 非常方便的编译快捷键
;; (setq compile-command "make -j 3 cd=true d=true")
;; (defun mark-one-key-compile ()
;; "先保存文件，然后编译，不包括测试横须"
;; (interactive)
;; (save-some-buffers t)
;; (compile compile-command))

;; (global-set-key "\C-xcc" 'mark-one-key-compile)

;; (c-set-style "ellemtel")
;; (setq c-default-style "ellemtel" c-basic-offset 2)
;; (setq tab-width 2 indent-tabs-mode nil)
;; (setq indent-tabs-mode t)

;; ;; set the default spilt direction
;; ;; some bad effects!!!
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

(setq default-tab-width 4)
(setq-default indent-tabs-mode  t)
;; M-x eval-buffer
;; we can make the configer effective without restart emacs 
(global-set-key [f1] 'eval-buffer)

;; open shell with other window horizontally
(defun my-open-shell ()
(interactive)

 (split-window-horizontally)
 (other-window 1 )
 (shell)
)

(global-set-key [f2] 'my-open-shell)

;; to roll screen with out moving cursor
(global-set-key [M-down] 'View-scroll-line-forward)
(global-set-key [M-up] 'View-scroll-line-backward)

;; complie setting 
(global-set-key [f5] 'compile)
(setq-default compile-command "make")

;; align region with expression
(global-set-key [(control  ?\;)] 'align-regexp)     
;; increase/decrease the front of emacs word display
(global-set-key [(control ?+)] 'text-scale-increase)
(global-set-key [(control ?-)] 'text-scale-decrease)

(delete-selection-mode t)

;;**********************    android setting    *********************           
(add-to-list 'load-path' "~/.emacs.d/android")
(require 'android-compile)
  (add-hook 'c++-mode-hook 'android-compile)
  (add-hook 'java-mode-hook 'android-compile)
  (global-set-key [f9] 'android-compile)

;;**********************    basic setting    *********************

;;Load_path
(add-to-list 'load-path' "~/.emacs.d/plugins")

;;todo_path
(setq todo-file-do "~/emacs/todo/do")
(setq todo-file-done "~/emacs/todo/done")
(setq todo-file-top "~/emacs/todo/top")

;;Personal information
(setq user-full-name "wujiao")
(setq user-mail-address "wujiao159@gmail.com") 

;;======================    time setting        =====================
;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)

;;时间使用24小时制
(setq display-time-24hr-format t)

;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)

;;时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)

;;时间的变化频率
(setq display-time-interval 10)

;;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t) 
;;----------------------    END    time setting    ---------------------


;;======================    color setting        =====================
;; 指针颜色设置为白色
(set-cursor-color "purple")
;; 鼠标颜色设置为白色
;;(set-mouse-color "white")
;; 设置背景颜色和字体颜色
;;(set-foreground-color "white")
;; (set-background-color "darkblue")
;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
;;(set-face-foreground 'highlight "white")
;; (set-face-background 'highlight "blue")

(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))

;;-------------------------Shell 使用 ansi color-------------
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;----------------------    END    color setting    ---------------------


;;设置emacs启动窗口大小
(setq default-frame-alist 
'((height . 32) (width , 50) (menu-bar-lines . 20) (tool-bar-lines . 0))) 


;;不要生成临时文件
(setq-default make-backup-files nil)

;;设置中文语言环境
;;(set-language-environment 'Chinese-GB)

;;写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
(set-buffer-file-coding-system 'utf-8)

;;新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'utf-8)

;;终端方式的编码方式
(set-terminal-coding-system 'utf-8)

;;键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312) 
(set-keyboard-coding-system 'utf-8) 
    
;;读取或写入文件名的编码方式
(setq file-name-coding-system 'utf-8) 

;;打开就启用 text 模式
(setq default-major-mode 'text-mode)

;;禁用启动信息
(setq inhibit-startup-message t) 

;; 取消自动保存,不太明智
 ;; (auto-save-mode 0)

;;语法高亮
(global-font-lock-mode t) 

;;把这些缺省禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)


;;打开图片显示功能
(auto-image-file-mode t) 

;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿
;;3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3
       scroll-conservatively 10000)

;;关闭烦人的出错时的提示声。
(setq visible-bell t)

;;以 y/n 替代 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;显示行列号
(column-number-mode t) 
;;显示行号
(global-linum-mode 1)
;;显示列号
(setq mouse-yank-at-point t)


;;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西。
(setq kill-ring-max 200)

;;括号匹配时显示另一端的括号，而不是跳过去
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用 的提示。
(setq frame-title-format "emacs@%b")

;;光标显示为一条竖线
;;setq-default cursor-type 'bar

;;使用C-k删除指针到改行末的所有东西
(setq-default kill-whole-line t)


;;增大函数变量查找的寻找范围
(setq apropos-do-all t)

;;使用aspell程序作为emacs的拼写检查程序
(setq-default ispell-program-name "aspell")

;;使用narrow功能的一个设置
;; (put 'narrow-to-region 'disabled nil)

;;隐藏工具栏
(tool-bar-mode nil) 
    
;;去掉菜单栏，将F10绑定为显示菜单栏，需要菜单栏了可以摁F10调出，再摁F10就去掉菜单
;; (menu-bar-mode nil)

;; 隐藏滚动条。实际上emacs-nox是没有这个模式的。
;;(scroll-bar-mode nil) 


;;光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate) 
    
;;不要在鼠标光标出插入
(setq mouse-yank-at-point t) 
    
;;高亮显示选中的区域
(transient-mark-mode t) 
    
;;支持emacs和外部程序的拷贝粘贴
(setq x-select-enable-clipboard t) 
    
;;在标题栏提示当前位置
(setq frame-title-format "Current@%b")

;;可以递归的使用 minibuffer
;; (setq enable-recursive-minibuffers t)	

;;显示80列就换行
;;(add-hook 'message-mode-hook (lambda ()
;;(setq default-fill-column 80) 
;;(turn-on-auto-fill)))


;;禁止终端响铃
(setq visiable-bell t) 
    
;;设置tab为4个空格的宽度
(setq default-tab-width 4)

;;设置一下备份时的版本控制，这样更加安全。
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;设置备份时的版本控制，这样更加安全。
(mapcar
  (function (lambda (setting)
                     (setq auto-mode-alist
                               (cons setting auto-mode-alist))))
   '(("\\.xml$".  sgml-mode)
     ("\\\.bash" . sh-mode)
     ("\\.rdf$".  sgml-mode)
     ("\\.session" . emacs-lisp-mode)
     ("\\.l$" . c-mode)
     ("\\.css$" . css-mode)
     ("\\.cfm$" . html-mode)
     ("gnus" . emacs-lisp-mode)
     ("\\.idl$" . idl-mode)))

;;让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;时间戳设置(time-stamp)，设定文档上次保存的信息
;;只要里在你得文档里有Time-stamp:的设置，就会自动保存时间戳
;;启用time-stamp
(setq time-stamp-active t)

;;去掉time-stamp的警告？
(setq time-stamp-warn-inactive t)

;;设置time-stamp的格式，我如下的格式所得的一个例子：<hans 05/18/2004 12:01:12>
(setq time-stamp-format "%:u %02m/%02d/%04y %02H02M02S")

;;将修改时间戳添加到保存文件的动作里。
(add-hook 'write-file-hooks 'time-stamp)

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)

;;光标显示为一竖线
;;(setq-default cursor-type 'bar)

;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)

;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)

;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)

;;是用aspell程序作为Emacs的拼写检查成学
(setq-default ispell-program-name "aspell")

;;使用narrow功能时的一个设置
(put 'narrow-to-region 'disabled nil)

;;启动Emacs自动设置为两个窗口(上下各一个)
;; (split-window-vertically)

;;鼠标滚轮，默认的滚动太快，这里改为3行
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)



;; M-x eval-buffer
;; we can make the configer effective without restart emacs 

;; auto-complete mode 

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-complete-words-in-all-buffer)
(setq-default ac-sources '(ac-source-words-in-all-buffer))

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)

;; cedet config
(load-file "~/.emacs.d/cedet/common/cedet.el")

;; select one of the fllowing
(semantic-load-enable-code-helpers)
;; ;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; ;; Select one of the following:

;; ;; * This enables the database and idle reparse engines
;; ;;(semantic-load-enable-minimum-features)

;; ;; * This enables some tools useful for coding, such as summary mode
;; ;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; ;; * This enables even more coding tools such as the nascent intellisense mode
;; ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; ;; (semantic-load-enable-guady-code-helpers)

;; ;; * This turns on which-func support (Plus all other code helpers)
;; ;; (semantic-load-enable-excessive-code-helpers)

;; ;; This turns on modes that aid in grammar writing and semantic tool
;; ;; development.  It does not enable any other features such as code
;; ;; helpers above.
;; ;; (semantic-load-enable-semantic-debugging-helpers)
;; share clipboard with extern program

;; ecb config 
;; version : ecb2.40
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb)
(setq x-select-enable-clipboard t)

;; to disable 
;;(setq load-path
  ;;       (let  (l1)
    ;;           (dolist (l load-path)
      ;;          (unless (string-match "cedet" l)
        ;;               (add-to-list 'l1 l))) l1))








(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/home/jiaowu/work/4780/kernel" "LNX")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; set xcscope
(require 'xcscope)
(setq cscope-do-not-update-database t)


;; -*- Emacs-Lisp -*-
 
;; Time-stamp: <2010-04-12 11:38:25 Monday by ahei>
 
;; emacser.com/highlight-symbol.htm
 
;; (require 'util)
;; (require 'highlight-symbol)
 
;; (when window-system
;;   (am-add-hooks
;;    '(emacs-lisp-mode-hook lisp-interaction-mode-hook java-mode-hook
;; 						    c-mode-common-hook text-mode-hook ruby-mode-hook html-mode-hook
;; 							  sh-mode-hook Info-mode-hook)
;;    'highlight-symbol-mode-on))
 
;; (defun highlight-symbol-settings ()
;;   "Settings for `highlight-symbol'."
 
;;   (setq highlight-symbol-idle-delay 0.5)
 
;;   (defun highlight-symbol-mode-on ()
;; 	"Turn on function `highlight-symbol-mode'."
;; 	(if window-system
;; 		(highlight-symbol-mode 1)))
 
;;   (defun highlight-symbol-mode-off ()
;; 	"Turn off function `highlight-symbol-mode'."
;; 	(highlight-symbol-mode -1))
 
;; ;;;###autoload
;;   (define-globalized-minor-mode global-highlight-symbol-mode highlight-symbol-mode highlight-symbol-mode-on)
 
;; ;;;###autoload
;;   (defun highlight-symbol-jump (dir)
;; 	"Jump to the next or previous occurence of the symbol at point.
;; DIR has to be 1 or -1."
;; 	(let ((symbol (highlight-symbol-get-symbol)))
;; 	    (if symbol
;; 			  (let* ((case-fold-search nil)
;; 					  (bounds (bounds-of-thing-at-point 'symbol))
;; 					   (offset (- (point) (if (< 0 dir) (cdr bounds) (car bounds)))))
;; 				(unless (eq last-command 'highlight-symbol-jump)
;; 				    (push-mark))
;; 				(let ((target
;; 					      (save-excursion
;; 							 ;; move a little, so we don't find the same instance again
;; 							 (goto-char (- (point) offset))
;; 							  (re-search-forward symbol nil t dir))))
;; 				    (if target
;; 						  (goto-char (+ target offset))
;; 					  (message (format "Reach %s" (if (> dir 0) "bottom" "top"))))
;; 					  (setq this-command 'highlight-symbol-jump)))
;; 		  (error "No symbol at point"))))
 
;;   ;; I bind "C-x w" to `copy-sexp'
;;   (eal-define-keys
;;    'hi-lock-map
;;    `(("C-x w" nil)))
 
;;   (eal-define-keys
;;    `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map
;; 						  c-mode-base-map text-mode-map ruby-mode-map html-mode-map)
;;    `(("C-c M-H" highlight-symbol-at-point)
;; 	  ("C-c M-R" highlight-symbol-remove-all)
;; 	   ("C-c M-N" highlight-symbol-next)
;; 	    ("C-c M-P" highlight-symbol-prev)
;; 		 ("C-c r"   highlight-symbol-query-replace)
;; 		  ("C-c M-n" highlight-symbol-next-in-defun)
;; 		   ("C-c M-p" highlight-symbol-prev-in-defun))))
 
;; (defun highlight-symbol-settings-for-emaci ()
;;   "`highlight-symbol' settings for `emaci'."
;;   (eval-when-compile (require 'cl))
 
;; ;;;###autoload
;;   (defun emaci-n ()
;; 	"Command bind to key n."
;; 	(interactive)
;; 	(if (edebug-active)
;; 		(edebug-next-mode)
;; 	    (if (equal major-mode 'gud-mode)
;; 			  (call-interactively 'gud-next)
;; 		  (call-interactively 'highlight-symbol-next))))
 
;;   (define-key-list
;; 	emaci-mode-map
;; 	`(("p" highlight-symbol-prev))))
 
;; (eval-after-load "emaci"
;;   `(highlight-symbol-settings-for-emaci))
 
;; (eval-after-load "highlight-symbol"
;;   '(highlight-symbol-settings))
 
;; (provide 'highlight-symbol-settings)

;; this seems no use to C mode , but useful for java
(setq tab-width 4)
(setq default-tab-width 4)
(setq indent-tabs-mode t)
(setq c-basic-offset 4)

;; C language setting
;; let the file indent with tab, and the tab width is 4
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "K&R")
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq c-basic-offset 4)))

;; C++ language setting
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "K&R")
             ;;(c-toggle-auto-state)
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq c-basic-offset 4)))

;; text mode setting
(add-hook 'text-mode-hook 
		  '(lambda ()
			 (setq tab-width 4)
			 (setq indent-tabs-mode t)
			 (setq indent-line-function 'insert-tab)
			))
;; yasnippet
(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet-0.6.1c") 

(require 'yasnippet)
;; (yas-global-mode 1)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
;; (yas/global-mode)

(add-to-list 'load-path
			      "~/.emacs.d/") 

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")

;; (color-theme-blackboard)

;; (whitespace-global-mode　t)

;; ac-complete-semantic
(defun ac-complete-semantic-self-insert (arg) (interactive "p") (self-insert-command arg) (ac-complete-semantic))

(defun my-c-mode-ac-complete-hook () (local-set-key "." 'ac-complete-semantic-self-insert) (local-set-key ">" 'ac-complete-semantic-self-insert))

(add-hook 'c-mode-common-hook 'my-c-mode-ac-complete-hook)


;; cflow setting
(add-to-list 'load-path
			      "/usr/local/share/emacs/site-lisp/") 
(require 'cflow-mode)
(defvar cmd nil nil)
(defvar cflow-buf nil nil)
(defvar cflow-buf-name nil nil)

(defun yyc/cflow-function (function-name)
  "Get call graph of inputed function. "
  ;(interactive "sFunction name:\n")
  (interactive (list (car (senator-jump-interactive "Function name: "
                                                    nil nil nil))))
  (setq cmd (format "cflow  -b --main=%s %s" function-name buffer-file-name))
  (setq cflow-buf-name (format "**cflow-%s:%s**"
                               (file-name-nondirectory buffer-file-name)
                               function-name))
  (setq cflow-buf (get-buffer-create cflow-buf-name))
  (set-buffer cflow-buf)
  (setq buffer-read-only nil)
  (erase-buffer)
  (insert (shell-command-to-string cmd))
  (pop-to-buffer cflow-buf)
  (goto-char (point-min))
  (cflow-mode)
  )


;; bookmark setting

(add-to-list 'load-path'  "~/.emacs.d/bm/") 

(require 'bm)
;; or 
;; (autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
;; (autoload 'bm-next     "bm" "Goto bookmark."                     t)
;; (autoload 'bm-previous "bm" "Goto previous bookmark."            t)

;; bm M$ Visual Studio key setup.
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;; bm Click on fringe to toggle bookmarks, and use mouse wheel to move between them.
;; left-fringe 就是buffer左边的小区域，在显示行号和buffer之间的小条
;; left-margin 就是显示行号的区域，要大一点
;; mouse-1 就是左键， mouse-4，5 就是鼠标滚轮
(global-set-key (kbd "<left-margin> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-margin> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-margin> <mouse-1>") 'bm-toggle-mouse)

;; bm If you would like the markers on the right fringe instead of the left, add the following to line:
;; (setq bm-marker 'bm-marker-right)		



;; 单词高亮
;; 常常需要在看代码的时候高亮某个变量，查看其变化，之前用的 lambda expression 如下：

;; (lambda () (interactive) 
;;   (highlight-phrase (current-word) 'hi-blue))
;; 然后发现，高亮的单词是亮了，但是怎么别的单词也部分亮了，比如我只想高亮变 量 i，但上面的 lambda 弄得 index 的 i 也亮了，iNode 的 i 也亮了，满屏都亮 了……
;; 其实都是 highlight-phrase 惹的祸，并不判断当下的 current-word 是否是一个 完整的单词。这样的话，用 highlight-regexp 就好了，只是需要将匹配单词的 regexp 给它，如下的 lambda expression，我习惯将其绑定到 F8 上。

;; 另外jwu还加入了标记颜色的循环，使得在标记多个不同关键字时颜色也不同

(defvar jwu-hi-color (list 'hi-blue 'hi-yellow 'hi-green  'hi-red 'hi-blue-b 'hi-red-b 'hi-pink))
(defvar jwu-hi-index (copy-list jwu-hi-color))
(defun jwu-get-color ()
  "thisandthat."
  (interactive)
  ;; (let (var1)
  ;;   (setq var1 some)
    
  ;; 	)
  (print "you ")
  (setq jwu-hi-index (copy-list (cdr jwu-hi-index)))
  (if (eql jwu-hi-index nil)
	  (setq jwu-hi-index (copy-list jwu-hi-color)))
  (print jwu-hi-index)
  (setq var1 (car jwu-hi-index))
  (print var1)
  )

(global-set-key [(f8)] (lambda () (interactive)
                         (highlight-regexp 
                          (concat "\\b" (current-word) "\\b")
                          (jwu-get-color))))
 
;; (global-set-key [(f8)] (lambda () (interactive)
;;                          (highlight-regexp 
;;                           (concat "\\b" (current-word) "\\b")
;;                           'hi-blue)))
 
;; 接下来是将高亮取消的 lambda expression，我绑定到了 C-F8 上
(global-set-key [(control f8)] (lambda ()
                                 (interactive)
                                 (hi-lock-mode nil)))

;; start emacs server for clients, to quickly open one file
(server-start)
