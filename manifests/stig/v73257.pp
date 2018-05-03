# This class manages V-73257
# Non-administrative accounts or groups must only have print permissions on printer shares.
class secure_windows::stig::v73257 (
  Boolean $enforced = false,
) {

  # PS C:\Users\Administrator> Get-Printer -full -Name "Microsoft XPS Document Writer" | select PermissionSDDL
  # -ExpandProperty PermissionSDDL
  # G:SYD:(A;OIIO;GA;;;CO)(A;OIIO;GA;;;AC)(A;;SWRC;;;WD)(A;CIIO;GX;;;WD)(A;;SWRC;;;AC)(A;CIIO;GX;;;AC)(A;;LCSWDTSDRCWDWO;;;BA)
  #(A;OICIIO;GA;;;BA)
  # PS C:\Users\Administrator>

  # -PermissionSDDL
  # https://blogs.technet.microsoft.com/askds/2008/05/07/the-security-descriptor-definition-language-of-love-part-2/

  # SDDL - ACE Strings
  # ace_type;ace_flags;rights;object_guid;inherit_object_guid;account_sid;(resource_attribute)
  # https://msdn.microsoft.com/en-us/library/aa374928.aspx

  # By default, each group is assigned a combination of the Print, Manage Documents,
  # and Manage Printers permissions as shown in the following table.

  # Group				      Print	Manage Documents	Manage Printers
  # -----------------	-----	----------------	---------------
  # Administrators		X		  X				        	X
  # Creator Owner	 			    X
  # Everyone			    X
  # Power Users			  X		  X					        X
  # Print Operators		X		  X					        X
  # Server Operators	X		  X					        X

  # The Print Operators and Server Operators groups are located only on domain controllers.

  # $PermissionSDDL = Get-Printer -full -Name test99 | select PermissionSDDL -ExpandProperty PermissionSDDL
  # $newSDDL = Add-LHSPrinterPermissionSDDL -Account "Domain\Username" -existingSDDL $PermissionSDDL
  # Get-Printer -Name test99 | Set-Printer -PermissionSDDL $newSDDL -verbose

  # SOURCE: https://gallery.technet.microsoft.com/scriptcenter/Add-Printer-Permission-c0ece1f3



  # STIG - Check Content
  # --------------------
  # Open "Devices and Printers".
  # If there are no printers configured, this is NA.
  # (Exclude Microsoft Print to PDF and Microsoft XPS Document Writer, which do not support sharing.)
  # For each printer:
  # Right-click on the printer.
  # Select "Printer Properties".
  # Select the "Sharing" tab.
  # If "Share this printer" is checked, select the "Security" tab.
  # If any standard user accounts or groups have permissions other than "Print", this is a finding.
  # The default is for the "Everyone" group to be given "Print" permission.
  # "All APPLICATION PACKAGES" and "CREATOR OWNER" are not standard user accounts.

  # STIG - Fix Text
  # Configure the permissions on shared printers to restrict standard users to only have Print permissions.

}
