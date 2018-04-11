# Class for installing security templates in support of STIGS:
# v73495, v73497, v73499, v73501, v73503, v73505
# This copies "MSS-Legacy.admx" and "MSS-Legacy.adml" to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.
# This copies "SecGuide.admx" and "SecGuide.adml" to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.
#
class secure_windows::administrative_template_installation {

  #file { 'c:\Windows\PolicyDefinitions\MSS-Legacy.admx':
  #  ensure => 'file',
  #  mode   => '0660',
  #  group  => 'BUILTIN\\Administrators',
  #  source => 'https://192.168.5.62/modules/secure_windows/STIG/v73495/MSS-Legacy.admx',
  #}

  file { 'c:\Windows\PolicyDefinitions\MSS-legacy.admx':
    ensure => 'file',
    mode   => '0777',
    source => 'puppet:///modules/secure_windows/stig/v73495/MSS-legacy.admx',
  }
  #  source => 'puppet:///modules/secure_windows/MSS-Legacy.admx',

  #file { 'c:\Windows\PolicyDefinitions\en-US\MSS-Legacy.adml':
  #  ensure => 'file',
  #  mode   => '0660',
  #  group  => 'BUILTIN\\Administrators',
  #  source => 'puppet:///modules/secure_windows/STIG/v73495/MSS-Legacy.adml',
  #}

  #file { 'c:\Windows\PolicyDefinitions\SecGuide.admx':
  #  ensure => 'file',
  #  mode   => '0660',
  #  group  => 'BUILTIN\\Administrators',
  #  source => 'puppet:///modules/secure_windows/STIG/v73495/SecGuide.admx',
  #}

  #file { 'c:\Windows\PolicyDefinitions\SecGuide.adml':
  #  ensure => 'file',
  #  mode   => '0660',
  #  group  => 'BUILTIN\\Administrators',
  #  source => 'puppet:///modules/secure_windows/STIG/v73495/SecGuide.adml',
  #}

}
