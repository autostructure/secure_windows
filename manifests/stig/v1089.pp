# This class manages V-1089
# The required legal notice must be configured to display before console logon.
class secure_windows::stig::v1089 (
  String $legalnoticetext = 'I\'ve read & consent to terms in IS user agreement.',
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v1089':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
      value => 'LegalNoticeText',
      type  => 'string',
      data  => $legalnoticetext,
    }

  }

}
