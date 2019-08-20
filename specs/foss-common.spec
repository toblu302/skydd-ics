# No debuginfo:
%define debug_package %{nil}
%define name      foss-common
%define summary   Configures the boot splash to use the FOSS splash etc.
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
Requires:  grub2, grub2-tools, pwgen, ansible, iptables-services, tcpdump, net-tools
Requires(pre): shadow-utils
Provides:  %{name}
URL:       %{url}
Buildroot: %{buildroot}

%description
Configures the boot splash to use the FOSS splash. It also changes the password for the root user and installs the
ansible settings (it also runs them when it is an upgrade)
%prep

%build

%install
pushd %{_srcdir}
cp -r boot opt %{buildroot}

%post
if [ $1 -eq 1 ];then
    # install
	echo 'GRUB_BACKGROUND="/boot/splash.png"' >> /etc/default/grub
	sed -i s/GRUB_TERMINAL_OUTPUT=\"console\"/GRUB_TERMINAL_OUTPUT=\"gfxterm\"/g /etc/default/grub
	grub2-mkconfig -o /boot/grub2/grub.cfg

	# Change default kickstart root password to a random password
	pwgen -1 48 | passwd root --stdin > /dev/null
fi

touch /opt/.foss-common
# run ansible with provided inventory which could have beeen changed by the user
/usr/bin/ansible-playbook -i /opt/ansible/inventory /opt/ansible/playbooks/foss.yml

%clean
rm -rf %{buildroot}

%postun
rm -f /opt/.foss-common

%files
%defattr(-,root,root)
     %attr(0644, root, root) /boot/splash.png
%dir %attr(0755, root, root) /opt/ansible
     %attr(0644, root, root) %config(noreplace) /opt/ansible/inventory
%dir %attr(0755, root, root) /opt/ansible/playbooks
     %attr(0644, root, root) /opt/ansible/playbooks/foss.yml
     %attr(0644, root, root) /opt/ansible/playbooks/ids.yml
     %attr(0644, root, root) /opt/ansible/playbooks/ids-repo.yml
     %attr(0644, root, root) /opt/ansible/playbooks/simple_log.yml
     %attr(0644, root, root) /opt/ansible/playbooks/traffic.yml
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/common
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/common/defaults
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/common/tasks
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/common/handlers
     %attr(0644, root, root) /opt/ansible/playbooks/roles/common/handlers/main.yml
     %attr(0644, root, root) /opt/ansible/playbooks/roles/common/defaults/main.yml
     %attr(0644, root, root) /opt/ansible/playbooks/roles/common/tasks/main.yml
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/common/templates
     %attr(0644, root, root) /opt/ansible/playbooks/roles/common/templates/etc/sysconfig/iptables.j2
     %attr(0644, root, root) /opt/ansible/playbooks/roles/ids/tasks/main.yml
     %attr(0644, root, root) /opt/ansible/playbooks/roles/ids_repo/tasks/main.yml
     %attr(0644, root, root) /opt/ansible/playbooks/roles/ids_repo/files/*
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/httpd
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/httpd/templates
     %attr(0644, root, root) /opt/ansible/playbooks/roles/httpd/templates/lighttpd.conf.j2
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/httpd/tasks
     %attr(0644, root, root) /opt/ansible/playbooks/roles/httpd/tasks/main.yml
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/simple_log
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/simple_log/tasks
     %attr(0644, root, root) /opt/ansible/playbooks/roles/simple_log/tasks/main.yml
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/traffic_capture
%dir %attr(0755, root, root) /opt/ansible/playbooks/roles/traffic_capture/tasks
     %attr(0644, root, root) /opt/ansible/playbooks/roles/traffic_capture/tasks/main.yml
     %attr(0644, root, root) /opt/ansible/playbooks/httpd.yml
     %attr(0644, root, root) /opt/ansible/playbooks/monitor.yml
     %attr(0644, root, root) /opt/ansible/playbooks/roles/monitor/tasks/main.yml
