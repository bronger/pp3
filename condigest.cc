// 	$Id$	

#include <string>
#include <iostream>
#include <fstream>
#include <vector>

struct line {
    double rectascension, declination;
    string constellation;
    bool interpolated;
};

istream& operator>>(istream& in, line& l) {
    string interpolated_flag;
    in >> l.rectascension >> l.declination >> l.constellation
       >> interpolated_flag;
    l.interpolated = interpolated_flag == "I";
    return in;
}

ostream& operator<<(ostream& out, const line& l) {
    string interpolated_flag;
    out << l.rectascension << ' ' << l.declination << ' ' <<  l.constellation
	<< ' ' <<  l.interpolated << '\n';
    return out;
}

struct point {
    double x,y;
    bool operator==(const point& p) const;
};

bool point::operator==(const point& p) const {
    return fabs(x-p.x) < 0.001 && fabs(y-p.y) < 0.001;
}

typedef vector<point> pointlist;

struct path {
    pointlist points;
    vector<string> constellations;
    bool operator==(const path& p) const;
};

bool path::operator==(const path& p) const {
    return (points[0] == p.points[0] &&
	    points[points.size()-1] == p.points[p.points.size()-1]) ||
	(points[0] == p.points[p.points.size()-1] &&
	 points[points.size()-1] == p.points[0]);
}

ostream& operator<<(ostream& out, const path& p) {
    out << p.points.size();
    for (int i=0; i<p.points.size(); i++) {
	if (i % 4 == 3) out << '\n'; else out << ' ';
	out << p.points[i].x << ' ' << p.points[i].y;
    }
    out << ' ' << p.constellations.size();
    for (int i=0; i<p.constellations.size(); i++)
	out << ' ' << p.constellations[i];
    out << '\n';
    return out;
}



main() {
    vector<line> lines;
    ifstream file("constell/eq2000.dat");
    line l;
    int i=0;
    file >> l;
    while (file.good()) {
	lines.push_back(l);
	file >> l;
    }
    // Insert missing points at the beginning of each constellation
    i = 1;
    string last_constellation;
    int last_beginning = 0;
    while (i < lines.size()) {
	if (last_constellation.empty())
	    last_constellation = lines[i].constellation;
	bool this_is_last;
	if (i == lines.size() - 1) this_is_last = true;
	else if (lines[i+1].constellation != last_constellation)
	    this_is_last = true;
	else this_is_last = false;
	if (this_is_last) {
	    lines.insert(lines.begin()+last_beginning,lines[i]);
	    i++;
	    last_beginning = i + 1;
	    last_constellation = "";
	}
	i++;
    }

    // Create paths
    vector<path> paths;

    i = 0;
    while (i < lines.size() - 1) {
	path current_path;
	point current_point;
	if (lines[i].constellation != lines[i+1].constellation) i++;
	current_path.constellations.push_back(lines[i].constellation);
	current_point.x = lines[i].rectascension;
	current_point.y = lines[i].declination;
	current_path.points.push_back(current_point);
	do {
	    i++;
	    current_point.x = lines[i].rectascension;
	    current_point.y = lines[i].declination;
	    current_path.points.push_back(current_point);
	} while (lines[i].interpolated);
	paths.push_back(current_path);
    }
    
    ofstream pathfile("boundaries.dat");
    pathfile.setf(ios::fixed);
    pathfile.precision(7);
    for (int i = 0; i < paths.size(); i++) {
	bool unique = true;
	for (int j = i + 1; j < paths.size(); j++)
	    if (paths[i] == paths[j]) {
		unique = false;
		for (int k = 0; k < paths[i].constellations.size(); k++)
		    paths[j].constellations.
			push_back(paths[i].constellations[k]);
	    }
	if (unique) pathfile << paths[i];
    }
    
    return 0;
}
