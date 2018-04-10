# V-73527
# Downloading print driver packages over HTTP must be prevented.
class secure_windows::stig::v73527 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73527':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
      value => 'DisableWebPnPDownload',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
