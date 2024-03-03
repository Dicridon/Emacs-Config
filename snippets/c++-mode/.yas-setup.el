;;; -*- lexical-binding: t -*-
;;; code below is from package yasnippet-snippets-2024-0221.1621 by Ved Vyas
(require 'yasnippet)

(defun yas-c++-class-name (str)
  "Search for a class name like `DerivedClass' in STR
(which may look like `DerivedClass : ParentClass1, ParentClass2, ...')

If found, the class name is returned, otherwise STR is returned"
  (yas-substr str "[^: ]*"))

(defun yas-c++-class-method-declare-choice ()
  "Choose and return the end of a C++11 class method declaration"
  (yas-choose-value '(";" " = default;" " = delete;")))

(defun yas-find-c++-class-or-struct-name ()
  "Find the C++ class or struct name before the point."
  (save-excursion
    (if (re-search-backward "\\b\\(class\\|struct\\)\\s-+\\([[:word:]]+\\)" nil t)
        (match-string 2)
      "Unknown")))
