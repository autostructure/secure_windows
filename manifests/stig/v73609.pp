# This class manages v73609
class secure_windows::stig::v73609 (
  Boolean $enforced = false,
  Optional[Boolean] $is_dod,
  Optional[String] $classification,
) {

  if $enforced {
    if $is_dod {
      case $classification {
        'unclassified', undef: {
          file { 'c:/windows/temp/DoD_CCEB_IRCA1-to-DoD_Root_CA_2.p7b':
            ensure => 'file',
            mode   => '0660',
            owner  => 'Administrator',
            group  => 'Administrators',
            source => 'puppet:///modules/secure_windows/STIG/v73609/DoD_CCEB_IRCA1-to-DoD_Root_CA_2.p7b',
            before => Sslcertificate['Install-Certificate-DoD-CCEB-IRCA1'],
          }
          sslcertificate { 'Install-Certificate-DoD-CCEB-IRCA1':
            name       => 'DoD_CCEB_IRCA1-to-DoD_Root_CA_2.p7b',
            location   => 'c:/windows/temp',
            # NOTE: 'disallowed' means 'Untrusted Certificates'
            store_dir  => 'disallowed',
            root_store => 'LocalMachine',
            thumbprint => 'DA36FAF56B2F6FBA1604F5BE46D864C9FA013BA3',
          }
        }
        'secret', 'ts', 'sci': {}
        default:               { notice("Unknown classification ${classification} defined.") }
      }
    }
  }

}
