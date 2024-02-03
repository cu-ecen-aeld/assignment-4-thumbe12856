
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = '06f1f0072ab4053e967d0652cf1a3eac8a5163e0'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-thumbe12856.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# Add writer, finder and finder-test utilities/scripts to the installation steps.
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder* $(TARGET_DIR)/usr/bin/
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/root/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/root/conf/
	mkdir -p $(TARGET_DIR)/root/.ssh/
	$(INSTALL) -m 0755 $(TARGET_DIR)/../../../conf/authorized_keys $(TARGET_DIR)/root/.ssh/
endef

$(eval $(generic-package))
