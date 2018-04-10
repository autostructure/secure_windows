# V-73581
# Indexing of encrypted files must be turned off.
class secure_windows::stig::v73581 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73581':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search',
      value => 'AllowIndexingEncryptedStoresOrItems',
      type  => 'dword',
      data  => '0x00000000',
    }
  }
}
