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
      class { '::secure_windows::stig::v73387': }
      class { '::secure_windows::stig::v73487': }
      class { '::secure_windows::stig::v73489': }
      class { '::secure_windows::stig::v73491': }
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
      class { '::secure_windows::stig::v73581': }
      class { '::secure_windows::stig::v73583': }
      class { '::secure_windows::stig::v73623': }
      class { '::secure_windows::stig::v73625': }
      class { '::secure_windows::stig::v73665': }
      class { '::secure_windows::stig::v73689': }
      class { '::secure_windows::stig::v73729': }
      class { '::secure_windows::stig::v73731': }
      class { '::secure_windows::stig::v73733': }
      class { '::secure_windows::stig::v73735': }
      class { '::secure_windows::stig::v73737': }
      class { '::secure_windows::stig::v73739': }
      class { '::secure_windows::stig::v73741': }
      class { '::secure_windows::stig::v73743': }
      class { '::secure_windows::stig::v73745': }
      class { '::secure_windows::stig::v73747': }
      class { '::secure_windows::stig::v73749': }
      class { '::secure_windows::stig::v73751': }
      class { '::secure_windows::stig::v73753': }
      class { '::secure_windows::stig::v73755': }
      class { '::secure_windows::stig::v73757': }
      class { '::secure_windows::stig::v73759': }
      class { '::secure_windows::stig::v73761': }
      class { '::secure_windows::stig::v73763': }
      class { '::secure_windows::stig::v73765': }
      class { '::secure_windows::stig::v73767': }
      class { '::secure_windows::stig::v73769': }
      class { '::secure_windows::stig::v73771': }
      class { '::secure_windows::stig::v73773': }
      class { '::secure_windows::stig::v73775': }
      class { '::secure_windows::stig::v73777': }
      class { '::secure_windows::stig::v73779': }
      class { '::secure_windows::stig::v73781': }
      class { '::secure_windows::stig::v73783': }
      class { '::secure_windows::stig::v73785': }
      class { '::secure_windows::stig::v73787': }
      class { '::secure_windows::stig::v73789': }
      class { '::secure_windows::stig::v73791': }
      class { '::secure_windows::stig::v73793': }
      class { '::secure_windows::stig::v73795': }
      class { '::secure_windows::stig::v73797': }
      class { '::secure_windows::stig::v73799': }
      class { '::secure_windows::stig::v73801': }
      class { '::secure_windows::stig::v73803': }
      class { '::secure_windows::stig::v73809': }

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
