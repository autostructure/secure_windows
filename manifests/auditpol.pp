#
# This class manages Windows Audit Policy
#
# TODO: 
# - Add unit testing
# - Consider adding customization with warning messages
#
class secure_windows::auditpol {
  # V-73413
  # Windows Server 2016 must be configured to audit Account Logon - Credential Validation successes.
  # V-73415
  # Windows Server 2016 must be configured to audit Account Logon - Credential Validation failures.
  auditpol { 'Credential Validation':
    success => 'enable',
    failure => 'enable',
  }

  # V-73417
  # Windows Server 2016 must be configured to audit Account Management - Computer Account Management successes.
  if($facts['windows_server_type'] == 'windowsdc') {
    auditpol { 'Computer Account Management':
      success => 'enable',
      failure => 'disable',
    }
  }

  # V-73419
  # Windows Server 2016 must be configured to audit Account Management - Other Account Management Events successes.
  # V-73421
  # Windows Server 2016 must be configured to audit Account Management - Other Account Management Events failures.
  auditpol { 'Other Account Management Events':
    success => 'enable',
    failure => 'enable',
  }

  # V-73423
  # Windows Server 2016 must be configured to audit Account Management - Security Group Management successes.
  # V-73425
  # Windows Server 2016 must be configured to audit Account Management - Security Group Management failures.
  auditpol { 'Security Group Management':
    success => 'enable',
    failure => 'enable',
  }

  # V-73427
  # Windows Server 2016 must be configured to audit Account Management - User Account Management successes.
  # V-73429
  # Windows Server 2016 must be configured to audit Account Management - User Account Management successes.
  auditpol { 'User Account Management':
    success => 'enable',
    failure => 'enable',
  }

  # V-73431
  # Windows Server 2016 must be configured to audit Detailed Tracking - Plug and Play Events successes.
  auditpol { 'Plug and Play Events':
    success => 'enable',
    failure => 'disable',
  }

  # V-73433
  # Windows Server 2016 must be configured to audit Detailed Tracking - Process Creation successes.
  auditpol { 'Process Creation':
    success => 'enable',
    failure => 'disable',
  }

  # V-73435
  # Windows Server 2016 must be configured to audit DS Access - Directory Service Access successes.
  # V-73437
  # Windows Server 2016 must be configured to audit DS Access - Directory Service Access failures.
  if($facts['windows_server_type'] == 'windowsdc') {
    auditpol { 'Directory Service Access':
      success => 'enable',
      failure => 'enable',
    }
  }

  # V-73439
  # Windows Server 2016 must be configured to audit DS Access - Directory Service Changes successes.
  # V-73441
  # Windows Server 2016 must be configured to audit DS Access - Directory Service Changes failures.
  if($facts['windows_server_type'] == 'windowsdc') {
    auditpol { 'Directory Service Changes':
      success => 'enable',
      failure => 'enable',
    }
  }

  # V-73443
  # Windows Server 2016 must be configured to audit Logon/Logoff - Account Lockout successes.
  # V-73445
  # Windows Server 2016 must be configured to audit Logon/Logoff - Account Lockout failures.
  auditpol { 'Account Lockout':
    success => 'enable',
    failure => 'enable',
  }

  # V-73447
  # Windows Server 2016 must be configured to audit Logon/Logoff - Group Membership successes.
  auditpol { 'Group Membership':
    success => 'enable',
    failure => 'disable',
  }

  # V-73449
  # Windows Server 2016 must be configured to audit Logon/Logoff - Logoff successes.
  auditpol { 'Logoff':
    success => 'enable',
    failure => 'disable',
  }

  # V-73451
  # Windows Server 2016 must be configured to audit Logon/Logoff - Logon successes.
  # V-73453
  # Windows Server 2016 must be configured to audit Logon/Logoff - Logon failures.
  auditpol { 'Logon':
    success => 'enable',
    failure => 'enable',
  }

  # V-73455
  # Windows Server 2016 must be configured to audit Logon/Logoff - Special Logon successes.
  auditpol { 'Special Logon':
    success => 'enable',
    failure => 'disable',
  }

  # V-73457
  # Windows Server 2016 must be configured to audit Object Access - Removable Storage successes.
  # V-73459
  # Windows Server 2016 must be configured to audit Object Access - Removable Storage failures.
  auditpol { 'Removable Storage':
    success => 'enable',
    failure => 'enable',
  }

  # V-73461
  # Windows Server 2016 must be configured to audit Policy Change - Audit Policy Change successes.
  # V-73463
  # Windows Server 2016 must be configured to audit Policy Change - Audit Policy Change failures.
  auditpol { 'Audit Policy Change':
    success => 'enable',
    failure => 'enable',
  }

  # V-73465
  # Windows Server 2016 must be configured to audit Policy Change - Authentication Policy Change successes.
  auditpol { 'Authentication Policy Change':
    success => 'enable',
    failure => 'disable',
  }

  # V-73467
  # Windows Server 2016 must be configured to audit Policy Change - Authorization Policy Change successes.
  auditpol { 'Authorization Policy Change':
    success => 'enable',
    failure => 'disable',
  }

  # V-73469
  # Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use successes.
  # V-73471
  # Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use failures.
  auditpol { 'Sensitive Privilege Use':
    success => 'enable',
    failure => 'enable',
  }

  # V-73473
  # Windows Server 2016 must be configured to audit System - IPsec Driver successes.
  # V-73475
  # Windows Server 2016 must be configured to audit System - IPsec Driver failures.
  auditpol { 'IPsec Driver':
    success => 'enable',
    failure => 'enable',
  }

  # V-73477
  # Windows Server 2016 must be configured to audit System - Other System Events successes.
  # V-73479
  # Windows Server 2016 must be configured to audit System - Other System Events failures.
  auditpol { 'Other System Events':
    success => 'enable',
    failure => 'enable',
  }

  # V-73481
  # Windows Server 2016 must be configured to audit System - Security State Change successes.
  auditpol { 'Security State Change':
    success => 'enable',
    failure => 'disable',
  }

  # V-73483
  # Windows Server 2016 must be configured to audit System - Security System Extension successes.
  # V-73485
  # Windows Server 2016 must be configured to audit System - Security System Extension failures.
  auditpol { 'Security System Extension':
    success => 'enable',
    failure => 'enable',
  }

  # V-73489
  # Windows Server 2016 must be configured to audit System - System Integrity successes.
  # V-73491
  # Windows Server 2016 must be configured to audit System - System Integrity failures.
  auditpol { 'System Integrity':
    success => 'enable',
    failure => 'enable',
  }
}
