# This class manages V-21973
# Autoplay must be turned off for non-volume devices.
class secure_windows::stig::v21973 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21973':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer',
      value => 'NoAutoplayfornonVolume',
      type  => 'dword',
      data  => '1',
    }

  }
}
