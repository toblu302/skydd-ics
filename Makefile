PWD = $(shell pwd)
BUILDDIR = $(PWD)/foss-build
BUILDNUMBER = $(shell date +%s)

all: docs common httpd simplelog dump foss-icinga-repo monitor ids ids-repo
#all: docs common httpd simplelog dump ids foss-icinga-repo monitor
#	cd image && ./download_packages.sh
#	cd image && ./create_iso.sh

docs:
	@cd ${PWD}/docs && make
	@cd ${PWD}
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-docs
	@mkdir -p $(BUILDDIR)/foss-docs/var/www/html/foss/doc
	@mkdir -p $(BUILDDIR)/foss-docs/etc/skel/Desktop
	@cp -rp	docs/bok.html $(BUILDDIR)/foss-docs/var/www/html/foss/doc/index.html
	@cp -rp	docs/css $(BUILDDIR)/foss-docs/var/www/html/foss/doc/
	@cp -rp	docs/images $(BUILDDIR)/foss-docs/var/www/html/foss/doc
	@cp -rp docs/bok.pdf $(BUILDDIR)/foss-docs/etc/skel/Desktop/Dokumentation.pdf
	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-docs" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-docs.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

common:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-common
	@mkdir -p $(BUILDDIR)/foss-common/boot
	@mkdir -p $(BUILDDIR)/foss-common/opt/
	@cp image/isolinux/splash.png $(BUILDDIR)/foss-common/boot/
	@cp -r files/ansible $(BUILDDIR)/foss-common/opt/
	@cp files/httpd/foss_httpd.* $(BUILDDIR)/foss-common/
	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-common" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-common.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

httpd:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-httpd
	@mkdir -p $(BUILDDIR)/foss-httpd/etc/httpd/conf.d/
	@mkdir -p $(BUILDDIR)/foss-httpd/var/www/html/js
	@mkdir -p $(BUILDDIR)/foss-httpd/var/www/html/css
	@mkdir -p $(BUILDDIR)/foss-httpd/var/www/html/assets
	@mkdir -p $(BUILDDIR)/foss-httpd/var/www/html/status/cgi
	@mkdir -p $(BUILDDIR)/foss-httpd/var/www/html/status/js
	@cp files/httpd/main.css $(BUILDDIR)/foss-httpd/var/www/html/css/
	@cp files/httpd/*.cgi $(BUILDDIR)/foss-httpd/var/www/html/status/cgi/
	@cp files/httpd/jquery.js $(BUILDDIR)/foss-httpd/var/www/html/js/
	@cp files/httpd/services.js $(BUILDDIR)/foss-httpd/var/www/html/status/js/
	@cp files/httpd/*.html $(BUILDDIR)/foss-httpd/var/www/html/status/
	@cp files/httpd/*.svg $(BUILDDIR)/foss-httpd/var/www/html/assets/
	@cp files/httpd/foss_httpd.fc $(BUILDDIR)/foss-httpd/
	@cp files/httpd/foss_httpd.te $(BUILDDIR)/foss-httpd/
	@cp files/httpd/foss-default.conf $(BUILDDIR)/foss-httpd/etc/httpd/conf.d/
	@cp files/httpd/jquery.js $(BUILDDIR)/foss-httpd/var/www/html/js/
	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-httpd" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-httpd.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

simplelog:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-simplelog
	@mkdir -p $(BUILDDIR)/foss-simplelog/etc/rsyslog.d
	@mkdir -p $(BUILDDIR)/foss-simplelog/etc/logrotate.d
	@mkdir -p $(BUILDDIR)/foss-simplelog/etc/skel/Desktop
	@mkdir -p $(BUILDDIR)/foss-simplelog/etc/xdg/autostart
	@mkdir -p $(BUILDDIR)/foss-simplelog/usr/share/selinux/packages/foss-simple-log
	@mkdir -p $(BUILDDIR)/foss-simplelog/var/www/html/log
	@touch $(BUILDDIR)/foss-simplelog/var/www/html/log/searching.json
	@mkdir -p $(BUILDDIR)/foss-simplelog/var/log
	@touch $(BUILDDIR)/foss-simplelog/var/log/incoming
	@cp files/simple_log_server/rsyslog.conf $(BUILDDIR)/foss-simplelog/etc/rsyslog.d/foss.conf
	@cp files/simple_log_server/logrotate.syslog $(BUILDDIR)/foss-simplelog/etc/logrotate.d/syslog.foss
	@cp -rp	files/simple_log_server/log $(BUILDDIR)/foss-simplelog/var/www/html/
	@cp files/simple_log_server/"Länk till loggvy.desktop" $(BUILDDIR)/foss-simplelog/etc/skel/Desktop/
	@cp files/simple_log_server/firefox.desktop $(BUILDDIR)/foss-simplelog/etc/skel/Desktop/firefox_log.desktop
	@cp files/simple_log_server/firefox_autostart.desktop $(BUILDDIR)/foss-simplelog/etc/xdg/autostart/firefox_log_autostart.desktop
	@cp files/simple_log_server/logger.* $(BUILDDIR)/foss-simplelog/
	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-simplelog" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-simple-log-server.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

dump:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-dump
	@mkdir -p $(BUILDDIR)/foss-dump/opt
	@mkdir -p $(BUILDDIR)/foss-dump/home/tcpdump
	@mkdir -p $(BUILDDIR)/foss-dump/etc/sysctl.d
	@mkdir -p $(BUILDDIR)/foss-dump/etc/skel/Desktop
	@mkdir -p $(BUILDDIR)/foss-dump/etc/xdg/autostart
	@mkdir -p $(BUILDDIR)/foss-dump/usr/share/selinux/packages/foss-traffic-capture
	@mkdir -p $(BUILDDIR)/foss-dump/var/www/html/dump
	@touch $(BUILDDIR)/foss-dump/var/www/html/dump/searching.json
	@mkdir -p $(BUILDDIR)/foss-dump/var/www/html/dump/cgi
	@mkdir -p $(BUILDDIR)/foss-dump/var/www/html/dump/js
	@mkdir -p $(BUILDDIR)/foss-dump/var/www/html/dump/css
	@mkdir -p $(BUILDDIR)/foss-dump/var/www/html/dump/unpacked
	@mkdir -p $(BUILDDIR)/foss-dump/etc/systemd/system/
	@mkdir -p $(BUILDDIR)/foss-dump/etc/NetworkManager/dispatcher.d/
	@cp files/dump_server/reaper.py $(BUILDDIR)/foss-dump/opt/
	@cp files/dump_server/chaosreader $(BUILDDIR)/foss-dump/opt/
	@cp -rp	files/dump_server/*.svg $(BUILDDIR)/foss-dump/var/www/html/dump/
	@cp -rp	files/dump_server/*.cgi $(BUILDDIR)/foss-dump/var/www/html/dump/cgi/
	@cp -rp	files/dump_server/*.js $(BUILDDIR)/foss-dump/var/www/html/dump/js/
	@cp -rp	files/dump_server/*.css $(BUILDDIR)/foss-dump/var/www/html/dump/css
	@cp -rp	files/dump_server/*.html $(BUILDDIR)/foss-dump/var/www/html/dump/
	@cp files/dump_server/"Länk till trafikvy.desktop" $(BUILDDIR)/foss-dump/etc/skel/Desktop/
	@cp files/dump_server/firefox.desktop $(BUILDDIR)/foss-dump/etc/skel/Desktop/
	@cp files/dump_server/firefox_autostart.desktop $(BUILDDIR)/foss-dump/etc/xdg/autostart/
	@cp files/dump_server/*.te $(BUILDDIR)/foss-dump
	@cp files/dump_server/sysctl.conf $(BUILDDIR)/foss-dump/etc/sysctl.d/88-inspelningsserver.conf
	@cp files/dump_server/*.service $(BUILDDIR)/foss-dump/etc/systemd/system/
	@cp files/dump_server/99-tcpdump $(BUILDDIR)/foss-dump/etc/NetworkManager/dispatcher.d/

	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-dump" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-traffic-capture-server.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

ids-repo:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-ids-repo
	@mkdir -p $(BUILDDIR)/foss-ids-repo/etc/yum.repos.d
	@mkdir -p $(BUILDDIR)/foss-ids-repo/root/rpm
	@cp files/ids/*.repo $(BUILDDIR)/foss-ids-repo/etc/yum.repos.d/
	@cp files/ids/*.rpm $(BUILDDIR)/foss-ids-repo/root/rpm/

	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-ids-repo" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-ids-repo.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

ids:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-ids
	@mkdir -p $(BUILDDIR)/foss-ids/root
	@mkdir -p $(BUILDDIR)/foss-ids/usr/local/bin
	@mkdir -p $(BUILDDIR)/foss-ids/etc/httpd/conf.d/
	@mkdir -p $(BUILDDIR)/foss-ids/etc/snort/rules
	@mkdir -p $(BUILDDIR)/foss-ids/etc/sysctl.d
	@mkdir -p $(BUILDDIR)/foss-ids/etc/yum.repos.d/
	@mkdir -p $(BUILDDIR)/foss-ids/etc/skel/Desktop
	@mkdir -p $(BUILDDIR)/foss-ids/etc/xdg/autostart
	@mkdir -p $(BUILDDIR)/foss-ids/usr/share/selinux/packages/foss-ids
	@mkdir -p $(BUILDDIR)/foss-ids/etc/systemd/system/
	@mkdir -p $(BUILDDIR)/foss-ids/etc/NetworkManager/dispatcher.d/
	@mkdir -p $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/etc/httpd/conf.d/
	@mkdir -p $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/etc/httpd/conf
	@mkdir -p $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html

	@cp files/ids/L*Snorby.desktop $(BUILDDIR)/foss-ids/etc/skel/Desktop/
	@cp files/ids/firefox.desktop $(BUILDDIR)/foss-ids/etc/skel/Desktop/firefox_ids.desktop
	@cp files/ids/firefox_autostart.desktop $(BUILDDIR)/foss-ids/etc/xdg/autostart/firefox_ids_autostart.desktop
	@cp files/ids/*.te $(BUILDDIR)/foss-ids
	@cp files/ids/foss-ids.conf $(BUILDDIR)/foss-ids/etc/httpd/conf.d/
	@cp files/ids/sysctl.conf $(BUILDDIR)/foss-ids/etc/sysctl.d/88-ids.conf
	@cp files/ids/99-snort $(BUILDDIR)/foss-ids/etc/NetworkManager/dispatcher.d/
	@cp files/ids/*.service $(BUILDDIR)/foss-ids/etc/systemd/system/

	@cp files/ids/snort.conf $(BUILDDIR)/foss-ids/etc/snort/foss_snort.conf
	@cp files/ids/local.rules $(BUILDDIR)/foss-ids/etc/snort/rules/
	@cp files/ids/fossdemo.rules $(BUILDDIR)/foss-ids/etc/snort/rules/
	@tar xzf files/ids/community.tar.gz -C $(BUILDDIR)/foss-ids/etc/snort/rules/
	@cp -r files/ids/quickdraw $(BUILDDIR)/foss-ids/etc/snort/rules/
	@touch $(BUILDDIR)/foss-ids/etc/snort/white_list.rules
	@touch $(BUILDDIR)/foss-ids/etc/snort/black_list.rules
	@cp files/ids/sid-msg.map $(BUILDDIR)/foss-ids/etc/snort/rules/
	@cp files/ids/create-sidmap.pl $(BUILDDIR)/foss-ids/usr/local/bin/
	@cp files/ids/barnyard2 $(BUILDDIR)/foss-ids/usr/local/bin/
	@cp files/ids/snorby.conf $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/etc/httpd/conf.d/snorby.conf
	@unzip -qq -d $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html/ files/ids/paket/snorby-master-git-20151111.zip
	@mv $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html/snorby-master $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html/snorby
	@cp files/ids/snorby-st*  $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html/snorby/
	@cp files/ids/Gemfile*  $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html/snorby/
	@tar xzpf files/ids/vendor-bundle.tgz -C $(BUILDDIR)/foss-ids/opt/rh/httpd24/root/var/www/html/snorby/

	@cp files/ids/maria_secure_installation.sh $(BUILDDIR)/foss-ids/root/
	@cp files/ids/barn_snor.sh $(BUILDDIR)/foss-ids/root/
	@cp files/ids/snort.db $(BUILDDIR)/foss-ids/root/
	@cp files/ids/barnyard2.conf.template $(BUILDDIR)/foss-ids/root/
	@cp files/ids/database.yml $(BUILDDIR)/foss-ids/root/
	@cp files/ids/snorby_config.yml $(BUILDDIR)/foss-ids/root/

	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-ids" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-ids.spec
	@find $(PWD)/rpmbuild/RPMS/ -name \*.rpm -exec mv "{}" $(PWD)/rpms \;

foss-icinga-repo:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-icinga-repo
	@mkdir -p $(BUILDDIR)/foss-icinga-repo/etc/yum.repos.d
	@mkdir -p $(BUILDDIR)/foss-icinga-repo/etc/pki/rpm-gpg
	@cp files/monitor_server/icinga2.repo $(BUILDDIR)/foss-icinga-repo/etc/yum.repos.d/
	@cp files/monitor_server/RPM-GPG-KEY-icinga $(BUILDDIR)/foss-icinga-repo/etc/pki/rpm-gpg
	@cp files/monitor_server/RPM-GPG-KEY-CentOS-SIG-SCLo $(BUILDDIR)/foss-icinga-repo/etc/pki/rpm-gpg

	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-icinga-repo" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-icinga-repo.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

monitor:
	@mkdir -p $(PWD)/rpmbuild
	@mkdir -p $(PWD)/rpms
	@mkdir -p $(BUILDDIR)/foss-monitor
	@mkdir -p $(BUILDDIR)/foss-monitor/root
	@mkdir -p $(BUILDDIR)/foss-monitor/etc/skel/Desktop
	@mkdir -p $(BUILDDIR)/foss-monitor/etc/xdg/autostart
	@mkdir -p $(BUILDDIR)/foss-monitor/etc/sudoers.d
	@mkdir -p $(BUILDDIR)/foss-monitor/etc/icinga2/scripts
	@mkdir -p $(BUILDDIR)/foss-monitor/etc/icinga2/conf.d
	@mkdir -p $(BUILDDIR)/foss-monitor/usr/share/selinux/packages/foss-monitor
	@mkdir -p $(BUILDDIR)/foss-monitor/etc/systemd/system/

	@cp files/monitor_server/L*Icinga.desktop $(BUILDDIR)/foss-monitor/etc/skel/Desktop/
	@cp files/monitor_server/firefox.desktop $(BUILDDIR)/foss-monitor/etc/skel/Desktop/firefox_monitor.desktop
	@cp files/monitor_server/firefox_autostart.desktop $(BUILDDIR)/foss-monitor/etc/xdg/autostart/firefox_monitor_autostart.desktop
	@cp files/monitor_server/*.te $(BUILDDIR)/foss-monitor
	@cp files/monitor_server/*.fc $(BUILDDIR)/foss-monitor
	@cp files/monitor_server/first-boot.service $(BUILDDIR)/foss-monitor/etc/systemd/system/
	@cp files/monitor_server/init_pg.sh $(BUILDDIR)/foss-monitor/root/
	@cp files/monitor_server/foss_notty $(BUILDDIR)/foss-monitor/etc/sudoers.d/
	@cp files/monitor_server/beepsend.pl $(BUILDDIR)/foss-monitor/etc/icinga2/scripts/
	@cp files/monitor_server/sms-notification.sh $(BUILDDIR)/foss-monitor/etc/icinga2/scripts/
	@cp files/monitor_server/templates.conf $(BUILDDIR)/foss-monitor/etc/icinga2/conf.d/foss-templates.conf
	@cp files/monitor_server/commands.conf $(BUILDDIR)/foss-monitor/etc/icinga2/conf.d/foss-commands.conf
	@cp files/monitor_server/notifications.conf $(BUILDDIR)/foss-monitor/etc/icinga2/conf.d/foss-notifications.conf

	@rpmbuild --quiet -bb \
		--define "_topdir $(PWD)/rpmbuild" \
		--define "_srcdir $(BUILDDIR)/foss-monitor" \
		--define "_buildtag $(BUILDNUMBER)" \
	    specs/foss-monitor-server.spec
	@mv $(PWD)/rpmbuild/RPMS/noarch/foss-*.noarch.rpm rpms

clean:
	rm -rf $(BUILDDIR)
	rm -rf $(PWD)/rpmbuild
	rm -rf $(PWD)/rpms

.PHONY: docs common httpd simplelog dump ids foss-icinga-repo monitor
