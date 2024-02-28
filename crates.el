;;; crates.el --- Simplify Dependency Management in Rust & Emacs

;; Author: Matheus (vorjdux) Santos
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1") (request "0.3.0"))
;; Keywords: convenience, rust, crate
;; URL: http://github.com/vorjdux/crates.el

(require 'request)

;;;###autoload
(defun rust-crate-versions-fetch-and-display ()
  "Fetch and display the latest versions of Rust crates in the Cargo.toml file."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\([^ ]+\\) = \"[^\"]+\"$" nil t)
      (let ((crate-name (match-string 1)))
        (request
          (format "https://crates.io/api/v1/crates/%s" crate-name)
          :parser 'json-read
          :success (cl-function
                    (lambda (&key data &allow-other-keys)
                      (when data
                        (let ((latest-version (gethash "max_version" (gethash "crate" data))))
                          (message "Latest version for %s: %s" crate-name latest-version))))))))))

(provide 'rust-crate-versions)
