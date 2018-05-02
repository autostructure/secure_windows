# secure_windows

#### Table of Contents

1. [Description](#module-description)
2. [Setup - Getting you started with *secure_windows*](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
    - [No-Op Mode - Running the Puppet Agent without implementing any changes](#no-op-mode)
4. [Reference - An under-the-hood peek at what the module is doing and how](#parameters)
5. [Possible Limitations - Some security features may not work with certain system configurations](#Limitations)
    - [Potentially Application-Breaking Rights Privileges](#potentially-application-breaking-rights-privileges)
    - [Systems Dedicated to the Management of Active Directory](#Exemptions for Systems Dedicated to the Management of Active Directory)
    - [Registry Key ACLs](#Registry Key ACLs)
    - [FTP Servers](#FTP Servers)
    - [Screen Savers](#Screen Savers)
    - [Audit Servers](#Audit Servers)
    - [Vulnerabilities Reported on but Not Changed](#Vulnerabilities Reported on but Not Changed)
    - [Non-Applicable to the System](#Non-Applicable to the System)
6. [Development - Guide for contributing to the module](#development)
7. [Copyright](#copyrights)
7. [Additional Info.](#NIST 800 53 Controls)

## Module Description
This module hardens Member, Standalone, and Domain Controller servers for Windows 2012 (Release 2) and 2016 (Release 11) according to DoD STIG specifications. The benchmark dates for the 2012 and 2016 STIGS are 1/26/18 and 7/28/17, respectively. The STIG vulnerabilities have been cross-referenced with the National Institute of Security and Technology 800 53 Controls, for users who desire the additional information.  

## Setup
The Puppet software, invoked by the single line of code shown below, will automatically identify which server is being used and configure it according to the user's pre-defined preferance.

```puppet
include ::secure_windows
```

Domain Controllers must install the `nokogiri` gem due to a dependency with the ad_acl module.

```
gem install nokogiri
```

## Usage
There are 655 vulnerabilities incuded in both Windows STIGS, and each one can be turned ON or OFF, according to the user. By default, all vulnerabilities are turned ON to ensure maximum security out-of-box. This is how you would turn off a vulnerablity using your company's Hiera configuration.

```yaml
# hieradata/common.yaml
secure_windows::stig::v73379::enforced: false
```

### No-Op Mode
It is possible to run the module in "No-Op Mode", which identifies detected Configuration Drifts without implementing any actual changes

```
puppet agent -t --noop
```

## Limitations
Below are lists of vunerabilities that can **potentially break the client's application if the rights described in the listed vulnerability are essential to operation**, **are reported on but cannot be changed** or are **Non-Applicable to the system**


### Potentially Application-Breaking Rights Privileges
Below is a list of vulnerabilities that require extra care and attention. By default, these vulnerabilities enforce proper user permissions on the machine. However, it is possible that an application might require one of these user rights. In that case, vendor documentation must support the requirement for having the user right and the requirement must be documented with the ISSO. In addition, you should disable this module from managing that right on that node, as it could break that application. Instead, manage that right in your own Puppet code:
- V-73731
- V-73733
- V-73735
- V-73739
- V-73743
- V-73747
- V-73749
- V-73755
- V-73783
- V-73785
- V-73787
- V-73791
- V-73793
- V-73801
- V-73803


### Exemptions for Systems Dedicated to the Management of Active Directory
Below is a list of vulnerabilities that should not be applied to systems dedicated to the management of Active Directory. For such systems, do not enforce these vulnerabilities:
- V-73759
- V-73771
- V-73775


### Registry Key ACLs
Puppet cannot enforce the default permissions on HKLM:security\ because its default permissions are too restrictive to allow Puppet to inspect them. We can enforce the permissions on all other keys. This affects:
- V-73255


### FTP Servers
The following will remove the FTP feature on all servers. This will break any server that is suppsosed to be an FTP server. Disable this vulnerability on FTP servers:
- V-73289


### Screen Savers
Applications requiring continuous, real-time screen display (e.g., network management products) must disable the following vulnerability that requires a screen saver:
- V-73723


### Audit Servers
Systems that are configured to write events directly to an audit server can disable the following vulnerabilities:
- V-73553
- V-73555
- V-73557

### Vulnerabilities Reported on but Not Changed
- V-73237
- V-73239
- V-73247
- V-73259
- V-73261
- V-73263
- V-73305
- V-73379
- V-73513
- V-73611

Message Input

Message @jack

### Non-Applicable to the System
- V-73217
- V-73219
- V-73221
- V-73223
- V-73227
- V-73229
- V-73231
- V-73233
- V-73241
- V-73243
- V-73245
- V-73257
- V-73265
- V-73267
- V-73269
- V-73271
- V-73273
- V-73275
- V-73281
- V-73283
- V-73285
- V-73383
- V-73385
- V-73401
- V-73403
- V-73613
- V-73615
- V-73617
```
Insert chart of STIG coverage
```
## Parameters

##### `scremoveoption`

Default value: '1'

Acceptable values are 1 (Lock Workstation) or 2 (Force Logoff).

Used in STIG V-73807


##### `time_server`

Default value: 'tick.usno.navy.mil'

This should be the appropriate time server for your organization.

Used in STIG V-73307


## NIST 800 53 Controls
Each of the controls listed below are classified as either Low, Moderate, or High, based on the potential impact a security breach could have on an organization's systems




| Low                 | Covered (x) | Moderate                       | Covered (x)          | High                                   | Covered (x)                  |
|---------------------|-------------|--------------------------------|----------------------|----------------------------------------|------------------------------|
| AC-1                |             | AC-1                           |                      | AC-1                                   |                              |
| AC-2                |             | AC-2                           | (2) (4)              | AC-2                                   |                              |
| AC-3                | x           | AC-3                           | x                    | AC-3                                   | x                            |
|                     |             | AC-4                           |                      | AC-4                                   |                              |
|                     |             | AC-5                           |                      | AC-5                                   |                              |
|                     |             | AC-6 (1) (2) (5) (9) (10)      | (9) (10)             | AC-6 (1) (2) (3) (5) (9) (10)          |                              |
| AC-7                | x           | AC-7                           | x                    | AC-7                                   | x                            |
| AC-8                | x           | AC-8                           | x                    | AC-8                                   | x                            |
|                     |             |                                |                      | AC-10                                  |                              |
|                     |             | AC-11 (1)                      | x                    | AC-11 (1)                              | x                            |
|                     |             | AC-12                          | x                    | AC-12                                  | x                            |
| AC-14               |             | AC-14                          |                      | AC-14                                  |                              |
| AC-17               |             | AC-17 (1) (2) (3) (4)          | (1) (2)              | AC-17 (1) (2) (3) (4)                  |                              |
| AC-18               | N/A         | AC-18 (1)                      | N/A                  | AC-18 (1) (4) (5)                      | N/A                          |
| AC-19               | N/A         | AC-19 (5)                      | N/A                  | AC-19 (5)                              | N/A                          |
| AC-20               |             | AC-20 (1) (2)                  |                      | AC-20 (1) (2)                          |                              |
|                     |             | AC-21                          | x                    | AC-21                                  | x                            |
| AC-22               |             | AC-22                          |                      | AC-22                                  |                              |
| AT-1                |             | AT-1                           |                      | AT-1                                   |                              |
| AT-2                |             | AT-2 (2)                       |                      | AT-2 (2)                               |                              |
| AT-3                |             | AT-3                           |                      | AT-3                                   |                              |
| AT-4                |             | AT-4                           |                      | AT-4                                   |                              |
| AU-1                |             | AU-1                           |                      | AU-1                                   |                              |
| AU-2                |             | AU-2 (3)                       |                      | AU-2 (3)                               |                              |
| AU-3                |             | AU-3 (1)                       | x                    | AU-3 (1) (2)                           |                              |
| AU-4                | x           | AU-4                           | x                    | AU-4                                   | x                            |
| AU-5                |             | AU-5                           |                      | AU-5 (1) (2)                           |                              |
| AU-6                |             | AU-6 (1) (3)                   |                      | AU-6 (1) (3) (5) (6)                   |                              |
|                     |             | AU-7 (1)                       |                      | AU-7 (1)                               |                              |
| AU-8                |             | AU-8 (1)                       | a                    | AU-8 (1)                               |                              |
| AU-9                | x           | AU-9 (4)                       |                      | AU-9 (2) (3) (4)                       |                              |
|                     |             |                                |                      | AU-10                                  |                              |
| AU-11               |             | AU-11                          |                      | AU-11                                  |                              |
| AU-12               | x           | AU-12                          | x                    | AU-12 (1) (3)                          | (3)                          |
| CA-1                |             | CA-1                           |                      | CA-1                                   |                              |
| CA-2                |             | CA-2 (1)                       |                      | CA-2 (1) (2)                           |                              |
| CA-3                |             | CA-3 (5)                       | x                    | CA-3 (5)                               | x                            |
| CA-5                |             | CA-5                           |                      | CA-5                                   |                              |
| CA-6                |             | CA-6                           |                      | CA-6                                   |                              |
| CA-7                |             | CA-7 (1)                       |                      | CA-7 (1)                               |                              |
|                     |             |                                |                      | CA-8                                   |                              |
| CA-9                |             | CA-9                           |                      | CA-9                                   |                              |
| CM-1                |             | CM-1                           |                      | CM-1                                   |                              |
| CM-2                |             | CM-2 (1) (3) (7)               |                      | CM-2 (1) (2) (3) (7)                   |                              |
|                     |             | CM-3 (2)                       |                      | CM-3 (1) (2)                           |                              |
| CM-4                | x           | CM-4                           | x                    | CM-4 (1)                               |                              |
|                     |             | CM-5                           |                      | CM-5 (1) (2) (3)                       |                              |
| CM-6                | b           | CM-6                           |                      | CM-6 (1) (2)                           |                              |
| CM-7                | x           | CM-7 (1) (2) (4)               | (2)                  | CM-7 (1) (2) (5)                       |                              |
| CM-8                |             | CM-8 (1) (3) (5)               |                      | CM-8 (1) (2) (3) (4) (5)               |                              |
|                     |             | CM-9                           |                      | CM-9                                   |                              |
| CM-10               | x           | CM-10                          | x                    | CM-10                                  | x                            |
| CM-11               |             | CM-11                          |                      | CM-11                                  |                              |
| CP-1                |             | CP-1                           |                      | CP-1                                   |                              |
| CP-2                |             | CP-2 (1) (3) (8)               |                      | CP-2 (1) (2) (3) (4) (5) (8)           |                              |
| CP-3                |             | CP-3                           |                      | CP-3 (1)                               |                              |
| CP-4                |             | CP-4 (1)                       |                      | CP-4 (1) (2)                           |                              |
|                     |             | CP-6 (1) (3)                   |                      | CP-6 (1) (2) (3)                       |                              |
|                     |             | CP-7 (1) (2) (3)               |                      | CP-7 (1) (2) (3) (4)                   |                              |
|                     |             | CP-8 (1) (2)                   |                      | CP-8 (1) (2) (3) (4)                   |                              |
| CP-9                |             | CP-9 (1)                       |                      | CP-9 (1) (2) (3) (5)                   |                              |
| CP-10               |             | CP-10 (2)                      |                      | CP-10 (2) (4)                          |                              |
| IA-1                |             | IA-1                           |                      | IA-1                                   |                              |
| IA-2(1) (12)        | (1)         | IA-2 (1) (2) (3) (8) (11) (12) | (1) (2) (3) (8) (11) | IA-2 (1) (2) (3) (4) (8) (9) (11) (12) | (1) (2) (3) (4) (8) (9) (11) |
|                     |             | IA-3                           |                      | IA-3                                   |                              |
| IA-4                | e           | IA-4                           |                      | IA-4                                   |                              |
| IA-5(1) (11)        |             | IA-5 (1) (2) (3) (11)          | 2a                   | IA-5 (1) (2) (3) (11)                  |                              |
| IA-6                |             | IA-6                           |                      | IA-6                                   |                              |
| IA-7                | x           | IA-7                           | x                    | IA-7                                   | x                            |
| IA-8(1) (2) (3) (4) | x           | IA-8 (1) (2) (3) (4)           | x                    | IA-8 (1) (2) (3) (4)                   | x                            |
| IR-1                |             | IR-1                           |                      | IR-1                                   |                              |
| IR-2                |             | IR-2                           |                      | IR-2 (1) (2)                           |                              |
|                     |             | IR-3 (2)                       |                      | IR-3 (2)                               |                              |
| IR-4                |             | IR-4 (1)                       |                      | IR-4 (1) (4)                           |                              |
| IR-5                |             | IR-5                           |                      | IR-5 (1)                               |                              |
| IR-6                |             | IR-6 (1)                       |                      | IR-6 (1)                               |                              |
| IR-7                |             | IR-7 (1)                       |                      | IR-7 (1)                               |                              |
| IR-8                |             | IR-8                           |                      | IR-8                                   |                              |
| MA-1                |             | MA-1                           |                      | MA-1                                   |                              |
| MA-2                | c,d         | MA-2                           |                      | MA-2 (2)                               |                              |
|                     |             | MA-3 (1) (2)                   |                      | MA-3 (1) (2) (3)                       |                              |
| MA-4                | c           | MA-4 (2)                       |                      | MA-4 (2) (3)                           |                              |
| MA-5                |             | MA-5                           |                      | MA-5 (1)                               |                              |
|                     |             | MA-6                           |                      | MA-6                                   |                              |
| MP-1                |             | MP-1                           |                      | MP-1                                   |                              |
| MP-2                |             | MP-2                           |                      | MP-2                                   |                              |
|                     |             | MP-3                           |                      | MP-3                                   |                              |
|                     |             | MP-4                           |                      | MP-4                                   |                              |
|                     |             | MP-5 (4)                       |                      | MP-5 (4)                               |                              |
| MP-6                |             | MP-6                           |                      | MP-6 (1) (2) (3)                       |                              |
| MP-7                |             | MP-7 (1)                       |                      | MP-7 (1)                               |                              |
| PE-1                |             | PE-1                           |                      | PE-1                                   |                              |
| PE-2                |             | PE-2                           |                      | PE-2                                   |                              |
| PE-3                |             | PE-3                           |                      | PE-3 (1)                               |                              |
|                     |             | PE-4                           |                      | PE-4                                   |                              |
|                     |             | PE-5                           |                      | PE-5                                   |                              |
| PE-6                |             | PE-6 (1)                       |                      | PE-6 (1) (4)                           |                              |
| PE-8                |             | PE-8                           |                      | PE-8 (1)                               |                              |
|                     |             | PE-9                           |                      | PE-9                                   |                              |
|                     |             | PE-10                          |                      | PE-10                                  |                              |
|                     |             | PE-11                          |                      | PE-11 (1)                              |                              |
| PE-12               |             | PE-12                          |                      | PE-12                                  |                              |
| PE-13               |             | PE-13 (3)                      |                      | PE-13 (1) (2) (3)                      |                              |
| PE-14               |             | PE-14                          |                      | PE-14                                  |                              |
| PE-15               |             | PE-15                          |                      | PE-15 (1)                              |                              |
| PE-16               |             | PE-16                          |                      | PE-16                                  |                              |
|                     |             | PE-17                          |                      | PE-17                                  |                              |
|                     |             |                                |                      | PE-18                                  |                              |
| PL-1                |             | PL-1                           |                      | PL-1                                   |                              |
| PL-2                |             | PL-2 (3)                       |                      | PL-2 (3)                               |                              |
| PL-4                |             | PL-4 (1)                       |                      | PL-4 (1)                               |                              |
|                     |             | PL-8                           |                      | PL-8                                   |                              |
| PS-1                |             | PS-1                           |                      | PS-1                                   |                              |
| PS-2                |             | PS-2                           |                      | PS-2                                   |                              |
| PS-3                |             | PS-3                           |                      | PS-3                                   |                              |
| PS-4                |             | PS-4                           |                      | PS-4 (2)                               |                              |
| PS-5                |             | PS-5                           |                      | PS-5                                   |                              |
| PS-6                |             | PS-6                           |                      | PS-6                                   |                              |
| PS-7                |             | PS-7                           |                      | PS-7                                   |                              |
| PS-8                |             | PS-8                           |                      | PS-8                                   |                              |
| RA-1                |             | RA-1                           |                      | RA-1                                   |                              |
| RA-2                |             | RA-2                           |                      | RA-2                                   |                              |
| RA-3                |             | RA-3                           |                      | RA-3                                   |                              |
| RA-5                |             | RA-5 (1) (2) (5)               |                      | RA-5 (1) (2) (4) (5)                   |                              |
| SA-1                |             | SA-1                           |                      | SA-1                                   |                              |
| SA-2                |             | SA-2                           |                      | SA-2                                   |                              |
| SA-3                |             | SA-3                           |                      | SA-3                                   |                              |
| SA-4(10)            |             | SA-4 (1) (2) (9) (10)          |                      | SA-4 (1) (2) (9) (10)                  |                              |
| SA-5                |             | SA-5                           |                      | SA-5                                   |                              |
|                     |             | SA-8                           |                      | SA-8                                   |                              |
| SA-9                |             | SA-9 (2)                       |                      | SA-9 (2)                               |                              |
|                     |             | SA-10                          |                      | SA-10                                  |                              |
|                     |             | SA-11                          |                      | SA-11                                  |                              |
|                     |             |                                |                      | SA-12                                  |                              |
|                     |             |                                |                      | SA-15                                  |                              |
|                     |             |                                |                      | SA-16                                  |                              |
|                     |             |                                |                      | SA-17                                  |                              |
| SC-1                |             | SC-1                           |                      | SC-1                                   |                              |
|                     |             | SC-2                           |                      | SC-2                                   |                              |
|                     |             |                                |                      | SC-3                                   | x                            |
|                     |             | SC-4                           | x                    | SC-4                                   | x                            |
| SC-5                | x           | SC-5                           | x                    | SC-5                                   | x                            |
| SC-7                |             | SC-7 (3) (4) (5) (7)           |                      | SC-7 (3) (4) (5) (7) (8) (18) (21)     |                              |
|                     |             | SC-8 (1)                       | x                    | SC-8 (1)                               | x                            |
|                     |             | SC-10                          | x                    | SC-10                                  | x                            |
| SC-12               |             | SC-12                          |                      | SC-12 (1)                              |                              |
| SC-13               | x           | SC-13                          | x                    | SC-13                                  | x                            |
| SC-15               |             | SC-15                          |                      | SC-15                                  |                              |
|                     |             | SC-17                          |                      | SC-17                                  |                              |
|                     |             | SC-18                          |                      | SC-18                                  |                              |
|                     |             | SC-19                          |                      | SC-19                                  |                              |
| SC-20               |             | SC-20                          |                      | SC-20                                  |                              |
| SC-21               |             | SC-21                          |                      | SC-21                                  |                              |
| SC-22               |             | SC-22                          |                      | SC-22                                  |                              |
|                     |             | SC-23                          |                      | SC-23                                  |                              |
|                     |             |                                |                      | SC-24                                  |                              |
|                     |             | SC-28                          | x                    | SC-28                                  | x                            |
| SC-39               | x           | SC-39                          | x                    | SC-39                                  | x                            |
| SI-1                |             | SI-1                           |                      | SI-1                                   |                              |
| SI-2                |             | SI-2 (2)                       | x                    | SI-2 (1) (2)                           |                              |
| SI-3                |             | SI-3 (1) (2)                   |                      | SI-3 (1) (2)                           |                              |
| SI-4                |             | SI-4 (2) (4) (5)               |                      | SI-4 (2) (4) (5)                       |                              |
| SI-5                |             | SI-5                           |                      | SI-5 (1)                               |                              |
|                     |             |                                |                      | SI-6                                   |                              |
|                     |             | SI-7 (1) (7)                   |                      | SI-7 (1) (2) (5) (7) (14)              |                              |
|                     |             | SI-8 (1) (2)                   |                      | SI-8 (1) (2)                           |                              |
|                     |             | SI-10                          |                      | SI-10                                  |                              |
|                     |             | SI-11                          |                      | SI-11                                  |                              |
| SI-12               |             | SI-12                          |                      | SI-12                                  |                              |
|                     |             | SI-16                          | x                    | SI-16                                  | x                            |


## Disclaimer

> This Work is provided "as is." Any express or implied warranties,
including but not limited to, the implied warranties of merchantability
and fitness for a particular purpose are disclaimed. In no event shall
the authors be liable for any direct, indirect,
incidental, special, exemplary or consequential damages (including, but
not limited to, procurement of substitute goods or services, loss of
use, data or profits, or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of
this Guidance, even if advised of the possibility of such damage.
>
> The User of this Work agrees to hold harmless and indemnify Autostructure,
its agents, parent company, and employees from every claim or liability
(whether in tort or in contract), including attorneys' fees,
court costs, and expenses, arising in direct consequence of Recipient's
use of the item, including, but not limited to, claims or liabilities
made for injury to or death of personnel of User or third parties,
damage to or destruction of property of User or third parties, and
infringement or other violations of intellectual property or technical
data rights.
>
> Nothing in this Work is intended to constitute an endorsement, explicit
or implied, by Autostructure of any particular manufacturer's
product or service.

## Copyrights

> All materials are copyright by their respective owners unless otherwise noted.
>
> Released under the [Apache License, Version 2](http://www.apache.org/licenses/LICENSE-2.0.html).
