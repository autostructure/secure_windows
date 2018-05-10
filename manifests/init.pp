#
# This module secures windows
#
class secure_windows (
  Optional[Boolean] $is_dod,
  Optional[String] $classification,
) {

  # Platform-specific defaults
  case $facts['operatingsystemmajrelease'] {

    '2012','2012 R2': {
      class { '::secure_windows::stig::v1073': }
      class { '::secure_windows::stig::v1075': }
      class { '::secure_windows::stig::v1081': }
      class { '::secure_windows::stig::v1089': }
      class { '::secure_windows::stig::v1093': }
      class { '::secure_windows::stig::v1097': }
      class { '::secure_windows::stig::v1098': }
      class { '::secure_windows::stig::v1099': }
      class { '::secure_windows::stig::v1102': }
      class { '::secure_windows::stig::v1104': }
      class { '::secure_windows::stig::v1105': }
      class { '::secure_windows::stig::v1107': }
      class { '::secure_windows::stig::v1112': }
      class { '::secure_windows::stig::v1113': }
      class { '::secure_windows::stig::v1114': }
      class { '::secure_windows::stig::v1115': }
      class { '::secure_windows::stig::v1136': }
      class { '::secure_windows::stig::v1141': }
      class { '::secure_windows::stig::v1145': }
      class { '::secure_windows::stig::v1150': }
      class { '::secure_windows::stig::v1152': }
      class { '::secure_windows::stig::v1154': }
      class { '::secure_windows::stig::v1155': }
      # class { '::secure_windows::stig::v36712': }
      # class { '::secure_windows::stig::v36713': }
      # class { '::secure_windows::stig::v36714': }
      # class { '::secure_windows::stig::v36718': }
      # class { '::secure_windows::stig::v36719': }
      # class { '::secure_windows::stig::v36720': }
      # class { '::secure_windows::stig::v36722': }
      # class { '::secure_windows::stig::v36773': }
      # class { '::secure_windows::stig::v36776': }
      # class { '::secure_windows::stig::v36777': }
      # class { '::secure_windows::stig::v39333': }
      # class { '::secure_windows::stig::v39334': }
      # class { '::secure_windows::stig::v40177': }
      # class { '::secure_windows::stig::v40178': }
      # class { '::secure_windows::stig::v40179': }
      # class { '::secure_windows::stig::v40200': }
      # class { '::secure_windows::stig::v40204': }
      # class { '::secure_windows::stig::v40206': }
      # class { '::secure_windows::stig::v42420': }
      # class { '::secure_windows::stig::v43238': }
      # class { '::secure_windows::stig::v43239': }
      # class { '::secure_windows::stig::v43240': }
      # class { '::secure_windows::stig::v43241': }
      # class { '::secure_windows::stig::v43245': }
      # class { '::secure_windows::stig::v57633': }
      # class { '::secure_windows::stig::v57637': }
      # class { '::secure_windows::stig::v57639': }
      # class { '::secure_windows::stig::v57721': }
      # class { '::secure_windows::stig::v73805': }
      # class { '::secure_windows::stig::v78057': }
      # class { '::secure_windows::stig::v78061': }
    }

    '2016','2016 R2': {
      class { '::secure_windows::stig::v73223': }
      class { '::secure_windows::stig::v73225': }
      class { '::secure_windows::stig::v73235': }
      class { '::secure_windows::stig::v73237': }
      class { '::secure_windows::stig::v73239': }
      class { '::secure_windows::stig::v73247': }
      class { '::secure_windows::stig::v73249': }
      class { '::secure_windows::stig::v73251': }
      class { '::secure_windows::stig::v73253': }
      class { '::secure_windows::stig::v73255': }
      class { '::secure_windows::stig::v73257': }
      class { '::secure_windows::stig::v73259': }
      class { '::secure_windows::stig::v73261': }
      class { '::secure_windows::stig::v73263': }
      class { '::secure_windows::stig::v73279': }
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
      class { '::secure_windows::stig::v73369': }
      class { '::secure_windows::stig::v73371': }
      class { '::secure_windows::stig::v73373': }
      class { '::secure_windows::stig::v73375': }
      class { '::secure_windows::stig::v73377': }
      class { '::secure_windows::stig::v73379': }
      class { '::secure_windows::stig::v73387': }
      class { '::secure_windows::stig::v73389': }
      class { '::secure_windows::stig::v73391': }
      class { '::secure_windows::stig::v73393': }
      class { '::secure_windows::stig::v73395': }
      class { '::secure_windows::stig::v73397': }
      class { '::secure_windows::stig::v73399': }
      class { '::secure_windows::stig::v73405': }
      class { '::secure_windows::stig::v73407': }
      class { '::secure_windows::stig::v73409': }
      class { '::secure_windows::stig::v73411': }
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
      class { '::secure_windows::stig::v73585': }
      class { '::secure_windows::stig::v73587': }
      class { '::secure_windows::stig::v73589': }
      class { '::secure_windows::stig::v73591': }
      class { '::secure_windows::stig::v73593': }
      class { '::secure_windows::stig::v73595': }
      class { '::secure_windows::stig::v73597': }
      class { '::secure_windows::stig::v73599': }
      class { '::secure_windows::stig::v73601': }
      class { '::secure_windows::stig::v73603': }
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
      class { '::secure_windows::stig::v73611': }
      class { '::secure_windows::stig::v73621': }
      class { '::secure_windows::stig::v73623': }
      class { '::secure_windows::stig::v73625': }
      class { '::secure_windows::stig::v73627': }
      class { '::secure_windows::stig::v73629': }
      class { '::secure_windows::stig::v73631': }
      class { '::secure_windows::stig::v73633': }
      class { '::secure_windows::stig::v73635': }
      class { '::secure_windows::stig::v73637': }
      class { '::secure_windows::stig::v73639': }
      class { '::secure_windows::stig::v73641': }
      class { '::secure_windows::stig::v73643': }
      class { '::secure_windows::stig::v73645': }
      class { '::secure_windows::stig::v73647': }
      class { '::secure_windows::stig::v73649': }
      class { '::secure_windows::stig::v73651': }
      class { '::secure_windows::stig::v73653': }
      class { '::secure_windows::stig::v73655': }
      class { '::secure_windows::stig::v73657': }
      class { '::secure_windows::stig::v73659': }
      class { '::secure_windows::stig::v73661': }
      class { '::secure_windows::stig::v73663': }
      class { '::secure_windows::stig::v73665': }
      class { '::secure_windows::stig::v73667': }
      class { '::secure_windows::stig::v73669': }
      class { '::secure_windows::stig::v73671': }
      class { '::secure_windows::stig::v73673': }
      class { '::secure_windows::stig::v73675': }
      class { '::secure_windows::stig::v73677': }
      class { '::secure_windows::stig::v73679': }
      class { '::secure_windows::stig::v73681': }
      class { '::secure_windows::stig::v73683': }
      class { '::secure_windows::stig::v73685': }
      class { '::secure_windows::stig::v73687': }
      class { '::secure_windows::stig::v73689': }
      class { '::secure_windows::stig::v73691': }
      class { '::secure_windows::stig::v73693': }
      class { '::secure_windows::stig::v73695': }
      class { '::secure_windows::stig::v73697': }
      class { '::secure_windows::stig::v73699': }
      class { '::secure_windows::stig::v73701': }
      class { '::secure_windows::stig::v73703': }
      class { '::secure_windows::stig::v73705': }
      class { '::secure_windows::stig::v73707': }
      class { '::secure_windows::stig::v73709': }
      class { '::secure_windows::stig::v73711': }
      class { '::secure_windows::stig::v73713': }
      class { '::secure_windows::stig::v73715': }
      class { '::secure_windows::stig::v73717': }
      class { '::secure_windows::stig::v73719': }
      class { '::secure_windows::stig::v73721': }
      class { '::secure_windows::stig::v73723': }
      class { '::secure_windows::stig::v73725': }
      class { '::secure_windows::stig::v73727': }
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
      class { '::secure_windows::stig::v73807': }
      class { '::secure_windows::stig::v73809': }

    }

    default: {
      fail("Unsupported operating system (${facts['operatingsystemmajrelease']}) detected.")
    }

  }
}
