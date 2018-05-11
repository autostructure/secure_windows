# This class manages V-36697
# Trusted app installation must be enabled to allow for signed enterprise line of business apps.
class secure_windows::stig::v36697 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v36697':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Appx',
      value => 'AllowAllTrustedApps',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
