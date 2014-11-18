################################################################################################
# FILENAME:		Remove-TrendwDS.ps1
# AUTHOR: 		Michael McConnell
# DATE: 		2014/11/10
# 
# 
# DESCRIPTION:	This script replicates a manual install process for Trend Micro Office Scan when 
# current install is corrupted or only paritally uninstalled. Only use this script on systems with Deep Security instaled. 
# You will need to get a copy of DevCon and put it in a Directory on C:\ called Remove-Trend along with this script.
# Download that here: http://support.microsoft.com/kb/311272 Remove Officescan when Uninstall Utility Fails. Requires Devcon Utility. For systems that do not have other Trend 
# products installed. All trademarks belong to their respective owners, this utility is provided without warranty or guarantee.
# VERSION HISTORY
# 1.0 Script created.
################################################################################################
$OSType = Get-WmiObject -Class Win32_OperatingSystem
#Check to see if Trend Services are running and stop them if they are 
$scanService = Get-Service "NTRTScan"
$listenerService = Get-Service "TMListen"
if($scanService.Status = "Running") {
	Stop-Service "NTRTScan"
}
if($listenerService.Status = "Running"){
	Stop-Service "TMListen"
}
#Delete Trend folders in Program Files
if(Test-Path "C:\Program Files\Trend Micro"){
	Remove-Item "C:\Program Files\Trend Micro\Trend Micro\OfficeScan Client" -Recurse -Force
}
if(Test-Path "C:\Program Files (x86)\Trend Micro"){
	Remove-Item "C:\Program Files (x86)\Trend Micro\OfficeScan Client" -Recurse -Force
}
#Removes Trend Entries in the Registry
If($OSType.OSArchitecture = "64-bit"){
		Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432node\TrendMicro\OfcWatchDog" -Recurse -Force
		Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\TrendMicro\PC-cillinNTCorp" -Recurse -Force
		Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432node\TrendMicro\PC-cillinNTCorp" -Recurse -Force
	}
Else{
	Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\TrendMicro\NSC" -Recurse -Force
	Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\TrendMicro\OfcWatchDog" -Recurse -Force
	}
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OfficeScanNT" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ntrtscan" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ntrtscan" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\ntrtscan" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\ntrtscan" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Perf_iCrcPerfMonMgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Perf_iCrcPerfMonMgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\Perf_iCrcPerfMonMgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\Perf_iCrcPerfMonMgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmcfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmcfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmcfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmcfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TmFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TmFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\TmFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\TmFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmpfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmpfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmpfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmpfw" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TmPreFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TmPreFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\TmPreFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\TmPreFilter" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmtdi" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmtdi" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmtdi" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmtdi" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VSApiNt" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\ServicesVSApiNt" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\VSApiNt" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\VSApiNt" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmlwf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Servicestmlwf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmlwf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmlwf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmwfp" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmwfp" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmwfp" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmwfp" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmactmon" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmactmon" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmactmon" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmactmon" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TMBMServer" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TMBMServer" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\TMBMServer" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\TMBMServer" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmccsf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmccsf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmccsf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmccsf" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TMEBC" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TMEBC" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\TMEBC" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\TMEBC" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmevtmgr" -Recurse -Force 
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmevtmgr" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmnciesc"  -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tmnciesc" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\tmnciesc" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\tmnciesc" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Services\TmProxy" -Recurse -Force
Remove-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet003\Services\TmProxy" -Recurse -Force

#Remove Trend Drivers
If($OSType.OSArchitecture = "64-bit"){
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMCOMM\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMACTMON\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_tmevtmgr\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMFILTER\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMPREFILTER\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMTDI\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_VSAPINT\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMBMSRV\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMWFP\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_TMEBC\0000"
	C:\Remove-Trend\Devcon\ia64\devcon.exe /r remove "ROOT\LEGACY_tmeevw\0000"
	}
Else {
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMCOMM\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMACTMON\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_tmevtmgr\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMFILTER\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMPREFILTER\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMTDI\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_VSAPINT\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMBMSRV\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMWFP\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_TMEBC\0000"
	C:\Remove-Trend\Devcon\i386\devcon.exe /r remove "ROOT\LEGACY_tmeevw\0000"
	}
