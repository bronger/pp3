#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <math.h>

/* You may call this program this way:
   pngtopnm milkyway.png | pnmtoplainpnm > milkyway.pgm && milkydigest
*/

inline double round(double x) {
    if (x - floor(x) < 0.5) return floor(x); else return ceil(x);
}

bool transform(double& rectascension, double& declination,
	       int x, int y, int height) {
    bool nothern = x < height;
    if (nothern) x -= height/2; else x -= height + height/2;
    y = (height - y) - height/2;
    double phi = atan2(y,x);
    if (nothern) phi = M_PI + M_PI_2 - phi; else phi += M_PI_2;
    if (phi < 0.0) phi += 2.0 * M_PI;
    if (phi > 2.0 * M_PI) phi -= 2.0 * M_PI;
    rectascension = phi * 180.0 / M_PI / 15.0;
    declination = hypot(x,y) / double(height) * 180.0;
    if (declination > 90.0) return false;
    if (nothern) declination = 90.0 - declination; else declination -= 90.0;
    return true;
}

struct milky_pixel {
    double rectascension, declination;
    int pixel;
    milky_pixel(double rectascension, double declination, int pixel)
	: rectascension(rectascension), declination(declination),
	  pixel(pixel) { }
};

int main() {
    ifstream in("milkyway.pgm");
    ofstream out("milkyway.dat");
    string magic_number;
    int width, height, maxval;
    in >> magic_number >> width >> height >> maxval;
    out.setf(ios::fixed);  // otherwise \LaTeX\ gets confused
    out.precision(3);
    vector<milky_pixel> pixels;
    maxval = 0;
    for (int row = 0; row < height; row++)
	for (int column = 0; column < width; column++) {
	    int pixel;
	    double rectascension, declination;
	    in >> pixel;
	    if (pixel == 0) continue;
	    if (transform(rectascension, declination, column, row, height)) {
		pixels.push_back(milky_pixel(rectascension, declination,
					     pixel));
		if (pixel > maxval) maxval = pixel;
	    }
	}
    out << 90.0 / (double(height)/2.0) / M_SQRT2 << '\n';
        // maximal (=equatorial) diagonal distance of two pixels in degrees
    double ratio = 255.0 / double(maxval);
    for (int i = 0; i < pixels.size(); i++)
	out << pixels[i].rectascension << ' '
	    << pixels[i].declination << ' '
	    << int(round(double(pixels[i].pixel) * ratio)) << '\n';
    if (!in) cerr << "Error reading file" << endl;
    return 0;
}
