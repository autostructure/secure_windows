Facter.add(:windows_server_type) do
    confine :kernel => :windows
    setcode do
      require 'win32/registry'
    
      value = nil
      hive = Win32::Registry::HKEY_LOCAL_MACHINE
      hive.open('SYSTEM\CurrentControlSet\Control\ProductOptions',  Win32::Registry::KEY_READ | 0x100) do |reg|
        value = reg['ProductType']
      end
      case value
        when 'LanmanNT'
          value='windowsdc'
        else
          value='MemberServer'
      end
      value
    end
end