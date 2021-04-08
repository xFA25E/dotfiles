;;; skempo-lisp.el --- Lisp skempo templates -*- lexical-binding: t; eval: (add-hook (quote after-save-hook) (lambda () (byte-recompile-file (buffer-file-name))) nil t); -*-

;; Copyright (C) 2021  Valeriy Litkovskyy

;; Author: Valeriy Litkovskyy
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'skempo)

(skempo-define-tempo (lambda :mode lisp-mode)
  "(lambda (" p ") " n> r> ")")

(skempo-define-tempo (let :mode lisp-mode)
  "(let ((" p "))" n> r> ")")

(skempo-define-tempo (defvar :mode lisp-mode)
  "(defvar " p n> r> n> "\"" p "\")")

(skempo-define-tempo (defun :mode lisp-mode)
  "(defun " p " (" p ")" n> "\"" p "\"" n> r> ")")

(provide 'skempo-lisp)
;;; skempo-lisp.el ends here
