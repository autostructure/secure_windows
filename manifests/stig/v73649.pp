# V-73649
# The Windows dialog box title for the legal banner must be configured with the appropriate text.
class secure_windows::stig::v73649 (
  Boolean $enforced = false,
) {

  if $enforced {

    # Alternatively, the title below is also valid...
    # $legalnoticetitle = 'DoD Notice and Consent Banner'

    $legalnoticetitle = 'US Department of Defense Warning Statement'

    registry::value { 'v73649':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'LegalNoticeCaption',
      type  => 'string',
      data  => $legalnoticetitle,
    }

  }

}
