// 	$Id$	

#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <vector>
#include <map>
#include <iomanip>
#include <cstdlib>
#include <cmath>

const string dat_path = "/windows/g/Programme/Ciel/cat/bsc5/";

struct star {
    int hd, hr;
    double rectascension, declination;
    double magnitude;
    double b_v;
    int flamsteed;
    string name;
    string constellation;
    string spectral_class;
    star() : hd(0), hr(0), rectascension(0.0), declination(0.0),
	     magnitude(0.0), b_v(0.0), flamsteed(0), name(""),
	     spectral_class("") { }
};

ostream& operator<<(ostream& out, const star& s) {
    out << s.hd << ' ' << s.hr << ' ' << s.rectascension << ' '
	<< s.declination << ' ' << s.magnitude << ' ' << s.b_v << ' '
	<< s.flamsteed << '\n';
    out << s.name << '\n' << s.constellation << '\n'
	<< s.spectral_class << '\n';
    return out;
}

istream& operator>>(istream& in, star& s) {
    in >> s.hd >> s.hr >> s.rectascension 
       >> s.declination >> s.magnitude >> s.b_v 
       >> s.flamsteed;
    getline(in,s.name);
    getline(in,s.constellation);
    getline(in,s.spectral_class);
    return in;
}

int read_byte(istream& file) {
    int result = 0;
    unsigned char ch;

    file.get(ch);
    result = (int)ch;
    return result;
}

int read_int(istream& file) {
    int result = 0;
    unsigned char ch;

    file.get(ch);
    result = (int)ch;
    file.get(ch);
    result += (int)ch << 8;
    if (result > 32767) result -= 65536;
    return result;
}

// long read_long_bs (FILE * fp)
// {
// 	unsigned long ul;
// 	long	l;

// 	ul = getc (fp);
// 	ul = (ul << 8) | getc (fp);
// 	ul = (ul << 8) | getc (fp);
// 	ul = (ul << 8) | getc (fp);

// 	l = ul & 0x80000000 ? - (ul & 0x7fffffff) : ul;
// 	return l;
// }

long int read_longint(istream& file) {
    long int result = 0;
    unsigned char ch;

    file.get(ch);
    result = (long int)ch;
    file.get(ch);
    result += (long int)ch << 8;
    file.get(ch);
    result += (long int)ch << 16;
    file.get(ch);
    result += (long int)ch << 24;
    return result;
}

string read_string(istream& file, int length, bool trim = false) {
    string result;
    char ch;

    while (length > 0) {
	file.get(ch);
	length--;
	if (ch == '\0') break;
	result += ch;
    }
    while (length > 0) {
	file.get(ch);
	length--;
    }
    if (trim) {
	int i = result.length() - 1;
	while (isspace(result[i])) i--;
	result.erase(i + 1);
    }
    return result;
}

void skip_bytes(istream& file, int number) {
    char ch;
    while (number-- > 0) file.get(ch);
}

typedef vector<star> stars_list;

map<string,string> cook;

void initialise_cooker() {
    cook["Alp"] = "\\alpha";
    cook["Bet"] = "\\beta";
    cook["Gam"] = "\\gamma";
    cook["Del"] = "\\delta";
    cook["Eps"] = "\\varepsilon";
    cook["Zet"] = "\\zeta";
    cook["Eta"] = "\\eta";
    cook["The"] = "\\vartheta";
    cook["Iot"] = "\\iota";
    cook["Kap"] = "\\kappa";
    cook["Lam"] = "\\lambda";
    cook["Mu "] = "\\mu";
    cook["Nu "] = "\\nu";
    cook["Xi "] = "\\xi";
    cook["Omi"] = "o";
    cook["Pi "] = "\\pi";
    cook["Rho"] = "\\rho";
    cook["Sig"] = "\\sigma";
    cook["Tau"] = "\\tau";
    cook["Ups"] = "\\upsilon";
    cook["Phi"] = "\\phi";
    cook["Chi"] = "\\chi";
    cook["Psi"] = "\\psi";
    cook["Ome"] = "\\omega";
}

string parse_bayer_name(const string bayer_name) {
    string raw_greek;
    string number;
    if (bayer_name[0] == ' ') return "";
    raw_greek = bayer_name.substr(0,3);
    string cooked_greek = cook[raw_greek];
    if (bayer_name[3] != ' ')
	number = string("^{") + bayer_name.substr(3) + '}';
    if (cooked_greek == "") throw string(string("Invalid Greek: \"") +
					 raw_greek + '"');
    return string("$") + cooked_greek + number + '$';
}

void read_bsc5_zone(const int i, stars_list& stars) {
    star current_star;
    stringstream s;  s << dat_path << setfill('0') << setw(2) << i << ".dat";
    ifstream file(s.str().c_str());
    while (file) {
	long int value;
	current_star.hd = read_longint(file);
	if (file.eof()) break;  // not very clean
	current_star.hr = read_longint(file);
	current_star.rectascension = read_longint(file) / 1500000.0;
	current_star.declination = read_longint(file) / 100000.0;
	skip_bytes(file,4);
	current_star.magnitude = read_int(file) / 100.0;
	current_star.b_v = read_int(file) / 100.0;
	current_star.constellation = read_string(file,3);
	for (int i = 0; i < 3; i++)
	    if (islower(current_star.constellation[i]))
		current_star.constellation[i] =
		    toupper(current_star.constellation[i]);
	current_star.flamsteed = read_byte(file);
	string bayer_name = read_string(file,6);
	current_star.name = "";
	if (current_star.flamsteed != 0) {
	    stringstream s;  s << '$' << current_star.flamsteed << '$';
	    current_star.name = s.str();
	}
	if (bayer_name[0] != ' ')
	    current_star.name = parse_bayer_name(bayer_name);
	current_star.spectral_class = read_string(file,18,true);
	if (file.good()) stars.push_back(current_star);
    }
}

double b_v_of_SC(const string SC, const stars_list& stars) {
    double b_v_sum = 0.0;
    int b_v_count = 0;

    for (int i = 0; i < stars.size(); i++)
	if (stars[i].spectral_class.substr(0,SC.length()) == SC) {
	    if (stars[i].b_v < 90.0) {
		b_v_sum += stars[i].b_v;
		b_v_count++;
	    }
	}
    return b_v_count > 0 ? b_v_sum / b_v_count : -1000.0;
}

void b_v_of_complete_class_letter(const string letter, stars_list& stars,
				  ostream& out) {
    out << "Spectral class " << letter << "9" << " has B-V of "
	<< b_v_of_SC(letter+"9",stars) << endl;
    out << "Spectral class " << letter << "8" << " has B-V of "
	<< b_v_of_SC(letter+"8",stars) << endl;
    out << "Spectral class " << letter << "7" << " has B-V of "
	<< b_v_of_SC(letter+"7",stars) << endl;
    out << "Spectral class " << letter << "6" << " has B-V of "
	<< b_v_of_SC(letter+"6",stars) << endl;
    out << "Spectral class " << letter << "5" << " has B-V of "
	<< b_v_of_SC(letter+"5",stars) << endl;
    out << "Spectral class " << letter << "4" << " has B-V of "
	<< b_v_of_SC(letter+"4",stars) << endl;
    out << "Spectral class " << letter << "3" << " has B-V of "
	<< b_v_of_SC(letter+"3",stars) << endl;
    out << "Spectral class " << letter << "2" << " has B-V of "
	<< b_v_of_SC(letter+"2",stars) << endl;
    out << "Spectral class " << letter << "1" << " has B-V of "
	<< b_v_of_SC(letter+"1",stars) << endl;
    out << "Spectral class " << letter << "0" << " has B-V of "
	<< b_v_of_SC(letter+"0",stars) << endl;
    out << "-> Whole class " << letter << " has B-V of "
	<< b_v_of_SC(letter,stars) << endl;
}

void remove_names_duplicates(stars_list& stars) {
    const double min_distance = 0.1;
    const double min_distance_squared = min_distance * min_distance;
    for (int i = 0; i < stars.size(); i++)
	for (int j = 0; j < i; j++) {
	    const double offset_y =
		stars[i].declination - stars[j].declination;
	    if (offset_y > min_distance || offset_y < -min_distance) continue;
	    const double offset_x =
		(stars[i].rectascension - stars[j].rectascension) * 15.0;
	    if (offset_x > min_distance || offset_x < -min_distance) continue;
	    if (offset_x*offset_x + offset_y*offset_y
		< min_distance*min_distance_squared) {
		const int brighter =
		    stars[i].magnitude < stars[j].magnitude ? i : j;
		const int fainter = brighter == i ? j : i;
		if (stars[brighter].name != stars[fainter].name) {
		    int caret_position = stars[brighter].name.find('^');
		    if (caret_position != string::npos) {
			stars[brighter].name.erase(caret_position);
			stars[brighter].name += '$';
		    }
		}
		const double A = -0.4 * log(10);
		stars[brighter].magnitude = log(exp(A*stars[brighter].magnitude)
						+ exp(A*stars[fainter].magnitude))
		    / A;
		stars[fainter].name = "";
		stars[fainter].flamsteed = 0;
		stars[fainter].magnitude = 100;
	    }
	}
}

struct dimension {
    string name;
    double height,width;
    dimension(string name) : name(name), height(0.0), width(0.0) { }
};

void add_if_new(vector<dimension>& dimensions, const string name) {
    for (int j = 0; j < dimensions.size(); j++)
	if (dimensions[j].name == name) return;
    dimensions.push_back(dimension(name));
}

void create_label_dimensions_database(const stars_list& stars) {
    ofstream latex_file("labels_temp.tex");
    latex_file << "\\documentclass{article}\n\n"
	       << "\\usepackage{eulervm}\n"
	       << "\\usepackage[T1]{fontenc}\n"
	       << "\\renewcommand*{\\rmdefault}{pmy}\n"
	       << "\n\\begin{document}\n"
	       << "\\newwrite\\labelsfile\n"
	       << "\\catcode`\\_=11\n"
	       << "\\immediate\\openout\\labelsfile=labels_temp.dat\n"
	       << "\\catcode`\\_=8\n";
    vector<dimension> dimensions;
    for (int i = 0; i < stars.size(); i++)
	add_if_new(dimensions, stars[i].name);
    add_if_new(dimensions, "M\\,");
    add_if_new(dimensions, "NGC\\,");
    add_if_new(dimensions, "IC\\,");
    add_if_new(dimensions, "0");
    for (int i = 0; i < dimensions.size(); i++)
	latex_file << "\\setbox0 = \\vbox{\\hbox{"
		   << dimensions[i].name
		   << "}\\hrule height 0pt}\n"
		   << "  \\immediate\\write\\labelsfile{"
		   << i << " \\the\\wd0s \\the\\ht0s}\n";
    latex_file << "\\immediate\\closeout\\labelsfile\n\\end{document}\n";
    latex_file.close();
    system("latex labels_temp");

    ifstream raw_labels_file("labels_temp.dat");
    ofstream cooked_labels_file("labeldimens.dat");
    cooked_labels_file.setf(ios::fixed);
    cooked_labels_file.precision(5);
    cooked_labels_file << dimensions.size() << '\n';
    for (int i = 0; i < dimensions.size(); i++) {
	int current_i;
	string current_width, current_height;
	raw_labels_file >> current_i >> current_width >> current_height;
	if (current_i != i) throw string("Invalid raw label dimensions file");
	current_width.substr(0,current_width.length() - 3);
	current_height.substr(0,current_height.length() - 3);
	cooked_labels_file << dimensions[current_i].name << '\n'
			   << strtod(current_width.c_str(), 0) / 72.27 * 2.54
			   << ' '
			   << strtod(current_height.c_str(), 0) / 72.27 * 2.54
			   << '\n';
    } 
}

int main() {
    double b_v_min = 1000.0;
    double b_v_max = -1000.0;

    initialise_cooker();
    ofstream out("stars.dat");
    stars_list stars;
    try {
	for (int i = 1; i <= 50; i++)
	    read_bsc5_zone(i,stars);
	cout << "Removing names duplicates ..." << flush;
	remove_names_duplicates(stars);
	cout << " done.\n";
	/*	create_label_dimensions_database(stars); */
	for (int i = 0; i < stars.size(); i++)
	    if (stars[i].magnitude < 99.0) out << stars[i];
    }
    catch (string s) {
	cerr << s << endl;
	return 1;
    }
    return 0;
    for (int i = 0; i < stars.size(); i++) {
	if (stars[i].b_v < b_v_min) b_v_min = stars[i].b_v;
	if (stars[i].b_v < 90 && stars[i].b_v > b_v_max) b_v_max = stars[i].b_v;
	if (stars[i].magnitude > 99.0) continue;
	out << stars[i];
    }
    cout << b_v_min << " < B-V < " << b_v_max << endl;
    b_v_of_complete_class_letter("M", stars, cout);
    b_v_of_complete_class_letter("K", stars, cout);
    b_v_of_complete_class_letter("G", stars, cout);
    b_v_of_complete_class_letter("F", stars, cout);
    b_v_of_complete_class_letter("A", stars, cout);
    b_v_of_complete_class_letter("B", stars, cout);
    b_v_of_complete_class_letter("O", stars, cout);
    cout << b_v_of_SC("C", stars) << '\n';
}

// Necessary patches:
// HD 18242 (R Hor) has brightness of 4.7 rather than 4.
