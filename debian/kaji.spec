Name:		kaji
Version:	0.1.99.9
Release:	1beta1
Summary:	Simple monitoring solution - Meta-package

Group:		Network
License:	AGPLv3+
URL:		https://github.com/kaji-project/kaji
Source0:	https://github.com/kaji-project/kaji/%{name}_%{version}.orig.tar.gz

BuildArch:  noarch

Requires: kaji-scripts
Requires: shinken-common
Requires: adagios
Requires: influxdb
Requires: grafana
Requires: grafana-admin
Requires: influxdb-python
Requires: rekishi
Requires: shinken-mod-booster-nrpe
Requires: shinken-mod-influxdb
Requires: shinken-mod-livestatus
Requires: shinken-mod-logstore-null
Requires: shinken-mod-logstore-sqlite
Requires: shinken-mod-pickle-retention-file-generic
Requires: shinken-mod-simple-log

%description
Simple monitoring solution - Meta-package
This meta-package install a fully functionnal monitoring solution
based on Shinken and Adagios.
Shinken is a new, Nagios compatible monitoring tool, written in Python. The
main goal of Shinken is to allow users to have a fully flexible architecture
for their monitoring system that can easily scale to large environments.
Adagios is a web based Nagios configuration interface built to be simple and
intuitive in design, exposing less of the clutter under the hood of nagios.
Additionally adagios has a rest interface for both status and configuration
data as well a feature complete status interface that can be used as an
alternative to nagios web interface.


%package scripts
Summary:  Scripts collection for Kaji Solution
Group:    Network
Requires: curl
Requires: sudo
Requires: git
Requires: redhat-lsb-core

%description scripts
Simple monitoring solution - Scripts Collection
This package install a collection of scripts to install Kaji Solution


%prep
%setup -q

%build

%install
rm -rf %{buildroot}/*

install -d %{buildroot}/usr/share/kaji
cp -rp configs %{buildroot}/usr/share/kaji
cp -rp scripts %{buildroot}/usr/share/kaji
cp -rp tools %{buildroot}/usr/share/kaji
install -dm0755 %{buildroot}/var/www/html
install -pm0644 images/kaji-fav.ico %{buildroot}/var/www/html

install -dm0755 %{buildroot}/%{_sbindir}/
ln -sf /usr/share/kaji/scripts/kaji-finish-install.sh %{buildroot}/%{_sbindir}/kaji-finish-install
ln -sf /usr/share/kaji/scripts/kaji-influxdb-create-databases.sh %{buildroot}/%{_sbindir}/kaji-influxdb-create-databases
ln -sf /usr/share/kaji/scripts/kaji-http-config.sh %{buildroot}/%{_sbindir}/kaji-http-config
ln -sf /usr/share/kaji/scripts/kaji-nagvis-reset-auth.sh %{buildroot}/%{_sbindir}/kaji-nagvis-reset-auth
ln -sf /usr/share/kaji/scripts/kaji-services-restart-all.sh %{buildroot}/%{_sbindir}/kaji-services-restart-all
ln -sf /usr/share/kaji/scripts/kaji-shinken-init-config.sh %{buildroot}/%{_sbindir}/kaji-shinken-init-config
ln -sf /usr/share/kaji/scripts/kaji-nagiosplugins-fix.sh %{buildroot}/%{_sbindir}/kaji-nagiosplugins-fix

%post
echo
echo "Kaji install finished"
echo
echo "Please run sudo /usr/sbin/kaji-finish-install"
echo


%files scripts
/usr/share/kaji
/var/www/html/kaji-fav.ico
/%{_sbindir}/kaji*



%changelog
* Tue Jan 27 2015 Thibault Cohen <thibaut.cohen@savoirfairelinux.com> 0.1.99.1-1beta1
- New Kaji release

