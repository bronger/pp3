
@ @c
#include <iostream>
#include <string>
#include <cmath>

#ifndef NAN
#define NAN 0.0
#endif

/*
Moon
384000.0
  0.054900489    0             0              0
  5.145396374    0             0              0
 75.146281    6003.176        -0.012403      -0.0000147
259.183275   -1934.142         0.002078       0.0000022
270.434164  481267.8831       -0.001133       0.0000019
*/

const char* planet_names[9] =
    { "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn",
      "Uranus", "Neptune", "Pluto" };

@
\def\JD{\hbox{\tenit{JD}}}
\def\UT{\hbox{\tenit{UT}}}
\let\phi\varphi
\let\epsilon\varepsilon

@s JD TeX
@s UT TeX

@c
double JD(int day, int month, int year, double UT) {
    if (month <= 2) {
        year--;
        month += 12;
    }
    if (year <= 1928) throw string("Too early year");
    const double B = floor(year/400.0) - floor(year/100.0);
    return floor(365.25*year) + floor(30.6001*(month+1)) + B
        +1720996.5 + day + UT/24.0;
}

@
\font\wasy=wasyb10 scaled 1000
\font\sevenwasy=wasyb10 scaled 700
\def\mercury{\hbox{\wasy\char"27}} %"}}
\def\venus{\hbox{\wasy\char"19}} %"}}
\def\earth{\hbox{\wasy\char"26}} %"}}
\def\mars{\hbox{\wasy\char"1A}} %"}}
\def\jupiter{\hbox{\wasy\char"58}} %"}}
\def\saturn{\hbox{\wasy\char"59}} %"}}
\def\uranus{\hbox{\wasy\char"5A}} %"}}
\def\neptune{\hbox{\wasy\char"5B}} %"}}
\def\pluto{\hbox{\wasy\char"5C}} %"}}

@s mercury TeX
@s venus TeX
@s earth TeX
@s mars TeX
@s jupiter TeX
@s saturn TeX
@s uranus TeX
@s neptune TeX
@s pluto TeX

@c
enum { @+ mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto @+ };

struct ephemeride {
    double rectascension, declination, magnitude;
};

@

\def\jdx{jd_}
\def\rectascensionxmoon{\hbox{\tenit rectascension\_\wasy\char"24}}  %"}}
\def\declinationxmoon{\hbox{\tenit declination\_\wasy\char"24}}  %"}}
\def\dxmoon{d\hbox{\_\wasy\char"24}}  %"}}
\def\positionxanglexmoon{\hbox{\tenit position\_angle\_\wasy\char"24}}  %"}}
\def\phasexanglexmoon{\hbox{\tenit phase\_angle\_\wasy\char"24}}  %"}}
\def\rectascensionxsun{\hbox{\tenit rectascension\_}\tensy\odot}
\def\declinationxsun{\hbox{\tenit declination\_}\tensy\odot}


@s jd_0 TeX
@s rectascension_moon TeX
@s declination_moon TeX
@s d_moon TeX
@s position_angle_moon TeX
@s phase_angle_moon TeX
@s rectascension_sun TeX
@s declination_sun TeX

@c
class ephemerides {
    ephemeride ephem[9];
    bool valid;
    void solve_equations(const double x, const double y, const double z,
                         double &a, double &b, double &r) const;
    double polynom(const double coefficients[4], const double T) const;
    double calculate_E(const double M, const double e) const;
    void calculate_orbit(double jd, int planet,
                         double &l, double &b, double &r) const;
    void transform_helio_to_geo_ecliptical(
        const double l, const double b, double r,
        const double L, const double B, double R,
        double& lambda, double& beta, double& Delta) const;
    void equinox_2000(const double jd_0, double& lambda, double& beta,
                      const double jd = 2451544.5334) const;
    void transform_ecliptical_to_equatorial(
        const double lambda, const double beta,
        double& alpha, double& delta) const;
    double magnitude(const int planet,
                     const double r, const double R, const double Delta,
                     const double jd = 0.0,
                     const double alpha = 0.0,
                     const double delta = 0.0) const;
    void calculate_moon(const double jd);
public: @/
    double rectascension_moon, declination_moon, d_moon, position_angle_moon,
        phase_angle_moon;
    double rectascension_sun, declination_sun;
    ephemerides(const double jd) { recalculate(jd); }
    ephemerides(const int day, const int month, const int year,
                const double UT) { recalculate(JD(day,month,year,UT)); }
    ephemerides() : valid(false) { }
    void recalculate(const double jd);
    ephemeride operator[](const int index) const;
};

@

@c
void ephemerides::recalculate(const double jd) {
    double L,B,R;
    calculate_orbit(jd,earth,L,B,R);
    double lambda,beta,Delta;
    double alpha,delta;
    @<Calculate sun position@>@;
    for (int planet = mercury; planet <= pluto; planet++)
        if (planet != earth) {
            double l,b,r;
            calculate_orbit(jd,planet,l,b,r);
            transform_helio_to_geo_ecliptical(l,b,r,L,B,R,lambda,beta,Delta);
            equinox_2000(jd,lambda,beta);
            transform_ecliptical_to_equatorial(lambda,beta,alpha,delta);
            ephem[planet].rectascension = alpha * 180.0/M_PI / 15.0;
            ephem[planet].declination = delta * 180.0/M_PI;
            ephem[planet].magnitude = magnitude(planet,r,R,Delta);
        }
    calculate_moon(jd);
    valid = true;
}

@
@<Calculate sun position@>=
    transform_helio_to_geo_ecliptical(L + M_PI,-B,R,L,B,R,lambda,beta,Delta);
    equinox_2000(jd,lambda,beta);
    transform_ecliptical_to_equatorial(lambda,beta,alpha,delta);
    rectascension_sun = alpha * 180.0/M_PI / 15.0;
    declination_sun = delta * 180.0/M_PI;


@
@c
ephemeride ephemerides::operator[](const int index) const {
    if (!valid) throw string("No JD given");
    if (index >= mercury && index <= pluto && index != earth) {
        return ephem[index];
    } else throw string("Invalid planet given");
}

@

@s phi TeX
@s rho TeX

@c
void ephemerides::solve_equations(const double x, const double y, const double z,
                                  double &a, double &b, double &r) const {
    const double rho = hypot(x,y);
    if (rho != 0.0) b = atan(z/rho);
    else if (z > 0) b = M_PI_2;
    else if (z < 0) b = -M_PI_2;
    else b = 0.0;
    const double phi = 2.0 * atan(y / (fabs(x) + rho));
    if (x < 0.0) a = M_PI - phi;
    else if ( x > 0)
        if (y < 0.0) a = 2.0*M_PI + phi; else a = phi;
    else if (y < 0.0) a = 2.0*M_PI + phi;
        else if (y > 0.0) a = phi;
        else a = 0.0;
    r = sqrt(x*x + y*y + z*z);
}

double ephemerides::polynom(const double coefficients[4], const double T) const {
    return (((coefficients[3] * T + coefficients[2]) * T)
            + coefficients[1]) * T + coefficients[0];
}

@

\def\Ex{E_}

@s E_0 TeX
@s E_1 TeX

@c
double ephemerides::calculate_E(const double M, const double e) const {
    const double epsilon = 1e-7;
    double E_0;
    double E_1 = M;
    do {
        E_0 = E_1;
        E_1 = E_0 - (M - E_0 + e*sin(E_0))/(e*cos(E_0) - 1.0);
    } while (fabs(E_1 - E_0) >= epsilon);
    return E_1;
}

@

\def\uxtilde{\tilde u}
\def\omegaxtilde{\tilde\omega}
\def\ascending{\hbox{{\wasy\char"13}}}  %"}} 
 
@s omega TeX
@s nu TeX
@s u_tilde TeX
@s omega_tilde TeX
@s ascending TeX

@c
void ephemerides::calculate_orbit(double jd, int planet,
                                  double &l, double &b, double &r) const {
    const double half_diameter[9] = { 0.3870986,
                                      0.7233316,
                                      1.0,
                                      1.5236883,
                                      5.202561,
                                      9.554747,
                                      19.21814,
                                      30.10957,
                                      39.5972 };
    const double orbital_elements_coefficients[9][5][4] = { @/
        {  // Mercury
            { 0.20561421,    2.046e-5,    -3e-8,    0}, @/
            { 0.122223330575,    3.24770867211e-5,    -3.19395253115e-7,    0}, @/
            { 0.501847662155,    0.00646261562626,    2.10835773641e-6,    0}, @/
            { 0.822851951761,    0.020685787157,    3.03512756922e-6,    0}, @/
            { 1.78511195535,    2608.78753307,    1.11701072128e-7,    0}
        }, @/
        {  // Venus
            { 0.00682069,    -4.774e-5,    9.1e-8,    0}, @/
            { 0.0592300345477,    1.75545216166e-5,    -1.74532925199e-8,    0}, @/
            { 0.949183106717,    0.00886952065787,    -2.41972447496e-5,    0}, @/
            { 1.32260434615,    0.0157053452741,    7.15584993318e-6,    0}, @/
            { 3.71062618934,    1021.32834864,    2.24466795099e-5,    0}
        }, @/
        {  // Earth, suboptimal
            { 0.016751,    -4.2e-5,    0,    0}, @/
            { 0,    0,    0,    0}, @/
            { 1.7666362315,    0.0300057005003,    0,    0}, @/
            { 0,    0,    0,    0}, @/
            { 6.25658299872,    628.301946599,    0,    0}
        }, @/
        {  // Mars
            { 0.0933129,    9.2064e-5,    -7.7e-8,    0}, @/
            { 0.0322944031083,    -1.1780972451e-5,    2.19911485751e-7,    0}, @/
            { 4.98172401922,    0.0186709511432,    2.29161730787e-6,    7.22566310326e-8}, @/
            { 0.851484043233,    0.0134563436705,    -2.44346095279e-8,    -9.30260491313e-8}, @/
            { -0.706524448119,    334.053483769,    3.15555528761e-6,    2.07694180987e-8}
        }, @/
        {  // Jupiter
            { 0.04833475,    0.00016418,    -4.676e-7,    -1.7e-9}, @/
            { 0.0228417522394,    -9.94156995228e-5,    6.80678408278e-8,    0}, @/
            { 4.76959315891,    0.0104620568058,    1.22879905987e-5,    8.86627260013e-8}, @/
            { 1.73561499372,    0.0176370756902,    6.14739869137e-6,    -1.48527519345e-7}, @/
            { -2.35046483606,    52.965367608,    -1.25937722836e-5,    3.10668606855e-8}
        }, @/
        {  // Saturn
            { 0.05589232,    -0.0003455,    -7.28e-7,    7.4e-10}, @/
            { 0.0435026632185,    -6.83977080564e-5,    -2.70351501134e-7, @/
              6.98131700798e-10}, @/
            { 5.90458499518,    0.0189406743258,    1.70787448625e-5,    1.73136661798e-7}, @/
            { 1.96856408899,    0.0152401295073,    -2.65604205568e-6,    -9.26769832809e-8}, @/
            { -3.22072303699,    21.3200951027,    -8.75910938406e-6,    -1.81688775133e-7}
        }, @/
        {  // Uranus
            { 0.0463444,    -2.658e-5,    7.7e-8,    0}, @/
            { 0.0134820401531,    1.09135438127e-5,    6.89405054538e-7,    0}, @/
            { 1.71167199109,    0.0172048449009,    -1.87535628127e-5,    -1.06465084372e-8}, @/
            { 1.2824175118,    0.00870339498368,    2.28934837984e-5,    0}, @/
            { 1.26796037365,    7.47662597211,    1.37531945057e-6,    1.74532925199e-10}
        }, @/
        {  // Neptune
            { 0.00899704,    6.33e-6,    -2e-9,    0}, @/
            { 0.0310536310898,    -0.000166567242493,    -1.58824961931e-7,    0}, @/
            { 4.81791115063,    0.00568347970422,    2.46004158069e-6,    7.17853921345e-8}, @/
            { 2.28082050913,    0.0191800340154,    4.36105420196e-6,    -8.23446341091e-8}, @/
            { -5.62466158483,    3.81286966434,    -1.22731553e-6,    8.72664625997e-11}
        }, @/
        {  // Pluto, suboptimal
            { 0.250448,    0,    0,    0}, @/
            { 0.298817821234,    0,    0,    0}, @/
            { 1.99704063672,    0,    0,    0}, @/
            { 1.92600573616,    0,    0,    0}, @/
            { 4.02126425293,    2.52159635889,    0,    0}
        }};
    const double T = (jd - 2415020.0) / 36525.0;
    const double a = half_diameter[planet];
    const double e = polynom(orbital_elements_coefficients[planet][0], T);
    const double i = polynom(orbital_elements_coefficients[planet][1], T);
    const double M = polynom(orbital_elements_coefficients[planet][4], T);
    const double E = calculate_E(M, e);
    const double nu = 2.0 * atan(sqrt((1.0+e) / (1.0-e)) * tan(E/2.0));
    r = a * (1 - e*cos(E));
    if (planet != earth) {
        const double omega =
            polynom(orbital_elements_coefficients[planet][2], T);
        const double ascending =
            polynom(orbital_elements_coefficients[planet][3], T);
        const double u = omega + nu;
        double dummy;
        solve_equations(cos(u), sin(u)*cos(i), sin(u)*sin(i), l, b, dummy);
        l += ascending;
    } else {
        const double omega_tilde =
            polynom(orbital_elements_coefficients[planet][2], T);
        const double u_tilde = omega_tilde + nu;
        b = 0.0;
        l = u_tilde;
    }
}
 
@

@s lambda TeX
@s beta TeX
@s Delta TeX

@c
void ephemerides::transform_helio_to_geo_ecliptical(
    const double l, const double b, double r,
    const double L, const double B, double R,
    double& lambda, double& beta, double& Delta) const {
    solve_equations(r*cos(b)*cos(l) - R*cos(B)*cos(L),
                    r*cos(b)*sin(l) - R*cos(B)*sin(L),
                    r*sin(b) - R*sin(B),
                    lambda, beta, Delta);
}
 
@

\def\PixA{\Pi_A}
\def\pixA{\pi_A}
\def\pxA{p_A}
\def\Tx{T_}

@s Pi_A TeX
@s pi_A TeX
@s p_A TeX
@s T_0 TeX

@c
void ephemerides::equinox_2000(const double jd_0, double& lambda, double& beta,
                               const double jd = 2451544.5334) const {
    const double T_0 = (jd_0 - 2451545.0) / 36525;
    const double T = (jd - jd_0) / 36525;
    const double Pi_A = (3.05216867315 + 1.59478490774e-2 * T_0
                         + 2.95736345e-6 * T_0*T_0) +
        (-4.21695788e-3 - 2.424e-6 * T_0) * T + 1.94e-7 * T*T;
    const double pi_A = (2.278770e-4 - 3.248e-7 * T_0) * T - 1.600e-7 * T * T;
    const double p_A = (2.438175e-2 + 1.077256e-5 * T_0) * T + 5.38628e-6 * T*T;
    double dummy;
    solve_equations(cos(beta)*cos(Pi_A-lambda),
                    cos(pi_A)*cos(beta)*sin(Pi_A-lambda) - sin(pi_A)*sin(beta),
                    sin(pi_A)*cos(beta)*sin(Pi_A-lambda) + cos(pi_A)*sin(beta),
                    lambda, beta, dummy);
    lambda = - (lambda - Pi_A - p_A);
    if (lambda < 0.0) lambda += 2.0*M_PI;
}
 
@

@s epsilon TeX
@s alpha TeX
@s delta TeX

@c
void ephemerides::transform_ecliptical_to_equatorial(
    const double lambda, const double beta,
    double& alpha, double& delta) const {
    const double epsilon = 0.40909280228;
    double dummy;
    solve_equations(cos(beta)*cos(lambda),
                    cos(epsilon)*cos(beta)*sin(lambda)
                        - sin(epsilon)*sin(beta),
                    sin(epsilon)*cos(beta)*sin(lambda)
                        + cos(epsilon)*sin(beta),
                    alpha, delta, dummy);
}

 
@

\def\hundredxdeg{100^\circ}
\def\alphax{\alpha_}
\def\deltax{\delta_}
\def\mx{m_}
 
@s hundred_deg TeX
@s alpha_0 TeX
@s delta_0 TeX
@s m_0 TeX
@q}@>

@c
double ephemerides::magnitude(const int planet,
                 const double r, const double R, const double Delta,
                 const double jd = 0.0,
                 const double alpha = 0.0,
                 const double delta = 0.0) const {
    const double m0_coefficients[9][4] = { @/
        { -0.42,   3.8,   -2.73,   2.00 }, @/
        { -4.40,   0.09,   2.39,  -0.65 }, @/
        { -3.86,   0.0,    0.0,    0.0  }, @/
        { -1.52,   1.60,   0.0,    0.0  }, @/
        { -9.40,   0.50,   0.0,    0.0  }, @/
        { -8.88,   4.4,    0.0,    0.0  }, @/
        { -7.19,   0.0,    0.0,    0.0  }, @/
        { -6.87,   0.0,    0.0,    0.0  }, @/
        { -1.0,    0.0,    0.0,    0.0  }
    };
    const double i = acos((Delta*Delta + r*r - R*R)/(2*Delta*r));
    const double hundred_deg = 100 * M_PI/180.0;
    double m_0 = m0_coefficients[planet][0]
        + m0_coefficients[planet][1] * (i/hundred_deg)
        + m0_coefficients[planet][2] * pow(i/hundred_deg,2.0)
        + m0_coefficients[planet][3] * pow(i/hundred_deg,3.0);
    if (planet == saturn) {  // Saturn
        const double T = (jd - 2451545.0) / 36525;
        const double alpha_0 = 0.70965 + (-6.28e-4 + 8.2572e-2) * T;
        const double delta_0 = 1.4577 + (-6.9813e-5 + 7.1035e-3) * T;
        const double x = cos(delta_0)*sin(alpha_0-alpha);
        const double y = sin(delta_0)*cos(delta)
            - cos(delta_0)*sin(delta)*cos(alpha_0-alpha);
        const double D = acos(x/(atan2(x,y)));
        m_0 += -2.60*sin(fabs(D)) + 1.25*pow(sin(D),2.0);
    }
    return m_0 + 5 * log10(r*Delta);
}

@

\def\alphaxmoon{\alpha_{\hbox{\sevenwasy\char"24}}}  %"}}}
\def\deltaxmoon{\delta_{\hbox{\sevenwasy\char"24}}}  %"}}}

@s alpha_moon TeX
@s delta_moon TeX

@c
void ephemerides::calculate_moon(const double jd) {
    const double T = (jd - 2415020.0) / 36525;
    const double l = 4.71996657 + 8399.70914491*T - 1.97745804e-5*T*T;
    const double m = 5.16800034 + 8328.69110364*T + 1.60430665e-4*T*T;
    const double ascending = 4.52360151 - 33.7571462407*T + 3.62679419e-5*T*T;
    const double L = 4.88162794 + 628.331950989*T + 5.28834763e-6*T*T;
    const double M = 6.25658357 + 628.301945725*T - 2.61799388e-6*T*T;@#
                                                                          
    double lambda = l @|
        + 0.109762 * sin(m) @|
        + 3.728e-3 * sin(2*m) @|
        + 1.75e-4 * sin(3*m) @|
        - 6.061e-4 * sin(l-L) @|
        + 0.011490 * sin(2*(l-L)) @|
        - 3.239e-3 * sin(M) @|
        - 1.997e-3 * sin(2*(l-ascending)) @|
        + 1.028e-3 * sin(2*(l-L-m)) @|
        + 0.022234 * sin(2*(l-L)-m) @|
        + 9.308e-4 * sin(2*(l-L)+m) @|
        + 7.999e-4 * sin(2*(l-L)-M) @|
        + 9.987e-4 * sin(2*(l-L)-m-M) @|
        - 5.333e-4 * sin(m+M) @|
        + 7.175e-4 * sin(m-M);
    double beta = 0.0897875 * sin(lambda - ascending
                                  + 1.990e-3*sin(2*(l-ascending))
                                  + 2.618e-3*sin(M)) @|
        - 2.550e-3 * sin(2*L-l-ascending) @|
        + 2.13e-4 * sin(2*L-l-ascending+m) @|
        - 1.50e-4 * sin(2*L-l-ascending-m) @|
        - 1.12e-4 * sin(2*L-l-ascending+M) @|
        + 5.33e-5 * sin(2*L-l-ascending-M) @|
        - 1.21e-4 * sin(l-ascending-2*m) @|
        + 1.02e-4 * sin(l-ascending-m);
    equinox_2000(jd, lambda, beta);
    double alpha_moon, delta_moon;
    transform_ecliptical_to_equatorial(lambda,beta,alpha_moon,delta_moon);
    rectascension_moon = alpha_moon * 180.0/M_PI / 15.0;
    declination_moon = delta_moon * 180.0/M_PI;
    const double pi = 0.016595 + 9.066e-4*cos(m) + 4.85e-5*cos(2*m)
	+ 1.65e-4*cos(2*(l-L)-m)
	+ 1.36e-4*cos(2*(l-L))
	+ 1.45e-5*cos(2*(l-L)+m);
    d_moon = 2.0 * asin(0.272493*sin(pi)) * 180.0/M_PI;
}
                      
@
@s ios int
@c
int main() {
    cout.setf(ios::fixed);
    ephemerides ephems(1,1,1983,0);
    cout << ephems.d_moon << '\t'
         << ephems.declination_sun << '\n';
    return 0;
    for (int day = int(floor(JD(1,1,2002,0)));
         day <= int(floor(JD(31,12,2002,0))); day++) {
        ephems.recalculate(day);
        cout << day << '\t'
             << ephems[mercury].rectascension << '\t'
             << ephems[mercury].declination << '\t'
             << ephems[mercury].magnitude << '\n';
    }
    return 0;
}
