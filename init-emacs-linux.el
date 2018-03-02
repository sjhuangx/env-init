;;; This file is only for windows platform
;;; The only thing it does do is to set the HOME directories for emacs
;;; then tigger the init.el in the directory specified by HOME to
;;; accomplish the true initialization
;;; You should put this file in the default HOME directory right after
;;; emacs is finished
;;(setenv "HOME" "~/emacs") ; you can change this dir to the place you like

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/Code/env-init/init.el")
