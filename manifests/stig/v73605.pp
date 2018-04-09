# This class manages v73605
class secure_windows::stig::v73605 (

  Boolean $enforced = false,
  Optional[Boolean] $is_dod,
  Optional[String] $classification,
) {

  if $enforced {
    if $is_dod {

      file { 'c:/windows/temp/DoD_Root_CA_2.cer':
        ensure => 'file',
        mode   => '0660',
        group  => 'BUILTIN\\Administrators',
        source => 'puppet:///modules/secure_windows/STIG/v73605/DoD_Root_CA_2.cer',
        before => Sslcertificate['Install-Certificate-DoD-Root-CA-2'],
      }

      file { 'c:/windows/temp/DoD_Root_CA_3.cer':
        ensure => 'file',
        mode   => '0660',
        group  => 'BUILTIN\\Administrators',
        source => 'puppet:///modules/secure_windows/STIG/v73605/DoD_Root_CA_3.cer',
        before => Sslcertificate['Install-Certificate-DoD-Root-CA-3'],
      }

      file { 'c:/windows/temp/DoD_Root_CA_4.cer':
        ensure => 'file',
        mode   => '0660',
        group  => 'BUILTIN\\Administrators',
        source => 'puppet:///modules/secure_windows/STIG/v73605/DoD_Root_CA_4.cer',
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
  }

}
