;;; skempo-templates.el --- My skempo templates      -*- lexical-binding: t; eval: (add-hook (quote after-save-hook) (lambda () (byte-recompile-file (buffer-file-name))) nil t); -*-

(require 'skempo)

;;; USER ELEMENTS

(defun skempo-user-element (arg)
  ""
  (pcase arg
    ('nix-hash (make-string 52 ?1))
    ('elisp-namespace (string-trim-right (buffer-name) (rx ".el" eos)))
    ('elisp-group (string-trim-right (buffer-name) (rx (? "-mode") ".el" eos)))
    (`(lisp-with-parens . ,body)
     (let ((surround (or (use-region-p) (not (eql (char-before) ?\()))))
       `(l ,(when surround "(") ,@body ,(when surround ")"))))))

(add-to-list 'tempo-user-elements 'skempo-user-element)

;;; LISP

(skempo-define-tempo (lambda :mode (emacs-lisp-mode lisp-mode))
  (lisp-with-parens
   "lambda (" p ") " n>
   r>))

(skempo-define-tempo (let :mode (emacs-lisp-mode lisp-mode))
  (lisp-with-parens
   "let ((" p "))" n>
   r>))

;;;; COMMON LISP

(skempo-define-tempo (defvar :mode lisp-mode)
  (lisp-with-parens
   "defvar " p n>
   r> n>
   "\"" p "\""))

(skempo-define-tempo (defun :mode lisp-mode)
  (lisp-with-parens
   "defun " p " (" p ")" n>
   "\"" p "\"" n>
   r>))

;;;; EMACS LISP

(skempo-define-tempo (defvar :mode emacs-lisp-mode)
  (lisp-with-parens
   "defvar " elisp-namespace "-" p n>
   r> n>
   "\"" p "\""))

(skempo-define-tempo (defun :mode emacs-lisp-mode)
  (lisp-with-parens
   "defun " elisp-namespace "-" p " (" p ")" n>
   "\"" p "\"" n>
   r>))

(skempo-define-tempo (defgroup :mode emacs-lisp-mode)
  (lisp-with-parens
   "defgroup " elisp-group " nil" n>
   "\"" p "\"" n>
   ":group " p "nil"))

(skempo-define-tempo (defcustom :mode emacs-lisp-mode)
  (lisp-with-parens
   "defcustom " elisp-namespace "-" p n>
   r> n>
   "\"" p "\"" n>
   ":type " p "nil" n>
   ":group '" elisp-group))

(skempo-define-tempo (defface :mode emacs-lisp-mode)
  (lisp-with-parens
   "defface " elisp-namespace "-" p n>
   "'((t :inherit " p "nil))" n>
   "\"" p "\"" n>
   ":group '" elisp-group))

;;; JS

(skempo-define-skeleton (switch :mode js-mode)
  "Expression: "
  "switch (" str ") {" > \n
  ("Pattern: "
   "case " str ":" > \n
   @ \n
   "break;" > \n \n)
  "default:" > \n
  @ \n
  "}" >)

;;; NIX

(skempo-define-tempo (github :mode nix-mode)
  "fetchFromGitHub {" n>
  "owner = \"" p "\";" n>
  "repo = \"" p "\";" n>
  "rev = \"" p "\";" n>
  "sha256 = \"" p nix-hash "\";" n>
  "}" p >)

(skempo-define-tempo (url :mode nix-mode)
  "fetchurl {" n>
  "url = \"" p "\";" n>
  "sha256 = \"" p nix-hash "\";" n>
  "}" p >)

(skempo-define-tempo (zip :mode nix-mode)
  "fetchzip {" n>
  "url = \"" p "\";" n>
  "sha256 = \"" p nix-hash "\";" n>
  "}" p >)

(skempo-define-tempo (git :mode nix-mode)
  "fetchgit {" n>
  "url = \"" p "\";" n>
  "rev = \"" p "\";" n>
  "sha256 = \"" p nix-hash "\";" n>
  "}" p >)

;;; PHP

(skempo-define-tempo (vd :mode php-mode)
  "echo '<pre>'; var_dump(" r "); echo '</pre>';")

;;; PROVIDE

(provide 'skempo-templates)
;;; skempo-templates.el ends here
