# This class manages V-36710
# Automatic download of updates from the Windows Store must be turned off.
class secure_windows::stig::v36710 (
  Boolean $enforced = true,
) {
  if $enforced {
    case $facts['operatingsystemmajrelease'] {
      '2012 R2': {
        registry::value { 'v36710':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore',
          value => 'AutoDownload',
          type  => 'dword',
          data  => '0x00000002',
        }
      }
      '2012': {
        registry::value { 'v36710':
          key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore\WindowsUpdate',
          value => 'AutoDownload',
          type  => 'dword',
          data  => '0x00000002',
        }
      }
      default: {
        fail('Unsupported OS for secure_windows::stig::v36710')
      }
    }
  }
}
