;;; setup-autoinsert.el --- Setup for auto-insert mode.  -*- lexical-binding: t; -*-

;; Author:   TVerloop <t93.verloop@gmail.com>
;; Keywords: convenience

;;; Commentary:

;;

;;; Code:

(use-package autoinsert
  :require helm
  :config

  (defvar auto-insert-exclude-file
    '("custom.el"
      "ede-projects.el"))

  (defun create-from-skeleton ()
    "Fills new file from skeleton."
    (if (not (file-exists-p buffer-file-name))
        (if (not (member (file-name-nondirectory buffer-file-name) auto-insert-exclude-file))
            (auto-insert))))

  (add-hook 'find-file-hook 'create-from-skeleton)

  (setq auto-insert-query nil
        auto-insert 'other)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; C++ Skeletons.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-skeleton cpp-source-skeleton
    "C++ Source file."
    "/* -*- mode: C++ -*- */\n"
    "/**\n"
    " * @file    " (file-name-nondirectory buffer-file-name) "\n"
    " * @author  " user-full-name " <" user-mail-address ">\n"
    " * @version 1.0\n"
    " * @date    " (format-time-string "%d-%m-%Y") "\n"
    " * \n"
    " * " (helm-read-string "Brief description: ") "\n"
    " */\n"
    "\n"
    "\n"
    _ "\n"
    "\n")

  (define-skeleton cpp-header-skeleton
    "C++ Header file."
    "/* -*- mode: C++ -*- */\n"
    "/**\n"
    " * @file    " (file-name-nondirectory buffer-file-name) "\n"
    " * @author  " user-full-name " <" user-mail-address ">\n"
    " * @version 1.0\n"
    " * @date    " (format-time-string "%d-%m-%Y") "\n"
    " * \n"
    " * " (helm-read-string "Brief description: ") "\n"
    " */\n"
    "\n"
    "#ifndef " (upcase (file-name-base buffer-file-name)) "_" (upcase (file-name-extension buffer-file-name)) "__\n"
    "#define " (upcase (file-name-base buffer-file-name)) "_" (upcase (file-name-extension buffer-file-name)) "__\n"
    "\n"
    "\n"
    _ "\n"
    "\n"
    "\n"
    "#endif // " (upcase (file-name-base buffer-file-name)) "_" (upcase (file-name-extension buffer-file-name)) "__\n"
    "\n")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; C Skeletons.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-skeleton c-source-skeleton
    "C Source file."
    "/* -*- mode: C -*- */\n"
    "/**\n"
    " * @file    " (file-name-nondirectory buffer-file-name) "\n"
    " * @author  " user-full-name " <" user-mail-address ">\n"
    " * @version 1.0\n"
    " * @date    " (format-time-string "%d-%m-%Y") "\n"
    " * \n"
    " * " (helm-read-string "Brief description: ") "\n"
    " */\n"
    "\n"
    "\n"
    _ "\n"
    "\n")

  (define-skeleton c-header-skeleton
    "C Header file."
    "/* -*- mode: C -*- */\n"
    "/**\n"
    " * @file    " (file-name-nondirectory buffer-file-name) "\n"
    " * @author  " user-full-name " <" user-mail-address ">\n"
    " * @version 1.0\n"
    " * @date    " (format-time-string "%d-%m-%Y") "\n"
    " * \n"
    " * " (helm-read-string "Brief description: ") "\n"
    " */\n"
    "\n"
    "\n"
    "#ifndef " (upcase (file-name-base buffer-file-name)) "_" (upcase (file-name-extension buffer-file-name)) "__\n"
    "#define " (upcase (file-name-base buffer-file-name)) "_" (upcase (file-name-extension buffer-file-name)) "__\n"
    "\n"
    "#ifdef __cplusplus\n"
    "extern \"C\" {\n"
    "#endif\n"
    "\n"
    "\n"
    _ "\n"
    "\n"
    "\n"
    "#ifdef __cplusplus\n"
    "} // extern \"C\"\n"
    "#endif\n"
    "\n"
    "#endif // " (upcase (file-name-base buffer-file-name)) "_" (upcase (file-name-extension buffer-file-name)) "__\n"
    "\n")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; CMake Skeletons.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-skeleton cmake-list-skeleton
    "CMakeLists.txt file"
    "# -*- mode: CMake -*-\n"
    "#==============================================================================#\n"
    "# File:     " (file-name-base buffer-file-name) "\n"
    "# Author:   " user-full-name "   <" user-mail-address ">\n"
    "# Version:  1.0\n"
    "# Date:     " (format-time-string "%d-%m-%Y") "\n"
    "#\n"
    "# " (helm-read-string "Brief description: ") "\n"
    "#\n"
    "#==============================================================================#\n"
    "cmake_minimum_required(VERSION 3.0)\n"
    "\n"
    "project(" (helm-read-string "Project name: ") "\n"
    > "VERSION 1.0.0)\n"
    "\n"
    "\n"
    _ "\n"
    "\n")

  (define-skeleton cmake-module-skeleton
    "CMake module file"
    "# -*- mode: CMake -*-\n"
    "#==============================================================================#\n"
    "# File:     " (file-name-base buffer-file-name) "\n"
    "# Author:   " user-full-name "   <" user-mail-address ">\n"
    "# Version:  1.0\n"
    "# Date:     " (format-time-string "%d-%m-%Y") "\n"
    "#\n"
    "# " (helm-read-string "Brief description: ") "\n"
    "#\n"
    "#==============================================================================#\n"
    "\n"
    "\n"
    _ "\n"
    "\n")

  (define-auto-insert
    "\\.\\([C]\\|c++\\|cc\\|cpp\\|cxx\\)\\'"
    'cpp-source-skeleton)

  (define-auto-insert
    "\\.\\(inc\\|hh\\|hpp\\|hxx\\)\\'"
    'cpp-header-skeleton)

  (define-auto-insert
    "\\.\\(c\\)\\'"
    'c-source-skeleton)

  (define-auto-insert
    "\\.\\(h\\)\\'"
    'c-header-skeleton)

  (define-auto-insert
    "CMakeLists\\.txt\\'"
    'cmake-list-skeleton)

  (define-auto-insert "\\.cmake\\'"
    'cmake-module-skeleton))

(provide 'setup-autoinsert)
;;; setup-autoinsert.el ends here
