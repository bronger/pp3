# RedHat spec file

Summary: Creation of sky charts in Postscript or PDF format.
Name: pp3
Version: 1.3.3
Release: 1tb
Copyright: MIT
Group: Sciences/Astronomy
Source: http://prdownloads.sourceforge.net/pp3/pp3-1.3.3.tar.bz2
url: http://pp3.sourceforge.net
BuildRoot: %{_tmppath}/%{name}-root

%description
PP3 creates celestial charts.  It generates resolution independent
maps of very high graphical quality in Postscript or PDF format.
They can be used for example as illustrations in books or on web
pages.  You may use the databases of the distribution or your own
databases converted to PP3's simple text format.

PP3 uses LaTeX+pstricks as the backend for generating the vector
graphics.  You can add arbitrary labels to the map.  The output is
configurable in many ways.

#'

%prep
%setup -n pp3-1.3.3

%build
rm -rf %{buildroot}
make LOCAL=""

%install
make LOCAL="" ROOT="$RPM_BUILD_ROOT" install

%clean
rm -Rf %{buildroot}

%files
%defattr(-, root, root)
%doc COPYING README WHATSNEW
%{_bindir}/pp3
%{_datadir}/pp3
%{_datadir}/doc/pp3
%{_infodir}/pp3.info.gz
%{_infodir}/betelg.png
%{_infodir}/leo1.png
%{_infodir}/orion.png
%{_infodir}/pp3rose.png
%{_infodir}/swan1.png
%{_infodir}/swan2.png
%{_infodir}/swan.png


%changelog
* Mon Aug 14 2004 Torsten Bronger 
- Version 1.3.3
- ATTENTION! Can only be compiled with a fixed brp-compress,
  see texinfo-pretest mailinglist 2004/03/03
* Mon Aug 14 2003 Torsten Bronger 
- Version 1.3.2
* Mon Aug 09 2003 Torsten Bronger 
- Version 1.3.1
* Mon Jul 30 2003 Torsten Bronger 
- Version 1.3
* Mon Apr 29 2003 Torsten Bronger 
- Initial RPM generation (no release yet).
