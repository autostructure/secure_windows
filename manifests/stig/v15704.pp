# This class manages V-15704
# This setting prevents errors in handwriting recognition on tablet PCs from being reported to Microsoft.
class secure_windows::stig::v15704 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15704':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\HandwritingErrorReports',
      value => 'PreventHandwritingErrorReports',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
