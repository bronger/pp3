@x
#include <map>
@y
#include <map>
#include <set>
@z

@x
@** The input script.  The input script is a text file that is given as the
first and only parameter to \PPTHREE/.  Its format is very simple: First, a
@y
@ The Wortlist.  This |set| will contain all labels and other strings in the
\PPTHREE/ input script.  Its contents will be read from \.{wordlist.txt},
filled with the strings of the current run, and the written back into
\.{wordlist.txt}.
@c
set<string> wordlist;

@** The input script.  The input script is a text file that is given as the
first and only parameter to \PPTHREE/.  Its format is very simple: First, a
@z

@x
    if (c != '"') {
        script >> contents;
        if (script) contents.insert(contents.begin(),c); else contents = c;
    } else {
@y}
    if (c != '"') {
        script >> contents;
        if (script) contents.insert(contents.begin(),c); else contents = c;
	wordlist.insert(contents);
    } else {
@z}

@x
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
@y
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
	wordlist.insert(string("\"")+contents+"\"");
@z

@x
int main(int argc, char **argv) {
    try {
        @<Dealing with command line arguments@>@;
@y}}
int main(int argc, char **argv) {
    try {
        @<Dealing with command line arguments@>@;
        {
            ifstream wordlist_file("wordlist.txt");
            while (wordlist_file) {
                string word;
                getline(wordlist_file,word);
                wordlist.insert(word);
            }
        }
@z}}

@x{
    }
    catch (string s) {
        cerr << "pp3: " << s << '.' << endl;
        exit(1);
    }
@y{
        {
            ofstream wordlist_file("wordlist.txt");
            set<string>::const_iterator i=wordlist.begin();
            while(++i != wordlist.end()) wordlist_file << *i << '\n';
        }
    }
    catch (string s) {
        cerr << "pp3: " << s << '.' << endl;
        exit(1);
    }
@z

@x
            cerr << "PP3 1.3.2  Copyright (c) 2003 Torsten Bronger\n" @/
                 << "           http://pp3.sourceforge.net\n\n" @/
                 << "Syntax:\n  pp3 {input-file}\n\n" @/
@y
            cerr << "PP3 1.3.2  Copyright (c) 2003 Torsten Bronger\n" @/
                 << "           http://pp3.sourceforge.net\n\n" @/
                 << " *** SPECIAL VERSION FOR WORDLIST CREATION ***\n\n" @/
                 << "Syntax:\n  pp3 {input-file}\n\n" @/
@z
