;	$Id$	

(define (wiki-convert-sky-chart in-filename out-filename-base number-colors)
  (file-ps-load-setargs 300 0 0 1 "1" 6 4 4)
  (let* ((img (car (file-ps-load 1 in-filename in-filename)))
	 (drawable (car (gimp-image-active-drawable img)))
	 (image-width (car (gimp-image-width img)))
	 (image-height (car (gimp-image-height img)))
	 (out-filename (string-append out-filename-base ".png"))
	 (img-small (car (file-ps-load 1 in-filename in-filename)))
	 (drawable-small (car (gimp-image-active-drawable img-small)))
	 (out-filename-small (string-append out-filename-base "_small.png")))
    (gimp-image-scale img (* image-width 0.4) (* image-height 0.4))
    (gimp-image-scale img-small (* image-width 0.28) (* image-height 0.28))
    (gimp-image-set-resolution img 120 120)
    (gimp-image-set-resolution img-small 120 120)
    (plug-in-sharpen 1 img-small drawable-small 50)
    (gimp-convert-indexed img 0 0 number-colors 0 1 "")
    (gimp-convert-indexed img-small 0 0 number-colors 0 1 "")
    (file-png-save 1 img drawable out-filename out-filename 0 9 0 0 0 1 1)
    (if (> (* image-width 0.4) 300) (file-png-save 1 img-small drawable-small 
		   out-filename-small out-filename-small 0 9 0 0 0 1 1)))
)

(script-fu-register
 "wiki-convert-sky-chart"
 _"<Toolbox>/Xtns/Script-Fu/Misc/Wiki..."
 "Wiki Convert Sky Chart, (c) 2003 Torsten Bronger <bronger@physik.rwth-aachen.de>"
 "Torsten Bronger"
 "Torsten Bronger"
 "2003-08-14"
 ""
 SF-VALUE "Input filename" "leo.eps"
 SF-VALUE "Output filename without extension" "leo_constellation_map"
 SF-VALUE "Number of output colors" "64"
)
