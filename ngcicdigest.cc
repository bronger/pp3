// 	$Id$	

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <cstdlib>

typedef enum { unknown, galaxy, emission, reflection, open_cluster,
	       globular_cluster } nebula_kind;

struct nebula {
    int NGC, IC, M;  // |0| if not defined.
    string constellation;
    double rectascension, declination;
    double magnitudes;
    double diameter_x, diameter_y;
    double horizontal_angle;
    nebula_kind kind;
    nebula() : NGC(0), IC(0), M(0), constellation(), rectascension(0.0),
	       declination(0.0), magnitudes(0.0), diameter_x(0.0),
	       diameter_y(0.0), horizontal_angle(0.0), kind(unknown) { }
};

ostream& operator<<(ostream& out, const nebula& n) {
    out << n.NGC << ' ' << n.IC << ' ' << n.M << ' '
	<< n.constellation << ' ' << n.rectascension << ' ' << n.declination
	<< ' ' << n.magnitudes << ' ' << n.diameter_x << ' ' << n.diameter_y
	<< ' ' << n.horizontal_angle << ' ' << n.kind << '\n';
    return out;
}

bool parse_line(string line, nebula& n, bool IC = false) {
    if (line[15] == ' ') return false;
    if (line.length() != 176) return false;
    n.NGC = n.IC = n.M = 0;
    if (!IC) n.NGC = strtol(line.substr(0,4).c_str(),0,10);
    else n.IC = strtol(line.substr(0,4).c_str(),0,10);
    string id1 = line.substr(95,14);
    if (id1.substr(0,2) == "M ")
	n.M = strtol(id1.substr(2,3).c_str(),0,10);
    n.constellation = line.substr(15,3);
    n.rectascension = strtod(line.substr(20,2).c_str(),0) +
	strtod(line.substr(23,2).c_str(),0) / 60.0 +
	strtod(line.substr(26,4).c_str(),0) / 3600.0;
    n.declination = strtod(line.substr(31,3).c_str(),0);
    double declination_fraction = strtod(line.substr(35,2).c_str(),0) / 60.0 +
	strtod(line.substr(38,2).c_str(),0) / 3600.0;
    if (n.declination > 0.0) n.declination += declination_fraction;
    else n.declination -= declination_fraction;
    n.magnitudes = strtod(line.substr(43,4).c_str(),0);
    if (n.magnitudes == 0.0)
	n.magnitudes = strtod(line.substr(50,4).c_str(),0);
    if (n.magnitudes == 0.0)
	n.magnitudes = strtod(line.substr(56,4).c_str(),0);
    if (n.magnitudes == 0.0) n.magnitudes = 100.0;
    n.diameter_x = strtod(line.substr(61,6).c_str(),0) / 60.0;
    n.diameter_y = strtod(line.substr(68,5).c_str(),0) / 60.0;
    if (line[76] != ' ')
	n.horizontal_angle = 90.0 - strtod(line.substr(74,3).c_str(),0);
    else n.horizontal_angle = 720.0;  // Value for `not defined'
    if (n.diameter_x == 0.0) return false;
    if (n.diameter_y == 0.0) {
	n.diameter_y = n.diameter_x;
	n.horizontal_angle = 0.0;
    }
    string kind = line.substr(78,7);
    string id2 = line.substr(111,14);
    string id3 = line.substr(127,14);
    n.kind = unknown;
    if (kind.substr(0,2) == "NF") return false;
    if (kind.substr(0,2) == "EN" || kind.substr(0,3) == "SNR")
	n.kind = emission;
    else if (kind.substr(0,2) == "RN") n.kind = reflection;
    else if (kind.substr(0,3) == "OCL" || id1.substr(0,3) == "OCL" ||
	     id2.substr(0,3) == "OCL" || id3.substr(0,3) == "OCL")
	n.kind = open_cluster;
    else if (kind.substr(0,3) == "GCL" || id1.substr(0,3) == "GCL" ||
	     id2.substr(0,3) == "GCL" || id3.substr(0,3) == "GCL")
	n.kind = globular_cluster;
    else if (kind[0] == 'S' || kind[0] == 'E' || kind[0] == 'I')
	n.kind = galaxy;
}

int main() {
    ifstream ngc_file("ngc_ic/revngc.txt");
    ifstream ic_file("ngc_ic/revic.txt");
    ofstream out("nebulae.dat");
    try {
	vector<nebula> nebulae;
	nebula current_nebula;
	string line;
	getline(ngc_file,line);
	getline(ngc_file,line);
	
	getline(ngc_file,line);
	while (ngc_file) {
	    if (parse_line(line,current_nebula)) {
		bool new_number = true;
		if (!nebulae.empty()) if (nebulae[nebulae.size() - 1].NGC
					  == current_nebula.NGC)
		    new_number = false;
		if (new_number) nebulae.push_back(current_nebula);
	    }
	    getline(ngc_file,line);
	}
	getline(ic_file,line);
	getline(ic_file,line);
	
	getline(ic_file,line);
	while (ic_file) {
	    if (parse_line(line,current_nebula,true)) {
		bool new_number = true;
		if (!nebulae.empty()) if (nebulae[nebulae.size() - 1].IC
					  == current_nebula.IC)
		    new_number = false;
		if (new_number) nebulae.push_back(current_nebula);
	    }
	    getline(ic_file,line);
	}
	for (int i = 0; i < nebulae.size(); i++)
	    out << nebulae[i];
	cerr << nebulae.size() << endl;
    }
    catch (string s) {
	cerr << s << endl;
    }
    return 0;
}
