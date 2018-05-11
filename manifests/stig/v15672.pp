# This class manages V-15672
# Disable Events.asp hyperlinks in Event Viewer to prevent links to the internet from within events.
class secure_windows::stig::v15672 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15672':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\EventViewer',
      value => 'MicrosoftEventVwrDisableLinks',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
