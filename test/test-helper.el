;;; test-helper --- Test helper for epresent

;;; Commentary:
;; test helper inspired from https://github.com/tonini/overseer.el/blob/master/test/test-helper.el

;;; Code:

(require 'f)

(defvar cpt-path
  (f-parent (f-this-file)))

(defvar epresent-test-path
  (f-dirname (f-this-file)))

(defvar epresent-root-path
  (f-parent epresent-test-path))

(defvar epresent-sandbox-path
  (f-expand "sandbox" epresent-test-path))

(when (f-exists? epresent-sandbox-path)
  (error "Something is already in %s. Check and destroy it yourself" epresent-sandbox-path))

(defmacro within-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(let ((default-directory epresent-sandbox-path))
     (when (f-exists? epresent-sandbox-path)
       (f-delete default-directory :force))
     (f-mkdir epresent-sandbox-path)
     ,@body
     (f-delete default-directory :force)))

(require 'ert)
(require 'epresent)

(provide 'test-helper)
;;; test-helper.el ends here
