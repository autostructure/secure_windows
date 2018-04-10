# V-73565
# File Explorer shell protocol must run in protected mode.
class secure_windows::stig::v73565 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73565':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
      value => 'PreXPSP2ShellProtocolBehavior',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
