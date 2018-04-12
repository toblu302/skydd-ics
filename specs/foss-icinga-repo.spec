# No debuginfo:
%define debug_package %{nil}
%define name      foss-icinga-repo
%define summary   Repo for icinga rpms
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
Requires:  foss-common
Requires(pre): shadow-utils
Provides:  %{name}
URL:       %{url}
Buildroot: %{buildroot}

%description
Icinga repo

%prep

%install
pushd %{_srcdir}
cp -r etc %{buildroot}

%post
touch /opt/.foss-monitor-repo

%postun
rm -f /opt/.foss-monitor-repo

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root)
     %attr(0644, root, root)              /etc/yum.repos.d/icinga2.repo
     %attr(0644, root, root)              /etc/pki/rpm-gpg/RPM-GPG-KEY-icinga
     %attr(0644, root, root)              /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo
