;; The symbols to be exported from the INTROSPECT-ENVIRONMENT package.
(eval-when (:load-toplevel :compile-toplevel :execute)
  (defparameter *%ie-export-forms%*
    '((:export #:compiler-macroexpand-1 #:compiler-macroexpand)
      (:export #:specialp #:variable-type #:function-type
               #:parse-macro #:parse-compiler-macro)
      (:export #:constant-form-p #:constant-form-value)
      (:export #:policy #:policy-quality)
      (:export #:typexpand #:typexpand-1))))

#+sbcl
(defpackage #:introspect-environment
  (:use #:cl)
  (:shadowing-import-from "SB-EXT"
			  #:typexpand
			  #:typexpand-1)
  (:shadowing-import-from "SB-CLTL2"
			  #:function-information
			  #:variable-information
			  #:declaration-information
			  #:parse-macro)
  (:shadowing-import-from "SB-INT"
			  #:constant-form-value)
  . #.*%ie-export-forms%*)

#+ccl
(defpackage #:introspect-environment
  (:use #:cl)
  (:shadowing-import-from "CCL"
			  #:function-information
			  #:variable-information
			  #:declaration-information
			  #:parse-macro)
  . #.*%ie-export-forms%*)

#- (or ccl sbcl)
(defpackage #:introspect-environment
  (:use #:cl)
  . #.*%ie-export-forms%*)
