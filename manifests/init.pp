#
# This module secures windows
#
# TODO:
# - LGPO
# - REGISTRY
# - GPO
# - OTHER
#

class secure_windows (
  [Optional]Boolean $is_dod,
  [Optional]String $classification,
) {

  #include ::secure_windows::acl
  #include ::secure_windows::ad_acl
  include ::secure_windows::auditpol
  include ::secure_windows::features
  include ::secure_windows::registry_editor
  include ::secure_windows::lgpo
  include ::secure_windows::gpo
  include ::secure_windows::servicing_level
  include ::secure_windows::ftp_servers
  include ::secure_windows::ntp
  include ::secure_windows::ldap_connections
  #include ::secure_windows::v73223

  # Platform-specific defaults
  case $fact['whatever_osfullversionstring_is'] {

    'Windows Server 2012','Windows Server 2012 R2': {
      class { 'secure_windows::STIG::v73605':
        is_dod         => $is_dod,
        classification => $classification,
      }
      class { 'secure_windows::STIG::v73607':
        is_dod         => $is_dod,
        classification => $classification,
      }
      class { 'secure_windows::STIG::v73609':
        is_dod         => $is_dod,
        classification => $classification,
      }
    }

    'Windows Server 2016','Windows Server 2016 R2': {
      class { 'secure_windows::STIG::v73605':
        is_dod         => $is_dod,
        classification => $classification,
      }
      class { 'secure_windows::STIG::v73607':
        is_dod         => $is_dod,
        classification => $classification,
      }
      class { 'secure_windows::STIG::v73609':
        is_dod         => $is_dod,
        classification => $classification,
      }
    }

    default: {
      fail("Unsupported operating system ($fact['whatever_osfullversionstring_is']) detected.")
    }

  }
