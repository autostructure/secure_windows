# This class manages v73607
class secure_windows::stig::v73607 (
  Boolean $enforced = false,
  Optional[Boolean] $is_dod,
  Optional[String] $classification,
) {

  if $enforced {
    if $is_dod {
      case $classification {
        'unclassified', undef: {

          #DoD_IRCA_1-to-ECA_Root_CA_2
          #DoD Root CA 2 - DoD Interoperability Root CA 1 - 22BBE981F0694D246CC1472ED2B021DC8540A22F
          #
          #DoD_IRCA_2-to-DoD_Root_CA_3
          #DoD Root CA 3 - DoD Interoperability Root CA 2 - FFAD03329B9E527A43EEC66A56F9CBB5393E6E13
          #
          #DoD_IRCA_2-to-ECA_Root_CA_4
          #DoD Root CA 4 - DoD Interoperability Root CA 2 - FCE1B1E25374DD94F5935BEB86CA643D8C8D1FF4

          file { 'c:/windows/temp/DoD_IRCA_1-to-ECA_Root_CA_2.p7b':
            ensure => 'file',
            mode   => '0660',
            owner  => 'Administrator',
            group  => 'Administrators',
            source => 'puppet:///modules/secure_windows/STIG/73607/DoD_IRCA_1-to-ECA_Root_CA_2.p7b',
            before => Sslcertificate['Install-Certificate-DoD-Root-CA-2'],
          }

          file { 'c:/windows/temp/DoD_IRCA_2-to-DoD_Root_CA_3.p7b':
            ensure => 'file',
            mode   => '0660',
            owner  => 'Administrator',
            group  => 'Administrators',
            source => 'puppet:///modules/secure_windows/STIG/v73607/DoD_IRCA_2-to-DoD_Root_CA_3.p7b',
            before => Sslcertificate['Install-Certificate-DoD-Root-CA-3'],
          }

          file { 'c:/windows/temp/DoD_IRCA_2-to-ECA_Root_CA_4.p7b':
            ensure => 'file',
            mode   => '0660',
            owner  => 'Administrator',
            group  => 'Administrators',
            source => 'puppet:///modules/secure_windows/STIG/v73607/DoD_IRCA_2-to-ECA_Root_CA_4.p7b',
            before => Sslcertificate['Install-Certificate-DoD-Root-CA-4'],
          }

          sslcertificate { 'Install-Certificate-DoD-Root-CA-2':
            name       => 'DoD_Root_CA_2.cer',
            location   => 'c:/windows/temp',
            # NOTE: 'root' means 'Trusted Root Certification Authorities'
            store_dir  => 'root',
            root_store => 'LocalMachine',
            thumbprint => '8C941B34EA1EA6ED9AE2BC54CF687252B4C9B561',
          }

          sslcertificate { 'Install-Certificate-DoD-Root-CA-3':
            name       => 'DoD_Root_CA_3.cer',
            location   => 'c:/windows/temp',
            # NOTE: 'root' means 'Trusted Root Certification Authorities'
            store_dir  => 'root',
            root_store => 'LocalMachine',
            thumbprint => 'D73CA91102A2204A36459ED32213B467D7CE97FB',
          }

          sslcertificate { 'Install-Certificate-DoD-Root-CA-4':
            name       => 'DoD_Root_CA_4.cer',
            location   => 'c:/windows/temp',
            # NOTE: 'root' means 'Trusted Root Certification Authorities'
            store_dir  => 'root',
            root_store => 'LocalMachine',
            thumbprint => 'B8269F25DBD937ECAFD4C35A9838571723F2D026',
          }
        }
        'secret', 'ts', 'sci': {}
        default:               { notice("Unknown classification ${classification} defined.") }
      }
    }
  }

}
