# This class manages V-26359
# The Windows dialog box title for the legal banner must be configured.

class secure_windows::stig::v26359 (
  Boolean $enforced = true,
  String $legalnoticetext = 'I\'ve read & consent to terms in IS user agreement.',

  ) {
    if $enforced {

      registry::value { 'v26359':
        key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System',
        value => 'LegalNoticeCaption',
        type  => 'string',
        data  => $legalnoticetext,
      }

    }

  }
