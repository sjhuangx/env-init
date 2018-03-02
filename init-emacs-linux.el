;;; This file is only for linux platform
;;; The only thing it does do is to set the HOME directories for emacs
;;; then tigger the init.el in the directory specified by HOME to
;;; accomplish the true initialization
;;; You should put this file in the default HOME directory right after
;;; emacs is finished

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;;(setenv "HOME" "~/emacs") ; you can change this dir to the place you like
(load "~/Code/env-init/init.el")
