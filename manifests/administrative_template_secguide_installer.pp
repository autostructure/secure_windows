# Class for installing security templates in support of STIGS:
# v73495, v73497
# This copies "SecGuide.admx" and "SecGuide.adml" to the directories:
# \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US, respectively.
#
class secure_windows::administrative_template_secguide_installer {

  file { 'c:\Windows\PolicyDefinitions\SecGuide.admx':
    ensure => 'file',
    mode   => '0660',
    group  => 'BUILTIN\\Administrators',
    source => 'puppet:///modules/secure_windows/stig/v73499/SecGuide.admx',
  }

  file { 'c:\Windows\PolicyDefinitions\SecGuide.adml':
    ensure => 'file',
    mode   => '0660',
    group  => 'BUILTIN\\Administrators',
    source => 'puppet:///modules/secure_windows/stig/v73499/SecGuide.adml',
  }

}
