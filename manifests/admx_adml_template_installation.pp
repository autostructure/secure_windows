# Class for installing security templates in support of STIGS:
# v73495, v73497, v73499, v73501, v73503, v73505
# This copies "MSS-Legacy.admx" and "MSS-Legacy.adml" to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.
# This copies "SecGuide.admx" and " SecGuide.adml" to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.
#
define secure_windows::admx_adml_template_installation {

  file { 'MSS-Legacy.admx':
    ensure => present
    path   => '\Windows\PolicyDefinitions\MSS-Legacy.admx',
    source => 'puppet:///modules/secure_windows/stig/v73495/MSS-Legacy.admx',
  }

}
