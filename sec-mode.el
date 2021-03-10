;; sec-mode.el --- major mode for editing Simple Event Correlator Config Files
;; Copyright © 2019 Rafael R. Sevilla
;;
;; Author: Rafael R. Sevilla (dido.sevilla@stormwyrm.com)
;; Version: 0.0.1
;; Created: 2019-08-08
;; Keywords: Languages
;; Homepage:
;;
;; This file is not part of GNU Emacs.

;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 3 or (at your option) any later version.

;;; Code:

(setq sec-highlights
      '(("^\\(type\\|continue[0-9]*\\|window2?\\|ptype[0-9]*\\|pattern[0-9]*\\|desc2?\\|thresh[0-9]*\\|action2?\\|context[0-9]*\\|varmap[0-9]*\\|rem\\|script\\|multact\\|init\\|end\\|slide\\|count[0-9]*\\|time\\|cfset\\|constset\\|joincfset\\|procallin\\)="
	 . (1 font-lock-keyword-face))
	("^\\(.+\\)=" . (1 font-lock-warning-face))

	("^type=\\(SingleWithScript\\|SingleWithThreshold\\|SingleWithSuppress\\|Single\\|PairWithWindow\\|Pair|\\SingleWithThreshold\\|SingleWith2Thresholds\\|EventGroup\\|Suppress\\|Calendar\\|Jump\\|Options\\)$" . (1 font-lock-constant-face))
	("^type=\\(.*\\)" . (1 font-lock-warning-face))
	
	("^continue=\\(TakeNext\\|DontCont\\|EndMatch\\|GoTo\\)$" . (1 font-lock-constant-face))
	("^continue=\\(.*\\)" . (1 font-lock-warning-face))
	
	("^ptype=\\(SubStr[0-9]*\\|RegExp[0-9]*\\|PerlFunc[0-9]*\\|Cached\\|NSubStr[0-9]*\\|NRegExp[0-9]*\\|NPerlFunc[0-9]*\\|NCached\\|TValue\\)$" . (1 font-lock-constant-face))
	("^ptype=\\(.*\\)" . (1 font-lock-warning-face))

	("^\\(window2?\\|thresh[0-9]*\\)=\\([0-9]+\\)$" . (2 font-lock-constant-face))
	("^\\(window2?\\|thresh[0-9]*\\)=\\(.*\\)" . (2 font-lock-warning-face))

	("^pattern2?=\\(.*\\)" . (1 font-lock-string-face))

	("\\$[0-9]+" . font-lock-variable-name-face)
	("%[a-zA-z0-9\.]+" . font-lock-variable-name-face)))

(setq sec-mode-syntax-table
      (let ((syntable (make-syntax-table)))
	(modify-syntax-entry ?# "<" syntable)
	(modify-syntax-entry ?\n ">" syntable)
	(modify-syntax-entry ?\" "w" syntable)
	syntable))

(define-derived-mode sec-mode fundamental-mode "SEC"
  "major mode for editing SEC configuration files."
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  (setq font-lock-defaults '(sec-highlights nil t))
  (set-syntax-table sec-mode-syntax-table))

(provide 'sec-mode)

