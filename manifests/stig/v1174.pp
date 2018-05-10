#This class manages V-1174
#The amount of idle time required before suspending a session must be properly set.
class secure_windows::stig::v1174 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v1174':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
      value => 'autodisconnect',
      type  => 'dword',
      data  => '0x0000000f',
    }

  }

}
