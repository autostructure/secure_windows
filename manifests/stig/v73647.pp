# V-73647
# The required legal notice must be configured to display before console logon.
class secure_windows::stig::v73647 (
  String $legalnoticetext,
  Boolean $enforced = false,
) {

  if $enforced {

    # Any OS versions that do not support the full text version must state the following:
    # "I've read & consent to terms in IS user agreem't."
    # Deviations are not permitted except as authorized by the
    # Deputy Assistant Secretary of Defense for Information and Identity Assurance.

    #$legalnoticetext = 'I\'ve read & consent to terms in IS user agreement.'

    registry::value { 'v73647':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'LegalNoticeText',
      type  => 'string',
      data  => $legalnoticetext,
    }

  }

}
