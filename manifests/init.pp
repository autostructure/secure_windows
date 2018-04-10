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
  include ::secure_windows::lgpo
  # include ::secure_windows::applocker
  include ::secure_windows::features
  #include ::secure_windows::reg_acl
  include ::secure_windows::registry_editor
  include ::secure_windows::lgpo

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
      class { '::secure_windows::stig::v73223': }
      class { '::secure_windows::stig::v73239': }
      class { '::secure_windows::stig::v73247': }
      class { '::secure_windows::stig::v73257': }
      class { '::secure_windows::stig::v73259': }
      class { '::secure_windows::stig::v73261': }
      class { '::secure_windows::stig::v73263': }
      class { '::secure_windows::stig::v73303': }
      class { '::secure_windows::stig::v73305': }
      class { '::secure_windows::stig::v73309': }
      class { '::secure_windows::stig::v73359': }
      class { '::secure_windows::stig::v73361': }
      class { '::secure_windows::stig::v73363': }
      class { '::secure_windows::stig::v73365': }
      class { '::secure_windows::stig::v73387': }
      class { '::secure_windows::stig::v73487': }
      class { '::secure_windows::stig::v73493': }
      class { '::secure_windows::stig::v73495': }
      class { '::secure_windows::stig::v73497': }
      class { '::secure_windows::stig::v73499': }
      class { '::secure_windows::stig::v73501': }
      class { '::secure_windows::stig::v73503': }
      class { '::secure_windows::stig::v73505': }
      class { '::secure_windows::stig::v73507': }
      class { '::secure_windows::stig::v73509': }
      class { '::secure_windows::stig::v73511': }
      class { '::secure_windows::stig::v73513': }
      class { '::secure_windows::stig::v73515': }
      class { '::secure_windows::stig::v73517': }
      class { '::secure_windows::stig::v73521': }
      class { '::secure_windows::stig::v73525': }
      class { '::secure_windows::stig::v73527': }
      class { '::secure_windows::stig::v73529': }
      class { '::secure_windows::stig::v73531': }
      class { '::secure_windows::stig::v73533': }
      class { '::secure_windows::stig::v73535': }
      class { '::secure_windows::stig::v73537': }
      class { '::secure_windows::stig::v73539': }
      class { '::secure_windows::stig::v73541': }
      class { '::secure_windows::stig::v73543': }
      class { '::secure_windows::stig::v73545': }
      class { '::secure_windows::stig::v73547': }
      class { '::secure_windows::stig::v73549': }
      class { '::secure_windows::stig::v73551': }
      class { '::secure_windows::stig::v73553': }
      class { '::secure_windows::stig::v73555': }
      class { '::secure_windows::stig::v73557': }
      class { '::secure_windows::stig::v73559': }
      class { '::secure_windows::stig::v73561': }
      class { '::secure_windows::stig::v73563': }
      class { '::secure_windows::stig::v73565': }
      class { '::secure_windows::stig::v73567': }
      class { '::secure_windows::stig::v73569': }
      class { '::secure_windows::stig::v73571': }
      class { '::secure_windows::stig::v73573': }
      class { '::secure_windows::stig::v73575': }
      class { '::secure_windows::stig::v73577': }
      class { '::secure_windows::stig::v73579': }

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
