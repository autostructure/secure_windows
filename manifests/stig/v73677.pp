# V-73677
# Remote calls to the Security Account Manager (SAM) must be restricted to Administrators.
class secure_windows::stig::v73677 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73677':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
      value => 'RestrictRemoteSAM',
      type  => 'string',
      data  => 'O:BAG:BAD:(A;;RC;;;BA)',
    }

  }

}
