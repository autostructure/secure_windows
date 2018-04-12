# Class for installing security templates in support of STIGS:
# v73499, v73501, v73503, v73505
# This copies "MSS-Legacy.admx" and "MSS-Legacy.adml" to the directories:
# \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US, respectively.
#
class secure_windows::administrative_template_msslegacy_installer {

  file { 'c:\Windows\PolicyDefinitions\MSS-legacy.admx':
    ensure => 'file',
    mode   => '0660',
    group  => 'BUILTIN\\Administrators',
    source => 'puppet:///modules/secure_windows/stig/v73495/MSS-legacy.admx',
  }

  file { 'c:\Windows\PolicyDefinitions\en-US\MSS-legacy.adml':
    ensure => 'file',
    mode   => '0660',
    group  => 'BUILTIN\\Administrators',
    source => 'puppet:///modules/secure_windows/stig/v73495/MSS-legacy.adml',
  }

}
