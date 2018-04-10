# V-73545
# AutoPlay must be turned off for non-volume devices.
class secure_windows::stig::v73545 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73545':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
      value => 'NoAutoplayfornonVolume',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
