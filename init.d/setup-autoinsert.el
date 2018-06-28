;;; setup-autoinsert.el --- Setup for auto-insert mode.  -*- lexical-binding: t; -*-

;; Author:   TVerloop <t93.verloop@gmail.com>
;; Keywords: convenience

;;; Commentary:

;;

;;; Code:

(require 'autoinsert)

(custom-set-variables
 '(auto-insert-mode t)
 '(auto-insert-query nil)
 '(auto-insert 'other))

(add-to-list 'auto-insert-alist '(("\\.\\([C]\\|cc\\|cpp\\)\\'" . "C++ source")
                                  nil
                                  "/* -*- mode: c++ -*- */\n"
                                  "/**\n"
                                  "*  @file    "(file-name-nondirectory (buffer-name))"\n"
                                  "*  @author  "user-full-name" <"user-mail-address">\n"
                                  "*  @version 0.1\n"
                                  "*  @date    "(format-time-string "%d-%m-%Y")"\n"
                                  "*  @brief   "(helm-read-string "Brief description:")"\n"
                                  "*/\n"
                                  "\n"
                                  "/******************************************************************************/\n"
                                  "/* Includes.                                                                  */\n"
                                  "/******************************************************************************/\n"
                                  "\n"
                                  "/* System */\n"
                                  "\n"
                                  "/* Third party */\n"
                                  "\n"
                                  "/* Local */\n"
                                  "\n"
                                  "\n"
                                  "/******************************************************************************/\n"
                                  "/* Macros.                                                                    */\n"
                                  "/******************************************************************************/\n"
                                  "\n"
                                  "/******************************************************************************/\n"
                                  "/* Private Variables.                                                         */\n"
                                  "/******************************************************************************/\n"
                                  "\n"
                                  "/******************************************************************************/\n"
                                  "/* Private function prototypes.                                               */\n"
                                  "/******************************************************************************/\n"
                                  "\n"
                                  "/******************************************************************************/\n"
                                  "/* function definitions.                                                      */\n"
                                  "/******************************************************************************/\n"
                                  > _ "\n"
                                  "/******************************************************************************/\n"
                                  "/* EOF.                                                                       */\n"
                                  "/******************************************************************************/\n"))



(provide 'setup-autoinsert)
;;; setup-autoinsert.el ends here
