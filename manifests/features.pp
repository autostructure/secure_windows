# secure_windows::features
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_windows::features
class secure_windows::features {
  $features_to_remove = [
    'fax',
    'web-ftp-service',
    'pnrp',
    'simple-tcpip',
    'telnet-client',
    'tftp-client',
    'fs-smb1',
    'powershell-v2',
  ]

  windowsfeature { $features_to_remove:
    ensure => absent,
  }
}
