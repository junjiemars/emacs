;;; xterm.el --- define function key sequences and standard colors for xterm

;; Copyright (C) 1995, 2002, 2005  Free Software Foundation, Inc.

;; Author: FSF
;; Keywords: terminals

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; Code:

(require 'server)

(defvar xterm-function-map nil
  "Function key map overrides for xterm.")

;; The terminal intialization C code file might have initialized
;; function keys F13->F60 from the termcap/terminfo information.  On
;; a PC-style keyboard these keys correspond to
;; MODIFIER-FUNCTION_KEY, where modifier is S-, C, A-, C-S-.  The
;; code here subsitutes the corresponding defintions in
;; function-key-map. This substitution is needed because if a key
;; definition if found in function-key-map, there are no further
;; lookups in other keymaps.
(let ((m (terminal-local-value 'function-key-map nil)))
  (substitute-key-definition [f13] [S-f1] m)
  (substitute-key-definition [f14] [S-f2] m)
  (substitute-key-definition [f15] [S-f3] m)
  (substitute-key-definition [f16] [S-f4] m)
  (substitute-key-definition [f17] [S-f5] m)
  (substitute-key-definition [f18] [S-f6] m)
  (substitute-key-definition [f19] [S-f7] m)
  (substitute-key-definition [f20] [S-f8] m)
  (substitute-key-definition [f21] [S-f9] m)
  (substitute-key-definition [f22] [S-f10] m)
  (substitute-key-definition [f23] [S-f11] m)
  (substitute-key-definition [f24] [S-f12] m)

  (substitute-key-definition [f25] [C-f1] m)
  (substitute-key-definition [f26] [C-f2] m)
  (substitute-key-definition [f27] [C-f3] m)
  (substitute-key-definition [f28] [C-f4] m)
  (substitute-key-definition [f29] [C-f5] m)
  (substitute-key-definition [f30] [C-f6] m)
  (substitute-key-definition [f31] [C-f7] m)
  (substitute-key-definition [f32] [C-f8] m)
  (substitute-key-definition [f33] [C-f9] m)
  (substitute-key-definition [f34] [C-f10] m)
  (substitute-key-definition [f35] [C-f11] m)
  (substitute-key-definition [f36] [C-f12] m)

  (substitute-key-definition [f37] [C-S-f1] m)
  (substitute-key-definition [f38] [C-S-f2] m)
  (substitute-key-definition [f39] [C-S-f3] m)
  (substitute-key-definition [f40] [C-S-f4] m)
  (substitute-key-definition [f41] [C-S-f5] m)
  (substitute-key-definition [f42] [C-S-f6] m)
  (substitute-key-definition [f43] [C-S-f7] m)
  (substitute-key-definition [f44] [C-S-f8] m)
  (substitute-key-definition [f45] [C-S-f9] m)
  (substitute-key-definition [f46] [C-S-f10] m)
  (substitute-key-definition [f47] [C-S-f11] m)
  (substitute-key-definition [f48] [C-S-f12] m)

  (substitute-key-definition [f49] [A-f1] m)
  (substitute-key-definition [f50] [A-f2] m)
  (substitute-key-definition [f51] [A-f3] m)
  (substitute-key-definition [f52] [A-f4] m)
  (substitute-key-definition [f53] [A-f5] m)
  (substitute-key-definition [f54] [A-f6] m)
  (substitute-key-definition [f55] [A-f7] m)
  (substitute-key-definition [f56] [A-f8] m)
  (substitute-key-definition [f57] [A-f9] m)
  (substitute-key-definition [f58] [A-f10] m)
  (substitute-key-definition [f59] [A-f11] m)
  (substitute-key-definition [f60] [A-f12] m))

;; Make reloads faster.
(unless xterm-function-map
  (setq xterm-function-map (make-sparse-keymap))

  (define-key xterm-function-map "\e[A" [up])
  (define-key xterm-function-map "\e[B" [down])
  (define-key xterm-function-map "\e[C" [right])
  (define-key xterm-function-map "\e[D" [left])
  (define-key xterm-function-map "\e[1~" [home])
  (define-key xterm-function-map "\e[2~" [insert])
  (define-key xterm-function-map "\e[3~" [delete])
  (define-key xterm-function-map "\e[4~" [select])
  (define-key xterm-function-map "\e[5~" [prior])
  (define-key xterm-function-map "\e[6~" [next])
  (define-key xterm-function-map "\e[11~" [f1])
  (define-key xterm-function-map "\e[12~" [f2])
  (define-key xterm-function-map "\e[13~" [f3])
  (define-key xterm-function-map "\e[14~" [f4])
  (define-key xterm-function-map "\e[15~" [f5])
  (define-key xterm-function-map "\e[17~" [f6])
  (define-key xterm-function-map "\e[18~" [f7])
  (define-key xterm-function-map "\e[19~" [f8])
  (define-key xterm-function-map "\e[20~" [f9])
  (define-key xterm-function-map "\e[21~" [f10])
  (define-key xterm-function-map "\e[23~" [f11])
  (define-key xterm-function-map "\e[24~" [f12])
  (define-key xterm-function-map "\e[29~" [print])

  (define-key xterm-function-map "\eOP" [f1])
  (define-key xterm-function-map "\eOQ" [f2])
  (define-key xterm-function-map "\eOR" [f3])
  (define-key xterm-function-map "\eOS" [f4])

  (define-key xterm-function-map "\eO2P" [S-f1])
  (define-key xterm-function-map "\eO2Q" [S-f2])
  (define-key xterm-function-map "\eO2R" [S-f3])
  (define-key xterm-function-map "\eO2S" [S-f4])
  (define-key xterm-function-map "\e[15;2~" [S-f5])
  (define-key xterm-function-map "\e[17;2~" [S-f6])
  (define-key xterm-function-map "\e[18;2~" [S-f7])
  (define-key xterm-function-map "\e[19;2~" [S-f8])
  (define-key xterm-function-map "\e[20;2~" [S-f9])
  (define-key xterm-function-map "\e[21;2~" [S-f10])
  (define-key xterm-function-map "\e[23;2~" [S-f11])
  (define-key xterm-function-map "\e[24;2~" [S-f12])

  (define-key xterm-function-map "\eO5P" [C-f1])
  (define-key xterm-function-map "\eO5Q" [C-f2])
  (define-key xterm-function-map "\eO5R" [C-f3])
  (define-key xterm-function-map "\eO5S" [C-f4])
  (define-key xterm-function-map "\e[15;5~" [C-f5])
  (define-key xterm-function-map "\e[17;5~" [C-f6])
  (define-key xterm-function-map "\e[18;5~" [C-f7])
  (define-key xterm-function-map "\e[19;5~" [C-f8])
  (define-key xterm-function-map "\e[20;5~" [C-f9])
  (define-key xterm-function-map "\e[21;5~" [C-f10])
  (define-key xterm-function-map "\e[23;5~" [C-f11])
  (define-key xterm-function-map "\e[24;5~" [C-f12])

  (define-key xterm-function-map "\eO6P" [C-S-f1])
  (define-key xterm-function-map "\eO6Q" [C-S-f2])
  (define-key xterm-function-map "\eO6R" [C-S-f3])
  (define-key xterm-function-map "\eO6S" [C-S-f4])
  (define-key xterm-function-map "\e[15;6~" [C-S-f5])
  (define-key xterm-function-map "\e[17;6~" [C-S-f6])
  (define-key xterm-function-map "\e[18;6~" [C-S-f7])
  (define-key xterm-function-map "\e[19;6~" [C-S-f8])
  (define-key xterm-function-map "\e[20;6~" [C-S-f9])
  (define-key xterm-function-map "\e[21;6~" [C-S-f10])
  (define-key xterm-function-map "\e[23;6~" [C-S-f11])
  (define-key xterm-function-map "\e[24;6~" [C-S-f12])

  (define-key xterm-function-map "\eO3P" [A-f1])
  (define-key xterm-function-map "\eO3Q" [A-f2])
  (define-key xterm-function-map "\eO3R" [A-f3])
  (define-key xterm-function-map "\eO3S" [A-f4])
  (define-key xterm-function-map "\e[15;3~" [A-f5])
  (define-key xterm-function-map "\e[17;3~" [A-f6])
  (define-key xterm-function-map "\e[18;3~" [A-f7])
  (define-key xterm-function-map "\e[19;3~" [A-f8])
  (define-key xterm-function-map "\e[20;3~" [A-f9])
  (define-key xterm-function-map "\e[21;3~" [A-f10])
  (define-key xterm-function-map "\e[23;3~" [A-f11])
  (define-key xterm-function-map "\e[24;3~" [A-f12])

  (define-key xterm-function-map "\e[1;2A" [S-up])
  (define-key xterm-function-map "\e[1;2B" [S-down])
  (define-key xterm-function-map "\e[1;2C" [S-right])
  (define-key xterm-function-map "\e[1;2D" [S-left])
  (define-key xterm-function-map "\e[1;2F" [S-end])
  (define-key xterm-function-map "\e[1;2H" [S-home])

  (define-key xterm-function-map "\e[1;5A" [C-up])
  (define-key xterm-function-map "\e[1;5B" [C-down])
  (define-key xterm-function-map "\e[1;5C" [C-right])
  (define-key xterm-function-map "\e[1;5D" [C-left])
  (define-key xterm-function-map "\e[1;5F" [C-end])
  (define-key xterm-function-map "\e[1;5H" [C-home])

  (define-key xterm-function-map "\e[1;6A" [C-S-up])
  (define-key xterm-function-map "\e[1;6B" [C-S-down])
  (define-key xterm-function-map "\e[1;6C" [C-S-right])
  (define-key xterm-function-map "\e[1;6D" [C-S-left])
  (define-key xterm-function-map "\e[1;6F" [C-S-end])
  (define-key xterm-function-map "\e[1;6H" [C-S-home])

  (define-key xterm-function-map "\e[1;3A" [A-up])
  (define-key xterm-function-map "\e[1;3B" [A-down])
  (define-key xterm-function-map "\e[1;3C" [A-right])
  (define-key xterm-function-map "\e[1;3D" [A-left])
  (define-key xterm-function-map "\e[1;3F" [A-end])
  (define-key xterm-function-map "\e[1;3H" [A-home])

  (define-key xterm-function-map "\e[2;2~" [S-insert])
  (define-key xterm-function-map "\e[3;2~" [S-delete])
  (define-key xterm-function-map "\e[5;2~" [S-prior])
  (define-key xterm-function-map "\e[6;2~" [S-next])

  (define-key xterm-function-map "\e[2;5~" [C-insert])
  (define-key xterm-function-map "\e[3;5~" [C-delete])
  (define-key xterm-function-map "\e[5;5~" [C-prior])
  (define-key xterm-function-map "\e[6;5~" [C-next])

  (define-key xterm-function-map "\e[2;6~" [C-S-insert])
  (define-key xterm-function-map "\e[3;6~" [C-S-delete])
  (define-key xterm-function-map "\e[5;6~" [C-S-prior])
  (define-key xterm-function-map "\e[6;6~" [C-S-next])

  (define-key xterm-function-map "\e[2;3~" [A-insert])
  (define-key xterm-function-map "\e[3;3~" [A-delete])
  (define-key xterm-function-map "\e[5;3~" [A-prior])
  (define-key xterm-function-map "\e[6;3~" [A-next])

  (define-key xterm-function-map "\eOA" [up])
  (define-key xterm-function-map "\eOB" [down])
  (define-key xterm-function-map "\eOC" [right])
  (define-key xterm-function-map "\eOD" [left])
  (define-key xterm-function-map "\eOF" [end])
  (define-key xterm-function-map "\eOH" [home])

  (define-key xterm-function-map "\eO2A" [S-up])
  (define-key xterm-function-map "\eO2B" [S-down])
  (define-key xterm-function-map "\eO2C" [S-right])
  (define-key xterm-function-map "\eO2D" [S-left])
  (define-key xterm-function-map "\eO2F" [S-end])
  (define-key xterm-function-map "\eO2H" [S-home])

  (define-key xterm-function-map "\eO5A" [C-up])
  (define-key xterm-function-map "\eO5B" [C-down])
  (define-key xterm-function-map "\eO5C" [C-right])
  (define-key xterm-function-map "\eO5D" [C-left])
  (define-key xterm-function-map "\eO5F" [C-end])
  (define-key xterm-function-map "\eO5H" [C-home]))

;; Use inheritance to let the main keymap override those defaults.
;; This way we don't override terminfo-derived settings or settings
;; made in the .emacs file.
(let ((m (copy-keymap xterm-function-map)))
  (set-keymap-parent m (keymap-parent (terminal-local-value 'function-key-map nil)))
  (set-keymap-parent (terminal-local-value 'function-key-map nil) m))

;; Set up colors, for those versions of xterm that support it.
(defvar xterm-standard-colors
  ;; The names in the comments taken from XTerm-col.ad in the xterm
  ;; distribution, see ftp://dickey.his.com/xterm/.  RGB values are
  ;; from rgb.txt.
  '(("black"          0 (  0   0   0))	; black
    ("red"            1 (205   0   0))	; red3
    ("green"          2 (  0 205   0))	; green3
    ("yellow"         3 (205 205   0))	; yellow3
    ("blue"           4 (  0   0 238))	; blue2
    ("magenta"        5 (205   0 205))	; magenta3
    ("cyan"           6 (  0 205 205))	; cyan3
    ("white"          7 (229 229 229))	; gray90
    ("brightblack"    8 (127 127 127))	; gray50
    ("brightred"      9 (255   0   0))	; red
    ("brightgreen"   10 (  0 255   0))	; green
    ("brightyellow"  11 (255 255   0))	; yellow
    ("brightblue"    12 (92   92 255))	; rgb:5c/5c/ff
    ("brightmagenta" 13 (255   0 255))	; magenta
    ("brightcyan"    14 (  0 255 255))	; cyan
    ("brightwhite"   15 (255 255 255)))	; white
  "Names of 16 standard xterm/aixterm colors, their numbers, and RGB values.")

(defun xterm-rgb-convert-to-16bit (prim)
  "Convert an 8-bit primary color value PRIM to a corresponding 16-bit value."
  (logior prim (lsh prim 8)))

(defun xterm-register-default-colors ()
  "Register the default set of colors for xterm or compatible emulator.

This function registers the number of colors returned by `display-color-cells'
for the currently selected frame.  The first 16 colors are taken from
`xterm-standard-colors', which see, while the rest are computed assuming
either the 88- or 256-color standard color scheme supported by latest
versions of xterm."
  (let* ((ncolors (display-color-cells (selected-frame)))
	 (colors xterm-standard-colors)
	 (color (car colors)))
    (if (> ncolors 0)
	;; Clear the 8 default tty colors registered by startup.el
	(tty-color-clear))
    ;; Only register as many colors as are supported by the display.
    (while (and (> ncolors 0) colors)
      (tty-color-define (car color) (cadr color)
			(mapcar 'xterm-rgb-convert-to-16bit
				(car (cddr color))))
      (setq colors (cdr colors)
	    color (car colors)
	    ncolors (1- ncolors)))
    ;; We've exhausted the colors from `xterm-standard-colors'.  If there
    ;; are more colors to support, compute them now.
    (when (> ncolors 0)
      (cond
       ((= ncolors 240)	; 256-color xterm
	;; 216 non-gray colors first
	(let ((r 0) (g 0) (b 0))
	  (while (> ncolors 24)
	    ;; This and other formulae taken from 256colres.pl and
	    ;; 88colres.pl in the xterm distribution.
	    (tty-color-define (format "color-%d" (- 256 ncolors))
			      (- 256 ncolors)
			      (mapcar 'xterm-rgb-convert-to-16bit
				      (list (if (zerop r) 0 (+ (* r 40) 55))
					    (if (zerop g) 0 (+ (* g 40) 55))
					    (if (zerop b) 0 (+ (* b 40) 55)))))

	    (setq b (1+ b))
	    (if (> b 5)
		(setq g (1+ g)
		      b 0))
	    (if (> g 5)
		(setq r (1+ r)
		      g 0))
	    (setq ncolors (1- ncolors))))
	;; Now the 24 gray colors
	(while (> ncolors 0)
	  (setq color (xterm-rgb-convert-to-16bit (+ 8 (* (- 24 ncolors) 10))))
	  (tty-color-define (format "color-%d" (- 256 ncolors))
			    (- 256 ncolors)
			    (list color color color))
	  (setq ncolors (1- ncolors))))
       ((= ncolors 72)  ; 88-color xterm
	;; 64 non-gray colors
	(let ((levels '(0 139 205 255))
	      (r 0) (g 0) (b 0))
	  (while (> ncolors 8)
	    (tty-color-define (format "color-%d" (- 88 ncolors))
			      (- 88 ncolors)
			      (mapcar 'xterm-rgb-convert-to-16bit
				      (list (nth r levels)
					    (nth g levels)
					    (nth b levels))))
	    (setq b (1+ b))
	    (if (> b 3)
		(setq g (1+ g)
		      b 0))
	    (if (> g 3)
		(setq r (1+ r)
		      g 0))
	    (setq ncolors (1- ncolors))))
	;; Now the 8 gray colors
	(while (> ncolors 0)
	  (setq color (xterm-rgb-convert-to-16bit
		       (floor
			(if (= ncolors 8)
			    46.36363636
			  (+ (* (- 8 ncolors) 23.18181818) 69.54545454)))))
	  (tty-color-define (format "color-%d" (- 88 ncolors))
			    (- 88 ncolors)
			    (list color color color))
	  (setq ncolors (1- ncolors))))
       (t (error "Unsupported number of xterm colors (%d)" (+ 16 ncolors)))))
    ;; Modifying color mappings means realized faces don't use the
    ;; right colors, so clear them.
    (clear-face-cache)))

;; rxvt puts the default colors into an environment variable
;; COLORFGBG.  We use this to set the background mode in a more
;; intelligent way than the default guesswork in startup.el.
(defun xterm-rxvt-set-background-mode ()
  "Set background mode as appropriate for the default rxvt colors."
  (let ((fgbg (server-getenv "COLORFGBG"))
	bg rgb)
    (setq default-frame-background-mode 'light)
    (when (and fgbg
	       (string-match ".*;\\([0-9][0-9]?\\)\\'" fgbg))
      (setq bg (string-to-number (substring fgbg (match-beginning 1))))
      ;; The next line assumes that xterm-standard-colors are ordered
      ;; by the color index in the ascending order!
      (setq rgb (car (cddr (nth bg xterm-standard-colors))))
      ;; See the commentary in frame-set-background-mode about the
      ;; computation below.
      (if (< (apply '+ rgb)
	     ;; The following line assumes that white is the 15th
	     ;; color in xterm-standard-colors.
	     (* (apply '+ (car (cddr (nth 15 xterm-standard-colors)))) 0.6))
	  (setq default-frame-background-mode 'dark)))
    (frame-set-background-mode (selected-frame))))

;; Do it!
(xterm-register-default-colors)
;; If this xterm is actually a disguised rxvt, be more intelligent about
;; determining the background mode.
(and (server-getenv "COLORTERM")
     (string-match "\\`rxvt" (server-getenv "COLORTERM"))
     (xterm-rxvt-set-background-mode))
;; This recomputes all the default faces given the colors we've just set up.
(tty-set-up-initial-frame-faces)

;; arch-tag: 12e7ebdd-1e6c-4b25-b0f9-35ace25e855a
;;; xterm.el ends here
