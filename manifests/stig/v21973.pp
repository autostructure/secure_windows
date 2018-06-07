# This class manages V-21973
# Autoplay must be turned off for non-volume devices.
class secure_windows::stig::v21973 (
  Boolean $enforced = true,
) {

  if $enforced {

      registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer\NoAutoplayfornonVolume':
        ensure => present,
        type   => 'dword',
        data   => '0x00000001',
      }
    }
  }
