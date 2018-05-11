# This class manages V-15674
# This setting prevents unhandled file associations from using the Microsoft Web service to find an application.
class secure_windows::stig::v15674 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15674':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer',
      value => 'NoInternetOpenWith',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
