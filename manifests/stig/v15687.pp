# This class manages V-15687
# This setting prevents users from being presented with Privacy and Installation options on first use of Windows Media Player,
# which could enable some communication with the vendor (sending system information or downloading data or components for the feature).
class secure_windows::stig::v15687 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15687':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsMediaPlayer',
      value => 'GroupPrivacyAcceptance',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
