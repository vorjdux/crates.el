# crates.el

Simplify Dependency Management in Rust & Emacs by displaying the latest crate versions directly in your Cargo.toml.

## Features

- Asynchronously fetches the latest versions of the Rust crates listed in your Cargo.toml.
- Displays the fetched versions in a dedicated Emacs buffer, allowing you to easily update your dependencies.

## Installation

Currently, you need to manually install `crates.el`. Clone this repository or download `crates.el` directly, then add the following to your Emacs configuration:

```elisp
(add-to-list 'load-path "/path/to/directory/containing/crates.el")
(require 'crates)
```

Make sure you have the request package installed:

```elisp
M-x package-install RET request RET
```

## Usage
Open your Cargo.toml and execute:

```elisp
M-x crates-update-cargo-toml-versions
```

This will fetch the latest versions for your dependencies and display them in the *Crates Versions* buffer.


## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues on the GitHub repository.

Remember to replace `/path/to/directory/containing/crates.el` with the actual path where you saved `crates.el`, and update the GitHub URL (`http://github.com/vorjdux/crates.el`) to point to your actual repository.

This setup provides a basic framework for your Emacs plugin. You might need to refine and expand upon this, particularly with regard to error handling, more sophisticated `Cargo.toml` parsing, and integration into Rust development workflows in Emacs.
