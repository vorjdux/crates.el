;;; crates.el --- Simplify Dependency Management in Rust & Emacs

;; Author: Matheus (vorjdux) Santos
;; Version: 0.1.0
;; Package-Requires: ((emacs "25.1") (request "0.3.0"))
;; Keywords: convenience, rust, crate
;; URL: http://github.com/vorjdux/crates.el

(require 'request)

;;;###autoload
(defun crates-update-cargo-toml-versions ()
  "Fetch and display the latest versions of Rust crates specified in Cargo.toml."
  (interactive)
  ;; Ensure we're in a Cargo.toml file or add logic to check it.
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
                         (with-current-buffer (get-buffer-create "*Crates Versions*")
                           (insert (format "Latest version for %s: %s\n" crate-name, latest-version))
                           (display-buffer (current-buffer))))))))))))

(provide 'crates)
