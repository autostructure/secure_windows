#This class manages V-16000
#The system must be configured to ensure smart card devices can be redirected to the Remote Desktop session. (Remote Desktop Services Role).
class secure_windows::stig::v16000 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v16000':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'fEnableSmartCard',
      type  => 'dword',
      data  => '1',
    }

  }

}
