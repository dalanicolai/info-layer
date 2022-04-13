;;; packages.el --- info layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: dalanicolai <dalanicolai@daniel-fedora>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `info-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `info/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `info/pre-init-PACKAGE' and/or
;;   `info/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst info-packages
  '((info :location built-in))
  "The list of Lisp packages required by the info layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun info/init-info ()
  (use-package info
    :defer t
    :after info+
    :init
    (setq evil-motion-state-modes (delete 'Info-mode evil-motion-state-modes)
          evil-overriding-maps (delete '(Info-mode-map . motion) evil-overriding-maps))
    (spacemacs/set-leader-keys
      "hh" 'info
      "hM" 'info-display-manual)
    :config
    (define-key Info-mode-map (kbd "?") #'hydra-info/body)
    ;; (define-key Info-mode-map "i" nil)
    (evilified-state-evilify-map Info-mode-map
      :mode Info-mode
      :bindings
      ;; unbind '?' for hydra
      (kbd "?") nil
      "J" 'Info-scroll-up
      "K" 'Info-scroll-down
      "0" 'evil-digit-argument-or-evil-beginning-of-line
      (kbd "C-o") 'evil-jump-backward
      (kbd "C-i") 'evil-jump-forward
      "H" 'Info-history-back
      "L" 'Info-history-forward
      (kbd "<tab>") 'Info-next-reference
      "w" 'evil-forward-word-begin
      "b" 'evil-backward-word-begin
      "e" 'evil-forward-word-end
      "gt"   'Info-goto-node
      "gg"   'beginning-of-buffer
      "G"   'end-of-buffer)
    (spacemacs/set-leader-keys-for-major-mode 'Info-mode "h" 'Info-history)
    (spacemacs/declare-prefix-for-mode 'Info-mode "e" "eval")
    (spacemacs/set-leader-keys-for-major-mode 'Info-mode "ec" 'spacemacs/eval-current-form-sp)
    (spacemacs/set-leader-keys-for-major-mode 'Info-mode "ef" 'spacemacs/eval-current-form)))

;;; packages.el ends here
