# This class manages V-15686
# Uncontrolled system updates can introduce issues to a system.
# This setting will prevent users from applying vendor-signed updates (though they may be from a trusted source).
class secure_windows::stig::v15686 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15686':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer',
      value => 'DisableLUAPatching',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
