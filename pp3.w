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
@q  For the full licence see below or the printed version of this       @>
@q  program.                                                            @>
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

\font\tenrm=pplr7t % roman text
\font\ninerm=pplr7t scaled 900
\font\eightrm=pplr7t scaled 800
\font\sevenrm=pplr7t scaled 700
\font\fiverm=pplr7t scaled 500

\font\teni=zplmr7m % math italic    (zptmcm7m for Times)
\font\seveni=zplmr7m
\font\fivei=zplmr7m

\font\tensy=zplmr7y % math symbols  (zptmcm7y for Times)
\font\sevensy=zplmr7y scaled 700
\font\fivesy=zplmr7y scaled 500

\font\tenex=zplmr7v % math extension  (zptmcm7v for Times)

\font\tenbf=pplb7t % boldface extended
\font\sevenbf=pplb7t scaled 700
\font\fivebf=pplb7t scaled 500

\font\tentt=cmtt10 % typewriter

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
\let\tt=\tentt
\let\cmntfont\tenpplr

\mainfont

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

\font\sf=bfrr8t \font\sfbf=bfrb8t
\font\sfa=bfrr8t scaled 700

\font\stitlefont=cmss8 scaled 1815         % sans serif type in title
\font\sbtitlefont=bfrb8t scaled\magstep3   % sans bold type in title
\font\ttitlefont=pcrb7t scaled\magstep3    % typewriter type in title


\def\title{PP3 (Version 0.1)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The  Sky Map
  Creator {\stitlefont PP3}}
  \vskip 15pt
  \centerline{(Version 0.1)}
  \vfill}
\def\botofcontents{\parindent2em\vfill
\noindent
Copyright \copyright\ 2003 Torsten Bronger
                           ({\tt bronger@@users.sourceforge.net})
\bigskip\noindent
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the ``Software''), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:


\leftskip1cm\rightskip\leftskip
\smallskip\noindent
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
dealings in the Software. }

@i c++lib.w
@s ios int

@* Introduction.  This program \.{pp3} (``parvum planetarium'') takes the data
of the Bright Star Catalogue Version~5 and turns it into a \LaTeX\ file that
uses PSTricks to draw a nice sky chart containing a certain region of the sky.

@c
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <vector>
#include <map>
#include <iomanip>
#include <cstdlib>
#include <cmath>
#include <cfloat>

@* Celestial data structures.  First I describe the data structures that
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

@ This first |struct| can be used as an ancestor in the various celestial
objects data structurs (e.\,g.\ stars) for containing all view frame dependent
information.  Most importantly it contains the label of a celestial object, its
position relatively to the object, and its size.

|in_view| is |true| if the object is actually display on screen.  |x| and |y|
contain the screen coordinates in centimetres.  |radius| is the radial size of
the object in centimetres.  |skip| is given in centimetres, too.  It denotes
the space between the outer boundary of the object (enclosed by |radius|) and
the label.  |with_label| is true if the object has a label, with |label_width|
and |label_height| (estimated in centimetres) and |label_angle|.  |lable_angle|
can only have eight possible values: 0:~$0^\circ\!$, 1:~$45^\circ\!$,
2:~$90^\circ\!$, 3:~$135^\circ\!$, 4:~$180^\circ\!$, 5:~$225^\circ\!$,
6:~$270^\circ\!$, and 7:~$315^\circ\!$.

@c
struct view_data {
    bool in_view;
    double x,y;
    double radius;
    double skip;
    bool with_label;
    string label;
    double label_width, label_height;
    int label_angle;
    view_data() : in_view(true), x(0.0), y(0.0), radius(0.0), skip(0.06),
                  with_label(false), label(), label_width(0.24),
                  label_height(0.36), label_angle(0) { }
    void get_label_boundaries(double& left,double& right,double& top,
                              double& bottom) const;
};

typedef vector<view_data> objects_list;

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
    case 0: case 4: bottom = origin_y - label_height / 2.0; break;
    case 1: case 2: case 3: bottom = origin_y; break;
    case 5: case 6: case 7: bottom = origin_y - label_height; break;
    }
    top = bottom + label_height;
}

@*1 Stars.  The actual star data is -- like all other user defined data
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

@c
struct star : public view_data {
    int hd, bs;
    double rectascension, declination;
    double magnitude;
    double b_v;
    int flamsteed;
    string name;
    string spectral_class;
    star() : hd(0), bs(0), rectascension(0.0), declination(0.0),
             magnitude(0.0), b_v(0.0), flamsteed(0), name(""),
             spectral_class(""), view_data() { }
};

typedef vector<star> stars_list;

@ I want to be able to read the star data records from a text format file.
This file was probably created by \.{bsc5digest}.

The format of the input is a text stream with the following format.  Each star
entry consists of tree lines: \medskip

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
\item{3.} The spectral class.  It must start with the spectral class letter,
followed by the fraction digit, followed by the luminosity class as a Roman
number, e.\,g.~``\.{F5III}''.  Anything may follow as in ``\.{K2-IIICa-1}'',
however the mandatory parts must not contain any whitespace.

@c
istream& operator>>(istream& in, star& s) {
    in >> s.hd >> s.bs >> s.rectascension 
       >> s.declination >> s.magnitude >> s.b_v 
       >> s.flamsteed;
    char ch;
    do in.get(ch); while (in.good() && ch != '\n');
    getline(in,s.name);
    getline(in,s.spectral_class);
    return in;
}

@ Here I read a set of stars from a file with the name |filename|.  I need
|dimension| here, because I want to adjust |label_width| and |label_height| of
each star to the correct values.  But it's better to describe |dimension|
later.

The file |stars_file| is a text file that consists solely of a list of |star|s.

FixMe: I want |dimensions| to be |const|.

@q'@>

@c
@<The structure |dimension|@>@;@#

void read_stars(const string filename, stars_list& stars,
                dimensions_list& dimensions) {
    ifstream stars_file(filename.c_str());
    star current_star;
    stars_file >> current_star;
    while (stars_file.good()) {
        const dimension current_dimension = dimensions[current_star.name];
        current_star.label_width = current_dimension.width;
        current_star.label_height = current_dimension.height;
        stars.push_back(current_star);
        stars_file >> current_star;
    }
}


@*1 Nebulae.  This is also used for stellar clusters of course.  In the whole
program ``nebula'' denotes nebulae, galaxies, clusters, and other non-stellar
objects.

\def\NGC{\hbox{\it NGC}}
\def\IC{\hbox{\it IC}}

@s NGC TeX
@s IC TeX

@c
typedef enum { unknown, galaxy, emission, reflection, open_cluster,
               globular_cluster } nebula_kind;

@ Since nebulae appear on the screen next to stars, and because they can have
labels, they are descendants of |view_data|, too.

|NGC|, |IC|, and |M| are of course the respective catalogue number.  Since it's
silly that |NGC| and |IC| are defined, a value of `|0|' means that the nebula
is not part of the respective catalogue.  |constellation| is a three-character
string with the name of the respective constellation in all uppercase.
|rectascension| is given in hours, |declination| in degrees.  |diameter_x| and
|diameter_y| are the extent of the nebula in the horizonal and the vertical
direction and are given in degrees, |horizontal_angle| (in degrees) is the
angle between the horizontal axis of |diameter_x| and the intersecting
celestial declination circle.  |magnitude| (in magnitudes) is the {\it
total\/} brightness (not the brightness density).

@c
struct nebula : public view_data {
    int NGC, IC, M;  // |0| if not defined.
    string constellation;
    double rectascension, declination;
    double magnitude;
    double diameter_x, diameter_y;
    double horizontal_angle;
    nebula_kind kind;
    nebula() : NGC(0), IC(0), M(0), constellation(), rectascension(0.0),
               declination(0.0), magnitude(0.0), diameter_x(0.0),
               diameter_y(0.0), horizontal_angle(0.0), kind(unknown) { }
};

typedef vector<nebula> nebulae_list;

@ As you can see, the file format for a nebulae file is very simple, because
there are no string fields with possible whitespace within them.  It's just a
stream of fields separated by whitespace.  |kind| is an |int|, and it's the
canonical translation of the |nebula_kind| to |int|.

If the |horizontal_angle| is unknown, is must be~|720.0|.  |diameter_y| must
always have a valid value, even if it's actually unknown; in this case it must
be equal to |diameter_y|.

@c
istream& operator>>(istream& in, nebula& n) {
    int kind;
    in >> n.NGC >> n.IC >> n.M >> n.constellation >> n.rectascension
       >> n.declination >> n.magnitude >> n.diameter_x >> n.diameter_y
       >> n.horizontal_angle >> kind;
    n.kind = nebula_kind(kind);
    return in;
}

@ Here I read a set of nebulae from a file with the name |filename|.  I need
|dimension| here, because I want to adjust |label_width| and |label_height| of
each nebula to the correct values.

The format is just a stream of |nebula|e.

FixMe: I want |dimensions| to be |const|.

@c
double fmax(const double& x, const double& y);

void read_nebulae(const string filename, nebulae_list& nebulae,
                  dimensions_list& dimensions) {
    ifstream nebulae_file(filename.c_str());
    nebula current_nebula;
    nebulae_file >> current_nebula;
    while (nebulae_file.good()) {
        @<Create nebula label@>@;
        @<Find dimensions of nebula label@>@;
        nebulae.push_back(current_nebula);
        nebulae_file >> current_nebula;
    }
}

@ In order to create a \LaTeX-ready label, I first choose which catalog to
use.  It is from the Messier, the NGC, and the IC catalogue the first in which
the nebula appears, i.\,e.\ the first non-zero catalogue number.  The catalogue
abbreviation itself is stored in |catalog|, whereas the |stringstream| |number|
contains the number within that catalogue.  I need that distinction later in
|@<Find dimensions of nebula label@>|, but here I just concatenate both to the
|label|.

@<Create nebula label@>=
        string catalogue;
        stringstream number;
        if (current_nebula.M > 0) {
            catalogue = "M\\,";
            number << current_nebula.M;
        } else if (current_nebula.NGC > 0) {
            catalogue = "NGC\\,";
            number << current_nebula.NGC;
        } else if (current_nebula.IC > 0) {
            catalogue = "IC\\,";
            number << current_nebula.IC;
        } else throw string("Invalid catalogue");
        current_nebula.label = catalogue + number.str();

@ For determining the width of the label for a nebula, I use the width of the
prefix (e.\,g.\ ``\.{M\\,}''), and the width of one digit (zero is used in
\.{pp3}).\footnote{$^1$}{Of course this only works if all digits in the used
font have the same width.}  They are sumed up, after the width of the digit has
been multiplied by the number of digits (or the length) of the contents of
|number|.

For determining the height, I use the height of the zero or the height of the
prefix, whichever is greater.

@<Find dimensions of nebula label@>=
        current_nebula.label_width = dimensions[catalogue].width +
            number.str().length() * dimensions["0"].width;
        current_nebula.label_height = fmax(dimensions[catalogue].height,
            dimensions["0"].height);


@*1 Constellation boundaries.  They are stored in an external file called
\.{constborders.dat} which is created by the program \.{condigest}.

Is is very convenient to have a special data type for a point in the program
\.{condigest}.  In this program the advantage is not so big but it's sensible
to use the same data structures here.

@c
struct point {
    double x,y;
    point(const double x, const double y) : x(x), y(y) { }
    point() : x(0.0), y(0.0) { }
};

@ An object of type |boundary| contains one stright line of a constellation
boundary.  This consists of the two endpoints which come from the original
boundary catalog by Delporte of 1930, and zero or more interpolated points
calculated by Davenhall (1990) in the catalog \.{condigest} uses as the
starting point.  The interpolated points help to draw a curved line where this
is necessary.

Every line usually belongs to exactly two constellations (of course).  They are
stored in the field |constellations|.  FixMe: There are boundaries with only
one owner.  I don't know how this can happen.

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

@ In this routine is use only the first three letters of the constellation
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
\.{constborders.dat}.  The input stream is a test stream of the following
format.  The set of celestial boundaries is stored as a set of elementary
lines without corners. \medskip

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

@q'@>

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

@ Here I read a set of boundaries froma file.  It's simply a list of
|boundary|'s.

@c
void read_constellation_boundaries(const string filename,
                                   boundaries_list& boundaries) {
    ifstream boundaryfile(filename.c_str());
    boundary current_boundary;
    boundaryfile >> current_boundary;
    while (boundaryfile.good()) {
        boundaries.push_back(current_boundary);
        boundaryfile >> current_boundary;
    }
}

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
    x = x1 * stretch + width / 2.0;
    if (x < 0.0 || x > width) return false;
    const double y1 = a[1][0] * x0 + a[1][1] * y0 + a[1][2] * z0;
    y = y1 * stretch + height / 2.0;
    if (y < 0.0 || y > height) return false;
    return true;
}

@* Constellation lines.  This is not about the {\it boundaries}, but about the
connection lines between the main stars of a given constellation.  They are
mere eye candy.  I call them ``connections'' in this program to keep the name
unique and concise.

A |connection| consists of .  The point coordinates
are screen coordinates in centimetres.  |from| and |to| are the star star and
the end star, given by their Henry Draper Catalogue number.

@s connection int

@q}@>

@c
struct connection {
    int from, to;
    vector<point> path;
    connection() : from(0), to(0), start(), end() { }
    cook(const stars_list& stars, const objects_list& objects);
};

connection::cook(const stars_list& stars, const objects_list& objects) {
    
}

@ I must be able to read a file which contains such data.

@c
void read_constellation_lines() {
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
overlap}_{\hbox{\sevenrm objects}}.$$

|print_labels()| actually generates the \LaTeX\ code for printing them.

@q'@>

@ First the routine that actually calculates the overlap.  It simply finds the
common rectangular area in squared centimetres.  Both rectangles are given by
their boundaries, |left1|, |right1|, |top1|, |bottom1| enclose the first
rectangle, |left2|, |right2|, |top2|, |bottom2| the second.

@c
@<Missing math routines@>@;@#

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

@ Now we re-arrange the labels, namely |objects[i].with_label| for all~|i|.
For efficiency, I first find all neighbours of the on-object and do all the
following work only with them.  In the inner |k|-look I test all possible
|label_angle|s and calculate their |penalty|.

@c 
void arrange_labels(objects_list& objects) {
    vector<view_data> vicinity;
    for (int i = 0; i < objects.size(); i++) {
        vicinity.resize(0);
        if (objects[i].in_view && objects[i].with_label) {
            @<Find objects in vicinity of |objects[i]|@>@;
            double best_penalty = DBL_MAX;
            int best_angle = 0;
            for (int k = 0; k < 8; k ++) {
                objects[i].label_angle = k;
                double on_object_left, on_object_right, on_object_top,
                    on_object_bottom;
                objects[i].
                    get_label_boundaries(on_object_left, on_object_right,
                                         on_object_top, on_object_bottom);
                double penalty = 0.0;
                @<Find overlaps with labels@>@;
                @<Find overlaps with objects@>@;
                if (penalty < best_penalty) {
                    best_penalty = penalty;
                    best_angle = k;
                }
            }
            objects[i].label_angle = best_angle;
        }
    }
}

@ All objects in the vicinity of |objects[i]| eventually end up in the |vector|
|vicinity|.  Here if fill this structure.  I use a very rough guess for finding
the neighbours, so there will probably be too many of them, but is makes
calculation much easier.

The variable |last_object_with_labels| holds the index in |vicinity| the
divides it into two sets: The first set comes before |objects[i]| in |objects|,
the second after it.  Only the first set must be checked for label collisions,
because otherwise labels would be re-arranges twice.  The practical thing is
that neighbouring objects are ordered in increasing brightness in the Bright
Star Catalog, which means that lables of bright stars are arranged first, and
labels of fainter stars must cope with these positions.

Of course, it's guaranteed that |objects[i]| is not part of its vicinity.

@q'@>

@<Find objects in vicinity of |objects[i]|@>=
            const double on_object_size =
                objects[i].radius + objects[i].skip + objects[i].label_width;
            int last_object_with_labels;
            for (int j = 0; j < objects.size(); j++) {
                if (i == j) {
                    last_object_with_labels = vicinity.size() - 1;
                    continue;
                }
                if (objects[i].in_view)
                    if (hypot(objects[i].x - objects[j].x,
                              objects[i].y - objects[j].y) < on_object_size +
                        objects[j].radius + objects[j].label_width)
                        vicinity.push_back(objects[j]);
            }

@ Here I wander through a part of |vicinity| to find all overlaps of the label
of |objects[i]| with the labels of its |vicinity|.  As said, I only need to go
to index |last_object_with_labels| for this.

@<Find overlaps with labels@>=
                for (int j = 0; j <= last_object_with_labels; j++) {
                    if (vicinity[j].with_label) {
                        double left, right, top, bottom;
                        vicinity[j].get_label_boundaries(left, right,
                                                         top, bottom);
                        penalty +=
                            calculate_overlap(on_object_left, on_object_right,
                                              on_object_top, on_object_bottom,
                                              left, right, top, bottom);
                    }
                }

@ Here I wander through the whole of |vicinity| to find all overlaps of the
label of |objects[i]| with the object disks of its |vicinity|.  I make a
simplification here: I use the circumscribed square of the disk circle.  This
makes the overlap too big, and sometimes, when it should be zero, it makes it
non-zero.

@<Find overlaps with objects@>=
                for (int j = 0; j < vicinity.size() ; j++) {
                    const double radius = vicinity[j].radius;
                    const double x = vicinity[j].x;
                    const double y = vicinity[j].y;
                    penalty += 
                        calculate_overlap(on_object_left, on_object_right,
                                          on_object_top, on_object_bottom,
                                          x - radius, x + radius, y + radius,
                                          y - radius);
                }



@ Finally I print out all labels by generation \LaTeX\ code from any of them.
I do that by calculation the coordinates in centimetres of the {\it bottom
left\/} corner of the label box, and placing the \TeX\ box there.  This \TeX\
box lies within another one with zero dimensions in order to keep the point of
origin (bottom left of the view frame) intact.

@c
void print_labels(const objects_list& objects, ostream& out = cout) {
    out << "\\cyan\n";
    for (int i = 0; i < objects.size(); i++)
        if (objects[i].in_view && objects[i].with_label) {
            const double angle = M_PI_4 * double(objects[i].label_angle);
            const double label_distance = objects[i].radius + objects[i].skip;
            double x = objects[i].x + label_distance * cos(angle);
            double y = objects[i].y + label_distance * sin(angle);

            switch (objects[i].label_angle) {
            case 2: case 6: x -= objects[i].label_width / 2.0; break;
            case 3: case 4: case 5: x -= objects[i].label_width; break;
            }
            switch (objects[i].label_angle) {
            case 0: case 4: y -= objects[i].label_height / 2.0; break;
            case 5: case 6: case 7: y -= objects[i].label_height; break;
            }
            out << "\\hbox to 0pt{";
            out << "\\hskip" << x << "cm";
            out << "\\vbox to 0pt{\\vss\\hbox{";
            out << objects[i].label;
            out << "}\\vskip" << y << "cm";
            out << "\\hrule height 0pt}\\hss}%\n";
        }
}

@ Last but not least: A structure with the real dimensions in centimetres of
all possible labels, namely all possible different |star::name|'s.  They are
read from the file \.{labeldims.dat} and stored in a |dimensions_list|.
\.{labeldims.dat} is created by \.{bsc5digest}.

This dimension list also contains the following elements: ``\.{NGC\\,}'',
``\.{IC\\,}'', ``\.{M\\,}'', and ``\.{0}''.  They are used to calculate the
width and height of nebulae labels.

@s dimensions_list int
@s dimension int

@q'@>

@<The structure |dimension|@>=
struct dimension { double width, height; };

typedef map<string,dimension> dimensions_list;

@ Here I read label dimensions from a text file.  The format is very simple:
\medskip

\item{1.} The number of labels |number_of_label_dimensions| (|int|).
\item{2.} The following |number_of_label_dimensions| times:
\itemitem{--} The \LaTeX\ representation of the label on a line of its own.
\itemitem{--} In the following line, width and height of the label in
centimetres (both |double|), separated by whitespace.

@c
void read_label_dimensions(const string filename, 
                           dimensions_list& dimensions) {
    ifstream file(filename.c_str());
    int number_of_label_dimensions;
    file >> number_of_label_dimensions;
    for (int i = 0; i < number_of_label_dimensions; i++) {
        string name, dummy;
        getline(file,dummy);  // Read the |'\n'|
        getline(file,name);
        file >> dimensions[name].width;
        file >> dimensions[name].height;
    }
}

@ The book claims that the following routines are part of the {\mc GNU}
\CEE/~Library version~2.2 beta.  However, I didn't find them.

@<Missing math routines@>=
inline double fmin(const double& x, const double& y) {
    return x < y ? x : y;
}

inline double fmax(const double& x, const double& y) {
    return x > y ? x : y;
}

inline double fdim(const double& x, const double& y) {
    return x > y ? x - y : 0.0;
}


@* Grid and other curves.  It's boring to have only stars on the map.  I want
to have the usual coordinate grid with rectascension and declination lines,
plus the ecliptic and maybe the galactic equator, plus the constellation
borders.  This is done here.

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
                            const int steps, ostream& out) {
    static double last_x, last_y;
    double x,y;
    if (transform.polar_projection(rectascension, declination, x, y)) {
        if (!within_curve) {  // start a new one
            out << "\\pscurve" << "(" << x << ',' << y << ")";
            within_curve = true;
        } else if (i % steps == 0) out << "(" << x << ',' << y << ")";
        if (i % (steps*4) == 0 || steps == 1) out << "%\n";
            /* line break every four coordinates */
    } else
        if (within_curve) { // end the current curve
            out << "(" << last_x << ',' << last_y << ")" << "\\relax\n";
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
                 const double point_distance = 5.0,
                 ostream& out = cout) {
    const double scans_per_fullcircle =
        scans_per_cm / transform.get_rad_per_cm() * 2.0*M_PI;
    const int steps = int((point_distance * M_PI/180.0) *
                          (scans_per_fullcircle/(2.0*M_PI))) + 2;
    bool within_curve;
    out << "\\newhsbcolor{gridblue}{0.555555556 1 0.45}%\n";
    out << "\\psset{linestyle=solid,linecolor=gridblue,linewidth=0.7pt}%\n";
    @<Create grid lines for equal declination@>@;
    @<Create grid lines for equal rectascension@>@;
    @<Draw the ecliptic@>@;
}

@ As mentioned before, declination circles are smaller than the full circle of
the celestial sphere.  Therefore I reduce the |scans_per_fullcircle| by
$cos(\hbox{|declination|})$ in order to the the number of scan points.  The
equator is drawn with a slightly bigger line width.

This strange construction with ``|i==number_of_points?1:steps|'' is necessary
because the very last point {\it must\/} be drawn.

@<Create grid lines for equal declination@>=
    for (int declination = -80; declination <= 80; declination += 10) {
        if (declination == 0) out << "\\psset{linewidth=1.5pt}%\n";
        within_curve = false;
        const int number_of_points =
            int(cos(declination*M_PI/180.0)*scans_per_fullcircle);
        for (int i = 0; i <= number_of_points; i++)
            add_curve_point(double(i)/double(number_of_points)*24.0,
                            declination,transform,i,within_curve,
                            i==number_of_points?1:steps,out);
        if (declination == 0) out << "\\psset{linewidth=0.7pt}%\n";
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
                            i==number_of_points?1:steps,out);
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
    out << "\\psset{linestyle=dashed,linecolor=red,linewidth=0.5pt}%\n";
    {
        const double epsilon = 23.44 * M_PI / 180.0;
        const int number_of_points = int(scans_per_fullcircle);
        within_curve = false;
        for (int i = 0; i <= number_of_points; i++) {
            double x,y;
            const double phi0 = double(i)/double(number_of_points)*2.0*M_PI;
            const double m_sin_phi0 = -sin(phi0);
            const double phi = atan2(m_sin_phi0 * cos(epsilon),cos(phi0));
            const double delta = asin(m_sin_phi0*sin(epsilon));
            add_curve_point(phi * 12.0 / M_PI, delta * 180.0 / M_PI,
                            transform,i,within_curve,
                            i==number_of_points?1:steps,out);
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
means e.\,g.\ that a dashed line pattern won't be broken at subpath junctions.}
In order to get crisp coners, the \.{liftpen} option is necessary.

@c
void draw_boundary_line(const boundary& b, const transformation& transform) {
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
        if (current_line.size() == 2) cout << "\\psline";
        else cout << "\\pscurve";
        cout << "[liftpen=2]";
        for (int j = 0; j < current_line.size(); j++) {
            cout << '(' << current_line[j].x << ','
                 << current_line[j].y << ')';
            if (j % 4 == 3) cout << "%\n";
        }
        cout << "\\relax\n";
    }
}

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
                     string constellation = string(""), ostream& out = cout) {
    out << "\\newrgbcolor{darkyellow}{0.5 0.5 0}";
    out << "\\psset{linecolor=darkyellow,linewidth=1.0pt," @/
        << "linestyle=dashed}%\n";
    if (!constellation.empty()) {
        for (int i = 0; i < boundaries.size(); i++)
            if (!boundaries[i].belongs_to_constellation(constellation))
                draw_boundary_line(boundaries[i], mytransform);
        out << "\\psset{linecolor=yellow,linewidth=1.0pt,"
            << "linestyle=dashed}%\n";
        out << "\\pscustom{";
        for (int i = 0; i < boundaries.size(); i++)
            if (boundaries[i].belongs_to_constellation(constellation))
                draw_boundary_line(boundaries[i], mytransform);
        out << "}%\n";
    } else
        for (int i = 0; i < boundaries.size(); i++)
            draw_boundary_line(boundaries[i], mytransform);
}

@* Drawing of stars and nebulae.  Now for the two most important objects of the
star charts.  They are special because they may have labels.  Therefore I not
only have to draw them, I have to fill a container of |main()| called |objects|
which contains elements of type |view_data|.  The part of each |star| or
|nebula| that is |view_data| is appended to |objects|, if and only if the star
is visible in the view frame.  The typical command for that is
$$\hbox{|objects.push_back(view_data(stars[i]));|}$$ (here for stars).  Please
notice that it is {\it not\/} important whether or not the respective object
bears a label.

@ First the nebulae.  Only nebulae with a certain minimal brightness and a
minimal diameter are included, but all of these get a label by default.  

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

The |radius| of the label is a rough estimate: It is simply the half of
|diameter_x|.  If the nebula is too small, it is printed as a minimal circle.
If it's large enough, it is printed in its (almost) full beauty, see |@<Draw
nebula shape@>|.

By the way, |in_view| is set here and at other places, but not really used
since objects with |in_view|${}={}$|false| aren't in |objects| anyway.

@c
void draw_nebulae(const transformation& mytransform, nebulae_list& nebulae,
                  objects_list& objects, ostream& out = cout) {
    out << "\\psset{linecolor=white,linewidth=0.5pt,linestyle=solid,"
        << "curvature=1 .5 -1}%\n";
    for (int i = 0; i < nebulae.size(); i++)
        if (nebulae[i].magnitude < 8 && nebulae[i].diameter_x > 0.2) {
            double x,y;
            if (mytransform.polar_projection(nebulae[i].rectascension,
                                             nebulae[i].declination,
                                             x,y)) {
                nebulae[i].x = x;
                nebulae[i].y = y;
                if (nebulae[i].horizontal_angle > 360.0)
                    nebulae[i].diameter_x = nebulae[i].diameter_y =
                        sqrt(nebulae[i].diameter_x * nebulae[i].diameter_y);
                nebulae[i].radius = nebulae[i].diameter_x/2.0 /
                    mytransform.get_rad_per_cm() * 180.0 / M_PI;
                nebulae[i].with_label = true;
                if (nebulae[i].radius > 0.1) {
                    @<Draw nebula shape@>@;
                } else {
                    nebulae[i].radius = 0.1;
                    out << "\\pscircle("
                        << nebulae[i].x << ","
                        << nebulae[i].y << "){"
                        << nebulae[i].radius / 2.54 * 72.27 << "pt}%\n";
                }
                objects.push_back(view_data(nebulae[i]));
            } else nebulae[i].in_view = false;
        } else nebulae[i].in_view = nebulae[i].with_label = false;
}

@ This is the core of |draw_nebula()|.  In order to draw the (almost) ellipsis,
I define four reference points at the vertexes of the ellipsis.  In the loop
they are then transformed to screen coordinates and printed.

@<Draw nebula shape@>=
    double rectascension[4], declination[4];
    const double cos_angle
        = cos(nebulae[i].horizontal_angle * M_PI/180.0);
    const double sin_angle
        = sin(nebulae[i].horizontal_angle * M_PI/180.0);
    const double half_x = nebulae[i].diameter_x/2.0;
    const double half_y = nebulae[i].diameter_y/2.0;
    rectascension[0] = nebulae[i].rectascension -
        half_x * cos_angle / 15.0;
    declination[0] = nebulae[i].declination -
        half_x * sin_angle;
    rectascension[1] = nebulae[i].rectascension +
        half_y * sin_angle / 15.0;
    declination[1] = nebulae[i].declination -
        half_y * cos_angle;
    rectascension[2] = nebulae[i].rectascension +
        half_x * cos_angle / 15.0;
    declination[2] = nebulae[i].declination +
        half_x * sin_angle;
    rectascension[3] = nebulae[i].rectascension -
        half_y * sin_angle / 15.0;
    declination[3] = nebulae[i].declination +
        half_y * cos_angle;
    out << "\\psccurve";
    for (int j = 0; j < 4; j++) {
        double x,y;
        mytransform.polar_projection(rectascension[j],
                                     declination[j], x, y);
        out << '(' << x << ',' << y << ')';
    }
    out << "\\relax\n";


@ Now for the stars.  Stars are a little bit simpler than nebulae because they
are mere disks.  They are only included if they have a certain minimal
magnitude.  The disk radius is calculated according to $$\eqalign{
\hbox{|radius|} &= \sqrt{m_{\hbox{\sevenrm min}} - m + \hbox{\it
radius}_{\hbox{\sevenrm min}}^2}\,,\quad\hbox{if $m<m_{\hbox{\sevenrm
min}}$\,,}\cr \noalign{\vskip0.5ex} \hbox{|radius|} &= m_{\hbox{\sevenrm
min}}\,,\quad \hbox{otherwise}.}$$

The star gets a label by default only it has a certain magnitude.  This is
even a little bit stricter than the related condition above.

Then only the stellar colour has to be calculated, and it can be printed.

@c
@<|create_hs_colour()| for star colour determination@>@;@#

void draw_stars(const transformation& mytransform, stars_list& stars,
                objects_list& objects, ostream& out = cout) {
    for (int i = 0; i < stars.size(); i++)
        if (stars[i].magnitude < 7) {  // Effectively all stars of the \BSC/
            double x,y;
            if (mytransform.polar_projection(stars[i].rectascension,
                                             stars[i].declination,
                                             x,y)) {
                stars[i].x = x;
                stars[i].y = y;
                stars[i].radius = (stars[i].magnitude < 5 ?
                                   sqrt(5.09 - stars[i].magnitude) : 0.3)
                    / 72.27 * 2.54;
                stars[i].with_label = stars[i].magnitude < 3.5 && 
                    !stars[i].name.empty();
                stars[i].label = stars[i].name;
                out << "\\newhsbcolor{starcolor}{";
                create_hs_colour(stars[i].b_v,stars[i].spectral_class,out);
                out << " 1}%\n";
                out << "\\pscircle*[linecolor=starcolor]("
                    << stars[i].x << ","
                    << stars[i].y << "){"
                    << stars[i].radius / 2.54 * 72.27 << "pt}%\n";
                objects.push_back(view_data(stars[i]));
            } else stars[i].in_view = false;
        } else stars[i].in_view = stars[i].with_label = false;
}

@ I want to use the B$-$V magnitude for the colour of the star disks on the
maps.  Here I map the value of the B$-$V magnitude to a colour in the \HSB/
space.  `\HSB/' -- `Hue, Saturation, Brightness' (all three fom $0$ to~$1$).
Brightness is always~$1$, so only hue and saturation have to be calculated.

There are three intervals for B$-$V with the boundaries |bv0|, |bv1|, |bv2|,
and |bv3|.  |bv0|--|bv1| is blue, |bv1|--|bv2| is white, and |bv2|--|bv3| is
red.  On each boundary, the hue values |hue0|--|hue3| respectively are valid.
Inbetween I interpolate linearly (rule of three).

@<|create_hs_colour()| for star colour determination@>=
void create_hs_colour(double b_v, string spectral_class, ostream& out) {
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
    out << hue << ' ' << saturation;
}

@ Since there are some stars in the Bright Star Catalogue without a B$-$V
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


@* The main function.  This consists of four parts: \medskip

\item{(1)} Definition of the desired transformation, here called |mytransform|.
\item{(2)} Definition of the containers and
\item{(3)} the filling of them by reading from text files.
\item{(4)} Creating of the \LaTeX\ file, first and foremost by calling the
drawing routines.

\medskip\noindent That's it.

@c
int main() {
    const double width = 15;
    const double height = 15;
    const double resolution = 4;
    transformation mytransform(14.8, 30, width, height, resolution);

    boundaries_list boundaries;
    dimensions_list dimensions;
    objects_list objects;
    stars_list stars;
    nebulae_list nebulae;

    read_constellation_boundaries("constborders.dat", boundaries);
    read_label_dimensions("labeldims.dat",dimensions);
    read_stars("bsc.dat", stars, dimensions);
    read_nebulae("nebulae.dat", nebulae, dimensions);

    cout.setf(ios::fixed);  // otherwise \LaTeX\ gets confused
    cout.precision(3);
    @<Create \LaTeX\ header@>@;
    cout << "\\psframe*[linestyle=none,linecolor=darkblue](0,0)(" << width
         << ',' << height << ")%\n";
    create_grid(mytransform);
    draw_boundaries(mytransform, boundaries, "BOO");
    draw_nebulae(mytransform, nebulae, objects);
    draw_stars(mytransform, stars, objects);
    arrange_labels(objects);
    print_labels(objects);
    @<Create \LaTeX\ footer@>@;
    return 0;
}

@ This is the preamble and the beginning of the resulting \LaTeX\ file.  Notice
that all font specific commands here should be also used during the generation
of the label dimensions file.  I use the \.{geometry} package and a dvips
\.{\\special} command to set the papaersize to the actual view frame plus
2~millimetres.  So I create a buffer border of 1\,mm thickness.

@<Create \LaTeX\ header@>=
    cout << "\\documentclass{article}\n\n" @/
         << "\\usepackage{eulervm}\n" @/
         << "\\usepackage[T1]{fontenc}\n" @/
         << "\\renewcommand*{\\rmdefault}{pmy}\n" @/
         << "\\usepackage{pstricks}\n" @/
         << "\\newrgbcolor{darkblue}{0 0 0.4}\n" @/
         << "\\usepackage[nohead,nofoot,margin=0cm," @/
         << "paperwidth=" << width + 0.2 << "cm," @/
         << "paperheight=" << height + 0.2 << "cm" @/
         << "]{geometry}\n" @/
         << "\n\\begin{document}\\boldmath\\parindent0pt\n" @/
         << "\\special{papersize=" << width << "cm," << height << "cm}%\n" @/
         << "\\vbox to \\vsize{\\vfill\\hbox{\\hspace{1mm}%\n";

@ This is almost trivial.  I just close the box structure I began at the end of
|@<Create \LaTeX\ header@>| and close the document.

@<Create \LaTeX\ footer@>=
    cout << "}\\vskip1mm}\\end{document}\n";

@* Index.
