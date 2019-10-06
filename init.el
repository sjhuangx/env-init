;;; emacs setting
;;; package should install
;; 1.  company  -> complete anything
;; 2.  racket-mode
;; 3.  rainbow-delimiters
;; 4.  sr-speedbar
;; 5.  tabbar
;; 6.  session
;; 7.  highlight-indent-guides
;; 8.  windresize  调整窗口大小, M-x: windresize
;; 9.  slime
;; 10. slime-company
;; 11. smooth-scrolling

;; 设置默认主题为: deeper-blue
(load-theme 'deeper-blue t)

;; 关闭工具栏
(tool-bar-mode 0)


;; 用空格代替TAB
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; 窗口切换快捷键 M-<left>,M-<right>,M-<up>,M-<down>
(windmove-default-keybindings 'meta)

;; 光标显示为一竖线
(setq-default cursor-type 'bar)

;; 使用y or n 代替 yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; 自动补全括号
(electric-pair-mode t)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode 1)
(setq show-paren-style 'parentheses)

;; 进行语法加亮
(global-font-lock-mode t)

;; session 设置
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; desktop 设置
(load "desktop")
(desktop-load-default)
(desktop-read)

;; 显示缩进线
(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; windows字体设置
(if (eq system-type 'windows-nt)
    (set-default-font "Courier New-12"))

;; windows中文字体设置为雅黑
(if (eq system-type 'windows-nt)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "Microsoft Yahei" :size 16))))

;; 设置默认文件编码为utf-8
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; rainbow括号颜色显示
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground 'unspecified
                    :inherit 'error
                    :strike-through t)
(set-face-attribute 'rainbow-delimiters-depth-1-face nil
                    :foreground "dark orange")
(set-face-attribute 'rainbow-delimiters-depth-2-face nil
                    :foreground "pink")
(set-face-attribute 'rainbow-delimiters-depth-3-face nil
                    :foreground "chartreuse")
(set-face-attribute 'rainbow-delimiters-depth-4-face nil
                    :foreground "deep sky blue")
(set-face-attribute 'rainbow-delimiters-depth-5-face nil
                    :foreground "yellow")
(set-face-attribute 'rainbow-delimiters-depth-6-face nil
                    :foreground "orchild")
(set-face-attribute 'rainbow-delimiters-depth-7-face nil
                    :foreground "spring green")
(set-face-attribute 'rainbow-delimiters-depth-8-face nil
                    :foreground "siennal")
(set-face-attribute 'rainbow-delimiters-depth-9-face nil
                    :foreground "royal blue")

;; 设置时间和日期显示格式
(display-time-mode 1)
(setq display-time-24hr-format t)

;; 高亮当前行
(global-hl-line-mode 1)
;; 关闭欢迎页
(setq inhibit-startup-message t)
;; 关闭出错时的蜂鸣提示声
(setq visible-bell t)
;; 尽快显示按键序列
(setq echo-keystrokes 0.1)

;; 显示行号和列号
(global-linum-mode t)
(setq column-number-mode t)
;; 在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;; 允许minibuffer自由变化其宽度大小
(setq resize-mini-windows t)
;; 指针不要闪
(blink-cursor-mode -1)

;; 默认启用文本模式
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq enable-recursive-minibuffers t)

;; 不产生备份文件
(setq make-backup-files nil)
;; 不产生备份
(setq backup-inhibited t)
;; 不生成名为#filename#的临时文件
(setq auto-save-default nil)
;; 自动保存
(setq auto-save-mode t)
;; 自动重载更改的文件
(global-auto-revert-mode 1)

;; 鼠标滚轮，默认的滚动太快，这里改为3行
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;; shell,gdb退出后，自动关闭该buffer
(defun kill-buffer-when-exit ()
  "Close assotiated buffer when a process exited"
  (let ((current-process (ignore-errors (get-buffer-process (current-buffer)))))
    (when current-process
      (set-process-sentinel
       current-process
       (lambda (watch-process change-state)
         (when (string-match "//(finished//|exited//)" change-state)
           (kill-buffer (process-buffer watch-process))))))))
(add-hook 'gdb-mode-hook 'kill-buffer-when-exit)
(add-hook 'shell-mode-hook 'kill-buffer-when-exit)

;; 清除代码中不必要的空格和TAB
(global-set-key [f6] 'whitespace-cleanup)

;; ibuffer - operate on buffers like dired
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; tabbar 标签功能
(require 'tabbar)
(tabbar-mode t)
(global-set-key (kbd "S-<up>") 'tabbar-backward-group)
(global-set-key (kbd "S-<down>") 'tabbar-forward-group)
(global-set-key (kbd "S-<left>") 'tabbar-backward)
(global-set-key (kbd "S-<right>") 'tabbar-forward)

;; sr-speedbar 设置
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq dframe-update-speed t)
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "<f4>")
                (lambda ()
                  (interactive)
                  (sr-speedbar-toggle)))

;;;--------------------------------------------------------------------
;; company mode
;; https://github.com/company-mode/company-mode/wiki/Switching-from-AC
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
;; tab key for complete or select next
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))
;; company color setting
(set-face-attribute 'company-preview nil
                    :foreground "darkgray" :underline t)
(set-face-attribute 'company-preview-common nil
                    :inherit 'company-preview)
(set-face-attribute 'company-tooltip nil
                    :background "lightgray" :foreground "black")
(set-face-attribute 'company-tooltip-common nil
                    :background "lightgray" :foreground "black" :weight 'bold)
(set-face-attribute 'company-tooltip-selection nil
                    :background "steelblue" :foreground "white")
(set-face-attribute 'company-tooltip-common-selection nil
                    :inherit 'company-tooltip-selection :weight 'bold)

;;;--------------------------------------------------------------------
;; see: http://blog.csdn.net/loveaborn/article/details/46763163
;; racket-mode setting
;;--------------------------------------------------------------------
(require 'racket-mode)
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
;; make tab key do indent AND completion
(set-default 'tab-always-indent 'complete)


;; slime 设置
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy slime-banner slime-company))


;;-----------------------------------------------------------------
;; 解决保存文件很慢问题 Disable all version control
(setq vc-handled-backends nil)
; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)
;; 显示保存文件profile
(defun profiled-save-buffer ()
  "Profile save buffer."
  (interactive)
  (profiler-start 'cpu)
  (save-buffer)
  (profiler-report)
  (profiler-stop)
  (select-window (previous-window)))


