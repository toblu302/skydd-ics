# No debuginfo:
%define debug_package %{nil}
%define name      foss-simple-log-server
%define summary   Simple server for collecting logs
%define version   1.0
%if 0%{?_buildtag:1}
%define release %{_buildtag}
%else
%define release 1
%endif
%define license   sysctl license
%define group     system/file
%define source    %{name}-%version.tar.gz
%define url       https://sysctl.se
%define vendor    sysctl
%define packager  sysctl packaging team
%define buildroot %{_tmppath}/%{name}-root
%define _prefix   /
%global __requires_exclude %{?__requires_exclude}|perl\\(config\.pl

Name:      %{name}
Summary:   %{summary}
Version:   %{version}
Release:   %{release}
License:   %{license}
Group:     %{group}
Source0:   %{source}
BuildArch: noarch
Requires:  foss-httpd, foss-common, foss-docs, perl-URI-Encode, perl-IPC-Run
Requires(pre): shadow-utils
Provides:  %{name}
URL:       %{url}
Buildroot: %{buildroot}

%description
Simple server for collecting logs. Uses syslogd. Listens on UDP and TCP port 514.

%prep

%build
# Build a selinux policy to allow httpd to read from the incoming log file
cd %{_srcdir}
make -f /usr/share/selinux/devel/Makefile

%install
pushd %{_srcdir}
mkdir -p  %{buildroot}/usr/share/selinux/packages/foss-simple-log
cp  %{_srcdir}/*.pp  %{buildroot}/usr/share/selinux/packages/foss-simple-log
cp -r var etc usr %{buildroot}

%pre

%post
touch /opt/.foss-simple-log
# run ansible with provided inventory which could have beeen changed by the user
/usr/bin/ansible-playbook -i /opt/ansible/inventory /opt/ansible/playbooks/simple_log.yml > /root/ansible-run-$$

%clean
rm -rf %{buildroot}

%postun
rm -f /opt/.foss-simple-log


%files
%defattr(-,root,root)
%dir %attr(0755, root, root)              /var/www/html/log
     %attr(0644, root, root)              /var/www/html/log/log.html
     %attr(0644, root, root)              /var/www/html/log/index.html
     %attr(0664, apache, apache)          /var/www/html/log/searching.json
%dir %attr(0755, root, root)              /var/www/html/log/cgi
     %attr(0550, apache, apache)          /var/www/html/log/cgi/*
%dir %attr(0755, root, root)              /var/www/html/log/js
     %attr(0644, root, root)              /var/www/html/log/js/*
     %attr(0644, root, root)              /etc/rsyslog.d/foss.conf
     %attr(0644, root, root)              /etc/logrotate.d/syslog.foss
     %attr(0644, root, root)              "/etc/skel/Desktop/Länk till loggvy.desktop"
     %attr(0644, root, root)              /etc/skel/Desktop/firefox_log.desktop
     %attr(0644, root, root)              /etc/xdg/autostart/firefox_log_autostart.desktop
%dir %attr(0755, root, root)              /usr/share/selinux/packages/foss-simple-log
     %attr(0644, root, root)              /usr/share/selinux/packages/foss-simple-log/logger.pp
     %attr(0600, root, root) %config(noreplace) /var/log/incoming
