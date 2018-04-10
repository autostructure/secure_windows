# V-73535
# Windows Server 2016 must be configured to block untrusted fonts from loading.
class secure_windows::stig::v73535 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73535':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOption',
      value => 'MitigationOptions_FontBocking',
      type  => 'string',
      data  => '1000000000000',
    }

  }

}
