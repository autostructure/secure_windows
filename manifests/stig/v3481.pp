# This class manages V-3481
# Media Player must be configured to prevent automatic Codec downloads.
class secure_windows::stig::v3481 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3481':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsMediaPlayer',
      value => 'PreventCodecDownload',
      type  => 'dword',
      data  => '1',
    }
  }
}
