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
  # include ::secure_windows::applocker
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
      class { '::secure_windows::stig::v73239': }
      class { '::secure_windows::stig::v73247': }
      class { '::secure_windows::stig::v73257': }
      class { '::secure_windows::stig::v73259': }
      class { '::secure_windows::stig::v73261': }
      class { '::secure_windows::stig::v73263': }
      class { '::secure_windows::stig::v73287': }
      class { '::secure_windows::stig::v73289': }
      class { '::secure_windows::stig::v73291': }
      class { '::secure_windows::stig::v73293': }
      class { '::secure_windows::stig::v73295': }
      class { '::secure_windows::stig::v73297': }
      class { '::secure_windows::stig::v73299': }
      class { '::secure_windows::stig::v73301': }
      class { '::secure_windows::stig::v73303': }
      class { '::secure_windows::stig::v73305': }
      class { '::secure_windows::stig::v73309': }
      class { '::secure_windows::stig::v73311': }
      class { '::secure_windows::stig::v73313': }
      class { '::secure_windows::stig::v73315': }
      class { '::secure_windows::stig::v73317': }
      class { '::secure_windows::stig::v73319': }
      class { '::secure_windows::stig::v73321': }
      class { '::secure_windows::stig::v73323': }
      class { '::secure_windows::stig::v73325': }
      class { '::secure_windows::stig::v73359': }
      class { '::secure_windows::stig::v73361': }
      class { '::secure_windows::stig::v73363': }
      class { '::secure_windows::stig::v73365': }
      class { '::secure_windows::stig::v73413': }
      class { '::secure_windows::stig::v73415': }
      class { '::secure_windows::stig::v73417': }
      class { '::secure_windows::stig::v73419': }
      class { '::secure_windows::stig::v73421': }
      class { '::secure_windows::stig::v73423': }
      class { '::secure_windows::stig::v73425': }
      class { '::secure_windows::stig::v73427': }
      class { '::secure_windows::stig::v73429': }
      class { '::secure_windows::stig::v73431': }
      class { '::secure_windows::stig::v73433': }
      class { '::secure_windows::stig::v73435': }
      class { '::secure_windows::stig::v73437': }
      class { '::secure_windows::stig::v73439': }
      class { '::secure_windows::stig::v73441': }
      class { '::secure_windows::stig::v73443': }
      class { '::secure_windows::stig::v73445': }
      class { '::secure_windows::stig::v73447': }
      class { '::secure_windows::stig::v73449': }
      class { '::secure_windows::stig::v73451': }
      class { '::secure_windows::stig::v73453': }
      class { '::secure_windows::stig::v73455': }
      class { '::secure_windows::stig::v73457': }
      class { '::secure_windows::stig::v73459': }
      class { '::secure_windows::stig::v73461': }
      class { '::secure_windows::stig::v73463': }
      class { '::secure_windows::stig::v73465': }
      class { '::secure_windows::stig::v73467': }
      class { '::secure_windows::stig::v73469': }
      class { '::secure_windows::stig::v73471': }
      class { '::secure_windows::stig::v73473': }
      class { '::secure_windows::stig::v73475': }
      class { '::secure_windows::stig::v73477': }
      class { '::secure_windows::stig::v73479': }
      class { '::secure_windows::stig::v73481': }
      class { '::secure_windows::stig::v73483': }
      class { '::secure_windows::stig::v73485': }
      class { '::secure_windows::stig::v73489': }
      class { '::secure_windows::stig::v73491': }
      class { '::secure_windows::stig::v73623': }
      class { '::secure_windows::stig::v73625': }
      class { '::secure_windows::stig::v73665': }
      class { '::secure_windows::stig::v73689': }

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
      fail("Unsupported operating system (${facts['operatingsystemmajrelease']}) detected.")
    }

  }
}
