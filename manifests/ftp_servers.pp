# This class manages settings for FTP servers
class secure_windows::ftp_servers {
  if ($facts['windows_role'] and
      $facts['windows_role'] =~ /(^184|,184,|,184$)/) {
    notify { 'FTP Server':
      message => 'I am a FTP Server!',
    }
  }
}
#
# %systemroot%\system32\inetsrv\AppCmd.exe set config -section:system.applicationHost/sites /[name='win08.example.com'].ftpServer.security.authentication.anonymousAuthentication.enabled:"False" /commit:apphost
#
#
#
# <ftpServer>
#         <connections />
#         <security>
#           <dataChannelSecurity />
#           <commandFiltering>
#           </commandFiltering>
#           <ssl controlChannelPolicy="SslAllow" dataChannelPolicy="SslAllow" />
#           <sslClientCertificates />
#           <authentication>
#             <anonymousAuthentication enabled="true" />
#
#             system.web/deployment
# system.webServer/cgi
# system.applicationHost/webLimits
# system.web/httpModules
# system.webServer/directoryBrowse
# configPaths
# system.web/compilation
# system.web/deviceFilters
# system.webServer/management/authorization
# system.web/authorization
# system.web/globalization
# configurationRedirection
# configProtectedData
# system.webServer/handlers
# system.web/xhtmlConformance
# system.webServer/urlCompression
# system.net/mailSettings/smtp
# system.web/profile
# system.webServer/isapiFilters
# system.web/customErrors
# system.web/caching/outputCacheSettings
# system.diagnostics
# system.web/fullTrustAssemblies
# system.web/webControls
# system.web/webServices
# administratorsProviders
# system.webServer/webSocket
# system.web/healthMonitoring
# connectionStrings
# system.web/roleManager
# system.web/machineKey
# system.webServer/httpTracing
# system.webServer/security/authentication/basicAuthentication
# system.web/httpCookies
# system.web/processModel
# system.webServer/caching
# system.ftpServer/firewallSupport
# system.webServer/security/isapiCgiRestriction
# system.web/mobileControls
# system.web/caching/outputCache
# system.ftpServer/security/ipSecurity
# system.webServer/security/authorization
# system.webServer/tracing/traceFailedRequests
# system.webServer/fastCgi
# system.webServer/httpProtocol
# system.webServer/staticContent
# system.applicationHost/listenerAdapters
# system.web/membership
# system.ftpServer/serverRuntime
# system.webServer/httpCompression
# system.webServer/validation
# system.webServer/modules
# system.applicationHost/applicationPools
# system.net/settings
# system.windows.forms
# system.webServer/odbcLogging
# system.web/caching/cache
# system.webServer/security/ipSecurity
# system.net/requestCaching
# system.webServer/security/dynamicIpSecurity
# modules
# system.web/hostingEnvironment
# system.webServer/httpRedirect
# system.web/httpRuntime
# moduleProviders
# system.transactions/machineSettings
# system.net/defaultProxy
# system.web/partialTrustVisibleAssemblies
# system.webServer/security/authentication/windowsAuthentication
# system.web/identity
# system.webServer/httpLogging
# system.net/connectionManagement
# system.webServer/asp
# system.webServer/globalModules
# system.webServer/security/access
# system.applicationHost/customMetadata
# system.transactions/defaultSettings
# system.ftpServer/caching
# system.web/browserCaps
# system.web/pages
# system.web/trace
# system.xml.serialization/dateTimeSerialization
# appSettings
# system.net/webRequestModules
# system.ftpServer/security/authorization
# system.webServer/security/authentication/clientCertificateMappingAuthentication
# system.applicationHost/serviceAutoStartProviders
# system.webServer/management/trustedProviders
# system.web/sessionState
# system.webServer/security/authentication/digestAuthentication
# system.web/anonymousIdentification
# system.web/authentication
# system.web/clientTarget
# system.data
# system.web/protocols
# system.applicationHost/log
# system.webServer/webdav/authoringRules
# system.ftpServer/providerDefinitions
# administrators
# system.web/webParts
# system.ftpServer/security/authentication
# system.webServer/defaultDocument
# system.webServer/management/authentication
# system.webServer/webdav/authoring
# system.web/sessionPageState
# system.xml.serialization/schemaImporterExtensions
# system.web/caching/sqlCacheDependency
# system.webServer/security/authentication/anonymousAuthentication
# system.webServer/security/requestFiltering
# system.applicationHost/configHistory
# system.web/siteMap
# system.web/securityPolicy
# system.webServer/security/applicationDependencies
# system.webServer/security/authentication/iisClientCertificateMappingAuthentication
# system.webServer/webdav/globalSettings
# system.webServer/httpErrors
# system.xml.serialization/xmlSerializer
# system.webServer/serverSideInclude
# system.webServer/tracing/traceProviderDefinitions
# system.web/httpHandlers
# system.ftpServer/log
# system.webServer/serverRuntime
# system.ftpServer/security/requestFiltering
# system.codedom
# system.webServer/applicationInitialization
# system.web/urlMappings
# system.web/trust
# system.applicationHost/sites
