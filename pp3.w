%       $Id$    

@q======================================================================@>
@q    pp3.w - Star Catalog Chart Creator                                @>
@q    Copyright 2003 Torsten Bronger <bronger@@users.sourceforge.net>   @>
@q                                                                      @>
@q  This program may be distributed and/or modified under the           @>
@q  conditions of the MIT licence with the following contraint:         @>
@q  If you copy or distribute a modified version of this Software, the  @>
@q  entire resulting derived work must be given a different name and    @>
@q  distributed under the terms of a permission notice identical to     @>
@q  this one.                                                           @>
@q                                                                      @>
@q  For the full licence see below under "*LICENCE*" or the printed     @>
@q  version of this program.                                            @>
@q                                                                      @>
@q  To get a compilable C++ source code, use                            @>
@q       ctangle pp3.w - pp3.cc                                         @>
@q  To get a structured documentation of the program, use               @>
@q       cweave pp3.w                                                   @>
@q       tex pp3                                                        @>
@q                                                                      @>
@q  cweave and ctangle belong to the cweb system by Levy/Knuth.         @>
@q  Further information can be obtained at                              @>
@q       http://www-cs-faculty.stanford.edu/~knuth/cweb.html            @>
@q======================================================================@>

\catcode`@@=11

% First the default font setup

\font\ninett=cmtt9
\font\nineit=cmti9

\font\stitlefont=cmss10 scaled\magstep3      % sans serif type in title
\font\sbtitlefont=cmssbx10 scaled\magstep3   % sans bold type in title
\font\sf=cmss10 \font\sfbf=cmssbx10
\font\sfa=cmss7

%% From here with Palatino
\font\tenrm=pplr7t % roman text
\font\ninerm=pplr7t scaled 900
\font\eightrm=pplr7t scaled 800
\font\sevenrm=pplr7t scaled 700
\font\fiverm=pplr7t scaled 500

\font\teni=zplmr7m % math italic    (zptmcm7m for Times, zplmr7m for Palatino)
\font\seveni=zplmr7m scaled 700
\font\fivei=zplmr7m scaled 500

\font\tensy=zplmr7y % math symbols  (zptmcm7y for Times, zplmr7y for Palatino)
\font\sevensy=zplmr7y scaled 700
\font\fivesy=zplmr7y scaled 500

\font\tenex=zplmr7v % math extension (zptmcm7v for Times, zplmr7v f. Palatino)

\font\tenbf=pplb7t % boldface extended
\font\sevenbf=pplb7t scaled 700
\font\fivebf=pplb7t scaled 500

\font\tentt=cmtt10 % typewriter
\font\ninett=cmtt9 % typewriter

\font\tensl=pplro7t % slanted roman

\font\tenit=pplri7t % text italic

\skewchar\teni='177 \skewchar\seveni='177 \skewchar\fivei='177
\skewchar\tensy='60 \skewchar\sevensy='60 \skewchar\fivesy='60

\textfont0=\tenrm \scriptfont0=\sevenrm \scriptscriptfont0=\fiverm
\def\rm{\fam\z@@\tenrm}
\textfont1=\teni \scriptfont1=\seveni \scriptscriptfont1=\fivei
\def\mit{\fam\@@ne} \def\oldstyle{\fam\@@ne\teni}
\textfont2=\tensy \scriptfont2=\sevensy \scriptscriptfont2=\fivesy
\def\cal{\fam\tw@@}
\textfont3=\tenex \scriptfont3=\tenex \scriptscriptfont3=\tenex
\newfam\itfam \def\it{\fam\itfam\tenit} % \it is family 4
\textfont\itfam=\tenit
\newfam\slfam \def\sl{\fam\slfam\tensl} % \sl is family 5
\textfont\slfam=\tensl
\newfam\bffam \def\bf{\fam\bffam\tenbf} % \bf is family 6
\textfont\bffam=\tenbf \scriptfont\bffam=\sevenbf
\scriptscriptfont\bffam=\fivebf
\newfam\ttfam \def\tt{\fam\ttfam\tentt} % \tt is family 7
\textfont\ttfam=\tentt

\catcode`@@=12

\font\eightpplr=pplr7t scaled 800
\font\ninepplr=pplr7t scaled 900
\font\ninepplri=pplri7t scaled 900
\font\tenpplr=pplr7t
\font\tenpplb=pplb7t
\font\tenpplri=pplri7t
\font\titlefont=pplr7t scaled 1728 % title on the contents page
\font\ttitlefont=cmtt10 scaled\magstep2 % typewriter type in title
\font\tentex=cmtex10 % TeX extended character set (used in strings)
\fontdimen7\tentex=0pt % no double space after sentences

\let\mainfont=\tenpplr
\let\sc=\ninepplr
\let\mc=\ninepplr
\let\it=\tenpplri
\let\nineit=\ninepplri
\let\tt=\tentt
\let\cmntfont\tenpplr

\mainfont\baselineskip12.7pt

%% Now for the title page

\font\sf=bfrr8t \font\sfbf=bfrb8t
\font\sfa=bfrr8t scaled 700

\font\stitlefont=phvr7t scaled\magstep3    % sans serif type in title
\font\sbtitlefont=phvb7t scaled\magstep3   % sans bold type in title
\font\ttitlefont=pcrb7t scaled\magstep3    % typewriter type in title

\font\stitlefont=bfrr8t scaled\magstep3    % sans serif type in title
\font\sbtitlefont=bfrb8t scaled\magstep3   % sans serif type in title
%\font\sbtitlefont=0t3x8r scaled\magstep3   % sans bold type in title
%\font\sf=0t3r8r \font\sfbf=0t3b8r
%\font\sfa=0t3r8r scaled 700


\hyphenation{white-space}

\secpagedepth=1
\def\TeX{T\kern-.1667em\lower.5ex\hbox{E}\kern-.125emX}
\def\LaTeX{L\kern-.36em%
        {\setbox0=\hbox{T}%
         \vbox to\ht0{\hbox{\sevenrm A}\vss}%
        }%
        \kern-.15em%
        \TeX}
\def\LaTeXbf{L\kern-.36em%
        {\setbox0=\hbox{T}%
         \vbox to\ht0{\hbox{\sevenbf A}\vss}%
        }%
        \kern-.15em%
        \TeX}
\def\AMSinner{\cal A\mkern-2mu\raise-0.5ex\hbox{$\cal M$}\mkern-2muS}
\def\AMS{\ifmmode\AMSinner\else$\AMSinner$\fi}
\def\BSC/{{\mc BSC\spacefactor1000}}
\def\HSB/{{\mc HSB\spacefactor1000}}
\def\EPS/{{\mc EPS\spacefactor1000}}
\def\PS/{{\mc PS\spacefactor1000}}
\def\PDF/{{\mc PDF\spacefactor1000}}
\def\RGB/{{\mc RGB\spacefactor1000}}
\def\NGC/{{\mc NGC\spacefactor1000}}
\def\IC/{{\mc IC\spacefactor1000}}
\def\HD/{{\mc HD\spacefactor1000}}

\def\sloppy{\tolerance9999\emergencystretch3em\hfuzz .5pt\vfuzz\hfuzz}

\def\title{PP3 (Version 1.2)}
\def\topofcontents{\null\vfill\vskip-1.5cm
  \centerline{\titlefont The Sky Map Creator 
               {\sbtitlefont PP\lower.35ex\hbox{3}}}
  \vskip 15pt
  \centerline{(Version 1.2)}
  \vfill}
\def\botofcontents{\parindent2em\vfill\vfill\vfill\vfill\vfill
\noindent
%
%                                *LICENCE*
%
%
Copyright \copyright\ 2003 Torsten Bronger
                           ({\tt bronger@@users.sourceforge.net})
\ninerm\baselineskip0.9\baselineskip\let\it\nineit
\bigskip\noindent
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the ``Software''), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

\leftskip1cm\rightskip\leftskip
\medskip\noindent
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

If you copy or distribute a modified version of this Software, the entire
resulting derived work must be given a different name and distributed under the
terms of a permission notice identical to this one. 

\leftskip0cm\rightskip\leftskip\bigskip\noindent
The Software is provided ``as~is'', without warranty of any kind, express or
implied, including but not limited to the warranties of {\it merchantability},
{\it fitness for a particular purpose\/} and {\it noninfringement}.  In no
event shall the authors or copyright holders be liable for any claim, damages
or other liability, whether in an action of contract, tort or otherwise,
arising from, out of or in connection with the Software or the use or other
dealings in the Software.\vskip-1cm}

\def\PPTHREE/{{\sf PP\lower.35ex\hbox{3}}}

@i c++lib.w
@s ios int

@** Introduction.  \ifpdftex (Please note that you can find a table of contents
at the end of this document). \fi This program \PPTHREE/ (``parvum
planetarium'') takes the data of various celestial data files and turns them
into a \LaTeX\ file that uses \PS/Tricks to draw a nice sky chart containing a
certain region of the sky.  Current versions are available on its
\pdfURL{homepage}{http://pp3.sourceforge.net}.

You call \PPTHREE/ with e.\,g.\medskip

\.{pp3 mychart.pp3}

\medskip\noindent The data files (\.{stars.dat}, \.{nebulae.dat},
\.{boundaries.dat}, \.{labeldimens.dat}, \.{lines.dat}, and
\.{milkyway}\hskip0pt\.{.dat}) must be in the current directory.  The resulting
chart is by default sent to standard output which you may redirect into a file.
But you can define an output filename explicitly in the input script.

If you want to use other data with this program, you may well provide your own
catalogue files.  Their file formats are very simple, and they are explained in
this document together with the respective |read_@t\dots@>()| function.

If you give a single dash ``\.{-}'' as the only parameter to \PPTHREE/, the
input script is read from standard input.  So if you write\medskip

\.{pp3 - > test.tex \AM\AM{} latex test \AM\AM{} dvips test}

\medskip\noindent and type \.{\CF D} (\hbox{Control-D})\footnote{$^1$}{it's
Control-Z-Return on Windows}, a file \.{test.ps} should be produced that
contains a sample chart.

Very important is to know how to write an input script.  Please consult the
following section ``The input script'' for this.  Here is an example input
script: \medskip

{\parindent2em\baselineskip10.5pt\ninett\obeylines\obeyspaces
\# Chart of the Scorpion, printable on a 
\# black and white printing device
\vskip\baselineskip
set constellation SCO           \# This is highlighted
set center\UL{}rectascension   17
set center\UL{}declination    -28
set grad\UL{}per\UL{}cm             2.5
\vskip\baselineskip
switch milky\UL{}way on
switch eps\UL{}output on            \# Please call LaTeX and dvips for us
switch colored\UL{}stars off        \# All the same colour ...
color stars 0 0 0               \# ...\ namely this one
color nebulae 0 0 0
color background 1 1 1
color grid 0.5 0.5 0.5
color ecliptic 0.3 0.3 0.3
color constellation\UL{}lines 0.7 0.7 0.7
color labels 0 0 0
color boundaries 0.8 0.8 0.8
color highlighted\UL{}boundaries 0 0 0
color milky\UL{}way 0.5 0.5 0.5
\vskip\baselineskip
filename output test.tex        \# Here should it go
\vskip\baselineskip
\vskip\baselineskip
objects\UL{}and\UL{}labels              \# Now for the second part
\vskip\baselineskip
delete M 18  NGC 6590  NGC 6634 ;  \# Delete superfluous
reposition SCO 20 S ;           \# Force sig Sco to be labelled.
text "\BS\BS{}Huge Sco" at 16.2 -41.5 color 0 0 0 towards NW ;
}

@ The resulting \LaTeX\ file doesn't use packages special to \PPTHREE/.  In
fact the preamble is rather small.  This makes it possible to copy the (maybe
huge) \.{\BS vbox} with the complete map into an own \LaTeX\ file.  However
this may be a stupid decision because (especially if the Milky Way is switched
on) this consumes much of \TeX's pool size.

Some \PPTHREE/ figures will need a lot of \TeX's memory.  Normally this is
problematic only if the Milky Way is included.  If you show a too large portion
of the sky, and a lot of Milky Way area is involved, it may even happen that
\LaTeX\ simply cannot process it.  You should use Milky Way data with lower
resolution in this case.

Make sure that the \PS/Tricks package is properly installed.

Please note that you cannot use pdf\/\LaTeX\ with \PPTHREE/, because \PS/Tricks
can't be used with pdf\/\LaTeX\spacefactor1000.  This is not a problem.  First,
you can convert all \EPS/ files easily to \PDF/ by hand, and secondly \PPTHREE/
can even call \PS/2\PDF/ for you.

@ In order to use the program, you must have a complete and modern \LaTeX\
distribution installed, and a modern Ghostscript.  On a Linux system, both
programs are possibly already available, and if not you may install them with a
package management program.

{\sloppy On Windows, you will probably have to install them by hand.  You can
download the \pdfURL{Mik\TeX\ distribution}{http://www.miktex.org} or get the
\pdfURL{\TeX{}Live~{\mc CD}}{http://www.tug.org/texlive/}\spacefactor1000.  If
you install
\pdfURL{Ghostscript}{http://www.cs.wisc.edu/\TILDE/ghost/doc/AFPL/get704.htm},
notice that \pdfURL{{\mc
GS}View}{http://www.cs.wisc.edu/\TILDE/ghost/gsview/get43.htm} is a very
sensible program, too.\par}

@ Some flaws and bugs in this program are already known to its author.

The input script processing is shaky.  The comment character `\.{\#}' must be
at the beginning of a line or must be preceded by whitespace.  The special
token ``\.{objects\UL and\UL labels}'' must not occur within strings.  If an
error is found in the input script, \PPTHREE/ doesn't tell the line number.  It
should be possible to include more than one file, and it should allow for a
nesting depth greater than one.

At the moment almost all data structures are kept in memory completely.  For
the author's needs this is perfectly sufficient, however if you want to use
data bases with hundreds of thousands of objects, you will run into trouble.
On the other hand it's only necessary to keep all object in memory that are
actually drawn.  So memory usage could be reduced drastically.
 
@ Okay, let's start with the header files~\dots

@q'}}}}@>

@c
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <vector>
#include <map>
#include <list>
#include <iomanip>
#include <cstdlib>
#include <cmath>
#include <cfloat>@#

using namespace std;

@* Global parameters and default values.  I have to break a strict \CPLUSPLUS/
rule here: Never use \hbox{|#@t\hskip-\fontdimen2\mainfont@>define|}!  However
I really found no alternative to~|OUT|.  No |const| construct worked, and if it
had done, I'd have to use it in every single routine.  And ubiquitous
|*params.out|'s are ugly.

@d OUT (*params.out)


@ The following makes it possible to compile a directory prefix into \PPTHREE/
for the data files.  By default, the data files must be in the current
directory.  You may say e.\,g.\ $$\hbox{\.{g++
-DPP3DATA=\BS"/usr/share/pp3/\BS" -O2 -s pp3.cc -o pp3}}$$ then they are
searched in \.{/usr/share/pp3/}.  If set, an environment variable called
\.{PP3DATA} has highest priority though.

\def\NULL{0}

@s NULL TeX

@c
const char* pp3data_env_raw = getenv("PP3DATA");
const string pp3data_env = (pp3data_env_raw == NULL ?
                            "" : pp3data_env_raw);
#ifdef PP3DATA
const string pp3data(PP3DATA);
#else
const string pp3data;
#endif
const string filename_prefix(!pp3data_env.empty() ?
                             pp3data_env + '/' : (pp3data.empty() ?
                                                  "" : pp3data + "/"));


@ I declare {\it and\/} define the structure |parameters| here.

@c
@<Define |color| data structure@>@;@#

struct parameters {
    double center_rectascension, center_declination;
    double view_frame_width, view_frame_height;
    double grad_per_cm;
    double label_skip, minimal_nebula_radius, faintest_cluster_magnitude,
        faintest_diffuse_nebula_magnitude, faintest_star_magnitude,
        star_scaling, minimal_star_radius, faintest_star_disk_magnitude,
        faintest_star_with_label_magnitude, shortest_constellation_line;
    string constellation;
    int font_size;
    double penalties_label, penalties_star, penalties_nebula,
        penalties_boundary, penalties_boundary_rim, penalties_cline,
        penalties_cline_rim, penalties_threshold, penalties_rim;
    string filename_stars, filename_nebulae, filename_dimensions,
        filename_lines, filename_boundaries, filename_milkyway,
        filename_preamble, filename_include;
    string filename_output;
    ostream* out;
    istream* in;
    bool input_file;
    color bgcolor, gridcolor, eclipticcolor, boundarycolor, hlboundarycolor,
        starcolor, nebulacolor, labelcolor, textlabelcolor, clinecolor, 
        milkywaycolor;
    double linewidth_grid, linewidth_ecliptic, linewidth_boundary,
        linewidth_hlboundary, linewidth_cline, linewidth_nebula;
    string linestyle_grid, linestyle_ecliptic, linestyle_boundary,
        linestyle_hlboundary, linestyle_cline, linestyle_nebula;
    bool milkyway_visible, colored_stars, show_grid, show_ecliptic,
        show_boundaries, show_lines, show_labels;
    bool create_eps, create_pdf;
    parameters() : @<Default values of all global parameters@> { }
    int view_frame_width_in_bp() {
        return int(ceil(view_frame_width / 2.54 * 72));
    }
    int view_frame_height_in_bp() {
        return int(ceil(view_frame_height / 2.54 * 72));
    }
} params;

@ @<Default values of all global parameters@>=
center_rectascension(5.8), center_declination(0.0),
                   view_frame_width(15.0), view_frame_height(15.0),
                   grad_per_cm(4.0),
                   constellation("ORI"), font_size(10), @/
                   label_skip(0.06), minimal_nebula_radius(0.1),
                   faintest_cluster_magnitude(4.0),
                   faintest_diffuse_nebula_magnitude(8.0),
                   faintest_star_magnitude(7.0), star_scaling(1.0),
                   minimal_star_radius(0.015),
                   faintest_star_disk_magnitude(4.5),
                   faintest_star_with_label_magnitude(3.7),
                   shortest_constellation_line(0.1), @/
                   penalties_label(1.0), penalties_star(1.0),
                   penalties_nebula(1.0), penalties_boundary(1.0),
                   penalties_boundary_rim(1.0), penalties_cline(1.0),
                   penalties_cline_rim(1.0), penalties_threshold(1.0),
                   penalties_rim(1.0), @/
                   filename_stars(filename_prefix + "stars.dat"),
                   filename_nebulae(filename_prefix + "nebulae.dat"),
                   filename_dimensions("labeldimens.dat"),
                   filename_lines(filename_prefix + "lines.dat"),
                   filename_boundaries(filename_prefix + "boundaries.dat"),
                   filename_milkyway(filename_prefix + "milkyway.dat"), @/
                   filename_preamble(), filename_include(), 
                   filename_output(), out(&cout), in(0), input_file(false), @/
                   bgcolor("bgcolor", 0, 0, 0.4),
                   gridcolor("gridcolor", 0, 0.298, 0.447),
                   eclipticcolor("eclipticcolor", 1, 0, 0),
                   boundarycolor("boundarycolor", 0.5, 0.5, 0),
                   hlboundarycolor("hlboundarycolor", 1, 1, 0),
                   starcolor("starcolor", 1, 1, 1),
                   nebulacolor("nebulacolor", 1, 1, 1),
                   labelcolor("labelcolor", 0, 1, 1),
                   textlabelcolor(1, 1, 0),
                   clinecolor("clinecolor", 0, 1, 0),
                   milkywaycolor(0, 0, 1), @/
                   linewidth_grid(0.025), linewidth_ecliptic(0.018),
                   linewidth_boundary(0.035), linewidth_hlboundary(0.035),
                   linewidth_cline(0.035), linewidth_nebula(0.018), @/
                   linestyle_grid("solid"), linestyle_ecliptic("dashed"),
                   linestyle_boundary("dashed"),
                   linestyle_hlboundary("dashed"), linestyle_cline("solid"),
                   linestyle_nebula("solid"), @/
                   milkyway_visible(true),
                   colored_stars(true),
                   show_grid(true), show_ecliptic(true), show_boundaries(true),
                   show_lines(true), show_labels(true), @/
                   create_eps(false),
                   create_pdf(false)


@** The input script.  The input script is a text file that is given as the
first and only parameter to \PPTHREE/.  Its format is very simple: First, a
`\.{\#}' introduces a comment and the rest of the line is ignored.  Secondly,
every command has an opcode--parameter(s) form.  Thirdly, opcodes and
parameters are separated by whitespace (no matter which type and how much).
Forthly, parameters and celestial objects must be separated by
``\.{objects\_and\_labels}''.

@* Part~I: Global parameters.  Every input script can be divided into two
parts, however the second may be absent.  They are separated from each other by
the token ``\.{objects\_and\_labels}''.  Here we process the first part of the
input script.

First two small helping routines that just read simple values from the file.

@q'@>

@<Routines for reading the input script@>=
bool read_boolean(istream& script) {
    string boolean;
    script >> boolean;
    if (boolean == "on") return true;
    else if (boolean == "off") return false;
    else throw string("Expected \"on\" or \"off\" in \"switch\" construct "
                      "in input script");
}

@ You can give strings in a similar way as on a shell command line:  If it
doesn't contain spaces, just input it.  In the other case you have to enclose
it within \.{"..."}.  The same is necessary if it starts with a~\.{"}.  Within
the double braces, backslashes and double braces have to be escaped with a
backslash.  This is not necessary if you had a simple string.

So you may write e.\,g.: \.{Leo}, \.{"Leo Minor"}, \.{\BS alpha}, and
\.{"\LB\BS\BS sfseries Leo\RB"}.  An empty string can only be written as
\.{""}.

@q'@>

@<Routines for reading the input script@>=
string read_string(istream& script) {
    const string UnexpectedEOS("Unexpected end of input script while reading a"
                               " string parameter");
    char c;
    string contents;
    while (script.get(c)) if (!isspace(c)) break;
    if (!script) throw UnexpectedEOS;
    if (c != '"') {
        script >> contents;
        if (script) contents.insert(contents.begin(),c); else contents = c;
    } else {
        while (script.get(c)) {
            if (c == '"') break;
            if (c == '\\') {
                if (!script.get(c))
                    throw UnexpectedEOS;
                switch (c) {
                case '\\': case '"': contents += c; break;
                default: throw string("Unknown escape sequence in string");
                }
            } else contents += c;
        }
        if (!script)
            throw UnexpectedEOS;
    }
    return contents;
}

@ {\sloppy Here the actual routine for this first part.  The top-level keywords
are: ``\.{color}'', ``\.{line\_width}'', ``\.{line\_style}'', ``\.{switch}'',
``\.{penalties}'', ``\.{filename}'', and ``\.{set}''.\par}

@.color@>
@.line\_width@>
@.line\_style@>
@.switch@>
@.penalties@>
@.filename@>
@.set@>

@<Routines for reading the input script@>=
void read_parameters_from_script(istream& script) {
    string opcode;
    script >> opcode;
    while (opcode != "objects_and_labels" && script) {
        if (opcode[0] == '#') {   // skip comment line
            string rest_of_line;
            getline(script,rest_of_line);
        } else
            @<Set color parameters@>@;
        else
            @<Set line widths@>@;
        else
            @<Set line styles@>@;
        else
            @<Set on/off parameters@>@;
        else
            @<Set penalty parameters@>@;
        else
            @<Set filename parameters@>@;
        else
            @<Set single value parameters@>@;
        else throw string("Undefined opcode in input script: \"") 
                 + opcode + '"';
        script >> opcode;
    }       
}

@ {\sloppy Colours are given as red--green--blue values from $0$ to~$1$.  For example,
$$\hbox{\.{color labels 1 0 0}}$$ which makes all labels red.  The following
sub-keywords can be used: ``\.{background}'', ``\.{grid}'',
``\.{eclip}\-\.{tic}'', ``\.{boundaries}'', ``\.{highlighted\_boundaries}'',
``\.{stars}'', ``\.{nebulae}'', ``\.{labels}'',
``\.{text\_}\hskip0pt\.{labels}'', ``\.{constellation\_}\hskip0pt\.{lines}'',
and ``\.{milky\_way}''.  In case of the milky way, the colour denotes the
brightest regions.  (The darkest have \.{back}\-\.{ground} colour.)\par}

@.color@>
@.background@>
@.grid@>
@.ecliptic@>
@.boundaries@>
@.highlighted\_boundaries@>
@.stars@>
@.nebulae@>
@.labels@>
@.text\_labels@>
@.constellation\_lines@>
@.milky\_way@>

@<Set color parameters@>=
        if (opcode == "color") {
            string color_name;
            script >> color_name;
            if (color_name == "background") script >> params.bgcolor;
            else if (color_name == "grid") script >> params.gridcolor;
            else if (color_name == "ecliptic") script >> params.eclipticcolor;
            else if (color_name == "boundaries")
                script >> params.boundarycolor;
            else if (color_name == "highlighted_boundaries")
                script >> params.hlboundarycolor;
            else if (color_name == "stars") script >> params.starcolor;
            else if (color_name == "nebulae") script >> params.nebulacolor;
            else if (color_name == "labels") script >> params.labelcolor;
            else if (color_name == "text_labels") 
                script >> params.textlabelcolor;
            else if (color_name == "constellation_lines")
                script >> params.clinecolor;
            else if (color_name == "milky_way") script >> params.milkywaycolor;
            else throw string("Undefined \"color\" construct"
                              " in input script: \"") + color_name + '"';
        }

@ {\sloppy\raggedright The following lines can be modified: ``\.{grid}'',
``\.{ecliptic}'', ``\.{boundaries}'',
``\.{highlighted\_}\hskip0pt\.{boundaries}'', ``\.{nebulae}'', and
``\.{constellation\_lines}''.  The linewidth in centimetres must follow.\par}

@.line\_width@>
@.grid@>
@.ecliptic@>
@.boundaries@>
@.highlighted\_boundaries@>
@.nebulae@>
@.constellation\_lines@>

@<Set line widths@>=
        if (opcode == "line_width") {
            string line_name;
            script >> line_name;
            if (line_name == "grid") script >> params.linewidth_grid;
            else if (line_name == "ecliptic")
                script >> params.linewidth_ecliptic;
            else if (line_name == "boundaries")
                script >> params.linewidth_boundary;
            else if (line_name == "highlighted_boundaries")
                script >> params.linewidth_hlboundary;
            else if (line_name == "nebulae")
                script >> params.linewidth_nebula;
            else if (line_name == "constellation_lines")
                script >> params.linewidth_cline;
            else throw string("Undefined \"line_width\" construct"
                              " in input script: \"") + line_name + '"';
        }

@ {\sloppy\raggedright The following lines can be modified: ``\.{grid}'',
``\.{ecliptic}'', ``\.{boundaries}'',
``\.{highlighted\_}\hskip0pt\.{boundaries}'', ``\.{nebulae}'', and
``\.{constellation\_lines}''.  You can set the respective line style to
``\.{solid}'', ``\.{dashed}'', and ``\.{dotted}''.\par}

@.line\_style@>
@.solid@>
@.dashed@>
@.dotted@>
@.grid@>
@.ecliptic@>
@.boundaries@>
@.highlighted\_boundaries@>
@.nebulae@>
@.constellation\_lines@>

@<Set line styles@>=
        if (opcode == "line_style") {
            string line_name;
            script >> line_name;
            if (line_name == "grid") script >> params.linestyle_grid;
            else if (line_name == "ecliptic")
                script >> params.linestyle_ecliptic;
            else if (line_name == "boundaries")
                script >> params.linestyle_boundary;
            else if (line_name == "highlighted_boundaries")
                script >> params.linestyle_hlboundary;
            else if (line_name == "nebulae")
                script >> params.linestyle_nebula;
            else if (line_name == "constellation_lines")
                script >> params.linestyle_cline;
            else throw string("Undefined \"line_width\" construct"
                              " in input script: \"") + line_name + '"';
        }


@ {\sloppy There are the following boolean values: ``\.{milky\_may}'',
``\.{colored\_stars}'', ``\.{grid}'', ``\.{ecliptic}'', ``\.{boundaries}'',
``\.{constellation\_lines}'', ``\.{labels}'', ``\.{eps\_output}'', and
``\.{pdf\_output}''.  You can switch them ``\.{on}'' or ``\.{off}''.\par}

@.switch@>
@.on@>
@.off@>
@.milky\_way@>
@.colored\_stars@>
@.grid@>
@.ecliptic@>
@.boundaries@>
@.constellation\_lines@>
@.labels@>
@.eps\_output@>
@.pdf\_output@>

@<Set on/off parameters@>=
        if (opcode == "switch") {
            string switch_name;
            script >> switch_name;
            if (switch_name == "milky_way")
                params.milkyway_visible = read_boolean(script);
            else if (switch_name == "colored_stars")
                params.colored_stars = read_boolean(script);
            else if (switch_name == "grid")
                params.show_grid = read_boolean(script);
            else if (switch_name == "ecliptic")
                params.show_ecliptic = read_boolean(script);
            else if (switch_name == "boundaries")
                params.show_boundaries = read_boolean(script);
            else if (switch_name == "constellation_lines")
                params.show_lines = read_boolean(script);
            else if (switch_name == "labels")
                params.show_labels = read_boolean(script);
            else if (switch_name == "eps_output")
                params.create_eps = read_boolean(script);
            else if (switch_name == "pdf_output")
                params.create_pdf = read_boolean(script);
            else throw string("Undefined \"switch\" construct"
                              " in input script: \"") + switch_name + '"';
        }

@ In order to avoid overlaps, \PPTHREE/ uses a simple penalty algorithm.  The
standard value for all penalty values is~1000.  The meanings of ``\.{stars}'',
``\.{labels}'', ``\.{nebulae}'', ``\.{boundaries}'', and
``\.{constellation\_lines}'' is pretty easy to explain: They come into play
when the current label (that is to be positioned) overlaps with the respective
object.  For example, if you want overlaps with constellation lines to be less
probable, you can say $$\hbox{\.{penalties constellation\_lines 2000}}$$

There is another concept of importance here: The rim.  A rim is a rectangular
margin around every label with a width of |skip|.  Overlaps in the rim are
counted, too, however normally they don't hurt that much.  Normally they hurt
half as much as the label area ({\it core}) itself, but this can be changed
with ``\.{rim}''.  With $$\hbox{\.{penalties rim 0}}$$ the rim loses its
complete significance.  But notice that for each rim penalty a core penalty is
added, too, so that the rim can never be more significant than the core.

Within the rim, ``\.{boundaries\_rim}'' and ``\.{constellation\_lines\_rim}''
are used instead of the normal ones.  This is because lines are not so bad in
the rim as other stars or nebulae would be, because other stars in the vicinity
of a label may cause confusion, lines not.

\medskip The third thing about penalties is the maximal penalty of a label.  If
the penalties of a label exceed this value, the label is supressed.  You may
overrule this behaviour with an explicit repositioning of the label.  You can
adjust this maximal badness of the label with ``\.{threshold}''.  With
$$\hbox{\.{penalties threshold 10000}}$$ probably all labels are printed.

@.penalties@>
@.stars@>
@.labels@>
@.nebulae@>
@.boundaries@>
@.boundaries\_rim@>
@.constellation\_lines@>
@.constellation\_lines\_rim@>
@.threshold@>
@.rim@>

@q'@>

@<Set penalty parameters@>=
        if (opcode == "penalties") {
            string penalty_name;
            double value;
            script >> penalty_name >> value;
            value /= 1000.0;
            if (penalty_name == "stars")
                params.penalties_star = value;
            else if (penalty_name == "labels")
                params.penalties_label = value;
            else if (penalty_name == "nebulae")
                params.penalties_nebula = value;
            else if (penalty_name == "boundaries")
                params.penalties_boundary = value;
            else if (penalty_name == "boundaries_rim")
                params.penalties_boundary_rim = value;
            else if (penalty_name == "constellation_lines")
                params.penalties_cline = value;
            else if (penalty_name == "constellation_lines_rim")
                params.penalties_cline_rim = value;
            else if (penalty_name == "threshold")
                params.penalties_threshold = value;
            else if (penalty_name == "rim")
                params.penalties_rim = value;
            else throw string("Undefined \"penalties\" construct"
                              " in input script: \"") + penalty_name + '"';
        }

@ @q(@> The most important filename is ``\.{output}''.  By default it's unset
so that the output is sent to standard output.  With $$\hbox{\.{filename output
orion.tex}}$$ the output is written to \.{orion.tex}.  Most of the other
filenames denote the data files.  Their file format is described at the
functions that read them.  Their names are: ``\.{stars}'', ``\.{nebulae}'',
``\.{label\_dimensions}'', ``\.{constellation\_lines}'', ``\.{boundaries}'',
and ``\.{milky\_way}''.

``\.{latex\_preamble}'' is a file with a \LaTeX\ excerpt with a preamble
fragment for the \LaTeX\ output.  See |@<|create_preamble()| for writing the
\LaTeX\ preamble@>|.

``\.{include}'' denotes a file that is included at the current position as an
insert script file.  This command particularly makes sense at the very
beginning of the input script because then you can overwrite the values
locally.  Note that you can only include zero or one file, and included script
files must not contain further \.{include}s.  Apart from that included scripts
have the same structure as usual scripts.  (This is also true for a possible
`\.{objects\_and\_labels}' part.)

@q;@>

The meaning of this is of course to write a master script with global settings
(e.\,g.\ colour, line style, data file names etc.), and to overwrite them for
certain regions of the sky, typically stellar constellations.

@.output@>
@.stars@>
@.nebulae@>
@.label\_dimensions@>
@.constellation\_lines@>
@.boundaries@>
@.milky\_way@>
@.latex\_preamble@>
@.include@>

@<Set filename parameters@>=
        if (opcode == "filename") {
            string object_name;
            script >> object_name;
            if (object_name == "output")
                params.filename_output = read_string(script);
            else if (object_name == "stars")
                params.filename_stars = read_string(script);
            else if (object_name == "nebulae") 
                params.filename_nebulae = read_string(script);
            else if (object_name == "label_dimensions")
                params.filename_dimensions = read_string(script);
            else if (object_name == "constellation_lines")
                params.filename_lines = read_string(script);
            else if (object_name == "boundaries")
                params.filename_boundaries = read_string(script);
            else if (object_name == "milky_way")
                params.filename_milkyway = read_string(script);
            else if (object_name == "latex_preamble")
                params.filename_preamble = read_string(script);
            else if (object_name == "include") {
                if (!params.filename_include.empty())
                    throw string("Nesting depth of include files greater"
                                 " than one");
                params.filename_include = read_string(script);
                ifstream included_script(params.filename_include.c_str());
                read_parameters_from_script(included_script);
            }
            else throw string("Undefined \"filename\" construct"
                              " in input script: \"") + object_name + '"';
        }


@ Most of these values are numeric, only \.{constellation} is a string, namely
a three-letter all-uppercase astronomic abbreviation of the constellation to be
highlighted.  It's default is ``\.{ORI}''  but you may set it to the empty
string with $$\hbox{\.{set constellation ""}}$$ so no constellation gets
highlighted.  At the moment highlighting means that the boundaries have a
brighter colour than normal.

{\sloppy\raggedright
``\.{center\_rectascension}'' and ``\.{center\_declination}'' are the celestial
coordinates of the view frame centre.  ``\.{box\_width}'' and
``\.{box\_height}'' are the dimensions of the view frame in centimetres.
``\.{grad\_per\_cm}'' is the magnification (scale).
``\.{star\_scaling}'' denotes a radial scaling of the star
disks. ``\.{fontsize}'' is the global \LaTeX\ font size (in points).  It must
be 10, 11, or~12.  Default is~10.

Many parameters deal with the graphical representation of stars and nebulae:
``\.{shortest\_constellation\_line}'' is the shortest length for a
constellation line that is supposed to be drawn.  ``\.{label\_skip}'' is the
distance between label and celestial object.  ``\.{minimal\_nebula\_radius}''
is the radius under which a nebula is drawn as a mere circle of {\it that\/}
radius.  ``\.{minimal\_star\_radius}'' is the radius of the smallest stellar
dots of the graphics.  All these parameters are measured in centimetres.

But there are also some magnitudes: The faintest stellar clusters that are
drawn by default are of the ``\.{faintest\_cluster\_magnitude}'', all other
nebulae drawn by default of the ``\.{faintest\_diffuse\_nebula\_magnitude}''.
Stars brighter than ``\.{faintest\_star\_magnitude}'' are drawn at all, if they
are even brighter than ``\.{faintest\_star\_with\_label\_magnitude}'' they get
a label.  Stars brighter than ``\.{faintest\_star\_disk\_magnitude}'' are not
just mere dots in the background, but get a radius according to their
brightness.\par}

Many of these parameters trigger the default behaviour that you can overrule by
commands in the second part of the input script.

@.set@>
@.center\_rectascension@>
@.center\_declination@>
@.box\_width@>
@.box\_height@>
@.grad\_per\_cm@>
@.shortest\_constellation\_line@>
@.label\_skip@>
@.minimal\_nebula\_radius@>
@.faintest\_cluster\_magnitude@>
@.faintest\_diffuse\_nebula\_magnitude@>
@.faintest\_star\_magnitude@>
@.minimal\_star\_radius@>
@.faintest\_star\_disk\_magnitude@>
@.faintest\_star\_with\_label\_magnitude@>
@.star\_scaling@>
@.constellation@>
@.fontsize@>

@q)'@>

@<Set single value parameters@>=
        if (opcode == "set") {
            string param_name;
            script >> param_name;
            if (param_name == "center_rectascension")
                script >> params.center_rectascension;
            else if (param_name == "center_declination")
                script >> params.center_declination;
            else if (param_name == "box_width")
                script >> params.view_frame_width;
            else if (param_name == "box_height")
                script >> params.view_frame_height;
            else if (param_name == "grad_per_cm")
                script >> params.grad_per_cm;
            else if (param_name == "constellation")
                params.constellation = read_string(script);
            else if (param_name == "shortest_constellation_line")
                script >> params.shortest_constellation_line;
            else if (param_name == "label_skip")
                script >> params.label_skip;
            else if (param_name == "minimal_nebula_radius")
                script >> params.minimal_nebula_radius;
            else if (param_name == "faintest_cluster_magnitude")
                script >> params.faintest_cluster_magnitude;
            else if (param_name == "faintest_diffuse_nebula_magnitude")
                script >> params.faintest_diffuse_nebula_magnitude;
            else if (param_name == "faintest_star_magnitude")
                script >> params.faintest_star_magnitude;
            else if (param_name == "minimal_star_radius")
                script >> params.minimal_star_radius;
            else if (param_name == "faintest_star_disk_magnitude")
                script >> params.faintest_star_disk_magnitude;
            else if (param_name == "faintest_star_with_label_magnitude")
                script >> params.faintest_star_with_label_magnitude;
            else if (param_name == "star_scaling")
                script >> params.star_scaling;
            else if (param_name == "fontsize")
                script >> params.font_size;
            else
                throw string("Undefined \"set\" construct in input script: \"")
                    + param_name + '"';
        }

@* Part~II: Change printed objects and labels.  Here I read and interpret the
second part of the input script, {\it after\/} the |"objects_and_labels"|.
This part doesn't need to be available, and both parts may be empty.

First I define a type that is often used in the following routines for a
mapping from a catalogue number on the index in \PPTHREE/'s internal |vectors|.
This makes access a lot faster.

@<Routines for reading the input script@>=
typedef map<int,int> index_list;

@ Here I create the data structures that make the above mentioned mapping
possible.  FixMe: They should be defined globally, so that the constellation
lines construction can profit by it, too.  And then they needn't be given in
the parameter lists of the routines.

This mapping is not vital for the program, but the alternative would be to look
through the whole of |nebulae| or |stars| to find a star with a certain \NGC/
or \HD/ number.  This is probably way to inefficient.

@q'@>

@<Create mapping structures for direct catalogue access@>=
    const int max_ngc = 7840, max_ic = 5386, max_messier = 110;
    index_list ngc, ic, messier;
    for (int i = 0; i < nebulae.size(); i++) {
        if (nebulae[i].ngc > 0 && nebulae[i].ngc <= max_ngc)
            ngc[nebulae[i].ngc] = i;
        if (nebulae[i].ic > 0 && nebulae[i].ic <= max_ic)
            ic[nebulae[i].ic] = i;
        if (nebulae[i].messier > 0 && nebulae[i].messier <= max_messier)
            messier[nebulae[i].messier] = i;
    }
    index_list henry_draper;
    map<string, index_list> flamsteed;
    for (int i = 0; i < stars.size(); i++) {
        if (stars[i].hd > 0) henry_draper[stars[i].hd] = i;
        if (stars[i].flamsteed > 0) 
            flamsteed[stars[i].constellation][stars[i].flamsteed] = i;
    }


@ This is a general warning producing routine.  Such tests are vital,
especially if the nebulae file has been deleted in order to save disk space.  I
want it to be a warning because it would be very annowing to delete all such
opcodes from an input script only because one wants to dispense with e.\,g.\
nebulae.

I need three incarnation of this function: One for nebulae, one for Flamsteed
number, and one for Henry Draper catalogue numbers.

@<Routines for reading the input script@>=
bool assure_valid_catalogue_index(const int index, const index_list& catalogue,
                                  const string catalogue_name) {
    if (catalogue.find(index) == catalogue.end()) {
        cerr << "pp3: Warning: Invalid " << catalogue_name << " index: "
             << index << ".\n";
        return false;
    } else return true;
}

bool assure_valid_catalogue_index(const int index,
                                  const string constellation,
                                  map<string,index_list>& flamsteed) {
    bool found = true;
    if (flamsteed.find(constellation) == flamsteed.end()) found = false;
    else if (flamsteed[constellation].find(index) ==
             flamsteed[constellation].end()) found = false;
    if (!found) cerr << "pp3: Warning: Invalid Flamsteed number: "
                     << index << ".\n";
    return found;
}

bool assure_valid_catalogue_index(const int index,
                                  const index_list& henry_draper) {
    if (henry_draper.find(index) == henry_draper.end()) {
        cerr << "pp3: Warning: Invalid HD number: "
             << index << ".\n";
        return false;
    } else return true;
}

@ In this routine I scan a list of stellar objects, given by a token pair of
catalogue name and catalogue index.  Such lists are used after some top-level
commands below.  A mandatory `\.{;}' ends such a list.  Five catalogues are
supported: \NGC/, \IC/, Messier, Henry-Draper~(\HD/), and Flamsteed numbers (in
the form ``{\it Constellation}\SP{\it Flamsteed number}'').  You may use the
program `Celestia' to get the \HD/ numbers for the stars.

@<Routines for reading the input script@>=
void search_objects(istream& script,
                    index_list& ngc, index_list& ic,
                    index_list& messier, index_list& henry_draper,
                    map<string, index_list>& flamsteed,
                    vector<int>& found_stars, vector<int>& found_nebulae) {
    found_stars.clear();
    found_nebulae.clear();
    string catalogue_name;
    int catalogue_index;
    script >> catalogue_name;
    while (script && catalogue_name != ";") {
        script >> catalogue_index;
        if (catalogue_index <= 0) {
            stringstream error_message;
            error_message << "Invalid index: " << catalogue_index;
            throw error_message.str();
        }
        if (!script) throw string("Unexpected end of input script");
        if (catalogue_name == "NGC") {
            if (assure_valid_catalogue_index(catalogue_index,ngc,"NGC"))
                found_nebulae.push_back(ngc[catalogue_index]);
        } else if (catalogue_name == "IC") {
            if (assure_valid_catalogue_index(catalogue_index,ic,"IC"))
                found_nebulae.push_back(ic[catalogue_index]);
        } else if (catalogue_name == "M") {
            if (assure_valid_catalogue_index(catalogue_index,messier,"M"))
                found_nebulae.push_back(messier[catalogue_index]);
        } else if (catalogue_name == "HD") {
            if (assure_valid_catalogue_index(catalogue_index,henry_draper))
                found_stars.push_back(henry_draper[catalogue_index]);
        } else {
            if (assure_valid_catalogue_index(catalogue_index,
                                             catalogue_name,flamsteed))
                found_stars.
                    push_back(flamsteed[catalogue_name][catalogue_index]);
        }
        script >> catalogue_name;
    }
}

@ This routine essentially does the same as the prevous one, however only for
{\it one\/} celestial object.  This is used for commands that don't take an
object list but only one object.

@q'@>

@<Routines for reading the input script@>=
view_data* identify_object(istream& script, index_list& ngc,
                           index_list& ic, index_list& messier,
                           index_list& henry_draper,
                           map<string, index_list>& flamsteed,
                           stars_list& stars, nebulae_list& nebulae) {
    string catalogue_name;
    int catalogue_index;
    script >> catalogue_name >> catalogue_index;
    if (!script) throw string("Unexpected end of input script");
    if (catalogue_name == "NGC") {
        if (assure_valid_catalogue_index(catalogue_index,ngc,"NGC"))
            return &nebulae[ngc[catalogue_index]];
    } else if (catalogue_name == "IC") {
        if (assure_valid_catalogue_index(catalogue_index,ic,"IC"))
            return &nebulae[ic[catalogue_index]];
    } else if (catalogue_name == "M") {
        if (assure_valid_catalogue_index(catalogue_index,messier,"M"))
            return &nebulae[messier[catalogue_index]];
    } else if (catalogue_name == "HD") {
        if (assure_valid_catalogue_index(catalogue_index,henry_draper))
            return &stars[henry_draper[catalogue_index]];
    } else {
        if (assure_valid_catalogue_index(catalogue_index,
                                         catalogue_name,flamsteed))
            return &stars[flamsteed[catalogue_name][catalogue_index]];
   }
   return 0;
}

@ Here now the main routine for the second part of the input script.  The
top-level commands in this section are: ``\.{reposition}'',
``\.{delete\_labels}'', ``\.{add\_labels}'', ``\.{delete}'', ``\.{add}'',
``\.{set\_text\_label}'', and ``\.{text}''.

@.reposition@>
@.delete\_labels@>
@.add\_labels@>
@.delete@>
@.add@>
@.text@>
@.set\_label\_text@>

@<Routines for reading the input script@>=
void read_objects_and_labels(istream& script,
                             const dimensions_list& dimensions,
                             objects_list& objects, stars_list& stars,
                             nebulae_list& nebulae,
                             texts_list& texts,
                             flexes_list& flexes,
                             const transformation& mytransform,
                             bool included = false) {
    if (!params.filename_include.empty() && !included) {
        ifstream included_file(params.filename_include.c_str());
        @<Skip everything till |"objects_and_labels"|@>@;
        read_objects_and_labels(included_file, dimensions, objects, stars,
                                nebulae, texts, flexes, mytransform, true);
    }
    string opcode;
    script >> opcode;
    if (!script) return;
    @<Create mapping structures for direct catalogue access@>@;
    while (script) {
        if (opcode[0] == '#') {   // skip comment line
            string rest_of_line;
            getline(script,rest_of_line);
        } else 
            @<Label repositioning@>@;
        else
            @<Change label text@>@;
        else
            @<Text labels@>@;
        else {  // command with objects list
            vector<int> found_stars, found_nebulae;
            @<Label deletion@>@;
            else
                @<Label activation@>@;
            else
                @<Celestial object deletion@>@;
            else
                @<Celestial object activation@>@;
            else throw string("Undefined opcode in input script: \"")
                + opcode + '"';
        } 
        script >> opcode;
    }
}

@ The following algorithm is so bad that it must be considered a bug.  It
simply searches for the string |"objects_and_labels"| in the |included_file|,
but that may occur within a string or wherever.  The file should be properly
scanned, but I'm too lazy for that.  A case where this bug becomes visible
should be very rare anyway.

FixMe: Fix this bug, or at least for strings.  Maybe the format of input
scripts must be changed significantly for this.

@q'@>

@<Skip everything till |"objects_and_labels"|@>=
        string token;
        included_file >> token;
        while (included_file) {
            if (token[0] == '#') getline(included_file,token);
            else if (token == "objects_and_labels") break;
            included_file >> token;
        }


@ Sometimes labels have an unfortunate position.  But you may say e.\,g.\
$$\hbox{\.{reposition M 42 E ;}}$$ to position the label for the Orion Nebula
to the right of it.  (Abbreviations are taken from the wind rose.)  You may use
this command to force a certain label to be drawn although \PPTHREE/ has
decided that there is no space for it and didn't print it in the first place.

If you write ``\.{E\UL}'' or ``\.{W\UL}'' the label text is not vertically
centred but aligned with the celestrial coordinates at the {\it baseline\/} of
the label text.

At the moment, this command takes exactly one argument.  However the closing
semicolon is necessary.

@q'@>

@<Label repositioning@>=
        if (opcode == "reposition") {
            string position, semicolon;
            view_data* current_object =
                identify_object(script, ngc, ic, messier, henry_draper,
                                flamsteed, stars, nebulae);
            int angle;
            bool on_baseline = false;
            script >> position >> semicolon;
            if (semicolon != ";") 
                throw string("Expected \";\" after \"reposition\" command");
            @<Map a wind rose |position| to an |angle|
              and determine |on_baseline|@>@;
            if (current_object) {
                current_object->label_angle = angle;
                current_object->with_label = visible;
                current_object->on_baseline = on_baseline;
                current_object->label_arranged = true;
            }
        }

@ @<Map a wind rose |position| to an |angle| and determine |on_baseline|@>=
            if (position == "E" || position == "E_") angle = 0;
            else if (position =="NE") angle = 1;
            else if (position =="N") angle = 2;
            else if (position =="NW") angle = 3;
            else if (position =="W" || position == "W_") angle = 4;
            else if (position =="SW") angle = 5;
            else if (position =="S") angle = 6;
            else if (position =="SE") angle = 7;
            else throw string("Undefined position angle: ") + position;
            on_baseline = position[position.length()-1] == '_';


@ \PPTHREE/ reads default labels from the stars and nebulae data files.  But
you may say e.\,g.\ $$\hbox{\.{set\_label\_text ORI 19 Rigel}}$$ to rename
``$\alpha$'' (Orionis) to ``Rigel''.

@<Change label text@>=
        if (opcode == "set_label_text") {
            view_data* current_object =
                identify_object(script, ngc, ic, messier, henry_draper,
                                flamsteed, stars, nebulae);
            if (current_object) current_object->label = read_string(script);
        }


@ With e.\,g.\ $$\hbox{\.{delete\_labels  M 35  M 42 ;}}$$ you delete the labels
(not the nebulae themselves!)\ of M\,35 and M\,42.

@<Label deletion@>=
            if (opcode == "delete_labels") {
                search_objects(script, ngc, ic, messier, henry_draper,
                               flamsteed, found_stars, found_nebulae);
                for (int i = 0; i < found_stars.size(); i++) {
                    stars[found_stars[i]].with_label = hidden;
                    stars[found_stars[i]].label_arranged = true;
                }
                for (int i = 0; i < found_nebulae.size(); i++) {
                    nebulae[found_nebulae[i]].with_label = hidden;
                    nebulae[found_nebulae[i]].label_arranged = false;
                }
            }

@ The counterpart of \.{delete\_labels}.  It makes sense first and foremost for
stars.  (Unfortunately this means that you have to use extensively the Henry
Draper Catalogue.)

@<Label activation@>=
            if (opcode == "add_labels") {
                search_objects(script, ngc, ic, messier, henry_draper,
                               flamsteed, found_stars, found_nebulae);
                for (int i = 0; i < found_stars.size(); i++)
                    stars[found_stars[i]].with_label = visible;
                for (int i = 0; i < found_nebulae.size(); i++)
                    nebulae[found_nebulae[i]].with_label = visible;
            }

@ This adds objects (mostly nebulae) the the field.  Notice that this object is
then printed even if it lies outside the view frame (it may be clipped though).

@<Celestial object activation@>=
            if (opcode == "add") {
                search_objects(script, ngc, ic, messier, henry_draper,
                               flamsteed, found_stars, found_nebulae);
                for (int i = 0; i < found_stars.size(); i++)
                    stars[found_stars[i]].in_view = visible;
                for (int i = 0; i < found_nebulae.size(); i++)
                    nebulae[found_nebulae[i]].in_view = visible;
            }

@ The opposite of |@<Celestial object activation@>|.

@<Celestial object deletion@>=
            if (opcode == "delete") {
                search_objects(script, ngc, ic, messier, henry_draper,
                               flamsteed, found_stars, found_nebulae);
                for (int i = 0; i < found_stars.size(); i++)
                    stars[found_stars[i]].in_view = hidden;
                for (int i = 0; i < found_nebulae.size(); i++)
                    nebulae[found_nebulae[i]].in_view = hidden;
            }

@ This is the only way to add a text label.  The parameters are the text
itself, rectascension, declination, \RGB/ colour, and the relative position
(uppercase wind rose), followed by a semicolon.  For example,
$$\hbox{\.{text Leo at 11 10 color 1 0 0 towards S ;}}$$ puts a red ``Leo''
centered below the point $(11\,\hbox{h}, +10^\circ)$ in the Lion.  You may
leave out the ``\.{color}'' and/or the ``\.{towards}'' option.  The default
colour is the last given colour in a previous \.{text} command, or if this
doesn't exist the current text label colour.  The default value of
``\.{towards}'' is~|"NE"|.

The contents of a text label is eventually in an \.{\BS hbox}, so you can use
that fact.  You can also use all \PS/Tricks commands.  For example, with
\medskip

{\parindent2em\tentt
text "\BS\BS psdots[dotstyle=+,dotangle=45](0,0)\BS\BS scriptsize\BS\BS{} N 
           pole of ecliptic"\par
\ \ \ \ \ at 18 66.56 towards E\UL{} ;
}

\medskip\noindent the $\times$ marks the northern ecliptical pole, together
with a small label text.  If such things occur frequently, define it as a
\LaTeX\ macro.

If you write ``\.{E\UL}'' or ``\.{W\UL}'' the label text is not vertically
centred but aligned with the celestrial coordinates at the {\it baseline\/} of
the label text.

\medskip A ``declination flex'' is a special text label that stands on a circle
of equal declination which can look very nice.  You get it with the option
``\.{along declination}'' in the parameter list of the text label.

\medskip If you use the \.{tics} option the label is printed along a
rectascension or declination circle multiple times, making it possible to print
tic marks.  For example, \medskip

{\parindent2em\tentt
text "\$\#3\$" at 0 20 along declination tics rectascension 1 towards N ;\par
text "\$\#5\$" at 11 0 along declination tics declination 10 towards S ;
}

\medskip\noindent creates automatically generated labels for the $20^\circ$
declination circle (every whole hour), and for the $11^{\sevenrm h}$
rectascension line (every 10 declination degrees).  See the explanation for
|@<Generate |contents| from current coordinates@>| for further details.

@.text@>
@.along@>
@.declination@>
@.tics@>

@<Text labels@>=
if (opcode == "text") {
    string token, contents, position("NE");
    double rectascension, declination;
    contents = read_string(script);
    script >> token;
    if (token != "at") throw string("\"at\" in \"text\" command expected");
    script >> rectascension >> declination;
    script >> token;
    int angle = 1;  // |"NE"|
    bool on_baseline = false;
    enum { kind_text_label, kind_flex_declination} label_kind
        = kind_text_label;
    double step_rectascension = -1.0; // $-1$ means that no maks are produced.
    double step_declination = -1.0; 
    while (script && token != ";") {
        if (token == "color") script >> params.textlabelcolor;
        else if (token == "towards") {
            script >> position;
            @<Map a wind rose |position| to an |angle|
              and determine |on_baseline|@>@;
        }
        else if (token == "along") {
            script >> token;
            if (token == "declination") {
                label_kind = kind_flex_declination;
            } else throw string("Invalid \"along\" option");
        }
        else if (token == "tics") {
            script >> token;
            if (token == "rectascension") {
                script >> step_rectascension;
                if (step_rectascension <= 0.0)
                    throw string("Invalid \"tics\" interval");
                step_declination = -1.0; 
            } else if (token == "declination") {
                script >> step_declination;
                if (step_declination <= 0.0)
                    throw string("Invalid \"tics\" interval");
                step_rectascension = -1.0; 
            } else throw string("Invalid \"tics\" option");
        } else throw string("Invalid \"text\" option");
        script >> token;
    }
    if (!script)
        throw string("Unexpected end of script while scanning \"text\"");
    if (step_rectascension <= 0.0 && step_declination <= 0.0) {
        @<Insert text label into label container structure@>@;
    } if (step_rectascension > 0.0) {
        string user_pattern(contents);
        double start = rectascension - floor(rectascension/step_rectascension)
                                         * step_rectascension;
        for (rectascension = start; rectascension < 24.0;
             rectascension += step_rectascension) { cerr << rectascension << ' ';
            @<Generate |contents| from current coordinates@>@;
            @<Insert text label into label container structure@>@;
        }
    } else if (step_declination > 0.0) {
        string user_pattern(contents);
        double start = declination - floor((declination+90.0) / step_declination)
                                         * step_declination;
        for (declination = start; declination <= 90.0;
             declination += step_declination) { cerr << declination << ' ';
            @<Generate |contents| from current coordinates@>@;
            @<Insert text label into label container structure@>@;
        }
    }
}

@ FixMe: Eventually this section must be a clean function call.  I insert a
text label or a flex into the correct data structure.

@<Insert text label into label container structure@>=
    switch (label_kind) {
    case kind_text_label:
        texts.push_back(text(contents, rectascension, declination,
                             params.textlabelcolor, angle, on_baseline));
        break;
    case kind_flex_declination: 
        flexes.push_back(new declination_flex(contents, rectascension,
                                              declination,
                                              params.textlabelcolor, angle,
                                              on_baseline));
        break;
    }

@ FixMe: Eventually this section must be a clean function call.  Here I create
the \LaTeX\ macro for the tics marks.  It is called \.{\BS coordinates} and has
nine parameters, however not all are used so far:\medskip

\item{\tt\#1} Rectascension in hours.
\item{\tt\#2} Declination in degrees.
\item{\tt\#3} Rectascension in integer hours (truncated, not rounded).
\item{\tt\#4} Rectascension fraction of hour in minutes (truncated, not
              rounded).
\item{\tt\#5} Declination in rounded integer degrees.

\medskip All decimal points are replaced by ``\.{\{\\DP\}}'' commands.

@<Generate |contents| from current coordinates@>=
        {
            stringstream coordinates;
            coordinates.setf(ios::fixed);
            coordinates << "\\def\\coordinates#1#2#3#4#5#6#7#8#9{\\TicMark{"
                        << user_pattern << "}}";
            coordinates << "\\coordinates{" << rectascension << "}{"
                        << declination << "}{";
            coordinates << int(floor(rectascension)) << "}{"
                        << int(floor((rectascension - floor(rectascension))
                                     * 60.0))
                        << "}{";
            if (int(declination) > 0.0) coordinates << '+';
            coordinates << int(declination) << "}{}{}{}{}";
            contents = coordinates.str();
            while (contents.find(".") != string::npos)
                contents.replace(contents.find("."),1,"{\\DP}");
        }

@** Data structures and file formats.  First I describe the data structures that
directly contain celestial objects such as stars and nebulae.  This is a little
bit unfortunate for the program itself, because actually other things should be
defined first (e.\,g.\ |dimension|).  However I think that the program can be
digested more easily this way.

All data structures are |struct|s and no |class|es.  The reason is that they
are all very simple and all object oriented security measures are only
hindering.

For each data type called {\bf classname} I define a container called {\bf
classnames\_list} that is a |vector|.  For almost each data type I define a
routine that can read it from a file in the vector.  There I also decribe the
respective file format.

@* View data: Positioning and labels.  This first |struct| can be used as an
ancestor in the various celestial objects data structurs (e.\,g.\ stars) for
containing all view frame dependent information.  Most importantly it contains
the label of a celestial object, its position relatively to the object, and its
size.

|in_view| is |visible| if the object is actually displayed on screen.  |x| and
 |y| contain the screen coordinates in centimetres.  |radius| is the radial
 size of the object in centimetres.  |skip| is given in centimetres, too.  It
 denotes the space between the outer boundary of the object (enclosed by
 |radius|) and the label.

|with_label| is |visible| if the object has a label, with |label_width|,
 |label_height|, |label_depth| (estimated in centimetres) and |label_angle|.
 {\it Please note the all heights in \PPTHREE/ are {\rm total} heights, thus
 the same as \TeX's height${}+{}$depth!}

|on_baseline| is true, if the {\it baseline\/} of the label text is supposed to
 be vertically aligned with the celestial position.  (This works not for all
 |label_angle|s.)

|label_arranged| is |true| if the best place for the label has been found
 already.  Only then the label should be really printed, but the real use of
 |label_arranged| is that it avoids the label to be arranged
 twice. |lable_angle| can only have eight possible values: 0:~$0^\circ\!$,
 1:~$45^\circ\!$, 2:~$90^\circ\!$, 3:~$135^\circ\!$, 4:~$180^\circ\!$,
 5:~$225^\circ\!$, 6:~$270^\circ\!$, and 7:~$315^\circ\!$.

|scope()| returns the maximal scope of the object.  It is used in |@<Find
objects in vicinity of |objects[i]|@>| to find all objects in the vicinity of a
given on-object.

@q;@>

@c
typedef enum { @!hidden, @!visible, @!undecided } visibility;

struct view_data {
    visibility in_view;
    double x,y;
    double radius, skip;
    visibility with_label;
    bool label_arranged;
    string label;
    double label_width, label_height, label_depth;
    bool on_baseline;
    color label_color;
    int label_angle;
    view_data() : in_view(undecided), x(DBL_MAX), y(DBL_MAX), radius(0.0), 
                  skip(params.label_skip),
                  with_label(undecided), label_arranged(false), label(), 
                  label_width(0.0), label_height(0.0),
                  label_depth(0.0), on_baseline(false),
                  label_color(params.labelcolor), label_angle(0) { }
    void get_label_boundaries(double& left,double& right,double& top,
                              double& bottom) const;
    double scope() const { return radius + skip + 
                               fmax(label_width,label_height) + 2.0*skip; }
    bool has_valid_coordinates() const { return x != DBL_MAX && y != DBL_MAX; }
    virtual double penalties_with(const double left, const double right,
                                  const double top, const double bottom,
                                  bool core = true) const;
};

@ This is the only structure that is not put into a container directly, but via
references.  The reason is the virtual routine |penalties_with()|; I want to
use polymorphy.

@c
typedef vector<view_data*> objects_list;

@ Each label is stored in |view_data| by its dimensions, its |skip|, the
|radius| of the object itself, and the |label_angle|.  While these quantities
are very convenient to use for the positioning of the label, they are pretty
unfortunate if you want to know which coordinates are occupied by the label in
order to find out possible overlaps.

Therefore I calculate here the rectangular boundaries of a label.  They are
stored in |left|, |right|, |top|, and |bottom| in screen centimetres.

@c
void view_data::get_label_boundaries(double& left,double& right,double& top,
                                     double& bottom) const {
    const double origin_x =
        x + (radius + skip) * cos(M_PI_4 * double(label_angle));
    const double origin_y =
        y + (radius + skip) * sin(M_PI_4 * double(label_angle));
    switch (label_angle) {
        case 0: case 1: case 7: left = origin_x; break;
        case 2: case 6: left = origin_x - label_width / 2.0; break;
        case 3: case 4: case 5: left = origin_x - label_width; break;
    }
    right = left + label_width;
    switch (label_angle) {
    case 0: case 4: bottom = origin_y -
                             (on_baseline? 0.0 : label_height / 2.0); break;
    case 1: case 2: case 3: bottom = origin_y; break;
    case 5: case 6: case 7: bottom = origin_y - label_height; break;
    }
    if (on_baseline) bottom -= label_depth;
    top = bottom + label_height;
}

@ Every object of type |view_data| (or a descendant of it) must be able to
calculate the overlap of itself with a rectangle given by |left|, |right|,
|top|, and |bottom|.  It must then create a penalty value out of it.  Normally
this is just the overlap itself in square centimetres, like here.

@c
double view_data::penalties_with(const double left, const double right,
                                 const double top, const double bottom,
                                 bool core) const {
    if (with_label == visible && label_arranged) {
        double left2, right2, top2, bottom2;
        get_label_boundaries(left2,right2,top2,bottom2);
        const double overlap_left = fmax(left, left2);
        const double overlap_right = fmin(right, right2);
        const double overlap_top = fmin(top, top2);
        const double overlap_bottom = fmax(bottom, bottom2);
        const double overlap_x = fdim(overlap_right, overlap_left);
        const double overlap_y = fdim(overlap_top, overlap_bottom);
        return overlap_x * overlap_y * params.penalties_label;
    } else return 0.0;
}


@* Stars.  The actual star data is -- like all other user defined data
structure in this program -- organised as a |struct| because it's too simple
for a |class|.  |hd| is the Henry Draper Catalog number, |bs| is the Bright
Star Catalog number.  |rectascension| is given in hours, |declination| in
degrees.  |b_v| is the B$-$V brightness in magnitudes (equals
$m_{\hbox{\sevenrm phot}}-m_{\hbox{\sevenrm vis}}$) and thus contains colour.
|name| either contains the Bayer name (only the Greek letter and maybe an
exponent number), or, if this doesn't exist, the Flamsteed number as a string.
|spectral_class| is the complete spectral class, starting with |"F6"| or
whatever.

@s star int
@s stars_list int

@q;@>

@c
struct star : public view_data {
    int hd, bs;
    double rectascension, declination;
    double magnitude;
    double b_v;
    int flamsteed;
    string name;
    string constellation;
    string spectral_class;
    star() : hd(0), bs(0), rectascension(0.0), declination(0.0),
             magnitude(0.0), b_v(0.0), flamsteed(0), name(""),
             spectral_class(""), view_data() { }
    virtual double penalties_with(const double left, const double right,
                                  const double top, const double bottom,
                                  bool core = true) const;
};

@ In order to find the penalties with a (labelled) star, I first calculate them
for the label itself, which may be |0.0|, in particular if |label_arranged| is
still |false|.  Then I determine the rectangular overlap, just like in
|view_data::penalties_with()|.  This is unfortunate, because stars are circles
and not rectangles.  FixMe: This should be done justice to.

@c
double star::penalties_with(const double left, const double right,
                            const double top, const double bottom,
                            bool core) const {
    double penalties = view_data::penalties_with(left, right, top, bottom,
                                                 core);
    const double left2 = x - radius, right2 = x + radius, top2 = y + radius,
        bottom2 = y - radius;
    const double overlap_left = fmax(left, left2);
    const double overlap_right = fmin(right, right2);
    const double overlap_top = fmin(top, top2);
    const double overlap_bottom = fmax(bottom, bottom2);
    const double overlap_x = fdim(overlap_right, overlap_left);
    const double overlap_y = fdim(overlap_top, overlap_bottom);
    penalties += overlap_x * overlap_y * params.penalties_star;
    return penalties;
}


typedef vector<star> stars_list;

@ I want to be able to read the star data records from a text format file.  The
format of the input is a text stream with the following format.  Each star
entry consists of four lines: \medskip

\item{1.} A row with seven fields separated by whitespace:
\itemitem{--} Henry Draper Catalogue number (|int|, `|0|' if unknown),
\itemitem{--} \BSC/ number (|int|, `|0|' if unknown),
\itemitem{--} rectascension in hours (|double|),
\itemitem{--} declination in degrees (|double|),
\itemitem{--} visual brightness in magnitudes (|double|),
\itemitem{--} B$-$V brightness in magnitudes (|double|, `|99.0|' if unknown),
\itemitem{--} Flamsteed number (|int|, `|0|' if unknown).
\item{2.} The label (astronomical name) for the star, as a \LaTeX-ready string,
e.\,g.\ ``\.{\$\\alpha\$}'', ``\.{\$\\phi\^\{2\}\$}'', or simply
``\.{\$23\$}''.  May be the empty string.
\item{3.} The astronomical abbreviation of the constellation.  It must be all
uppercase.
\item{4.} The spectral class.  It must start with the spectral class letter,
followed by the fraction digit, followed by the luminosity class as a Roman
number, e.\,g.~``\.{F5III}''.  Anything may follow as in ``\.{K2-IIICa-1}'',
however the mandatory parts must not contain any whitespace.

@c
istream& operator>>(istream& in, star& s) {
    in >> s.hd >> s.bs >> s.rectascension 
       >> s.declination >> s.magnitude >> s.b_v 
       >> s.flamsteed;
    char ch;
    do in.get(ch); while (in && ch != '\n');
    getline(in,s.name);
    getline(in,s.constellation);
    getline(in,s.spectral_class);
    return in;
}

@ Here I read a set of stars from a file with the name |filename|.  The file
|stars_file| is a text file that consists solely of a list of |star|s.

@c
void read_stars(stars_list& stars) {
    ifstream stars_file(params.filename_stars.c_str());
    if (!stars_file) throw string("No stars file found: " 
                                  + params.filename_stars);
    star current_star;
    stars_file >> current_star;
    while (stars_file) {
        current_star.label = string("\\Starname{") + current_star.name + '}';
        stars.push_back(current_star);
        stars_file >> current_star;
    }
}


@* Nebulae.  This is also used for stellar clusters of course.  In the whole
program ``nebula'' denotes nebulae, galaxies, clusters, and other non-stellar
objects.

@c
typedef enum { @!unknown, @!galaxy, @!emission, @!reflection, @!open_cluster,
               @!globular_cluster } nebula_kind;

@ Since nebulae appear on the screen next to stars, and because they can have
labels, they are descendants of |view_data|, too.

|ngc|, |ic|, and |messier| are of course the respective catalogue number.
Since it's silly that |ngc| and |ic| are defined, a value of `|0|' means that
the nebula is not part of the respective catalogue.  |constellation| is a
three-character string with the name of the respective constellation in all
uppercase.  |rectascension| is given in hours, |declination| in degrees.
|diameter_x| and |diameter_y| are the extent of the nebula in the horizonal and
the vertical direction and are given in degrees, |horizontal_angle| (in
degrees) is the angle between the horizontal axis of |diameter_x| and the
intersecting celestial rectascension circle.  |magnitude| (in magnitudes) is
the {\it total\/} brightness (not the brightness density).

@c
struct nebula : public view_data {
    int ngc, ic, messier;  // |0| if not defined.
    string constellation;
    double rectascension, declination;
    double magnitude;
    double diameter_x, diameter_y;
    double horizontal_angle;
    nebula_kind kind;
    nebula() : ngc(0), ic(0), messier(0), constellation(), rectascension(0.0),
               declination(0.0), magnitude(0.0), diameter_x(0.0),
               diameter_y(0.0), horizontal_angle(0.0), kind(unknown) { }
    virtual double penalties_with(const double left,const double right,
                                  const double top, const double bottom,
                                  bool core = true) const;
};

typedef vector<nebula> nebulae_list;

@ In order to find the penalties with a (labelled) nebula, I first calculate
them for the label itself, which may be |0.0|, in particular if
|label_arranged| is still |false|.  Then I determine the rectangular overlap,
just like in |view_data::penalties_with()|.  This is unfortunate, because nebulae
are circles and not rectangles.  FixMe: This should be done justice to.

@c
double nebula::penalties_with(const double left, const double right,
                              const double top, const double bottom,
                              bool core) const {
    double penalties = view_data::penalties_with(left, right, top, bottom, core);
    const double left2 = x - radius, right2 = x + radius, top2 = y + radius,
        bottom2 = y - radius;
    const double overlap_left = fmax(left, left2);
    const double overlap_right = fmin(right, right2);
    const double overlap_top = fmin(top, top2);
    const double overlap_bottom = fmax(bottom, bottom2);
    const double overlap_x = fdim(overlap_right, overlap_left);
    const double overlap_y = fdim(overlap_top, overlap_bottom);
    penalties += overlap_x * overlap_y * params.penalties_nebula;
    return penalties;
}

@ As you can see, the file format for a nebulae file is very simple, because
there are no string fields with possible whitespace within them.  It's just a
stream of fields separated by whitespace.  |kind| is an |int|, and it's the
canonical translation of the |nebula_kind| to |int|.

If the |horizontal_angle| is unknown, is must be~|720.0|.  |diameter_y| must
always have a valid value, even if it's actually unknown; in this case it must
be equal to |diameter_y|.

@q'@>

@c
istream& operator>>(istream& in, nebula& n) {
    int kind;
    in >> n.ngc >> n.ic >> n.messier >> n.constellation >> n.rectascension
       >> n.declination >> n.magnitude >> n.diameter_x >> n.diameter_y
       >> n.horizontal_angle >> kind;
    n.kind = nebula_kind(kind);
    return in;
}

@ Here I read a set of nebulae from a file with the name |filename|.  The
format is just a stream of |nebula|e.

@c
void read_nebulae(nebulae_list& nebulae) {
    ifstream nebulae_file(params.filename_nebulae.c_str());
    nebula current_nebula;
    nebulae_file >> current_nebula;
    while (nebulae_file) {
        @<Create nebula label@>@;
        nebulae.push_back(current_nebula);
        nebulae_file >> current_nebula;
    }
}

@ In order to create a \LaTeX-ready label, I first choose which catalog to use.
It is from the Messier, the \NGC/, and the \IC/ catalogue the first in which
the nebula appears, i.\,e.\ the first non-zero catalogue number.  The catalogue
abbreviation itself is stored in |catalog|, whereas the |stringstream| |number|
contains the number within that catalogue.  I just concatenate both to the
|label|.

@<Create nebula label@>=
        string catalogue;
        stringstream number;
        if (current_nebula.messier > 0) {
            catalogue = "\\Messier{";
            number << current_nebula.messier;
        } else if (current_nebula.ngc > 0) {
            catalogue = "\\NGC{";
            number << current_nebula.ngc;
        } else if (current_nebula.ic > 0) {
            catalogue = "\\IC{";
            number << current_nebula.ic;
        } else throw string("Invalid catalogue: \"") + catalogue + '"';
        current_nebula.label = catalogue + number.str() + '}';


@* Constellation boundaries.  They are stored in an external file called
\.{constborders.dat}.

{\sloppy Is is very convenient to have a special data type for a point in the
program that has created \.{constborders.dat}.  In this program the advantage
is not so big but it's sensible to use the same data structures here.\par}

@q'@>

@c
struct point {
    double x,y;
    point(const double x, const double y) : x(x), y(y) { }
    point() : x(0.0), y(0.0) { }
};

@ An object of type |boundary| contains one stright line of a constellation
boundary.  This consists of the two endpoints which come from the original
boundary catalog by Delporte of 1930, and zero or more interpolated points
calculated by Davenhall (1990).  The interpolated points help to draw a curved
line where this is necessary.

{\sloppy Every line usually belongs to exactly two constellations (of course).
They are stored in the field |constellations|.  FixMe: There are boundaries
with only one owner.  I don't know how this can happen.\par}

@s boundary int
@s boundaries_list int

@q'@>

@c
struct boundary {
    vector<point> points;
    vector<string> constellations;
    bool belongs_to_constellation(const string constellation) const;
};

typedef vector<boundary> boundaries_list;

@ In this routine I use only the first three letters of the constellation
abbreviation.  The reason is that the original catalog uses |"SER1"| and
|"SER2"| for ``Serpent Caput'' and ``Serpent Cauda''.  However, I see them as
one constellation.  Be aware that this routine expects the constellation
abbreviation in uppercase.

@c
bool boundary::belongs_to_constellation(const string constellation) const {
    for (int i = 0; i < constellations.size(); i++)
        if (constellations[i].substr(0,3) == constellation.substr(0,3))
            return true;
    return false;
}

@ Of course I need to be able to read the boundaries from
\.{constborders.dat}.  The input stream is a text stream of the following
format.  The set of celestial boundaries is stored as a set of elementary
lines without kinks. \medskip

\item{1.} Number of points (|size|$_1$) in the line (|int|).
\item{2.} Repeated |size|$_1$ times:
\itemitem{--} rectascension of point in hours (|double|),
\itemitem{--} declination of point in degrees (|double|).
\item{3.} Number of constellations (|size|$_2$) touching this border line
    (|int|, should be be always |2|, however it isn't with current data).
\item{4.} Repeated |size|$_2$ times:
\itemitem{--} All uppercase astronomical abbreviation of the constellation.  It
may distinguish between ``\.{SER1}'' and ``\.{SER2}'' for Serpens Caput and
Serpens Cauda.

\medskip All fields are separated by whitespace.

@q')@>

@c
istream& operator>>(istream& in, boundary& p) {
    int size;
    in >> size;
    p.points.resize(size);
    for (int i=0; i<size; i++)
        in >> p.points[i].x >> p.points[i].y;
    in >> size;
    p.constellations.resize(size);
    for (int i=0; i<size; i++)
        in >> p.constellations[i];
    return in;
}

@ Here I read a set of boundaries from a file.  It's simply a list of
|boundary|'s.

@c
void read_constellation_boundaries(boundaries_list& boundaries) {
    ifstream boundaryfile(params.filename_boundaries.c_str());
    boundary current_boundary;
    boundaryfile >> current_boundary;
    while (boundaryfile) {
        boundaries.push_back(current_boundary);
        boundaryfile >> current_boundary;
    }
}

@ As a big exception to the other classes, I don't derive |boundary| itself
from |view_data|, but its smaller brother, |boundary_atom|.  In contrast to
|boundary|, |boundary_atom| only contains two points of the view frame, between
which a boundary line will be drawn.  This is not totally accurate since
boundary lines are not totally straight which may cause problems at the poles.
However, it should be good enough.

@s boundary_atom int

@q'@>

@c
struct boundary_atom : public view_data {
    point start, end;
    boundary_atom(point start, point end);
    virtual double penalties_with(const double left,const double right,
                                  const double top, const double bottom,
                                  bool core = true) const;
};

@ The nice thing about |boundary_atom| is that after it has been constructed,
it's finished.  Nothing has to be changed any more because all is known in the
moment of construction.

Since boundary atoms are only created when they are visible, I can set |in_view
= visible| etc. @q'@>

@c
boundary_atom::boundary_atom(point start, point end) : start(start), end(end) {
    x = (start.x + end.x) / 2.0;
    y = (start.y + end.y) / 2.0;
    radius = hypot(end.x - start.x, end.y - start.y) / 2.0;
    radius *= M_PI_2;
    in_view = visible;
    with_label = hidden;
    skip = 0.0;
}

@ The full algorithm that is used here is described in the |@<Definition of
|line_intersection()| for intersection of two lines@>|.  Except for peculiar
cases there should be exact two intersections altogether, which means that it's
the same as with constellation lines.

Objects of this type are created in |@<Create a |boundary_atom| for the
|objects|@>|.

@q'@>

@c
@<Definition of |line_intersection()| for intersection of two lines@>@;@#

double boundary_atom::penalties_with(const double left,const double right,
                                     const double top, const double bottom,
                                     bool core)
    const {
    double intersection;
    point r(end.x - start.x, end.y - start.y);
    vector<point> intersection_points;
    if (line_intersection(left - start.x, r.x, start.y, r.y,
                          bottom, top, intersection))
        intersection_points.push_back(point(left, intersection));
    if (line_intersection(right - start.x, r.x, start.y, r.y,
                          bottom, top, intersection))
        intersection_points.push_back(point(right, intersection));
    if (line_intersection(top - start.y, r.y, start.x, r.x,
                          left, right, intersection))
        intersection_points.push_back(point(intersection, top));
    if (line_intersection(bottom - start.y, r.y, start.x, r.x,
                          left, right, intersection))
        intersection_points.push_back(point(intersection, bottom));
    if (start.x > left && start.x < right && start.y > bottom && start.y < top)
        intersection_points.push_back(start);
    if (end.x > left && end.x < right && end.y > bottom && end.y < top)
        intersection_points.push_back(end);
    if (intersection_points.empty()) return 0.0;
    if (intersection_points.size() != 2) {
        cerr << "pp3: Funny " << intersection_points.size()
             << "-fold constellation boundary intersecrtion." << endl;
        return 0.0;
    }
    const double length = hypot(intersection_points[1].x -
                                intersection_points[0].x,
                                intersection_points[1].y -
                                intersection_points[0].y);
    return (core? 8.0 * params.penalties_boundary :
            0.5 * params.penalties_boundary_rim) / 72.27*2.54 * length;
}

@* Constellation lines.  This is not about the {\it boundaries}, but about the
connection lines between the main stars of a given constellation.  They are
mere eye candy.  I call their |struct| type ``connections'' to keep the name
unique and concise.

A |connection| consists of |lines|.  The point coordinates are screen
coordinates in centimetres.  |from| and |to| are the star star and the end
star, given by their index in |stars|.

Notice that |start| and |end| aren't defined before
|draw_constellation_lines()| has been called, {\it and\/} the constellation
line is actually visible.  Then they contain the screen coordinates of the
start and the end point of the line.

@s connection int

@q'@>

@c
struct connection : public view_data {
    point start, end;
    int from, to;
    connection(const int from, const int to)
        : from(from), to(to), start(), end() { in_view = visible;
        with_label = hidden; skip = 0.0; }
    virtual double penalties_with(const double left,const double right,
                                  const double top, const double bottom,
                                  bool core = true) const;
};

typedef vector<connection> connections_list;

@ In order to calculate penalties, we need some sort of overlap.  Since there
is no area overlap between a line and a rectangle, I need the overlapping line
length.

This is the first part of the algorithm.  It is actually pretty simple, however
hard to explain.  We have two lines to intersect: One edge of the label
rectangle and the constellation line.  The rectangle is given by |left|,
|right|, |top|, and |bottom| -- as usual.  The constellation line is given by
their start point |start| and end point |end|.  Or, in parameterised form:
%
$$\vec x = {\hbox{|start.x|} \choose \hbox{|start.y|}} + \lambda
{\hbox{|end.x|} - \hbox{|start.x|} \choose \hbox{|end.y|} - \hbox{|start.y|}},
\qquad \lambda\in[0;1].$$
%
The edge of the rectangle is given by (left edge as
example)
%
$$\eqalign{\left(\vec x - {\hbox{|left|} \choose 0}\right) \cdot
{1\choose0} &= 0 \cr \noalign{\vskip0.5ex} \Rightarrow\quad \hbox{|start.x|} +
\lambda (\hbox{|end.x|} - \hbox{|start.x|}) &= \hbox{|left|}\cr
\mathrel{\mathop\Leftrightarrow^{end.x - start.x \ne 0}\lambda = {\hbox{|left|}
- \hbox{|start.x|} \over \hbox{|end.x|} - \hbox{|start.x|}}}}$$
%
with the
boundary condition $\hbox{|bottom|} < \hbox{|start.y|} + \lambda
(\hbox{|end.y|} - \hbox{|start.y|}) =: \hbox{|intersection|} < \hbox{|top|}$.
With the abbreviations/\hskip0ptassignments (also exemplarily for the `left'
case)
%
$$\eqalign{\hbox{|numerator|} &= \hbox{|left|} - \hbox{|start.x|},\cr
\hbox{|denominator|} &= \hbox{|end.x|} - \hbox{|start.x|},\cr
\hbox{|zero_point|} &= \hbox{|start_y|},\cr \hbox{|slope|} &= \hbox{|end.y|} -
\hbox{|start.y|},\cr \hbox{|min|} &= \hbox{|bottom|},\quad \hbox{|max|} =
\hbox{|top|}}$$
%
we get the following routine for finding out whether a certain
label rectangle edge is intersected by the constellation line or not:

@q')@>

@<Definition of |line_intersection()| for intersection of two lines@>=
bool line_intersection(double numerator, double denominator,
                       double zero_point, double slope,
                       double min, double max,
                       double& intersection) {
    if (denominator == 0) return false;
    const double lambda = numerator / denominator;
    intersection = zero_point + lambda * slope;
    return lambda > 0.0 && lambda < 1.0 &&
        intersection > min && intersection < max;
}

@ Now for the second part of the intersection algorithm.  Here I apply the
preceding routing on all four label edges.  I return an overlap as the penalty
value, however I pretend that the line has a width of 8\,pt.  For an overlap
with the rim, it's only 0.5\,pt.

@q'@>

@c
double connection::penalties_with(const double left, const double right,
                                  const double top, const double bottom,
                                  bool core) const
{
    double intersection;
    point r(end.x - start.x, end.y - start.y);
    vector<point> intersection_points;
    if (line_intersection(left - start.x, r.x, start.y, r.y,
                          bottom, top, intersection))
        intersection_points.push_back(point(left, intersection));
    if (line_intersection(right - start.x, r.x, start.y, r.y,
                          bottom, top, intersection))
        intersection_points.push_back(point(right, intersection));
    if (line_intersection(top - start.y, r.y, start.x, r.x,
                          left, right, intersection))
        intersection_points.push_back(point(intersection, top));
    if (line_intersection(bottom - start.y, r.y, start.x, r.x,
                          left, right, intersection))
        intersection_points.push_back(point(intersection, bottom));
    if (start.x > left && start.x < right && start.y > bottom && start.y < top)
        intersection_points.push_back(start);
    if (end.x > left && end.x < right && end.y > bottom && end.y < top)
        intersection_points.push_back(end);
    if (intersection_points.empty()) return 0.0;
    if (intersection_points.size() != 2) {
        cerr << "pp3: Funny " << intersection_points.size()
             << "-fold constellation line intersecrtion." << endl;
        return 0.0;
    }
    const double length = hypot(intersection_points[1].x -
                                intersection_points[0].x,
                                intersection_points[1].y -
                                intersection_points[0].y);
    return (core? 8.0 * params.penalties_cline :
            0.5 * params.penalties_cline_rim) / 72.27*2.54 * length;
}

@ I must be able to read a file which contains such data.  Here, too, the text
file format is very simple: It's a list of constellation line paths separated
by `\.{;}'.  A star name must be of the form $$\eqalign{\noalign{\hbox{{\it
Constellation}\SP{\it Flamsteed number}}} \noalign{\hbox{or}}
\noalign{\hbox{\.{HD}\SP{\it Henry-Draper Catalogue number}}}}$$ where {\it
Constellation\/} must be given as an all uppercase three letter abbreviation.
For example, \.{ORI\SP19} is $\alpha$~Ori (Rigel).

The hash sign `\.{\#}' introduces comments that are ignored till end of line,
however they mustn't occur within a star.

@c
void read_constellation_lines(connections_list& connections,
                              const stars_list& stars) {
    ifstream file(params.filename_lines.c_str());
    string from_catalogue_name, to_catalogue_name;
    int from_catalogue_index = 0, to_catalogue_index = 0;
    file >> to_catalogue_name;
    while (file) {
        if (to_catalogue_name[0] == '#') { // skip comment
            string dummy;
            getline(file,dummy);
        } else if (to_catalogue_name == ";")  // start a new path
            from_catalogue_index = 0;
        else {
            file >> to_catalogue_index;
            if (from_catalogue_index > 0 && to_catalogue_index > 0) {
                @<Create one connection@>@;
            }
            from_catalogue_name = to_catalogue_name;
            from_catalogue_index = to_catalogue_index;
        }
        file >> to_catalogue_name;
    }
}

@ In the loop I try to find the index within |stars| of the `from' star and the
`to'~star.

@<Create one connection@>=
            int from_index = -1, to_index = -1;
            for (int i = 0; i < stars.size(); i++) {
                @<Test whether |stars[i]| is the `from' star@>@;
                @<Test whether |stars[i]| is the `to' star@>@;
            }
            if (from_index == -1 || to_index == -1) {
                stringstream error_message;
                error_message << "Unrecognised star in constellation lines: ";
                if (from_index == 0)
                    error_message << from_catalogue_name << ' '
                                  << from_catalogue_index;
                else
                    error_message << to_catalogue_name << ' '
                                  << to_catalogue_index;
                throw error_message.str();
            }
            connections.push_back(connection(from_index, to_index));

@ Here I test whether the current star in the loop is the `from' star.  Of
course only if I haven't found it already (|from_index == 0|).  If apparently
both stars have been found already, I leave the loop immediately.

@q;@>

@<Test whether |stars[i]| is the `from' star@>=
@q'@>
                if (from_index == -1)
                    if (from_catalogue_name == "HD") {
                        if (stars[i].hd == from_catalogue_index) from_index = i;
                    } else {
                        if (from_catalogue_name == stars[i].constellation)
                            if (stars[i].flamsteed == from_catalogue_index)
                                from_index = i;
                    } else if (to_index != -1) break;

@ Perfectly analogous to |@<Test whether |stars[i]| is the `from' star@>|.

@q'@>

@<Test whether |stars[i]| is the `to' star@>=
@q'@>
                if (to_index == -1)
                    if (to_catalogue_name == "HD") {
                        if (stars[i].hd == to_catalogue_index) to_index = i;
                    } else {
                        if (to_catalogue_name == stars[i].constellation)
                            if (stars[i].flamsteed == to_catalogue_index)
                                to_index = i;
                    } else if (from_index != -1) break;


@* The Milky Way.  The file is a text file as usual with the following
structure, everything separated by whitespace: \medskip

\item{1.} The maximal ($={}$equatorial) diagonal half distance of two pixels in
degrees (|double|).  This value is used as the |radius| for the milky way
`pixels'.  Of course it must be the minimal radius for which there are no gaps
between the pixels.

\item{2.} The pixels themselves with two |double|s and one |int| each:
\itemitem{--} The rectascension in hours.
\itemitem{--} The declination in degrees.
\itemitem{--} The grey value of the pixel from $1$ to~$255$.  Zero is not used
because zero-value pixels are not included into the data file anyway.

In \PPTHREE/'s standard distribution, this file was produced with the helper
program \.{milkydigest.cc}, and the original Milky Way bitmap was photographed
and compiled by \pdfURL{Axel
Mellinger}{http://home.arcor-online.de/axel.mellinger/}.

|pixels| is a |vector<vector<point> >|.  The outer (first) index is the grey
 value, and for every grey value there is an inner vector (second index) with a
 list of all points (rectascension, declination) that have this value.  This
 construction makes the drawing in Ghostview looking nice, but more importantly
 it reduces the number of colour change commands in the \LaTeX\ file.
 Unfortunately this doesn't reduce pool size usage.

@<Reading the milkyway into |pixels|@>=
    ifstream file(params.filename_milkyway.c_str());
    double radius;
    file >> radius;
    double rectascension, declination, x, y;
    int pixel;
    const double cm_per_grad = 1.0 /
        (mytransform.get_rad_per_cm() * 180.0 / M_PI);
    radius *= cm_per_grad / 2.54 * 72.27;
    file >> rectascension >> declination >> pixel;
    while (file) {
        if (mytransform.polar_projection(rectascension, declination, x,y))
            pixels[pixel].push_back(point(x,y));
        file >> rectascension >> declination >> pixel;
    }


@* Colour.  It's very convenient to have a unified data structure for all
colours that appear in this program.  Its internal structure is trivial, and I
only support the \RGB/ colour model.  The only complicated thing is |name|
here.  I need it because of \PS/Tricks' way to activate colours: They must get
names first.  I could get rid of it if I called all colours e.\,g.\
``\.{tempcolor}'' or ``\.{dummycolor}'' and activated them at once.  But this
is not necessary.

@s color int

@<Define |color| data structure@>=
struct color {
    double red, green, blue;
    string name;
    color(string name, double red, double green, double blue)
        : red(red), green(green), blue(blue), name(name) { }
    color(double red, double green, double blue)
        : red(red), green(green), blue(blue), name() { }
    void set(ostream& out) const;
};

@ This routine is used when the name of the colour is not necessary, because
it's only needed locally.  This is the case for text labels and the Milky Way
dots.

@q'@>

@c
void color::set(ostream& out) const {
    out << "\\newrgbcolor{dummycolor}{" << red << ' ' << green << ' ' << blue
        << "}\\dummycolor\n  \\psset{linecolor=dummycolor}%\n";
}

@ Both output and input of |color|s is asymmetric: When I {\it read\/} them I
assume that I do it from an input script.  Then it's a mere sequence of the
three colour values.

@q'@>

@c
istream& operator>>(istream& in, color& c) {
    in >> c.red >> c.green >> c.blue;
    if (!in @/
        || c.red < 0.0 || c.red > 1.0 @/
        || c.green < 0.0 || c.green > 1.0 @/
        || c.blue < 0.0 || c.blue > 1.0)
        throw string("Invalid RGB values in input script");
    return in;
}

@ But when I {\it write\/} them, I assume that I do it into a \LaTeX\ file with
\PS/Tricks package activated.  Then I deploy a complete \.{\\newrgbcolor}
command.

@c
ostream& operator<<(ostream& out, const color& c) {
    if (c.name.empty()) throw string("Cannot write unnamed color to stream");
    out << "\\newrgbcolor{" << c.name << "}{" << c.red << ' ' << c.green
        << ' ' << c.blue << "}%\n";
    return out;
}

@ This routine is hitherto only used when drawing the milky way.  It helps to
find a colour between the two extremes |c1| and~|c2|.  The value of |x| is
always between $0$ and~$1$ and denotes the point on the way between |c1| and
|c1| in the \RGB/ colour space where the new colour should be.  I interpolate
linearly.  In order to create a new colour object, I need a |new_name| for it,
too.

@c
color interpolate_colors(const double x, const color c1, const color c2,
                         const string new_name = "") {
    if (x < 0.0 || x > 1.0) throw string("Invalid x for color interpolation");
    const double y = 1.0 - x;
    return color(new_name,
                 y * c1.red + x * c2.red,
                 y * c1.green + x * c2.green,
                 y * c1.blue + x * c2.blue);
}


@q@** Ephemerides.@>


@** Drawing the chart.  This is done in two steps.  First the lines and the
celestial objects are printed.  During this phase a lot of labels may
accumulate.  They cannot be drawn at that phase, because the arrangement with
minimal overlaps can only be calculated when all are known.

Therefore I have to fill a container called |objects| which contains elements
of type |view_data|.  The part of each |star| or |nebula| or whatever that is
|view_data| is appended to |objects|, if and only if the object is visible in
the view frame.  The typical command for that is
$$\hbox{|objects.push_back(&stars[i]);|}$$ (here for stars).
Please notice that it is {\it not\/} important whether or not the respective
object bears a label.  Its data is needed in any case.

In the second phase I arrange and print the labels.

@* Coordinate transformations.  They are done by the class |transformation|.
|width| and |height| contain the view frame dimensions in centimetres.
|rad_per_cm| is the resolution.

The $3\times3$ matrices |a| and |a_unscaled| are rotation matrices for the
transformation in cartesian space from the equatorial system into the azimuthal
system, where the center of the view frame is the $z$ axis.  While |a_unscaled|
refers to a celestial sphere with radius~$1$, |a| contains the additional
scaling for the actual centimetres on the paper.

@s transformation int

@c
class transformation {
    double width, height, rad_per_cm;
    double a[3][3], a_unscaled[3][3];
    inline double stretch_factor(double z) const;
public:
    transformation(const double rectascension,
                   const double declination,
                   const double width, const double height,
                   const double grad_per_cm);
    bool polar_projection(const double rectascension, const double declination,
                          double& x, double& y) const;
    double get_rad_per_cm() const @+ { @+ return rad_per_cm; @+ }
};

@ Starting point is the parallel projection of a celestial unit sphere on the
$x$-$y$ plane.  This projection looks like a sky globus seen from far away with
a strong zoom objective.

It is the starting point because it simply is a necessary intermediate step:
All celestial positions given in polar coordinates ({\it rectascension}, {\it
declination\/}) must be transformed to cartesian coordinates in order to apply
a rotation on them for having the center of the view frame in the center of the
coordinate system.  From there it's a trivial step to the parallel projection.

But it squeezes the rim areas too much, which I don't like.

By |stretch| I mean the radial stretch factor that should relieve this
distortion.  If |stretch| was |1.0|, we would get the mentioned parallel
projection.

\def\frac#1#2{{#1\over#2}}

Therefore I stretch the plot here so that this effect is minimised.  The result
is the equidistant azimuthal projection that can be described best if you
imagine a plot with its center exactly on the north pole: All circles of equal
declination have then the same distance from each other.  So the plot keeps its
circular form.  The {\it radial\/} scale is constant everywhere and equal to
|grad_per_cm|.  Perpendicular to that, the scale is decreasing from
|grad_per_cm| (center) to $2/\pi\cdot{}$|grad_per_cm| (border).  The exact
relation is $$\eqalignno{{\it scale}_\parallel &= \hbox{|grad_per_cm|},\cr {\it
scale}_\perp &= \hbox{|grad_per_cm|} \cdot {r \over
\arccos\sqrt{1-r^2}},\quad\hbox{and thus}\cr \noalign{\vskip0.5ex} {\it
stretch} &= {\arccos\sqrt{1-r^2} \over r}. &(1)}$$ $r$ is simply the distance
from the center of the plot and it is $1$ on the border.  But I don't have $r$,
I have $z$.  I could to the substitution $r = \sqrt{1-z^2}$ leading to a very
badly converging Taylor series, but much better is $\tilde z = 1 - z$ and to
use a Taylor series of $${\it stretch} = {\arccos (1-\tilde z) \over \sqrt{1-
(1-\tilde z)^2}}.$$ Maple\,V says $${\it stretch} = 1+1/3\,\tilde
z+2/15\,{\tilde z}^{2}+{\frac {2}{35}}\,{\tilde z}^{3} + {\frac
{8}{315}}\,{\tilde z}^ {4} + {\frac{8}{693}}\,{\tilde z}^{5} + {\cal O}({\tilde
z}^{11/2}).$$ This is good enough (error less than 1\,\%).  There are two
alternatives:

\medskip \item{1.} Use the Tayor expansion of~(1) directly, because this
expansion converges very quickly, especially for the center-near regions.  This
would mean to calculate $r(z)$ for every point, but this shouldn't be too
costly.  \item{2.} Transform back in spherical coordinates, re-interpret them
as planar polar coordinates and transform them to planar cartesian.  Probably
too difficult.  \medskip

Why not calculating~(1) (maybe with a subsitution) directly without series
expansion?  First, it may be too costly.  But secondly, I don't like that in
the particularly interesting region close to the center of the view frame both
numerator and denominator get close to $0$, and eventually they do reach it.
Maybe I'm paranoid, but I don't like that.

\def\zt{\tilde z}

@s zt TeX

@q'@>

@c
inline double transformation::stretch_factor(const double z) const {
    const double zt = 1.0 - z;
    return 1.0 + zt *
        ( 1.0/3.0 + zt *
          ( 2.0/15.0 + zt *
            ( 2.0/35.0 + zt *
              ( 8.0/315.0 + zt *
                ( 8.0/693.0 )))));
}

@ This is not only the constructor for |transformation|, it is also the
initialiser for the whole transformation.  As much work as possible is this
routine, in order to keep calculations easy in the function
|polar_projection()| which will be called hundreds if not thousands of times.

|rectascension| is given in hours, together with |declination| it's the center
of the desired view frame.  |width| and |height| give its dimensions in
centimetres, |grad_per_cm| is the resulting resolution in the center.
$$\hbox{|a_unscaled|} = \pmatrix{\sin\varphi & \cos\varphi & 0\cr
\cos\varphi\cos\alpha & -\sin\varphi\cos\alpha & \sin \alpha\cr
-\cos\varphi\sin\alpha & \sin\varphi\sin\alpha & \cos\alpha}.$$

@q'@>
  
@c
transformation::transformation(const double rectascension,
                               const double declination,
                               const double width, const double height,
                               const double grad_per_cm) {
    const double phi = - (rectascension + 12) * 15.0 * M_PI / 180.0;
    const double delta = declination * M_PI / 180.0;
    const double alpha = - delta + M_PI_2;
    rad_per_cm = grad_per_cm * M_PI / 180.0;
    a_unscaled[0][0] = sin(phi);
    a_unscaled[0][1] = cos(phi);
    a_unscaled[0][2] = 0.0;
    a_unscaled[1][0] = cos(phi) * cos(alpha);
    a_unscaled[1][1] = -sin(phi) * cos(alpha);
    a_unscaled[1][2] = sin(alpha);
    a_unscaled[2][0] = -cos(phi) * sin(alpha);
    a_unscaled[2][1] = sin(phi) * sin(alpha);
    a_unscaled[2][2] = cos(alpha);
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            a[i][j] = a_unscaled[i][j] / rad_per_cm;
    transformation::width = width;
    transformation::height = height;
}

@ Here I transform the equatorial position $(\hbox{|rectascension|},
\hbox{|declination|})$ to the cartesian position $(x,y)$.  The resulting
cartesian positions represents an azimuthal equidistant projection with the
center of the view frame (see |rectascension| and |declination| in the
constructor of |transformation|).

It returns |true| if the resulting point is within the view frame, otherwise
|false|.

@c    
bool transformation::polar_projection(const double rectascension,
                                      const double declination,
                                      double& x, double& y) const {
    const double phi = rectascension * 15.0 * M_PI / 180.0;
    const double delta = declination * M_PI / 180.0;
    const double cos_delta = cos(delta);

    const double x0 = cos_delta * cos(phi);
    const double y0 = cos_delta * sin(phi);
    const double z0 = sin(delta);
    
    const double z1 =
        a_unscaled[2][0] * x0 + a_unscaled[2][1] * y0 + a_unscaled[2][2] * z0;
    if (z1 < -DBL_EPSILON) return false;
    const double stretch = stretch_factor(z1);
    const double x1 = a[0][0] * x0 + a[0][1] * y0;
    const double y1 = a[1][0] * x0 + a[1][1] * y0 + a[1][2] * z0;
    x = x1 * stretch + width / 2.0;
    y = y1 * stretch + height / 2.0;
    if (x < 0.0 || x > width || y < 0.0 || y > height) return false;
    return true;
}


@* Label organisation.  Without labels, star charts are not very useful.  But
labels mustn't overlap, and they should not overlap with other chart elements
such as star circles or nebula circles.  Here I try to develop a simple
algorithm that is able to avoid most of these problems.  There are two main
routines here: |arrange_labels()| and |print_labels()|.

|arrange_labels()| modifies the |label_angle| field in each celestial object
in order to avoid any overlap with other objects, namely other labels, stars,
or nebulae.  It does so by testing all eight values for |label_angle| and
calculating a |penalty| value for each of them.  This |penalty| is
$$\hbox{|penalty|} = \hbox{\it overlap}_{\hbox{\sevenrm labels}} + \hbox{\it
overlap}_{\hbox{\sevenrm objects}} + \hbox{\it penalty}_{\hbox{\sevenrm
lines}}.$$

|print_labels()| actually generates the \LaTeX\ code for printing them.

@q'@>

@ First the routine that actually calculates the overlap.  It simply finds the
common rectangular area in squared centimetres.  Both rectangles are given by
their boundaries, |left1|, |right1|, |top1|, |bottom1| enclose the first
rectangle, |left2|, |right2|, |top2|, |bottom2| the second.

@c
double calculate_overlap(double left1, double right1, double top1,
                         double bottom1, double left2, double right2,
                         double top2, double bottom2) {
    const double overlap_left = fmax(left1, left2);
    const double overlap_right = fmin(right1, right2);
    const double overlap_top = fmin(top1, top2);
    const double overlap_bottom = fmax(bottom1, bottom2);
    const double overlap_x = fdim(overlap_right, overlap_left);
    const double overlap_y = fdim(overlap_top, overlap_bottom);
    return overlap_x * overlap_y;
}

@ Nor for a structure with the real dimensions in centimetres of all possible
labels.  They are read from the file \.{labeldims.dat} and stored in a
|dimensions_list|.

@s dimensions_list int
@s dimension int
@q'@>

@c
struct dimension {
    double width, height, depth;
    dimension() :  width(0.0), height(0.0), depth(0.0) { }
    dimension(const dimension& d) : width(d.width), height(d.height), 
                                    depth(d.depth) { }
};

typedef map<string,dimension> dimensions_list;

@ Now we re-arrange the labels, namely |objects[i].with_label| for all~|i|.
For efficiency, I first find all neighbours of the on-object and do all the
following work only with them.  In the inner |k|-loop I test all possible
|label_angle|s and calculate their |penalty|.

If a label leaps out of the view frame, this adds to |penalty| the gigantic
value of |10000.0|.
    
@c
@<|create_preamble()| for writing the \LaTeX\ preamble@>@#@;
@<Helping routines for nebulae labels@>@#@;

void arrange_labels(objects_list& objects, dimensions_list& dimensions) {
    objects_list vicinity;
    @<Set label dimensions@>@;
    for (int i = 0; i < objects.size(); i++) {
        vicinity.clear();
        if (objects[i]->in_view == visible && objects[i]->with_label == visible
            && !objects[i]->label_arranged) {
            @<Find objects in vicinity of |objects[i]|@>@;
            double best_penalty = DBL_MAX;
            int best_angle = 0;
            for (int k = 0; k < 8; k ++) {
                objects[i]->label_angle = k;
                double on_object_left, on_object_right, on_object_top,
                    on_object_bottom;
                objects[i]->
                    get_label_boundaries(on_object_left, on_object_right,
                                         on_object_top, on_object_bottom);
                double penalty = 0.0;
                double rim_width = 2.0 * objects[i]->skip;
                for (int j = 0; j < vicinity.size(); j++) {
                    penalty += vicinity[j]->
                        penalties_with(on_object_left, on_object_right,
                                       on_object_top, on_object_bottom) + @|
                        vicinity[j]->
                        penalties_with(on_object_left - rim_width,
                                       on_object_right + rim_width,
                                       on_object_top + rim_width,
                                       on_object_bottom - rim_width,
                                       false) * params.penalties_rim;
                }
                if (on_object_left < 0.0 || on_object_bottom < 0.0 ||
                    on_object_right > params.view_frame_width ||
                    on_object_top > params.view_frame_height)
                    penalty += 10000.0;
                if (penalty < best_penalty) {
                    best_penalty = penalty;
                    best_angle = k;
                }
            }
            if (!objects[i]->label.empty())
                if (best_penalty < 0.4 * params.penalties_threshold *
                    objects[i]->label_height * objects[i]->label_width) {
                    objects[i]->label_angle = best_angle;
                    objects[i]->label_arranged = true;
#ifdef DEBUG
                    stringstream penalty;
                    penalty.precision(2);
                    penalty << " " << best_penalty << " ("
                            <<  best_penalty /
                        (objects[i]->label_height * objects[i]->label_width)
                        * 100 << "%)";
                //  |objects[i]->label += penalty.str();|
                    cerr << "pp3DEBUG: Object " << objects[i]->label << ' ';
                    const star* s = dynamic_cast<star*>(objects[i]);
                    if (s) cerr << s->constellation;
                    cerr << " has penalty of" << penalty.str() << endl;
#endif
                } else {
                    objects[i]->with_label = hidden;
                    objects[i]->label_arranged = true;
                }
        }
    }
}

@ All objects in the vicinity of |objects[i]| eventually end up in the |vector|
|vicinity|.  Here I fill this structure.  I use a very rough guess for finding
the neighbours, so there will probably be too many of them, but it makes
calculation much easier.

The practical thing is that neighbouring objects are ordered in increasing
brightness in star data file, which means that lables of bright stars are
arranged first, and labels of fainter stars must cope with these positions.

Of course, it's guaranteed that |objects[i]| is not part of its vicinity.

@q'@>

@<Find objects in vicinity of |objects[i]|@>=
            const double on_object_scope = objects[i]->scope();
            for (int j = 0; j < objects.size(); j++) {
                if (i != j && objects[j]->in_view == visible) {
                    const double distance =
                        hypot(objects[i]->x - objects[j]->x,
                              objects[i]->y - objects[j]->y);
                    if (distance < on_object_scope + objects[j]->scope() &&
                        @<Condition to exclude double stars and such@>)
                        vicinity.push_back(objects[j]);
                }
            }

@ @<Condition to exclude double stars and such@>=
(distance > objects[j]->skip ||
 (objects[j]->with_label == visible && !objects[j]->label.empty()))

@ Finally I print out all labels by generation \LaTeX\ code from any of them.
I do that by calculating the coordinates in centimetres of the {\it bottom
left\/} corner of the label box, and placing the \TeX\ box there.  This \TeX\
box lies within another one with zero dimensions in order to keep the point of
origin (bottom left of the view frame) intact.

@c
void print_labels(const objects_list& objects) {
    for (int i = 0; i < objects.size(); i++)
        if (objects[i]->in_view == visible && objects[i]->with_label == visible
            && objects[i]->label_arranged) {
            double left, right, top, bottom;
            objects[i]->get_label_boundaries(left,right,top,bottom);
            if (left < 0.0 || bottom < 0.0 || right > params.view_frame_width
                || top > params.view_frame_height) continue;

            objects[i]->label_color.set(OUT);
            OUT << "\\hbox to 0pt{";
            OUT << "\\hskip" << left << "cm";
            OUT << "\\vbox to 0pt{\\vss\n  \\hbox{\\Label{";
            OUT << objects[i]->label;
            OUT << "}}\\vskip" << bottom << "cm";
            OUT << "\\hrule height 0pt}\\hss}%\n";
#ifdef DEBUG
            OUT << "\\psframe[linewidth=0.1pt](" << left << ',' << bottom
                << ")(" << right << ',' << bottom+objects[i]->label_depth << ")%\n";
            OUT << "\\psframe[linewidth=0.3pt](" << left << ',' << bottom
                << ")(" << right << ',' << top << ")%\n";
#endif
        }
}

@ Here I read label dimensions from a text file.  The format is very simple:
\medskip

\item{1.} The \LaTeX\ representation of the label on a line of its own.
\item{2.} In the following line, width, height, and depth of the label in
centimetres (both |double|), separated by whitespace.

\medskip This is repeated for every data record.

@c
void read_label_dimensions(dimensions_list& dimensions) {
    ifstream file(params.filename_dimensions.c_str());
    string name,dummy;
    getline(file,name);
    while (file) {
        file >> dimensions[name].width >> dimensions[name].height
             >> dimensions[name].depth;
        getline(file,dummy);  // Read the |'\n'|
        getline(file,name);
    }
}

@*1 Determining label dimensions.  {\sloppy Here I go through all |objects| and
set the |label_width|, |label_height|, and |label_depth| which have been zero
so far.  It may happen that a label is not found (possibly because |dimensions|
is totally empty because no label dimensions file could be found).  In this
case I call |recalculate_dimensions()| to get all labels recalculated via an
extra \LaTeX\ run.\par}

|dimensions_recalculated| is |true| if |recalculate_dimensions()| has been
 called and thus one can assume that all needed labels are now available.  It
 is merely to remove unnecessary tests and make the procedure faster.

The |throw| command should never happen.  It means an internal error.

@<Set label dimensions@>=
bool dimensions_recalculated = false;
for (int i = 0; i < objects.size(); i++) {
    view_data* current_object = objects[i];
    if (current_object->with_label == visible) {
        if (!dimensions_recalculated &&
            dimensions.find(current_object->label) == dimensions.end()) {
            recalculate_dimensions(dimensions,objects);
            dimensions_recalculated = true;
            if (dimensions.find(current_object->label) == dimensions.end())
                throw string("Update of label dimensions file failed: \"") +
                    current_object->label + "\" not found";
        }
        current_object->label_width = dimensions[current_object->label].width;
        current_object->label_height =
            dimensions[current_object->label].height;
        current_object->label_depth = dimensions[current_object->label].depth;
    }
}


@ When \PPTHREE/ is started it reads a file usually called \.{labeldimens.dat}
in order to know width, height, and depth (in centimetres) of all labels.  This
is vital for the penalty (i.\,e.\ overlap) calculations.  But it may be that a
label that you want to include can't be found in this file, or you have deleted
it because you've changed the \LaTeX\ preamble of the output (i.\,e.\ the
fonts).  In these cases \PPTHREE/ automatically creates a new one.  It is then
used in the following runs to save time.

Here I do this.  First I store all label names (not only the missing!)\ in
|required_names|.  I assure that every label occurs only once.

Then I create a |temp_file| which is a \LaTeX\ file that -- if sent through
\LaTeX\ -- is able to create another temporary file called |raw_labels_file|.
This is read and stored directly in |dimensions| (where it belongs to
naturally).  At the same time a new, updated |cooked_labels_file| (aka
\.{labeldimens.dat}) is created.

\medskip
By the way, I am forced to use {\it two\/} temporary files.  It is impossible
to let the \LaTeX\ file create directly the file \.{labeldimens.dat}.  The
reason are the label string:  They may contain characters that have a special
meaning in \LaTeX, and I'm unable to avoid any tampering.

@q'@>

@<Helping routines for nebulae labels@>=
void recalculate_dimensions(dimensions_list& dimensions,
                            const objects_list& objects)
{
    list<string> required_names;
    for (int i = 0; i < objects.size(); i++) {
        const string current_name = objects[i]->label;
        if (!current_name.empty()) required_names.push_back(current_name);
    }
    required_names.unique();

    ofstream temp_file("pp3temp.tex");
    create_preamble(temp_file);
    temp_file << "\n\\begin{document}\n"
              << "\\newwrite\\labelsfile\n"
              << "\\catcode`\\_=11  % for underscores in the filename\n"
              << "\\immediate\\openout\\labelsfile=pp3temp.dat\n"
              << "\\catcode`\\_=8\n";
    list<string>::const_iterator p = required_names.begin();
    while (p != required_names.end())
        temp_file << "\\setbox0 = \\hbox{" << *(p++)
                  << "}\n  \\immediate\\write\\labelsfile{"
                     "\\the\\wd0s \\the\\ht0s \\the\\dp0s}\n";
    temp_file << "\\immediate\\closeout\\labelsfile\n\\end{document}\n";
    temp_file.close();
    string commandline("latex pp3temp");
    if (params.filename_output.empty())
        commandline += " > pp3dump.log";
    if (system(commandline.c_str()) != 0)
        throw string("Label dimensions calculations: LaTeX call failed: ")
            + commandline;

    ifstream raw_labels_file("pp3temp.dat");
    ofstream cooked_labels_file("labeldimens.dat");
    cooked_labels_file.setf(ios::fixed);
    cooked_labels_file.precision(5);
    p = required_names.begin();
    while (p != required_names.end()) {
        string current_width, current_height, current_depth;
        string current_name;
        current_name = *(p++);
        raw_labels_file >> current_width >> current_height >> current_depth;
        current_width.substr(0,current_width.length() - 3);
        current_height.substr(0,current_height.length() - 3);
        current_depth.substr(0,current_depth.length() - 3);
        dimensions[current_name].width = strtod(current_width.c_str(), 0)
            / 72.27 * 2.54;
        dimensions[current_name].height = strtod(current_height.c_str(), 0)
            / 72.27 * 2.54;
        dimensions[current_name].depth = strtod(current_depth.c_str(), 0)
            / 72.27 * 2.54;
        dimensions[current_name].height += dimensions[current_name].depth;
        cooked_labels_file << current_name << '\n'
                           << dimensions[current_name].width << ' '
                           << dimensions[current_name].height << ' '
                           << dimensions[current_name].depth
                           << '\n';
    }
}

@*1 User labels.  The user should be able to insert arbitaray text into the
chart.  The code for this is provided here.  The data type of them, |text|, is
of course a classical derivative of |view_data|.  It only holds the celestial
coordinates and the text (\LaTeX) string of the label.

@s text int

@c
struct text : public view_data {
    string contents;
    double rectascension, declination;
    text(string t, double r, double d, color c, int angle, bool on_baseline);
};

typedef list<text> texts_list;

@ In the constructor I modify the values of some |view_data| elements, because
a |text| is a special label.  For example it mustn't be arranged, because it is
already.  And it gets another colour (if wanted).

@q'@>

@c
text::text(string t, double r, double d, color c, int angle, bool on_baseline)
    : contents(t), rectascension(r), declination(d) {
    label = string("\\TextLabel{") + t + '}';
    with_label = visible;
    label_angle = angle;
    view_data::on_baseline = on_baseline;
    label_arranged = true;
    label_color = c;
    radius = skip = 0.0;
}

@ This routine is called |draw_|\dots\ due to its analogy to the other drawing
function.  But curiously enough, I don't draw anything here, because labels are
drawn in |print_labels()| and |text|s consists only of labels.  I only have to
assure that I don't include invisible labels.

@c
void draw_text_labels(transformation& mytransform, texts_list& texts,
                      objects_list& objects) {
    texts_list::iterator p = texts.begin();
    while (p != texts.end()) {
        double x,y;
        if (mytransform.polar_projection(p->rectascension,
                                         p->declination,
                                         x,y)) {
            p->in_view = visible;
            p->x = x;
            p->y = y;
            objects.push_back(&(*p));
        }
        p++;
    }
}

@*1 Flex labels.  ``Flex labels'' are drawn along a path that needn't (and
usually isn't) be a straight line.  Unfortunately, due to this, their
dimensions are very difficult to predict and therefore they are {\it not\/}
part of the penalty algorithm -- at least not in the current version.

Eventually \PPTHREE/ could have many kinds of flexes, therefore there is a
common (abstract) ancestor for all of them called |flex_label|.  But at the
moment I only implement the by far most important one, the |declination_flex|,
see below.

Flexes are special also in another respect: They are read from the input
script.  This means that the |flexes_list| that contains all flexes (of all
kinds) is filled during reading the input script.  Therefore there is no {\it
read\_flexes\/}(\,), and no file format associated with it.

@s flex_label int
@s declination_flex int

@q')}@>

@c
struct flex_label : public view_data {
    double rectascension, declination;
    flex_label(string s, double r, double d, color c, int a, bool b);
    virtual bool draw(const transformation& mytransform,
                      dimensions_list& dimensions, objects_list& objects)
        const = 0;
};

@ Of course I need no extra label because a flex is a label of its own.  So a
flex only uses |label| and |label_angle|.  The rest is unimportant because the
label isn't printed anyway because the coodrinates |x| and |y| are invalid
anyway and therefore printing will be rejected in |print_labels()|.

Actually |on_baseline| is insignificant for flexes.

@c
flex_label::flex_label(string s, double r, double d, color c, int a, bool b)
    : rectascension(r), declination(d) {
    label_color = c;
    label = string("\\FlexLabel{") + s + '}';
    label_angle = a;
    on_baseline = b;
    in_view = visible;
    with_label = hidden;
    label_arranged = true;
}

typedef list<flex_label*> flexes_list;

@ |declination_flex| enables us to write a text along a path of constant
declination.  This looks very nice on the chart.

@c
struct declination_flex : public flex_label {
    declination_flex(string s, double r, double d, color c, int a, bool b)
        : flex_label(s,r,d,c,a,b) { }
    virtual bool draw(const transformation& mytransform,
                      dimensions_list& dimensions, objects_list& objects)
        const;
    virtual double penalties_with(const double left, const double right,
                                  const double top, const double bottom,
                                  bool core = true) const;
};

@ This is the main declination flex routine.  I calculate the dimensions of the
label in oder to find out how long the path must be and how much it must be
shifted vertically in order to get the desired angular positioning.  Both
values can only be estimates.  (For example, the scale is not constant on the
map, so it cannot work perfectly.  However I try to assure that the path will
be too long rather than too short.)

Then I calculate the coordinates of three points that form the path.  Start
point, end point, and one exactly in between.  Of course all have the same
declination.  |lower| is measured in em and denotes the amount by which the
whole text is shifted downwards.  This is sub-optimal because it may affect
letterspacing disadvantageously.

Finally the three coordinate pairs and the label text are sent to the output in
form of a \PS/Tricks text path command.

@c
bool declination_flex::draw(const transformation& mytransform,
                            dimensions_list& dimensions,
                            objects_list& objects) const {
    if (dimensions.find(label) == dimensions.end())
        recalculate_dimensions(dimensions, objects);
    if (dimensions.find(label) == dimensions.end())
        throw string("Update of label dimensions file failed: \"") +
            label + "\" not found";
    const double label_width = dimensions[label].width;
    const double label_height = dimensions[label].height;
    const double rectascension_halfwidth = label_width
        * mytransform.get_rad_per_cm() * 180.0/M_PI / 15.0
        / cos(declination * M_PI/180.0) / 2.0;
    char justification;
    double path_point_rectascension[3];
    path_point_rectascension[0] = rectascension;
    path_point_rectascension[1] = rectascension - rectascension_halfwidth;
    path_point_rectascension[2] = rectascension -
        2.0 * rectascension_halfwidth;
    switch (label_angle) {
    case 0: case 1: case 7:
        justification = 'l';
        break;
    case 2: case 6:
        justification = 'c';
        for (int i = 0; i < 3; i++)
            path_point_rectascension[i] += rectascension_halfwidth;
        break;
    case 3: case 4: case 5:
        justification = 'r';
        for (int i = 0; i < 3; i++)
            path_point_rectascension[i] += 2.0 * rectascension_halfwidth;
        break;
    }
    double lower;
    switch (label_angle) {
    case 0: case 4: lower = -0.4; break;
    case 1: case 2: case 3: lower = 0.0; break;
    case 5: case 6: case 7: lower = -0.8; break;
    }
    double x[3],y[3];
    for (int i = 0; i < 3; i++)
        if (!mytransform.polar_projection(path_point_rectascension[i],
                                          declination, x[i],y[i]))
            return false;

    label_color.set(OUT);
    OUT << "\\FlexLabel{\\pstextpath[" << justification
        << "](0," << lower << "em){\\pscurve[linestyle=none]%\n  ";
    for (int i = 0; i < 3; i++)
        OUT << '(' << x[i] << "cm," << y[i] << "cm)";
    OUT << "}{\\dummycolor" << label << "}}%\n";
    
    return true;
}

@ As I've already said, a flex is (at the moment) excluded from the penalty
algorithm.  This is realised here: This routine always returns zero.

@c
double declination_flex::penalties_with(const double left, const double right,
                   const double top, const double bottom,
                   bool core) const {
        return 0.0;
}

@ This is the drawing routine called from the main program.  It goes through
all flexes twice: First it only fills |objects|.  Then it actually draws the
flexes.  The reason is efficiency: This assures that all needed labels are
available before the first flex is about to be draw which may mean a
reclaculation of the label dimensions.  If I realised this in one pass, the
needed labels would occure over and over again, and every time it would be
necessary to recalculate the dimensions.

@c
void draw_flex_labels(const transformation& mytransform,
                      const flexes_list& flexes, objects_list& objects,
                      dimensions_list& dimensions) {
    flexes_list::const_iterator p = flexes.begin();
    while (p != flexes.end()) objects.push_back(*p++);
    p = flexes.begin();
    while (p != flexes.end()) (*p++)->draw(mytransform,dimensions,objects);
}

@* Drawing stars.  Stars are a little bit simpler than nebulae because they are
mere disks.  They are only included if they have a certain minimal magnitude.
The disk radius is calculated according to $$\eqalign{ \hbox{|radius|} &=
\sqrt{m_{\hbox{\sevenrm min}} - m + \hbox{\it radius}_{\hbox{\sevenrm
min}}^2}\,,\quad\hbox{if $m<m_{\hbox{\sevenrm min}}$\,,}\cr
\noalign{\vskip0.5ex} \hbox{|radius|} &= m_{\hbox{\sevenrm min}}\,,\quad
\hbox{otherwise}.}$$

The star gets a label by default only if it has a certain magnitude.  This is
even a little bit stricter than the related condition above.

Then only the stellar colour has yet to be calculated, and it can be printed.

@q;@>

@c
@<|create_hs_colour()| for star colour determination@>@;@#

void draw_stars(const transformation& mytransform, stars_list& stars,
                objects_list& objects) {
    for (int i = 0; i < stars.size(); i++)
        if (stars[i].in_view != hidden &&
            stars[i].magnitude < params.faintest_star_magnitude) {
                // Effectively all stars of the \BSC/
            if (mytransform.polar_projection(stars[i].rectascension,
                                             stars[i].declination,
                                             stars[i].x,stars[i].y)) {
                stars[i].in_view = visible;
                const double m_dot = params.faintest_star_disk_magnitude;
                const double r_min = params.minimal_star_radius /
                    params.star_scaling;
                stars[i].radius = params.star_scaling *
                    (stars[i].magnitude < m_dot ?
                     sqrt((m_dot - stars[i].magnitude)/300.0 + r_min*r_min)
                     : r_min);
                if (stars[i].with_label == undecided) 
                    stars[i].with_label =
                        (stars[i].magnitude <
                         params.faintest_star_with_label_magnitude &&
                         !stars[i].name.empty()) ? visible : hidden;
                if (params.colored_stars) {
                    OUT << "\\newhsbcolor{starcolor}{";
                    create_hs_colour(stars[i].b_v,stars[i].spectral_class);
                    OUT << " 1}%\n";
                } else OUT << params.starcolor;
                OUT << "\\pscircle*[linecolor=starcolor]("
                    << stars[i].x << ","
                    << stars[i].y << "){"
                    << stars[i].radius / 2.54 * 72.27 << "pt}%\n";
                objects.push_back(&stars[i]);
            } else stars[i].in_view = hidden;
        } else stars[i].in_view = stars[i].with_label = hidden;
}

@ I want to use the B$-$V magnitude for the colour of the star disks on the
maps.  Here I map the value of the B$-$V magnitude to a colour in the \HSB/
space.  `\HSB/' -- `Hue, Saturation, Brightness' (all three fom $0$ to~$1$).
Brightness is always~$1$, so only hue and saturation have to be calculated.

There are three intervals for B$-$V with the boundaries |bv0|, |bv1|, |bv2|,
and |bv3|.  |bv0|--|bv1| is blue, |bv1|--|bv2| is white, and |bv2|--|bv3| is
red.  On each boundary, the hue values |hue0|--|hue3| respectively are valid.
Inbetween I interpolate linearly (rule of three).

@q;@>

@<|create_hs_colour()| for star colour determination@>=
void create_hs_colour(double b_v, string spectral_class) {
    double hue, saturation;
    const double bv0 = -0.1, bv1 = 0.001, bv2 = 0.62, bv3 = 1.7;
    const double hue0 = 0.6, hue1 = 0.47, hue2 = 0.17, hue3 = 0.0;
    const double min_saturation = 0.0, max_saturation = 0.2;
    @<Handle missing B$-$V value@>@;
    if (b_v < bv0) b_v = bv0;  // cut off extreme values
    if (b_v > bv3) b_v = bv3;
    if (b_v < bv1) {  // blue star
        hue = (b_v - bv0) / (bv1 - bv0)
            * (hue1 - hue0) + hue0;
        saturation = (b_v - bv0) / (bv1 - bv0)
            * (min_saturation - max_saturation) + max_saturation;
    }
    else if (b_v < bv2) { // white star: constantly white.
        hue = 0.3;  // could be anything
        saturation = 0;
    }
    else {  // red star
        hue =  (b_v - bv2) / (bv3 - bv2)
            * (hue3 - hue2) + hue2;
        saturation = (b_v - bv2) / (bv3 - bv2)
            * (max_saturation - min_saturation) + min_saturation;
    }
    OUT << hue << ' ' << saturation;
}

@ Since there are some stars in the stellar catalogue without a B$-$V
brightness, I need a fallback on the spectral class.  For such stars is
$\hbox{|b_v|} = 99$.  In this routine I use the very first character in the
string with the spectral class for determining an estimated value for
B$-$V\spacefactor1000.  The values are averages of all stars in the \BSC/ with
the respective spectral class.

@<Handle missing B$-$V value@>=
    if (b_v > 90.0) {
        switch (spectral_class[0]) {
        case 'O': b_v = 0.0; @+ break;
        case 'B': b_v = -0.07; @+ break;
        case 'A': b_v = 0.11; @+ break;
        case 'F': b_v = 0.43; @+ break;
        case 'G': b_v = 0.89; @+ break;
        case 'K': b_v = 1.24; @+ break;
        case 'M': b_v = 1.62; @+ break;
        case 'N': b_v = 2.88; @+ break;
        case 'S': b_v = 1.84; @+ break;
        case 'C': b_v = 3.02; @+ break;
        default: b_v = 0.0; @+ break;
        }
    }


@* Drawing nebulae.  Only nebulae with a certain minimal brightness are
included, and all Messier objects, but all of these get a label by default.

The first decision I have to make here is whether the nebula has all necessary
data for drawing a neat ellipsis that has the correct diameters and the correct
angle.  If this is not anvailable (|horizontal_angle|${}=720^\circ$), the
nebula ellipsis is re-calculated so that $$\eqalign{ \hbox{|diameter_x|}_
{\hbox{\sevenrm new}} &= \hbox{|diameter_y|}_ {\hbox{\sevenrm
new}}\quad\hbox{and}\cr \noalign{\vskip0.5ex} \hbox{|diameter_x|}_
{\hbox{\sevenrm new}} \cdot \hbox{|diameter_y|}_ {\hbox{\sevenrm new}} &=
\hbox{|diameter_x|}_ {\hbox{\sevenrm old}} \cdot \hbox{|diameter_y|}_
{\hbox{\sevenrm old}}}$$ (make the ellipsis a circle of the same area) which
means $$\hbox{|diameter_x|}_ {\hbox{\sevenrm new}} \mathrel{:=}
\hbox{|diameter_y|}_ {\hbox{\sevenrm new}} \mathrel{:=}
\sqrt{\hbox{|diameter_x|}_ {\hbox{\sevenrm old}} \cdot \hbox{|diameter_y|}_
{\hbox{\sevenrm old}}}.$$

The |radius| of the nebula is a rough estimate: It is simply the half of
|diameter_x|.  If the nebula is too small, it is printed as a minimal circle.
If it's large enough, it is printed in its (almost) full beauty, see |@<Draw
nebula shape@>|.

@q'@>

@c
void draw_nebulae(const transformation& mytransform, nebulae_list& nebulae,
                  objects_list& objects) {
    OUT << "\\psset{linecolor=nebulacolor,linewidth="
        << params.linewidth_nebula << "cm,linestyle="
        << params.linestyle_nebula << ",curvature=1 .5 -1}%\n";
    for (int i = 0; i < nebulae.size(); i++)
        if (nebulae[i].in_view == visible ||
            (nebulae[i].in_view == undecided &&
             (((nebulae[i].kind == open_cluster ||
                nebulae[i].kind == globular_cluster)
               && nebulae[i].magnitude < params.faintest_cluster_magnitude)
             || @/
              ((nebulae[i].kind == galaxy || nebulae[i].kind == reflection ||
                nebulae[i].kind == emission) &&
               nebulae[i].magnitude < params.faintest_diffuse_nebula_magnitude)
             ||
              nebulae[i].messier > 0 ))) {
            if (mytransform.polar_projection(nebulae[i].rectascension,
                                             nebulae[i].declination,
                                             nebulae[i].x,nebulae[i].y)) {
                nebulae[i].in_view = visible;
                if (nebulae[i].horizontal_angle > 360.0)
                    nebulae[i].diameter_x = nebulae[i].diameter_y =
                        sqrt(nebulae[i].diameter_x * nebulae[i].diameter_y);
                nebulae[i].radius = nebulae[i].diameter_x/2.0 /
                    mytransform.get_rad_per_cm() * M_PI / 180.0;
                if (nebulae[i].with_label != hidden) 
                    nebulae[i].with_label = visible;
                if (nebulae[i].radius > params.minimal_nebula_radius) {
                    @<Draw nebula shape@>@;
                } else {
                    nebulae[i].radius = params.minimal_nebula_radius;
                    OUT << "\\pscircle("
                        << nebulae[i].x << ","
                        << nebulae[i].y << "){"
                        << nebulae[i].radius / 2.54 * 72.27 << "pt}%\n";
                }
                objects.push_back(&nebulae[i]);
            } else nebulae[i].in_view = hidden;
        } else nebulae[i].in_view = nebulae[i].with_label = hidden;
}

@ This is the core of |draw_nebula()|.  In order to draw the (almost) ellipsis,
I define four reference points at the vertexes of the ellipsis.  In the loop
they are then transformed to screen coordinates and printed.

Mathematically, the algorithm used here works only for infitesimally small
nebulae on the equator.  The problem of ``finding a point that is $x$ degrees
left from the current point with an angle of $\alpha$ degrees'' is actually
much more difficult.  This is also the reason for this special case
|nebulae[i]|\hskip0pt|@[.diameter_x@] == nebulae[i]|\hskip0pt|@[.diameter_y@]|.
It shouldn't be necessary, and at the rim of the view frame it's even wrong due
to the different circular scale.  FixMe: Improve this. (Via rotation matrices.)

@q;@>

@<Draw nebula shape@>=
    if (nebulae[i].diameter_x == nebulae[i].diameter_y)
        OUT << "\\pscircle(" << nebulae[i].x << ',' << nebulae[i].y
            << "){" << nebulae[i].radius << "}%\n";
    else {
        double rectascension[4], declination[4];
        const double r_scale = 1.0 / cos(nebulae[i].declination * M_PI/180.0);
        const double cos_angle
            = cos(nebulae[i].horizontal_angle * M_PI/180.0);
        const double sin_angle
            = sin(nebulae[i].horizontal_angle * M_PI/180.0);
        const double half_x = nebulae[i].diameter_x/2.0;
        const double half_y = nebulae[i].diameter_y/2.0;
        rectascension[0] = nebulae[i].rectascension -
            half_x * cos_angle / 15.0 * r_scale;
        declination[0] = nebulae[i].declination -
            half_x * sin_angle;
        rectascension[1] = nebulae[i].rectascension +
            half_y * sin_angle / 15.0 * r_scale;
        declination[1] = nebulae[i].declination -
            half_y * cos_angle;
        rectascension[2] = nebulae[i].rectascension +
            half_x * cos_angle / 15.0 * r_scale;
        declination[2] = nebulae[i].declination +
            half_x * sin_angle;
        rectascension[3] = nebulae[i].rectascension -
            half_y * sin_angle / 15.0 * r_scale;
        declination[3] = nebulae[i].declination +
            half_y * cos_angle;
        OUT << "\\psccurve";
        for (int j = 0; j < 4; j++) {
            double x,y;
            mytransform.polar_projection(rectascension[j],
                                         declination[j], x, y);
            OUT << '(' << x << ',' << y << ')';
        }
    }
    OUT << "\\relax\n";


@* Grid and other curves.  It's boring to have only stars on the map.  I want
to have the usual coordinate grid with rectascension and declination lines,
plus the ecliptic and maybe the galactic equator, plus the constellation
borders and constellation lines.  This is done here.

@ The first routine is basic for all the following: It
helps to draw a smooth curve through the given points.  Actually it's a mere
code fragment that is used later several times, therefore it's declared
|inline| and it has unfortunately many parameters.

|rectascension| and |declination| are the celestial coordinates of the point.
|i| is the number of the scan point in the current curve.  Later it'll be the
loop variable.  |within_curve| is |true| if I'm actually drawing a curve, and
|false| if the current segment is not visible.  |steps| is the number of |i|'s
that I skip over before I deploy a curve point.  (I {\it scan\/} much more
points than I actually {\it draw}, because the resulting curve is smoothed
anyway so a very high point density is not necessary.)

|last_x| and |last_y| simply contain the values of |x| and |y| from the last
call, because I need them when I step outwards of the view frame: Then I must
draw a curve ending point at the {\it last\/} coordinates rather than the
current ones.

|steps|${}=1$ denotes the ending point of a curve.

FixMe: There is a very basic flaw here, namely that the curve directions in the
endpoints may be rather suboptimal.  This is particularly annoying when drawing
a circle-like shape.  However, a solution is not easy; so far the only help is
to make the points denser.

@c
inline void add_curve_point(const double rectascension,
                            const double declination,
                            const transformation& transform,
                            const int i, bool& within_curve,
                            const int steps) {
    static double last_x, last_y;
    double x,y;
    if (transform.polar_projection(rectascension, declination, x, y)) {
        if (!within_curve) {  // start a new one
            OUT << "\\pscurve" << "(" << x << ',' << y << ")";
            within_curve = true;
        } else if (i % steps == 0) OUT << "(" << x << ',' << y << ")";
        if (i % (steps*4) == 0 || steps == 1) OUT << "%\n";
            /* line break every four coordinates */
    } else
        if (within_curve) { // end the current curve
            OUT << "(" << last_x << ',' << last_y << ")" << "\\relax\n";
            within_curve = false;
        }
    last_x = x;  last_y = y;
}

@ This is the principal grid routine that is called from the |main()| function.
|scans_per_cm| is the density of tests whether we are within the view frame or
not.  By default, we scan once every millimetre.  |point_distance| is given in
degrees and it's the distance between two actually drawn curve points.

|scans_per_fullcircle| is the number of scan points in one full arc.  It is
used in the following code for determining the number of loop repetitions.  In
order to keep the meaning of all quantities, the grid creating code should
respect this variable.  E.\,g., most declination circles are smaller than one
full arc.  Therefore they mustn't use the full value of
|scans_per_fullcircle|.

|steps| and |within_curve| should be clear from the routine
 |add_curve_point()|.  |steps| is at least $2$, because it must be at least $1$
 anyway and ``$1$'' has a special meaning in |add_curve_point|: It denotes the
 end of a curve. |within_curve| must be reset to |false| if a new set of lines
 is to be drawn.

For a plot with closed lines (e.\,g.\ of one of the poles), you may set
|point_distance| to |0| and |scans_per_cm| to a higher value, for avoiding a
kink at the joint.

@c
void create_grid(const transformation transform,
                 const double scans_per_cm = 10,
                 const double point_distance = 5.0) {
    if (!params.show_grid && !params.show_ecliptic) return;
    const double scans_per_fullcircle =
        scans_per_cm / transform.get_rad_per_cm() * 2.0*M_PI;
    const int steps = int((point_distance * M_PI/180.0) *
                          (scans_per_fullcircle/(2.0*M_PI))) + 2;
    bool within_curve;
    if (params.show_grid) {
        OUT << "\\psset{linestyle=" << params.linestyle_grid
            << ",linecolor=gridcolor,linewidth="
            << params.linewidth_grid << "cm}%\n";
        @<Create grid lines for equal declination@>@;
        @<Create grid lines for equal rectascension@>@;
    }
    if (params.show_ecliptic) {
        @<Draw the ecliptic@>@;
    }
}

@ As mentioned before, declination circles are smaller than the full circle of
the celestial sphere.  Therefore I reduce the |scans_per_fullcircle| by
$cos(\hbox{|declination|})$ in order to decrese the number of scan points.  The
equator is drawn with a slightly bigger line width.

This strange construction with ``|i==number_of_points?1:steps|'' is necessary
because the very last point {\it must\/} be drawn.

@<Create grid lines for equal declination@>=
    for (int declination = -80; declination <= 80; declination += 10) {
        if (declination == 0)
            OUT << "\\psset{linewidth=" << 2.0 * params.linewidth_grid
                << "cm}%\n";
        within_curve = false;
        const int number_of_points =
            int(cos(declination*M_PI/180.0)*scans_per_fullcircle);
        for (int i = 0; i <= number_of_points; i++)
            add_curve_point(double(i)/double(number_of_points)*24.0,
                            declination,transform,i,within_curve,
                            i==number_of_points?1:steps);
        if (declination == 0)
            OUT << "\\psset{linewidth=" << params.linewidth_grid << "cm}%\n";
    }

@ The only slightly interesting thing here is that I draw the lines of equal
rectascension only from $-80^\circ$ to $+80^\circ$ of declination, because
otherwise it gets too populated in the pole regions.

@<Create grid lines for equal rectascension@>=
    const int number_of_points = int(scans_per_fullcircle / 2.0);
    for (int rectascension = 0; rectascension <= 23; rectascension++) {
        within_curve = false;
        for (int i = 0; i <= number_of_points; i++)
            add_curve_point(double(rectascension),
                            double(i)/double(number_of_points)*160.0 - 80.0,
                            transform,i,within_curve,
                            i==number_of_points?1:steps);
    }

@ Unfortunately the naive approach for drawing the ecliptic,
$$\hbox{|declination|} = \varepsilon \cdot \sin(\hbox{|rectascension|})$$ (with
$\varepsilon$ being the angle between equator and ecliptic) is wrong.  So I
have to take the equatorial declination circle, transform it into cartesian
coordinates, apply a simple rotation matrix for turning it into the ecliptical
circle, and transform it back into celestial coordinates.  Fortunately the
ecliptic lies very symmetrically, so the resulting formulae are rather simple:

Being $\varphi_0$ the right ascension angle ($=\hbox{\it rectascension} \cdot
15^\circ\!/\hbox{h}$) of the point on the equator, its right ascension
$\varphi$ and declination $\delta$ after becoming the ecliptic are
$$\eqalign{\varphi &= \arctan_2\frac{-\sin\varphi_0
\cos\varepsilon}{\cos\varphi_0}\cr\delta &= \arcsin(-\sin\varphi_0
\sin\varepsilon).}$$  $\arctan_2$ is the quadrant-aware version of $\arctan$,
because $\arctan$ only returns values between $-\pi/2$ and $+\pi/2$.


@<Draw the ecliptic@>=
    OUT << "\\psset{linestyle=" << params.linestyle_ecliptic
        << ",linecolor=eclipticcolor,"
        << "linewidth=" << params.linewidth_ecliptic << "cm}%\n";
    {
        const double epsilon = 23.44 * M_PI / 180.0;
        const int number_of_points = int(scans_per_fullcircle);
        within_curve = false;
        for (int i = 0; i <= number_of_points; i++) {
            const double phi0 = double(i)/double(number_of_points)*2.0*M_PI;
            const double m_sin_phi0 = -sin(phi0);
            const double phi = atan2(m_sin_phi0 * cos(epsilon),cos(phi0));
            const double delta = asin(m_sin_phi0*sin(epsilon));
            add_curve_point(phi * 12.0 / M_PI, delta * 180.0 / M_PI,
                            transform,i,within_curve,
                            i==number_of_points?1:steps);
        }
    }

@*1 Constellation boundaries.  They are drawn at a quite early stage so that
they are overprinted by more interesting stuff.

@ This routine is a helper and is used in |draw_constellation_boundaries()|.
It draws one boundary line~|b|, but only the part that is visible.  For this in
the first part of this routine, the container |current_line| is filled with all
points of |b| that are actually visible, with their screen coordinates in
centimetres.

If |current_line| consists only of a start and an end point, a `\.{\\psline}'
is created which is a straight line.  I cannot get a curvature from anywhere
easily in this case.  Otherwise it is a `\.{\\pscurve}' which means that we go
smoothly through all points.

I need this |"[liftpen=2]"| because eventually the \.{\\pscurve} command may be
part of a \.{\\pscustom} command and thus be part of a bigger path that forms
-- in terms of the Porstscript language -- one united path.\footnote{$^2$}{This
means e.\,g.\ that a dashed line pattern won't @q'@> be broken at subpath
junctions.}  In order to get crisp coners, the \.{liftpen} option is necessary.

@c
void draw_boundary_line(const boundary& b, const transformation& transform,
                        objects_list& objects, bool highlighted = false) {
    vector<point> current_line;
    for (int j = 0; j < b.points.size(); j++) {
        const double rectascension = b.points[j].x;
        const double declination = b.points[j].y;
        double x,y;
        if (!transform.polar_projection(rectascension,declination,x,y))
            continue;
        current_line.push_back(point(x,y));
    }
    if (current_line.size() >= 2) {
        if (current_line.size() == 2) OUT << "\\psline";
        else OUT << "\\pscurve";
        OUT << "[liftpen=2]{c-c}";
        for (int j = 0; j < current_line.size(); j++) {
            OUT << '(' << current_line[j].x << ','
                 << current_line[j].y << ')';
            if (j % 4 == 3) OUT << "%\n";
            if (highlighted)
                @<Create a |boundary_atom| for the |objects|@>@;
        }
        OUT << "\\relax\n";
    }
}

@ This is the point where the |boundary_atom|s are actually created.  As one
can see, it's very simple.  I just draw a virtual line from the current point
in the current path to the previous one.  Unfortunately I create new objects
here on the heap that are never deleted.  But it's harmless nevertheless.

@<Create a |boundary_atom| for the |objects|@>=
if (j > 0) objects.push_back(new boundary_atom(current_line[j],
                                               current_line[j-1]));

@ This is the routine that is actually called from the main program.  There are
two possibilities: Either the string |constellation| is empty or not.  If not,
the caller wants to highlight the given constellation.  Then we have to
undertake a two step process: \medskip

\item{(1)} Draw all boundaries that do not belong to |constellation|.
\item{(2)} Draw all boundaries that enclose |constellation| in a hightlighted
style and {\it as one path\/} via \.{\\pscustom}.

\medskip If no |constellation| is given we simply draw all lines in
|boundaries| in modus~(1).

@c
void draw_boundaries(const transformation& mytransform,
                     boundaries_list& boundaries,
                     objects_list& objects,
                     string constellation = string("")) {
    OUT << "\\psset{linecolor=boundarycolor,linewidth="
        << params.linewidth_boundary << "cm,"
        << "linestyle=" << params.linestyle_boundary << "}%\n";
    if (!constellation.empty()) {
        for (int i = 0; i < boundaries.size(); i++)
            if (!boundaries[i].belongs_to_constellation(constellation))
                draw_boundary_line(boundaries[i], mytransform, objects);
        OUT << "\\psset{linecolor=hlboundarycolor,linewidth="
            << params.linewidth_boundary << "cm," << "linestyle="
            << params.linestyle_hlboundary << "}%\n";
        OUT << "\\pscustom{";
        for (int i = 0; i < boundaries.size(); i++)
            if (boundaries[i].belongs_to_constellation(constellation))
                draw_boundary_line(boundaries[i], mytransform, objects, true);
        OUT << "}%\n";
    } else
        for (int i = 0; i < boundaries.size(); i++)
            draw_boundary_line(boundaries[i], mytransform, objects);
}

@*1 Constellation lines.  In the loop I test all lines available in
|connections|.  The first thing in the loop is to assure that at least one of
stars is actually visible.  At the beginning $(\hbox{|x1|}, \hbox{|y1|})$ and
$(\hbox{|x2|}, \hbox{|y2|})$ are the screen coordinates of the two stars that
are supposed to be connected by a line.  Then I move from there to the
respective other star by the amount of |skip|.  The current length of the
connection line is stored in~|r| which must have a minimal value (in particular
it must be positive), otherwise it doesn't make sense to draw the line.
Finally the line is drawn from the new $(\hbox{|x1|}, \hbox{|y1|})$ to the new
$(\hbox{|x2|}, \hbox{|y2|})$.

I expect |has_valid_coordinates()| to be |false| if the star is on the
non-visible hemisphere (i.\,e.\ $z<0$).


@q'@>

@c
void draw_constellation_lines(connections_list& connections,
                              const stars_list& stars,
                              objects_list& objects) {
    OUT << "\\psset{linecolor=clinecolor,linestyle=" << params.linestyle_cline
        << ",linewidth=" << params.linewidth_cline << "cm}%\n";
    for (int i = 0; i < connections.size(); i++)
        if ((stars[connections[i].from].in_view == visible ||
            stars[connections[i].to].in_view == visible)
            && stars[connections[i].from].has_valid_coordinates()
            && stars[connections[i].to].has_valid_coordinates()) {
            double x1 = stars[connections[i].from].x;
            double y1 = stars[connections[i].from].y;
            double x2 = stars[connections[i].to].x;
            double y2 = stars[connections[i].to].y;
            const double phi = atan2(y2 - y1, x2 - x1);
            double r = hypot(x2 - x1, y2 - y1);
            double skip;
            skip = stars[connections[i].from].radius +
                stars[connections[i].from].skip;
            r -= skip;
            x1 += skip * cos(phi);
            y1 += skip * sin(phi);
            skip = stars[connections[i].to].radius +
                stars[connections[i].to].skip;
            r -= skip;
            x2 -= skip * cos(phi);
            y2 -= skip * sin(phi);
            connections[i].radius = r/2.0;
            connections[i].x = (x1 + x2) / 2.0;
            connections[i].y = (y1 + y2) / 2.0;
            if (r > params.shortest_constellation_line && r > 0.0) {
                OUT << "\\psline{cc-cc}(" << x1 << ',' << y1
                    << ")(" << x2 << ',' << y2 << ")%\n";
                connections[i].start = point(x1,y1);
                connections[i].end = point(x2,y2);
                objects.push_back(&connections[i]);
            }
        }

}


@* Drawing the Milky Way.  If a proper data file is available, the milky way is
a simple concept, however difficult to digest for \LaTeX\ due to many many
Postscipt objects.  But for this program it's so simple that I can do the
reading and drawing in one small routine and I even don't need any large data
structures.

See |@<Reading the milkyway into |pixels|@>| for more information on |pixels|.

@c
void draw_milky_way(const transformation& mytransform) {
    vector<vector<point> > pixels(256);
    @<Reading the milkyway into |pixels|@>@;
    for (int i = 1; i < pixels.size(); i++) {
        if (pixels[i].size() == 0) continue;
        interpolate_colors(double(i) / 255.0, params.bgcolor,
                           params.milkywaycolor).set(OUT);
        for (int j = 0; j < pixels[i].size(); j++)
            OUT << "\\qdisk(" << pixels[i][j].x << "," << pixels[i][j].y
                << "){" << radius << "pt}%\n";
    }
}


@** The main function.  This consists of six parts: \medskip

\item{(1)} Command line interpretation.
\item{(2)} Definition of the desired transformation, here called |mytransform|.
\item{(3)} Definition of the containers and
\item{(4)} the filling of them by reading from text files.
\item{(5)} Creating of the \LaTeX\ file, first and foremost by calling the
drawing routines.
\item{(6)} Possibly create an \EPS/ or \PDF/ file by calling the necessary
programs.

\medskip\noindent That's it.

@q'@>

@c
@<Routines for reading the input script@>@#@;

int main(int argc, char **argv) {
    try {
        @<Dealing with command line arguments@>@;
        read_parameters_from_script(*params.in);
        if (!params.filename_output.empty())
            params.out = new ofstream(params.filename_output.c_str());
        transformation mytransform(params.center_rectascension,
                                   params.center_declination,
                                   params.view_frame_width,
                                   params.view_frame_height,
                                   params.grad_per_cm);

        @<Definition and filling of the containers@>@;

        read_objects_and_labels(*params.in, dimensions, objects, stars,
                                nebulae, texts, flexes, mytransform);

        OUT.setf(ios::fixed);  // otherwise \LaTeX\ gets confused
        OUT.precision(3);
        @<Create \LaTeX\ header@>@;
        OUT << "\\psclip{\\psframe[linestyle=none](0bp,0bp)(" 
            << params.view_frame_width_in_bp()
            << "bp," << params.view_frame_height_in_bp() << "bp)}%\n"
            << "\\psframe*[linecolor=bgcolor,linestyle=none](-1bp,-1bp)("
            << params.view_frame_width_in_bp() + 1
            << "bp," << params.view_frame_height_in_bp() + 1 << "bp)%\n";
        @<Draw all celestial objects and labels@>@;
        OUT << "\\endpsclip\n";
        @<Create \LaTeX\ footer@>@;
        if (params.input_file) delete params.in;
        @<Create \EPS/ or \PDF/ file if requested@>@;
    }
    catch (string s) {
        cerr << "pp3: " << s << '.' << endl;
        exit(1);
    }
    return 0;
}

@ \PPTHREE/ needs exactly one argument.  It must be either the file name of the
input script or a `\.{-}' which means that it takes standard input for reading
the input script.

@q'@>

@<Dealing with command line arguments@>=
        if (argc == 2) {
            if (argv[1][0] != '-') {
                params.in = new ifstream(argv[1]);
                if (!params.in->good())
                    throw string("Input script file ") + argv[1]
                        + " not found";
                else params.input_file = true;
            } else if (!strcmp(argv[1],"-")) params.in = &cin; else
                cerr << "Invalid argument: " << argv[1] << endl;
        }
        if (params.in == 0) {
            cerr << "Syntax:\n  pp3 {input-file}\n\n" @/
                 << "{input-file} may be \"-\" to denote standard input.\n" @/
                 << "You may give an empty file to get a default plot.\n" @/
                 << "The plot is sent to standard output by default.\n";
            exit(0);
        }

@ I must define all containers, but of course I only read those data structures
that are actually used.

@<Definition and filling of the containers@>=
        boundaries_list boundaries;
        dimensions_list dimensions;
        objects_list objects;
        stars_list stars;
        nebulae_list nebulae;
        connections_list connections;
        texts_list texts;
        flexes_list flexes;

        read_stars(stars);  /* Must come first, because it tests whether 
                               data files can be found */
        if (params.show_boundaries) read_constellation_boundaries(boundaries);
        read_label_dimensions(dimensions);
        read_nebulae(nebulae);
        if (params.show_lines) read_constellation_lines(connections, stars);

@ Three calls here are not preceded by an |if| clause: |create_grid()| contains
such tests of its own (because it's divided into subsections), and in
|draw_nebulae()| and |draw_stars()| every single object is tested for
visibility anyway.

@q')@>

@<Draw all celestial objects and labels@>=
        if (params.milkyway_visible) draw_milky_way(mytransform);
        create_grid(mytransform);
        if (params.show_boundaries)
            draw_boundaries(mytransform, boundaries, objects,
                            params.constellation);
        draw_flex_labels(mytransform, flexes, objects, dimensions);
        draw_text_labels(mytransform, texts, objects);
        draw_nebulae(mytransform, nebulae, objects);
        draw_stars(mytransform, stars, objects);
        if (params.show_lines)
            draw_constellation_lines(connections, stars, objects);
        if (params.show_labels) {
            arrange_labels(objects,dimensions);
            print_labels(objects);
        }

@ This is the preamble and the beginning of the resulting \LaTeX\ file.  I use
the \.{geometry} package and a dvips \.{\\special} command to set the papersize
to the actual view frame plus 2~millimetres.  So I create a buffer border of
1\,mm thickness.

@<Create \LaTeX\ header@>=
    create_preamble(OUT);
    OUT << "\\usepackage[nohead,nofoot,margin=0cm," @/
        << "paperwidth=" << params.view_frame_width_in_bp() << "bp," @/
        << "paperheight=" << params.view_frame_height_in_bp() << "bp" @/
        << "]{geometry}\n\n" @/
        << "\n\\begin{document}\\parindent0pt\n" @/
        << "\\pagestyle{empty}\\thispagestyle{empty}%\n" @/
        << "\\special{papersize=" << params.view_frame_width_in_bp() - 0.1
        << "bp," << params.view_frame_height_in_bp() - 0.1 << "bp}%\n" @/
        << "\\vbox to " << params.view_frame_height_in_bp() << "bp{" @/
        << "\\vfill" @/
        << "\\hbox to " << params.view_frame_width_in_bp() << "bp{%\n" @/
        << params.bgcolor << params.gridcolor << params.eclipticcolor
        << params.boundarycolor << params.hlboundarycolor << params.starcolor
        << params.nebulacolor << params.clinecolor;

@ If no preamble filename was given in the input script, a default preamble is
used.  If a preamble filename was given, the file should contain only font
specifying commands.  A possible preamble may be: \medskip

{\parindent2em\baselineskip10.5pt\ninett\obeylines
\BS usepackage\LB eulervm\RB 
\BS usepackage[T1]\LB fontenc\RB 
\BS renewcommand*\LB \BS rmdefault\RB \LB pmy\RB \par}

\medskip\noindent You may also have use for a command like \.{\BS
AtBeginDocument\LB\BS sffamily\RB} or \.{\BS boldmath} or \.{\BS large} or
whatever.  Or let be inspired by this fragment: \medskip

{\parindent2em\baselineskip10.5pt\ninett
\BS usepackage\LB relsize\RB\par
\BS renewcommand*\LB\BS NGC\RB[1]\LB\BS smaller \#1\RB\par
\BS renewcommand*\LB\BS IC\RB[1]\LB\BS smaller\LB\BS smaller
     IC\BS,\RB\#1\RB\par
\BS renewcommand*\LB\BS Messier\RB[1]\LB\BS smaller\LB\BS smaller
     M\BS,\RB\#1\RB\par}

\medskip The default preamble activates Adobe Symbol Greek letters, and
Helvetica Roman letters.  If you define a preamble of your own, you don't have
to re-define that, because it's not defined then.  You can assume a naked plain
\LaTeX\ font setup.

I define a couple of \LaTeX\ commands as hooks here, all of them take exactly
one argument.  ``\.{\BS Label}'' encloses every label.  In addition to that,
``\.{\BS NGC}'', ``\.{\BS IC}'', and ``\.{\BS Messier}'' are built around the
nebula label of the respective type, ``\.{\BS Starname}'' around all star
labels, ``\.{\BS TextLabel}'' around text labels, and ``\.{\BS FlexLabel}''
around flex labels.  ``\.{\BS TicMark}'' encloses all coordinate labels
generated with the \.{tics} option.  By default, they do nothing.  Well,
nothing to speak of.

@^preamble (\LaTeX)@>

@<|create_preamble()| for writing the \LaTeX\ preamble@>=
void create_preamble(ostream& out) {
    out << "\\documentclass[" << params.font_size << "pt]{article}\n\n" @/
        << "\\nofiles" @/
        << "\\usepackage[dvips]{color}\n" @/
        << "\\usepackage{pstricks,pst-text}\n" @/
        << "\\newcommand*{\\DP}{.}\n" @/
        << "\\newcommand*{\\TicMark}[1]{#1}\n" @/
        << "\\newcommand*{\\Label}[1]{#1}\n" @/
        << "\\newcommand*{\\TextLabel}[1]{#1}\n" @/
        << "\\newcommand*{\\FlexLabel}[1]{#1}\n" @/
        << "\\newcommand*{\\Starname}[1]{#1}\n" @/
        << "\\newcommand*{\\Messier}[1]{M\\,#1}\n" @/
        << "\\newcommand*{\\NGC}[1]{NGC\\,#1}\n" @/
        << "\\newcommand*{\\IC}[1]{IC\\,#1}\n\n";

    if (params.filename_preamble.empty()) @/
        out << "\\usepackage{mathptmx}\n" @/
            << "\\usepackage{helvet}\n" @/
            << "\\AtBeginDocument{\\sffamily}\n";
    else out << "\\input " << params.filename_preamble << '\n';
}

@ This is almost trivial.  I just close the box structure I began at the end of
|@<Create \LaTeX\ header@>| and close the document.

@<Create \LaTeX\ footer@>=
    OUT << "\\hfill}}\\end{document}\n";

@ Here I call \LaTeX, dvips, and/or \PS/2\PDF/ in order to create the
output the user wanted to have eventually in the input script.

@<Create \EPS/ or \PDF/ file if requested@>=
        if (!params.filename_output.empty() && (params.create_eps
                                                || params.create_pdf)) {
            OUT.flush();
            string commandline = string("latex ") + params.filename_output;
            if (system(commandline.c_str()) == 0) {
                string base_filename(params.filename_output);
                if (base_filename.find('.') != string::npos)
                    base_filename.erase(base_filename.find('.'));
                commandline = string("dvips -o ") + base_filename + ".eps "
                    + base_filename;
                if (system(commandline.c_str()) == 0) {
                    if (params.create_pdf) {
                        commandline = string("ps2pdf ") +
                            "-dCompatibility=1.3 " +
                            base_filename + ".eps " + base_filename + ".pdf";
                        if (system(commandline.c_str()) != 0)
                            throw string("ps2pdf call failed: ") + commandline;
                    }
                } else throw string("dvips call failed: ") + commandline;
            } else throw string("LaTeX call failed: ") + commandline;
        }


@** Index.
