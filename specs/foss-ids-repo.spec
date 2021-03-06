# No debuginfo:
%define debug_package %{nil}
%define name      foss-ids-repo
%define summary   Repo for ids rpms
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
Requires:  foss-common, createrepo, centos-release-scl-rh
Requires(pre): shadow-utils
Provides:  %{name}
URL:       %{url}
Buildroot: %{buildroot}

%description
Ids repo

%prep

%install
pushd %{_srcdir}
cp -r etc root %{buildroot}

%post
touch /opt/.foss-ids-repo

if [ $1 -en 1 ];then
    # run ansible with provided inventory which could have beeen changed by the user
    /usr/bin/ansible-playbook -i /opt/ansible/inventory.yml /opt/ansible/playbooks/ids-repo.yml > /root/ansible-run-$$
fi

%postun
rm -f /opt/.foss-ids-repo

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root)
     %attr(0644, root, root)              /root/rpm/*.rpm
