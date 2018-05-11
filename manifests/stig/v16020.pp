#This class manages V-16020
#The Windows Customer Experience Improvement Program must be disabled.
class secure_windows::stig::v16020 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v16020':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\SQMClient\Windows',
      value => 'CEIPEnable',
      type  => 'dword',
      data  => '0',
    }

  }

}
