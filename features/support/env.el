(require 'f)
(require 'undercover)
(undercover "*.el" "epresent/*.el"
	    (:exclude "*-test.el")
	                (:report-file "/tmp/undercover-report.json"))

(defvar epresent-support-path
  (f-dirname load-file-name))

(defvar epresent-features-path
  (f-parent epresent-support-path))

(defvar epresent-root-path
  (f-parent epresent-features-path))

(add-to-list 'load-path epresent-root-path)

(require 'epresent)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
