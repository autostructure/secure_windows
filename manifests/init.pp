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
  Optional[Boolean] $is_dod,
  Optional[String] $classification,
) {

  #include ::secure_windows::acl
  include ::secure_windows::ad_acl
  include ::secure_windows::auditpol
  include ::secure_windows::features
  #include ::secure_windows::reg_acl
  include ::secure_windows::registry_editor
  include ::secure_windows::lgpo
  include ::secure_windows::gpo
  include ::secure_windows::ftp_servers
  include ::secure_windows::ntp
  include ::secure_windows::ldap_connections

  # Platform-specific defaults
  case $facts['operatingsystemmajrelease'] {

    '2012','2012 R2': {
      # class { '::secure_windows::stig::v73605':
      #   is_dod         => $is_dod,
      #   classification => $classification,
      # }
      # class { '::secure_windows::stig::v73607':
      #   is_dod         => $is_dod,
      #   classification => $classification,
      # }
      # class { '::secure_windows::stig::v73609':
      #   is_dod         => $is_dod,
      #   classification => $classification,
      # }
    }

    '2016','2016 R2': {
      class { '::secure_windows::stig::v73239': }
      class { '::secure_windows::stig::v73309': }
      class { '::secure_windows::stig::v73247': }
      class { '::secure_windows::stig::v73257': }
      class { '::secure_windows::stig::v73259': }
      class { '::secure_windows::stig::v73261': }
      class { '::secure_windows::stig::v73263': }
      class { '::secure_windows::stig::v73605':
        is_dod         => $is_dod,
        classification => $classification,
      }
      class { '::secure_windows::stig::v73607':
        is_dod         => $is_dod,
        classification => $classification,
      }
      class { '::secure_windows::stig::v73609':
        is_dod         => $is_dod,
        classification => $classification,
      }
    }

    default: {
      fail("Unsupported operating system (${facts['whatever_osfullversionstring_is']}) detected.")
    }

  }
}
