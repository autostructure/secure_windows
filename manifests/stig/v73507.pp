# V-73507
# Insecure logons to an SMB server must be disabled.
class secure_windows::stig::v73507 (
  Boolean $enforced = false,
) {
  if $enforced {
    registry::value { 'v73507':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation',
      value => 'AllowInsecureGuestAuth',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
