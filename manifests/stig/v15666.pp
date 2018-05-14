#This class manages V-15666
#Windows Peer-to-Peer networking services must be turned off.
class secure_windows::stig::v15666 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v15666':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Peernet',
      value => 'Disabled',
      type  => 'dword',
      data  => '1',
    }

  }

}
