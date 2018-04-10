# V-73659
# The amount of idle time required before suspending a session must be configured to 15 minutes or less.
class secure_windows::stig::v73659 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73659':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
      value => 'autodisconnect',
      type  => 'dword',
      data  => '0x0000000f',
    }

  }

}
