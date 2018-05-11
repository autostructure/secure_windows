# This class manages V-15722
# This check verifies that Windows Media DRM will be prevented from accessing the Internet.
class secure_windows::stig::v15722 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15722':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WMDRM',
      value => 'DisableOnline',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
