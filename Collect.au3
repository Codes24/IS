#include-once	;3125370d31339f3f038b207ab207b7287b7afec5561568ee07ba7277a754c509
#include <Array.au3>
#include <CompInfo.au3>
#include <EventLog.au3>
#include <File.au3>
#include <GuiEdit.au3>
#include <GuiListView.au3>
#include <Process.au3>
#include <Zip.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <IE.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <VT.au3>
#Include <WinAPI.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\hugo\downloads\autoit\clean.kxf
$Form1_1 = GUICreate("�Ѭr�u��", 269, 314, 204, 123)
$Label1 = GUICtrlCreateLabel("�q���W��", 8, 8, 52, 17, 0)
$Input1 = GUICtrlCreateInput("00-0000000-00", 64, 8, 81, 21, $GUI_SS_DEFAULT_INPUT)
$Label2 = GUICtrlCreateLabel("IP", 152, 8, 14, 17, 0)
$Input2 = GUICtrlCreateInput("140.96.255.255", 168, 8, 89, 21, $GUI_SS_DEFAULT_INPUT)
$Tab1 = GUICtrlCreateTab(8, 40, 249, 105)
$TabSheet1 = GUICtrlCreateTabItem("���R")
GUICtrlSetState(-1,$GUI_SHOW)
$B1 = GUICtrlCreateButton("�}������", 16, 72, 67, 25)
$B2 = GUICtrlCreateButton("�t���ɮ�", 96, 72, 67, 25)
$B3 = GUICtrlCreateButton("����{��", 176, 72, 67, 25)
$B4 = GUICtrlCreateButton("ATTK", 16, 112, 67, 25)
$B5 = GUICtrlCreateButton("����", 96, 112, 67, 25)
$B6 = GUICtrlCreateButton("Event Log", 176, 112, 67, 25)
$TabSheet2 = GUICtrlCreateTabItem("����")
$B7 = GUICtrlCreateButton("�t�θ�T", 16, 72, 67, 25)
$B8 = GUICtrlCreateButton("Event Log", 96, 72, 67, 25)
$B9 = GUICtrlCreateButton("TDME Log", 176, 72, 67, 25)
$B10 = GUICtrlCreateButton("�ɮץؿ�", 16, 112, 67, 25)
$B11 = GUICtrlCreateButton("�i���ɮ�", 96, 112, 67, 25)
$B12 = GUICtrlCreateButton("CDT Log", 176, 112, 67, 25)
$TabSheet3 = GUICtrlCreateTabItem("��L")
$B13 = GUICtrlCreateButton("�}���޲z", 16, 72, 67, 25)
$B14 = GUICtrlCreateButton("�{�Ǻ޲z", 96, 72, 67, 25)
$B15 = GUICtrlCreateButton("�����y�q", 176, 72, 67, 25)
$B16 = GUICtrlCreateButton("Dr. Web", 16, 112, 67, 25)
$B17 = GUICtrlCreateButton("�ʴ��{��", 96, 112, 67, 25)
$B18 = GUICtrlCreateButton("PeStudio", 176, 112, 67, 25)
$TabSheet4 = GUICtrlCreateTabItem("�M��")
$B19 = GUICtrlCreateButton("Ų��", 16, 72, 67, 25)
$B20 = GUICtrlCreateButton("��f�r", 96, 72, 67, 25)
$B21 = GUICtrlCreateButton("�e���R", 176, 72, 67, 25)
$B22 = GUICtrlCreateButton("�s�~", 16, 112, 67, 25)
GUICtrlCreateTabItem("")
$Edit1 = GUICtrlCreateEdit("", 8, 152, 249, 145)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Initial()
While 1
   $nMsg = GUIGetMsg()
   Switch $nMsg
	  Case $B1
		 Autoruns()
	  Case $B2
		 CheckSign()
	  Case $B3
		 EventLog()
	  Case $B4
		 ATTKNoGUI();ATTK()
	  Case $B5
		 EventLogParsers()
	  Case $B6
		 EventLogParser()
	  Case $B7
		 CollectSystemInfo()
	  Case $B8
		 CollectEventLog()
	  Case $B9
		 CollectTDMELog()
	  Case $B10
		 CollectDir()
	  Case $B11
		 CollectSuspicious()
	  Case $B12
		 CollectCDTLog()
	  Case $B13
		 RunAutoruns()
	  Case $B14
		 RunProcessExplorer()
	  Case $B15
		 RunTCPView()
	  Case $B16
		 RunDrWeb()
	  Case $B17
		 RunProcessMon()
	  Case $B18
		 RunPeStudio()
	  Case $B19
		 Forensic()
	  Case $B20
		 FindVirus()
	  Case $B21
		 ShowServices();RunSystemExplorer()
	  Case $B22
		 FindNetworkVirus();
	  Case $GUI_EVENT_CLOSE
		 Terminal()
   EndSwitch
WEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Func Initial()
   if not FileExists(@computername) then
	  DirCreate (@computername)
   EndIf
   if not fileexists(@COMPUTERNAME & "\prefech") Then
	  DirCreate (@computername & "\prefech")
   EndIf
   If Not FileExists(@COMPUTERNAME & "\suspicious") Then
	  DirCreate (@COMPUTERNAME & "\suspicious")
   EndIf
   If	Not FileExists(@COMPUTERNAME & "\PEAgent") Then
	  DirCreate(@COMPUTERNAME & "\PEAgent")
   EndIf
   GUICtrlSetData($Input1 , @computername)
   GUICtrlSetData($Input2 , @IPAddress1)
   Global $ListView1
EndFunc

Func ATTK()	;$B4
   FileCopy("supportcustomizedpackage.exe",@DesktopDir)
   _GUICtrlEdit_AppendText($Edit1,"����ATTK" & @CRLF)
   $g_nProcessPID = Run(@DesktopDir & "\supportcustomizedpackage.exe");Get Process ID
   ;_GUICtrlEdit_AppendText($Edit1,$g_nProcessPID & @CRLF)
   WinWaitActive("[Class:#32770]", "", 60)	;wait for window
   Sleep(5000)	;�������}��
   $st = WinGetPos("[Class:#32770]")	;���o������m
   _GUICtrlEdit_AppendText($Edit1,$st & @CRLF)
   ControlClick("[Class:#32770]", "","[Class:Internet Explorer_Server; Instance:1]","left",1,536,136)	;click scan
   Sleep(180000)
   While 1
	  $color = PixelGetColor($st[0]+478,$st[1]+61)
	  _GUICtrlEdit_AppendText($Edit1,$color & @CRLF)
	  If $color <> 0xE30000 Then;Stop Scan
		 Sleep(6000)
	  Else
		 ControlClick("[Class:#32770]", "","[Class:Internet Explorer_Server; Instance:1]","left",1,674,15)	;Close window
		 ExitLoop
	  EndIf
   WEnd
   While 1
	  If ProcessExists("supportcustomizedpackage.exe") Then
		 Sleep(6000)
	  Else
		 ExitLoop
	  EndIf
   WEnd
   _GUICtrlEdit_AppendText($Edit1,"ATTK���槹��" & @CRLF)
   If FileMove(@DesktopDir & "\TrendMicro AntiThreat Toolkit\Output\*.*",@COMPUTERNAME & "\",1) Then	;copy result file
	  _GUICtrlEdit_AppendText($Edit1,"ATTK Log�ƻs����" & @CRLF)
   EndIf
EndFunc

Func ATTKNoGUI()	;B4
   FileCopy("supportcustomizedpackage.exe",@DesktopDir)
   _GUICtrlEdit_AppendText($Edit1,"����ATTK" & @CRLF)
   $g_nProcessPID = Run(@DesktopDir & "\supportcustomizedpackage.exe",@DesktopDir);Get Process ID
   While 1
	  If ProcessExists("supportcustomizedpackage.exe") Then
		 Sleep(6000)
	  Else
		 ExitLoop
	  EndIf
   WEnd
   _GUICtrlEdit_AppendText($Edit1,"ATTK���槹��" & @CRLF)
   If FileMove(@DesktopDir & "\TrendMicro AntiThreat Toolkit\Output\*.*",@COMPUTERNAME & "\",1) Then	;copy result file
	  _GUICtrlEdit_AppendText($Edit1,"ATTK Log�ƻs����" & @CRLF)
   EndIf
EndFunc

Func Autoruns()	;$B1
   _GUICtrlEdit_AppendText($Edit1,"����Autoruns" & @CRLF)
   _RunDos('autorunsc.exe -acvm > %computername%\autorun.csv')
   _GUICtrlEdit_AppendText($Edit1,"Autoruns���槹��" & @CRLF)
EndFunc

Func CheckSign()	;B2
   _GUICtrlEdit_AppendText($Edit1,"����Sigcheck" & @CRLF)
   _RunDos('sigcheck -e -u -v %windir%\system32 >> %COMPUTERNAME%\sigcheck.csv')
   _RunDos('sigcheck -e -u -v %windir% >> %COMPUTERNAME%\sigcheck.csv')
   _GUICtrlEdit_AppendText($Edit1,"Sigcheck���槹��" & @CRLF)
EndFunc

Func CollectAuto()	;���Ncollauto.vbs
   Dim $a_lines, $i, $a_temp
   $rc = _FileReadToArray(@computername & "\autorun.csv", $a_lines)
   If $rc <> 0 Then
	  For $i = 2 To $a_lines[0]	;���L�Ĥ@����D
		 $a_temp = StringSplit($a_lines[$i], ",")
		 If IsArray($a_temp) And $a_temp[0] > 0 Then
            $Pos = StringInStr($a_temp[6],"(Verified)")	;�����Ҫ�����(��ťո�Not verified)
			If $Pos = 0 Then
			   $fil = StringInStr($a_temp[7],"File not found:")	;���L�ɮפ��s�b��
			   If $fil = 0 Then
				  FileCopy(StringReplace($a_temp[7],"""",""),@COMPUTERNAME & "\suspicious")
			   EndIf
            EndIf
		 EndIf
	  Next
   EndIf
EndFunc

Func CollectCDTLog()	;$B12 http://files.trendmicro.com/products/activesupport/cdt_26_win_en_1111.zip
   Local $cdtpid
   if not FileExists(@DesktopDir & "\CDT") then
	  DirCreate (@DesktopDir & "\CDT")
   EndIf
   FileCopy("CDT\*.*",@DesktopDir & "\CDT")
   ;_ExtractZip("cdt_26_win_en_1111.zip", @DesktopDir & "\CDT")
   ;_Zip_UnzipAll("cdt_26_win_en_1111.zip", @DesktopDir & "\CDT")
   _GUICtrlEdit_AppendText($Edit1,"����CDT" & @CRLF)
   ;$list = _Zip_List("cdt_26_win_en_1111.zip") ;Returns an array containing all the files in the zip file
   ;For $i = 0 to UBound($list) - 1     
	;  _GUICtrlEdit_AppendText($Edit1,$list[$i] & @CRLF)  ;Print Search Results in the console
   ;Next
   $cdtpid = Run(@DesktopDir & "\CDT\CaseDiagnosticTool.exe"
   WinWaitActive("Case Diagnostic Tool","",30)
   ControlClick("Case Diagnostic Tool","","[Class:Internet Explorer_Server; Instance:7]","left",1,35,323)	;click accept
   Sleep(1000)
   ControlClick("Case Diagnostic Tool","","[Class:Internet Explorer_Server; Instance:7]","left",1,528,372)	;click start
   Sleep(1000)
   ControlClick("Case Diagnostic Tool","","[Class:Internet Explorer_Server; Instance:5]","left",1,516,385)	;Click Next>
   Sleep(1000)
   ControlClick("Case Diagnostic Tool","","[Class:Internet Explorer_Server; Instance:2]","left",1,100,250)	;click edit
   Sleep(1000)
   $value = InputBox("�п�J��]","�п�J��]")
   ControlSetText("Case Diagnostic Tool","","[Class:Internet Explorer_Server; Instance:2]",$value)
   Sleep(1000)
   ControlClick("Case Diagnostic Tool","","[Class:Internet Explorer_Server; Instance:2]","left",1,500,386)	;click Next>
   Sleep(60000)
EndFunc

Func CollectDir()	;B10
   _GUICtrlEdit_AppendText($Edit1,"�x�s�ɮ׸�T" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'dir %SystemDrive%\ /s/a/ta/od > %COMPUTERNAME%\dir_ta_od.txt')
   RunWait(@ComSpec & ' /c ' & 'dir %SystemDrive%\ /s/a/tw/od > %COMPUTERNAME%\dir_tw_od.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'dir %SystemDrive%\ /s/a/tc/od > %COMPUTERNAME%\dir_tc_od.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'dir %SystemDrive%\ /s/a/tc/od/q > %COMPUTERNAME%\dir_tc_od_q.txt', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"�ɮ׸�T�x�s����" & @CRLF)
EndFunc

Func CollectEventLog()	;$B8 @WindowsDir & "\System32\Winevt\Logs\Security.evtx"
   Local $hEventLog; Read most current event record
   _GUICtrlEdit_AppendText($Edit1,"�}�l�ƥ�Event Log" & @CRLF)
   $hEventLog = _EventLog__Open("", "Security")
   If @OSBuild > 5999 Then	;later 2008 save as evtx
	  _EventLog__Backup($hEventLog, @computername & "\Sec.evtx")
   Else
	  _EventLog__Backup($hEventLog, @computername & "\Sec.evt")
   EndIf
   _EventLog__Close($hEventLog)
   #cs
   $objWMIService = ObjGet("winmgmts:{impersonationLevel=impersonate,(Backup, Security)}!\\"&@computername&"\root\cimv2")
   for $logname in $objWMIService.InstancesOf("Win32_NTEventLogFile")
	  $currenteventlog = @computername & "\sec.evt"
	  $retcode = $logname.BackupEventLog($currenteventlog)
	  While $retcode <> 0
		 if $retcode == 183 Then
			if MsgBox(262196,"Event Log Backup","File: " & $currenteventlog & " already exists. Do you wish to replace it?") == 6 Then
			   if FileDelete ($currenteventlog) == 0 Then
				  Return -1
			   Else
				  $retcode = $logname.BackupEventLog($currenteventlog)
			   EndIf
			Else
			   Return -1
			EndIf
		 elseif $retcode == 5 Then
			MsgBox(262160,"Event Log Backup","Unable to backup " & $logname.LogfileName & " Event Log due to insufficient permissions")
			Return -1
		 EndIf
	  WEnd
   Next
   #ce
   _GUICtrlEdit_AppendText($Edit1,"Event Log�ƥ�����" & @CRLF)
EndFunc

Func CollectEventLogByGUI()	;eventvwr.exe
   $g_nProcessPID = Run("eventvwr.exe");Get Process ID
   WinWaitActive("[Class:MMCMainFrame]", "", 60)	;wait for window
   $st = WinGetPos("[Class:MMCMainFrame]")	;���o������m
EndFunc

Func CollectNonVerify()	;���Ncollnovi.vbs
   Dim $a_lines, $i, $a_temp
   $rc = _FileReadToArray(@computername & "\sigcheck.csv", $a_lines)
   If $rc <> 0 Then
	  For $i = 2 To $a_lines[0]
		 $a_temp = StringSplit($a_lines[$i], ",")
		 If IsArray($a_temp) And $a_temp[0] > 0 Then
            $Pos = StringInStr($a_temp[2],"Unsigned")	;
			If $Pos <> 0 Then
			   If FileExists(StringReplace($a_temp[1],"""","")) Then
				  FileCopy(StringReplace($a_temp[1],"""",""),@COMPUTERNAME & "\suspicious")
			   EndIf
            EndIf
		 EndIf
	  Next
   EndIf
EndFunc

Func CollectNoClean()	;Get not clean file
   Local $oscelogpath = "C:\Program Files (x86)\Trend Micro\OfficeScan Client\Misc\pccnt35.log"
   If @OSArch = "X86" Then
	  $oscelogpath = "C:\Program Files\Trend Micro\OfficeScan Client\Misc\pccnt35.log"
   EndIf
   Local $a_lines, $i, $a_temp
   $rc = _FileReadToArray($oscelogpath, $a_lines)
   If $rc <> 0 Then
	  For $i = 1 To $a_lines[0]
		 $a_temp = StringSplit($a_lines[$i], "<;>")
		 If IsArray($a_temp) And $a_temp[0] > 0 Then
            ;$Pos = StringInStr($a_temp[4],"(Not verified)")	;�쥼���Ҫ�
			;If $Pos <> 0 Then
			   ;$fil = StringInStr($a_temp[7],"File not found:")	;���L�ɮפ��s�b��
			   ;If $fil = 0 Then
				  FileCopy(StringReplace($a_temp[7],"""",""),@COMPUTERNAME & "\suspicious")
			   ;EndIf
            ;EndIf
		 EndIf
	  Next
   EndIf
EndFunc

Func CollectSuspicious()	;$B11
   _GUICtrlEdit_AppendText($Edit1,"�}�l����Autoruns��쪺�i���ɮ�" & @CRLF)
   ;RunWait(@ComSpec & ' /c ' & 'WScript collauto.vbs', '', @SW_HIDE)
   CollectAuto()
   _GUICtrlEdit_AppendText($Edit1,"Autoruns��쪺�i���ɦ�������" & @CRLF)
   _GUICtrlEdit_AppendText($Edit1,"�}�l����sigcheck��쪺�i���ɮ�" & @CRLF)
   ;RunWait(@ComSpec & ' /c ' & 'WScript collnovi.vbs', '', @SW_HIDE)
   CollectNonVerify()
   _GUICtrlEdit_AppendText($Edit1,"sigcheck��쪺�i���ɦ�������" & @CRLF)
EndFunc

Func CollectSystemInfo()	;$B7
   _GUICtrlEdit_AppendText($Edit1,"�}�l�����t�θ�T" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'for /f "skip=1 tokens=3 delims=," %i in (' & "'" & '"getmac /v /fo csv"' & "'" & ') do echo %i >> %COMPUTERNAME%\pcinfo.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'ipconfig /all >> %COMPUTERNAME%\pcinfo.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'net user >> %COMPUTERNAME%\pcinfo.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'net localgroup administrators >> %COMPUTERNAME%\pcinfo.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'Auditpol.exe /get /Category:* > %COMPUTERNAME%\auditpol.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'tasklist /svc /fo CSV > %computername%\tasklistservice.csv', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'tasklist /M /fo CSV > %computername%\tasklistM.csv', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'listdlls > %computername%\listdlls.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'net share >> %COMPUTERNAME%\pcinfo.txt', '', @SW_HIDE)
   RunWait(@ComSpec & ' /c ' & 'tcpvcon /acn > %computername%\tcpview.csv', '', @SW_HIDE)
   ;CollectTaskList()
   ;CollectTaskListService()
   ;CollectTaskListDLL()
   Run(@ComSpec & ' /c ' & 'xcopy %windir%\prefech %COMPUTERNAME%\prefetch /S /D /Y', '', @SW_HIDE)	;����prefech
   Run(@ComSpec & ' /c ' & 'xcopy %windir%\prefetch %COMPUTERNAME%\prefetch /S /D /Y', '', @SW_HIDE)
   Run(@ComSpec & ' /c ' & 'xcopy %windir%\SCHEDLGU.TXT %COMPUTERNAME%\ /D /Y', '', @SW_HIDE)	;����Schedul Task Log
   Run(@ComSpec & ' /c ' & 'xcopy %windir%\Tasks\SCHEDLGU.TXT %COMPUTERNAME%\ /D /Y', '', @SW_HIDE)
   Run(@ComSpec & ' /c ' & 'xcopy %windir%\PEAgent %COMPUTERNAME%\PEAgent /S /D /Y', '', @SW_HIDE)	;����PEAgent�U�Ҧ��ɮ�(�tTDME DB)
   _GUICtrlEdit_AppendText($Edit1,"�t�θ�T��������" & @CRLF)
EndFunc

Func CollectTaskList()	;��TaskList
   _GUICtrlEdit_AppendText($Edit1,"�}�l����TaskList" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'tasklist /fo CSV > %COMPUTERNAME%\tasklist.csv', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"TaskList��������" & @CRLF)
EndFunc

Func CollectTaskListDLL()	;����tasklist�̨C��process���JDLL
   _GUICtrlEdit_AppendText($Edit1,"�}�l����TaskList�̨C��process���JDLL" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'tasklist /M /fo CSV > %computername%\tasklistM.csv', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"TaskList�̨C��process���JDLL��������" & @CRLF)
EndFunc

Func CollectTaskListDlls()	;�����Ҧ�process���JDLL����ڦ�}
   _GUICtrlEdit_AppendText($Edit1,"�����Ҧ�process���JDLL����ڦ�}" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'tasklist > %computername%\listdlls.txt', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"�Ҧ�process���JDLL����ڦ�}��������" & @CRLF)
EndFunc

Func CollectTaskListService()	;����tasklist�ۨ�services
   _GUICtrlEdit_AppendText($Edit1,"�}�l����TaskList�ۨ�services" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'tasklist /svc /fo CSV > %computername%\tasklistservice.csv', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"TaskList�ۨ�services��������" & @CRLF)
EndFunc

Func CollectTaskScheduler()
   _GUICtrlEdit_AppendText($Edit1,"�}�l�����u�@�Ƶ{�����Ҧ��u�@�Ƶ{" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'schtasks /query /FO CSV /V > %computername%\taskscheduler.csv', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"�u�@�Ƶ{�����Ҧ��u�@�Ƶ{��������" & @CRLF)
EndFunc

Func CollectTDMELog()	;$B9
   _GUICtrlEdit_AppendText($Edit1,"�}�l����TDME Log" & @CRLF)
   RunWait(@ComSpec & ' /c ' & 'xcopy %windir%\PEAgent %COMPUTERNAME%\PEAgent /S /D /Y', '', @SW_HIDE)
   _GUICtrlEdit_AppendText($Edit1,"TDME Log��������" & @CRLF)
EndFunc

Func Terminal()	;�M�ୱ�ɮ�
   If ProcessExists("cports.exe") Then	;����Currports
	  ProcessClose("cports.exe")
	  Sleep(1000)
   EndIf
   If FileExists(@DesktopDir & "\supportcustomizedpackage.exe") Then
	  FileDelete(@DesktopDir & "\supportcustomizedpackage.exe")
   EndIf
   If FileExists(@DesktopDir & "\Result.txt") Then
	  FileDelete(@DesktopDir & "\Result.txt")
   EndIf
   If FileExists(@DesktopDir & "\TrendMicro AntiThreat Toolkit") Then
	  DirRemove(@DesktopDir & "\TrendMicro AntiThreat Toolkit",1)
   EndIf
   If FileExists(@DesktopDir & "\CDT") Then
	  DirRemove(@DesktopDir & "\CDT",1)
   EndIf
   If FileExists("cports.log") then
	  FileMove("cports.log",@computername & "\cports.csv",1)
   EndIf
   Exit
EndFunc

Func EventLogParser()	;$B6
   $Form1_2 = GUICreate("Event Log Parser", 400, 294, 369, 272)
   $Label1 = GUICtrlCreateLabel("�i�ê��n�J", 8, 8, 64, 17)
   $ListView1 = GUICtrlCreateListView("SN|Generated|Description", 8, 32, 385, 97)
   GUISetState(@SW_SHOW)
   
   Local $hEventLog,$iOldest,$iNewest,$aEvent,$reg,$eventid
   Switch @OSBuild;get os version
   Case 1381 To 3790
	  $eventid = 540
   Case 6000 To 9200
	  $eventid = 4624
   EndSwitch
   $hEventLog = _EventLog__Open ("", "Security"); Read most current event record
   $iOldest = _EventLog__Oldest($hEventLog)
   $iNewest = $iOldest + _EventLog__Count($hEventLog) - 1
   For $n = $iNewest To $iNewest - 500 Step -1
	  $aEvent = _EventLog__Read($hEventLog, True, False) ; read last event
	  If $aEvent[6] = $eventid Then
		 GUICtrlCreateListViewItem($aEvent[1]&"|"&$aEvent[4] & " " & $aEvent[5]&"|"&$aEvent[13],$ListView1)
		 ;$reg=StringRegExp($aEvent[13],"^((25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(25[0-5]|2[0-4]\d|[01]?\ d?\d)$",3) ;([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\
		 $temp = StringReplace($aEvent[13],'	',"")
		 $tempstr = StringSplit($temp,@CRLF)	;replace tab
		 If StringInStr($temp,"�n�J����:10") <> 0 Then;$aEvent[1] = 300198 Then;
			For $i = 1 to $tempstr[0]
			   $Pos = StringInStr($tempstr[$i],"�b��W��:")	;find the first word location
			   If $Pos <> 0 Then
				  $account = StringReplace($tempstr[$i],"�b��W��:","")
				  _GUICtrlEdit_AppendText($Edit1,"�b��W��:" & $account & @CRLF)
			   Else
				  $Pos = StringInStr($tempstr[$i],"�n�J�ѧO�X:")	;find the first word location
				  If $Pos <> 0 Then
					 $loginid = StringReplace($tempstr[$i],"�n�J�ѧO�X:","")
					 _GUICtrlEdit_AppendText($Edit1,"�n�J�ѧO�X:" & $loginid & @CRLF)
				  Else
					 $Pos = StringInStr($tempstr[$i],"�n�J����:")	;
					 If $Pos <> 0 Then
						$logontype = StringReplace($tempstr[$i],"�n�J����:","")
						_GUICtrlEdit_AppendText($Edit1,"�n�J����:" & $logontype & @CRLF)
					 Else
						$Pos = StringInStr($tempstr[$i],"�u�@���W��:")	;
						If $Pos <> 0 Then
						   $workstation = StringReplace($tempstr[$i],"�u�@���W��:","")
						   _GUICtrlEdit_AppendText($Edit1,"�u�@���W��:" & $workstation & @CRLF)
						EndIf
					 EndIf
				  EndIf
			   EndIf
			   ;_GUICtrlEdit_AppendText($Edit1,$tempstr[$i]& @CRLF)
			Next
		 EndIf
		 If @error = 0 Then
			;_GUICtrlEdit_AppendText($Edit1,$reg & @CRLF)
			;_GUICtrlListView_AddItem($List1,$aEvent[13],0)
		 EndIf
		 ;_ArrayDisplay($reg)
	  EndIf
	  ;_GUICtrlEdit_AppendText($Edit1,$reg & @CRLF)
	  ;GUICtrlCreateListViewItem($aEvent[6],$ListView1)
   Next
   ;GUICtrlCreateListViewItem($aEvent[1],$ListView1)
   While 1
	  $nMsg = GUIGetMsg()
	  Switch $nMsg
		 Case $GUI_EVENT_CLOSE
			GUIDelete($Form1_2)
			ExitLoop
	  EndSwitch
   WEnd
EndFunc

Func EventLog()	;$B3
   Local $temp,$tempstr,$Pos,$eventid,$lang
   $Form1_2 = GUICreate("Event Log Parser", 600, 377, 178, 124)
   $Label1 = GUICtrlCreateLabel("�i�ê��n�J", 8, 8, 64, 17)
   $ListView1 = GUICtrlCreateListView("Type|Time|IP|Account|WorkStation|Session", 8, 24, 586, 150)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 4, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 5, 50)
   $Label2 = GUICtrlCreateLabel("�����ƥ�", 8, 184, 52, 17)
   $ListView2 = GUICtrlCreateListView("SN|Time|Event|Category", 8, 208, 586, 158)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 50)
   GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 50)
   GUISetState(@SW_SHOW)
   GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
   Switch @OSBuild;get os version
   Case 1381 To 3790
	  $eventid = 540
   Case 6000 To 9201
	  $eventid = 4624
   EndSwitch
   $lang = _Language()
   $objWMIService = ObjGet("winmgmts:{impersonationLevel = impersonate}!\\.\root\cimv2")
   $colLoggedEvents = $objWMIService.ExecQuery ("Select * from Win32_NTLogEvent Where Logfile = 'Security'")
   $i = 1
   for $objevent In $colLoggedEvents
	  $account = 0
	  $loginid = 0
	  $logontype = 0
	  $workstation = 0
	  $ips = 0
	  If $i = 500 Then
		 ExitLoop
	  EndIf
	  $i = $i + 1
	  If $objevent.EventIdentifier = $eventid Then
		 $temp = StringReplace($objevent.Message,'	',"")
		 $tempstr = StringSplit($temp,@CRLF)	;replace tab
		 ;_GUICtrlEdit_AppendText($Edit1,"�b��W��:" & $lang & @CRLF);;
		 ;Select
			;Case $lang = "Chinese"
		 If StringInStr($temp,"�n�J����:10") <> 0 Then;$aEvent[1] = 300198 Then;
			For $i = 1 to $tempstr[0]
			   $Pos = StringInStr($tempstr[$i],"�b��W��:")	;find the first word location
			   If $Pos <> 0 Then
				  $account = StringReplace($tempstr[$i],"�b��W��:","")
			   Else
				  $Pos = StringInStr($tempstr[$i],"�n�J�ѧO�X:")	;find the first word location
				  If $Pos <> 0 Then
					 $loginid = StringReplace($tempstr[$i],"�n�J�ѧO�X:","")
				  Else
					 $Pos = StringInStr($tempstr[$i],"�n�J����:")	;
					 If $Pos <> 0 Then
						$logontype = StringReplace($tempstr[$i],"�n�J����:","")
					 Else
						$Pos = StringInStr($tempstr[$i],"�u�@���W��:")	;
						If $Pos <> 0 Then
						   $workstation = StringReplace($tempstr[$i],"�u�@���W��:","")
						Else
						   $Pos = StringInStr($tempstr[$i],"�ӷ�������}:")	;
						   If $Pos <> 0 Then
							  $ips = StringReplace($tempstr[$i],"�ӷ�������}:","")
						   EndIf
						EndIf
					 EndIf
				  EndIf
			   EndIf
			Next
		 ElseIf StringInStr($temp,"�n�J����:3") <> 0 Then
			For $i = 1 to $tempstr[0]
			   $Pos = StringInStr($tempstr[$i],"�b��W��:")	;find the first word location
			   If $Pos <> 0 Then
				  $account = StringReplace($tempstr[$i],"�b��W��:","")
			   Else
				  $Pos = StringInStr($tempstr[$i],"�n�J�ѧO�X:")	;find the first word location
				  If $Pos <> 0 Then
					 $loginid = StringReplace($tempstr[$i],"�n�J�ѧO�X:","")
				  Else
					 $Pos = StringInStr($tempstr[$i],"�n�J����:")	;
					 If $Pos <> 0 Then
						$logontype = StringReplace($tempstr[$i],"�n�J����:","")
					 Else
						$Pos = StringInStr($tempstr[$i],"�u�@���W��:")	;
						If $Pos <> 0 Then
						   $workstation = StringReplace($tempstr[$i],"�u�@���W��:","")
						Else
						   $Pos = StringInStr($tempstr[$i],"�ӷ�������}:")	;
						   If $Pos <> 0 Then
							  $ips = StringReplace($tempstr[$i],"�ӷ�������}:","")
						   EndIf
						EndIf
					 EndIf
				  EndIf
			   EndIf
			Next
		 EndIf
		 If $ips <> 0 Then
			GUICtrlCreateListViewItem($logontype&"|"&$objevent.TimeGenerated&"|"&$ips&"|"&$account&"|"&$workstation&"|"&$loginid,$ListView1)
		 EndIf
			;Case $lang = "English"
		 ;EndSelect
	  EndIf
   Next
   While 1
	  $nMsg = GUIGetMsg()
	  Switch $nMsg
		 Case $GUI_EVENT_CLOSE
			GUIDelete($Form1_2)
			ExitLoop
	  EndSwitch
   WEnd
EndFunc

Func EventLogP($tempstr)	;EventLog subFunction
   For $i = 1 to $tempstr[0]
	  $Pos = StringInStr($tempstr[$i],"�b��W��:")	;find the first word location
	  If $Pos <> 0 Then
		 $account = StringReplace($tempstr[$i],"�b��W��:","")
	  Else
		 $Pos = StringInStr($tempstr[$i],"�n�J�ѧO�X:")	;find the first word location
		 If $Pos <> 0 Then
			$loginid = StringReplace($tempstr[$i],"�n�J�ѧO�X:","")
		 Else
			$Pos = StringInStr($tempstr[$i],"�n�J����:")	;
			If $Pos <> 0 Then
			   $logontype = StringReplace($tempstr[$i],"�n�J����:","")
			Else
			   $Pos = StringInStr($tempstr[$i],"�u�@���W��:")	;
			   If $Pos <> 0 Then
				  $workstation = StringReplace($tempstr[$i],"�u�@���W��:","")
			   Else
				  $Pos = StringInStr($tempstr[$i],"�ӷ�������}:")	;
				  If $Pos <> 0 Then
					 $ips = StringReplace($tempstr[$i],"�ӷ�������}:","")
				  EndIf
			   EndIf
			EndIf
		 EndIf
	  EndIf
   Next
   GUICtrlCreateListViewItem($logontype&"|"&$objevent.TimeGenerated&"|"&$ips&"|"&$account&"|"&$workstation&"|"&$loginid,$ListView1)
EndFunc

Func EventLogParsers()	;��LogParser.dll�i��Event Log parser
   ; Define Objects
   $oLogQuery= ObjCreate("MSUtil.LogQuery")
   $oInputFormat=ObjCreate("MSUtil.LogQuery.EventLogInputFormat")	;��JEvent Log
   $oOutputFormat = ObjCreate("MSUtil.LogQuery.DataGridOutputFormat")  ; DataGridEndFunc
   ; Set Input Format
   ;$oInputFormat.recurse = -1 ; default -1 = All SubDir
   ;$oInputFormat.binaryFormat = "PRINT" 
   ;$oInputFormat.direction = "BW"
   ; Set Output Format Parameters -> Boolian
   ;$oOutputFormat.rtp= 10 ; Default
   ;$oOutputFormat.autoScroll = 1
   ; Create a SQL query text
   $StrQuery = "SELECT TimeGenerated,EventID,Message,Strings FROM Security WHERE EventID = 4624"
   ; Execute query and receive a LogRecordSet
   $oLogQuery.ExecuteBatch($StrQuery , $oInputFormat , $oOutputFormat)
EndFunc

Func FindFileByDate($datetime)
   
EndFunc

Func FindNetworkVirus()	;������f�r
   RunCurrPorts()	;����Cport
   Dim $a_lines, $i , $a_temp , $PID ,$j = 1
   Dim $rc
   
   If FileExists("cports.log") Then
	  ;_GUICtrlEdit_AppendText($Edit1,"Ū��CurrPorts Log" & @CRLF)
	  $rc = _FileReadToArray("cports.log", $a_lines)
	  If $rc <> 0 Then
		 For $i = $j To $a_lines[0]
		 $a_temp = StringSplit($a_lines[$i], ",")
		 ;_GUICtrlEdit_AppendText($Edit1,$a_temp[1] & @CRLF)
		 If IsArray($a_temp) And $a_temp[0] > 0 Then
			If Not $a_temp[7] = "TmProxy" Then	;���LTMProxy���s�u
			;_GUICtrlEdit_AppendText($Edit1,"��Ū����CurrPorts Log" & @CRLF)
			   $PID = $a_temp[2]	;��PID
			   If $a_temp[2] <> 0 Then
				  $fil = StringInStr($a_temp[7],"File not found:")	;���L�ɮפ��s�b��
				  If FileExists(_PidGetPath($PID)) Then
					 FileCopy(_PidGetPath($PID),@COMPUTERNAME & "\suspicious")	;0 = (default) do not overwrite existing files
					 ;_GUICtrlEdit_AppendText($Edit1,"�ƻs�ɮ�" & @CRLF)
				  EndIf
			   EndIf
			EndIf
		 EndIf
		 Next
		 $j = $i
	  EndIf
   EndIf
EndFunc

Func FindTrace()
   ;��X�i�ê��ɶ��I 1.��Task�إ� 2.�䲧�`service�إ� 3.��i�äu��(ex. rar.exe,psexec.exe)�إ߮ɶ�
EndFunc

Func FindVirus()	;$B20
   RunCurrPorts()
   CollectSystemInfo()
   ATTKNoGUI()
   Autoruns()
   ;CheckSign()
   CollectSuspicious()
   _GUICtrlEdit_AppendText($Edit1,"��f�r���槹��" & @CRLF)
EndFunc

Func FindVirusFrequency()
   ;�C�X�Ҧ���connection��Process
   ;��X����~�s��process
   ;
EndFunc

Func Forensic()	;$B19
   RunCurrPorts()
   CollectSystemInfo()
   ;ATTKNoGUI()
   Autoruns()
   CheckSign()
   CollectDir()
   CollectEventLog()
   CollectSuspicious()
   _GUICtrlEdit_AppendText($Edit1,"Ų�Ѱ��槹��" & @CRLF)
EndFunc

Func MyErrFunc()	;This is Sven P's custom error handler
  $HexNumber=hex($oMyError.number,8)
  Msgbox(0,"AutoItCOM Test","We intercepted a COM Error !"       & @CRLF  & @CRLF & _
			 "err.description is: "    & @TAB & $oMyError.description    & @CRLF & _
			 "err.windescription:"     & @TAB & $oMyError.windescription & @CRLF & _
			 "err.number is: "         & @TAB & $HexNumber              & @CRLF & _
			 "err.lastdllerror is: "   & @TAB & $oMyError.lastdllerror   & @CRLF & _
			 "err.scriptline is: "     & @TAB & $oMyError.scriptline     & @CRLF & _
			 "err.source is: "         & @TAB & $oMyError.source         & @CRLF & _
			 "err.helpfile is: "       & @TAB & $oMyError.helpfile       & @CRLF & _
			 "err.helpcontext is: "    & @TAB & $oMyError.helpcontext _
			)
  SetError(1)  ; to check for after this function returns
Endfunc

Func RunAutoruns()	;$B13
   Run("autoruns.exe")
EndFunc

Func RunCurrPorts()	;��TCP Log
   Local $p
   IF NOT ProcessExists("cports.exe") Then
	  If FileExists("cports.log") then
		 FileDelete("cports.log")
	  EndIf
	  $p = Run("cports.exe")
	  If $p <> 0 Then
		 _GUICtrlEdit_AppendText($Edit1,"�}�l����CurrPorts" & @CRLF)
	  EndIf
   EndIf
EndFunc

Func RunDrWeb()	;$B16
   ;_RunDos('Listdlls.exe')
   _GUICtrlEdit_AppendText($Edit1,"�}�l�U��Dr.Web" & @CRLF)
   InetGet("http://download.geo.drweb.com/pub/drweb/cureit/cureit.exe")
   FileMove("cureit.exe",@DesktopDir)
   _GUICtrlEdit_AppendText($Edit1,"����Dr.Web" & @CRLF)
   Run(@DesktopDir & "\cureit.exe")
EndFunc

Func RunPeStudio()	;$B18
   Run("PeStudio.exe")
EndFunc

Func RunProcessExplorer()	;$B14
   Run("procexp.exe")
EndFunc

Func RunProcessMon()	;$B17
   Run("Procmon.exe")
EndFunc

Func RunSystemExplorer()	;$B21
   Local $se,$st
   $se = Run("SystemExplorer.exe")
   WinWaitActive("System Explorer","",5)
   _GUICtrlEdit_AppendText($Edit1,"����System Explorer" & @CRLF)
   Sleep(5000)
   If WinActive("System Explorer License") <> 0 Then;if it show license window
	  ControlClick("System Explorer License","","[Class:TTntButton.UnicodeClass; Instance:2]")
   EndIf
   WinWaitActive("[Class:TMainForm.UnicodeClass]","",10)
   Sleep(3000)
   ControlClick("[Class:TMainForm.UnicodeClass]","","[Class:TTntPanel.UnicodeClass; Instance:7]","left",1,50,12) ;security scan
   WinWaitActive("System Explorer Security Check","",5)
   ControlClick("System Explorer Security Check","","[Class:TTntButton.UnicodeClass; Instance:2]")	;star security check
   ;see the results of the security check
   $st = WinGetPos("System Explorer Security Check")
   While 1
	  $color = PixelGetColor($st[0]+250,$st[1]+124)
	  _GUICtrlEdit_AppendText($Edit1,$color & @CRLF)
	  If $color <> 0x0000FF Then;see the results of the security check
		 Sleep(6000)
	  Else
		 ControlClick("System Explorer Security Check", "","[Class:TTntButton.UnicodeClass; Instance:2]","left",1,0,-25)	;click
		 ExitLoop
	  EndIf
   WEnd
EndFunc

Func RunTCPView()	;$B15
   Run("Tcpview.exe")
EndFunc

Func TDMEParser()	;$B5
   _RunDos('TMLESParser.exe %COMPUTERNAME%\ %COMPUTERNAME%\%COMPUTERNAME%.txt')
EndFunc

Func ShowServices()	;��Autoruns�C�X���`Service����
   _GUICtrlEdit_AppendText($Edit1,"�}�l�C�X���`�A�Ȫ��إ߮ɶ�" & @CRLF)
   Dim $a_lines, $i, $a_temp,$Arr[10],$a = 1
   $rc = _FileReadToArray(@computername & "\autorun.csv", $a_lines)
   If $rc <> 0 Then
	  For $i = 2 To $a_lines[0]
		 $a_temp = StringSplit($a_lines[$i], ",")
		 If IsArray($a_temp) And $a_temp[0] > 0 Then
			$category = StringInStr($a_temp[4],"Services")	;��service
			If $category <> 0 Then
			   $Pos = StringInStr($a_temp[6],"(Not verified)")	;�쥼���Ҫ�
			   If $Pos <> 0 Then
				  $fil = StringInStr($a_temp[7],"File not found:")	;���L�ɮפ��s�b��
				  If $fil = 0 Then
					 _GUICtrlEdit_AppendText($Edit1,$a_temp[5] & @CRLF)
					 $Arr[$a] = FileGetTime(StringReplace($a_temp[7],"""",""),0,1)	;0 = Modified (default),1 = Created,2 = Accessed
					 _GUICtrlEdit_AppendText($Edit1,$Arr[$a] & @CRLF)	;;
					 $a = $a + 1
				  EndIf
			   EndIf
			EndIf
		 EndIf
	  Next
   EndIf
   _GUICtrlEdit_AppendText($Edit1,"�C�X���`�A�Ȫ��إ߮ɶ����槹��" & @CRLF)
EndFunc

Func Verify($filename,$filepath = @COMPUTERNAME)	;��virustotal����
   Local $file,$l_temp,$sr,$i,$scan_date,$permalink,$positives
   $sVirusTotalAPIkey = "3125370d31339f3f038b207ab207b7287b7afec5561568ee07ba7277a754c509"
   $file = $filepath & "\" & $filename
   $bHash = _FileHashSHA256($file);"1111111111111111111111111111111111111111111111111111111111111111"
   Local $hVirusTotal = VT_Open()
   $sr = VT($hVirusTotal, $fReport,$bHash,$sVirusTotalAPIkey)
   VT_Close($hVirusTotal)
   $l_temp = StringSplit(StringReplace($sr,"""",""),",")
   If $l_temp[0] > 4 Then
   For $i = $l_temp[0] To $l_temp[0] - 10 Step -1
	  If StringInStr($l_temp[$i],"response_code: 0") <> 0 Then	;�p�G�S�H���L
		 ExitLoop
	  ElseIf StringInStr($l_temp[$i],"scan_date:") > 0 Then
		 $scan_date = StringReplace($l_temp[$i],"scan_date:","")
	  ElseIf StringInStr($l_temp[$i],"permalink:") > 0 Then
		 $permalink = StringReplace($l_temp[$i],"permalink:","")
	  ElseIf StringInStr($l_temp[$i],"positives:") > 0 Then
		 $positives = StringReplace($l_temp[$i],"positives:","")
	  EndIf
   Next
   EndIf
   If $scan_date = "" Then
	  _GUICtrlEdit_AppendText($Edit1,$filename & "���ɮרS�H�e�汽�y�L�A�ܥi��" & @CRLF)
   Else
	  _GUICtrlEdit_AppendText($Edit1,$filename & "���y���G:" & $positives & "�a�{�����r" & @CRLF)
   EndIf
   Return SetError(0,0,$positives)
EndFunc

Func VerifyWeb($filename)
   ;$strQueryURL = "https://www.virustotal.com/en/file/";54e59741dcc19162836e0b6b97dce391068c44c13e62374c5cf4ddd9b7ff40ce/analysis/"
   $file = @COMPUTERNAME & "\suspicious\" & $filename
   $bHash = _FileHashSHA256($file)
   $sURL = "https://www.virustotal.com/en/file/" & $bHash & "/analysis/"
   _GUICtrlEdit_AppendText($Edit1,HttpGet($sURL) & @CRLF)
   $oIE = _IECreate ("http://www.hotmail.com")
EndFunc

Func Test()
   Local $foldere,$i,$t = 0
   $foldere = _FileListToArray(@COMPUTERNAME & "\suspicious", "*.exe", 1)
   If $foldere[0] > 1 Then
	  For $i = 1 To $foldere[0] Step 1
		 If Mod($t,4) = 0 Then
			Sleep(60000)
		 EndIf
		 ;If Not $foldere[$i] = "iSleep.exe" Then
			Verify($foldere[$i])
			$t = $t + 1
		 ;EndIf
	  Next
   EndIf
   $foldere = _FileListToArray(@COMPUTERNAME & "\suspicious", "*.dll", 1)
   If $foldere[0] > 1 Then
	  For $i = 1 To $foldere[0] Step 1
		 If Mod($t,4) = 0 Then
			Sleep(60000)
		 EndIf
		 ;If Not $folders[$i] = "7-zip.dll" Then
			Verify($foldere[$i])
			$t = $t + 1
		 ;EndIf
	  Next
   EndIf
   $foldere = _FileListToArray(@COMPUTERNAME & "\suspicious", "*.sys", 1)
   If $foldere <> 0 Then
	  For $i = 1 To $foldere[0] Step 1
		 If Mod($t,4) = 0 Then
			Sleep(60000)
		 EndIf
		 Verify($foldere[$i])
		 $t = $t + 1
	  Next
   EndIf
   $foldere = _FileListToArray(@COMPUTERNAME & "\suspicious", "*.cmd", 1)
   If $foldere <> 0 Then
	  For $i = 1 To $foldere[0] Step 1
		 If Mod($t,4) = 0 Then
			Sleep(60000)
		 EndIf
		 Verify($foldere[$i])
		 $t = $t + 1
	  Next
   EndIf
EndFunc

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
   #forceref $hWnd, $iMsg, $iwParam
   Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
   $hWndListView = $ListView1
   If Not IsHWnd($ListView1) Then $hWndListView = GUICtrlGetHandle($ListView1)

   $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
   $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
   $iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
   $iCode = DllStructGetData($tNMHDR, "Code")
   Switch $hWndFrom
	  Case $hWndListView
		 Switch $iCode
		 Case $NM_CLICK ; Sent by a list-view control when the user clicks an item with the left mouse button
			$tInfo = DllStructCreate($tagNMITEMACTIVATE, $ilParam)
;~ do something, for testing i use message box.
			;MsgBox(4160, "TEST", "Selected Item: " & GUICtrlRead($ListView1))
			MsgBox(4160,"Information","EventNumber:" & GUICtrlRead($ListView1))
	  EndSwitch
   EndSwitch
   Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _Language()
Select
   Case StringInStr("0404 0804 0c04 1004 1404", @OSLang)
	  Return "Chinese"
   
   Case StringInStr("0413 0813", @OSLang)
	  Return "Dutch"

   Case StringInStr("0409 0809 0c09 1009 1409 1809 1c09 2009 2409 2809 2c09 3009 3409", @OSLang)
	  Return "English"

   Case StringInStr("040c 080c 0c0c 100c 140c 180c", @OSLang)
	  Return "French"

   Case StringInStr("0407 0807 0c07 1007 1407", @OSLang)
	  Return "German"

   Case StringInStr("0410 0810", @OSLang)
	  Return "Italian"

   Case StringInStr("0414 0814", @OSLang)
	  Return "Norwegian"

   Case StringInStr("0415", @OSLang)
	  Return "Polish"

   Case StringInStr("0416 0816", @OSLang)
	  Return "Portuguese"

   Case StringInStr("040a 080a 0c0a 100a 140a 180a 1c0a 200a 240a 280a 2c0a 300a 340a 380a 3c0a 400a 440a 480a 4c0a 500a", @OSLang)
	  Return "Spanish"

   Case StringInStr("041d 081d", @OSLang)
	  Return "Swedish"

   Case Else
	  Return "Other (can't determine with @OSLang directly)"

   EndSelect
EndFunc
 
Func _ExtractZip($sZipFile, $sDestinationFolder, $sFolderStructure = "")

    Local $i
    Do
        $i += 1
        $sTempZipFolder = @TempDir & "\Temporary Directory " & $i & " for " & StringRegExpReplace($sZipFile, ".*\\", "")
    Until Not FileExists($sTempZipFolder) ; this folder will be created during extraction

    Local $oShell = ObjCreate("Shell.Application")

    If Not IsObj($oShell) Then
        Return SetError(1, 0, 0) ; highly unlikely but could happen
    EndIf

    Local $oDestinationFolder = $oShell.NameSpace($sDestinationFolder)
    If Not IsObj($oDestinationFolder) Then
        DirCreate($sDestinationFolder)
;~         Return SetError(2, 0, 0) ; unavailable destionation location
    EndIf

    Local $oOriginFolder = $oShell.NameSpace($sZipFile & "\" & $sFolderStructure) ; FolderStructure is overstatement because of the available depth
    If Not IsObj($oOriginFolder) Then
        Return SetError(3, 0, 0) ; unavailable location
    EndIf

    Local $oOriginFile = $oOriginFolder.Items();get all items
    If Not IsObj($oOriginFile) Then
        Return SetError(4, 0, 0) ; no such file in ZIP file
    EndIf

    ; copy content of origin to destination
    $oDestinationFolder.CopyHere($oOriginFile, 20) ; 20 means 4 and 16, replaces files if asked

    DirRemove($sTempZipFolder, 1) ; clean temp dir

    Return 1 ; All OK!

EndFunc

Func _FileHashMD5($sFile, $iRunErrorsFatal = -1, $vEXEPath = 0)
    Local $sEXEPath, $hPID, $sLine, $iFileNameLen, $sHash, $iOPT
    If Not FileExists($sFile) or StringInStr(FileGetAttrib($sFile),"D") or StringInStr($sFile,"?") or StringInStr($sFile,"?") or Not StringInStr($sFile,"\") Then
        SetError(1)
        Return ""
    EndIf
    If Not ($iRunErrorsFatal = 0 Or $iRunErrorsFatal = 1 Or $iRunErrorsFatal = -1) Then
        SetError(2)
        Return ""
    EndIf
    If $vEXEPath = 0 Then
        $sEXEPath = @ScriptDir & "\md5deep.exe"
    Else
        $sEXEPath = $vEXEPath
    EndIf
    If $iRunErrorsFatal <> - 1 Then $iOPT = opt("RunErrorsFatal", $iRunErrorsFatal)
    $hPID = Run('"' & $sEXEPath & '" "' & $sFile & '"', @SystemDir, @SW_HIDE, 6)
    If @error Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(3)
        Return ""
    EndIf
    ProcessWaitClose($hPID)
    $sLine = StdoutRead ($hPID)
    $iFileNameLen = StringLen($sFile)
    $sLine = StringTrimRight($sLine, 2)
    If Not StringLen($sLine) = 33 + $iFileNameLen Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(4)
        Return ""
    EndIf
    If StringRight($sLine, $iFileNameLen) <> $sFile Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(4)
        Return ""
    EndIf
    $sHash = StringLeft($sLine, 32)
    If Not StringIsXDigit($sHash) Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(0)
        Return $sHash
        SetError(4)
        Return ""
    EndIf
    If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
    SetError(0)
    Return $sHash
EndFunc ;==>_FileHashMD5

Func _FileHashSHA1($sFile, $iRunErrorsFatal = -1, $vEXEPath = 0)
    Local $sEXEPath, $hPID, $sLine, $iFileNameLen, $sHash, $iOPT
    If Not FileExists($sFile) or StringInStr(FileGetAttrib($sFile),"D") or StringInStr($sFile,"?") or StringInStr($sFile,"?") or Not StringInStr($sFile,"\") Then
        SetError(1)
        Return ""
    EndIf
    If Not ($iRunErrorsFatal = 0 Or $iRunErrorsFatal = 1 Or $iRunErrorsFatal = -1) Then
        SetError(2)
        Return ""
    EndIf
    If $vEXEPath = 0 Then
        $sEXEPath = @ScriptDir & "\sha1deep.exe"
    Else
        $sEXEPath = $vEXEPath
    EndIf
    If $iRunErrorsFatal <> - 1 Then $iOPT = opt("RunErrorsFatal", $iRunErrorsFatal)
    $hPID = Run('"' & $sEXEPath & '" "' & $sFile & '"', @SystemDir, @SW_HIDE, 6)
    If @error Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(3)
        Return ""
    EndIf
    ProcessWaitClose($hPID)
    $sLine = StdoutRead ($hPID)
    $iFileNameLen = StringLen($sFile)
    $sLine = StringTrimRight($sLine, 2)
    If Not StringLen($sLine) = 41 + $iFileNameLen Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(4)
        Return ""
    EndIf
    If StringRight($sLine, $iFileNameLen) <> $sFile Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(4)
        Return ""
    EndIf
    $sHash = StringLeft($sLine, 40)
    If Not StringIsXDigit($sHash) Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(0)
        Return $sHash
        SetError(4)
        Return ""
    EndIf
    If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
    SetError(0)
    Return $sHash
EndFunc ;==>_FileHashSHA1

Func _FileHashSHA256($sFile, $iRunErrorsFatal = -1, $vEXEPath = 0)
    Local $sEXEPath, $hPID, $sLine, $iFileNameLen, $sHash, $iOPT
    If Not FileExists($sFile) or StringInStr(FileGetAttrib($sFile),"D") or StringInStr($sFile,"?") or StringInStr($sFile,"?") Then;or Not StringInStr($sFile,"\") 
        SetError(1)
        Return ""
    EndIf
    If Not ($iRunErrorsFatal = 0 Or $iRunErrorsFatal = 1 Or $iRunErrorsFatal = -1) Then
        SetError(2)
        Return ""
    EndIf
    If $vEXEPath = 0 Then
	    If @OSArch = "X86" Then
        $sEXEPath = @ScriptDir & "\sha256deep.exe"
		 Else
			$sEXEPath = @ScriptDir & "\sha256deep64.exe"
		 EndIf
    Else
        $sEXEPath = $vEXEPath
    EndIf
    If $iRunErrorsFatal <> - 1 Then $iOPT = opt("RunErrorsFatal", $iRunErrorsFatal)
    $hPID = Run('"' & $sEXEPath & '" "' & $sFile & '"', @ScriptDir, @SW_HIDE, 6)
    If @error Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(3)
        Return ""
    EndIf
    ProcessWaitClose($hPID)
    $sLine = StdoutRead ($hPID)
    $iFileNameLen = StringLen($sFile)
    $sLine = StringTrimRight($sLine, 2)
    ;If Not StringLen($sLine) = 65 + $iFileNameLen Then
    ;    If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
     ;   SetError(4)
    ;    Return ""
    ;EndIf
    ;If StringRight($sLine, $iFileNameLen) <> $sFile Then
    ;    If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
    ;    SetError(4)
    ;    Return ""
    ;EndIf
    $sHash = StringLeft($sLine, 64)
    If Not StringIsXDigit($sHash) Then
        If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
        SetError(0)
        Return $sHash
        SetError(4)
        Return ""
    EndIf
    If $iRunErrorsFatal <> - 1 Then opt("RunErrorsFatal", $iOPT)
    SetError(0)
    Return $sHash
 EndFunc ;==>
 
Func HttpPost($sURL, $sData = "")
Local $oHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")

$oHTTP.Open("POST", $sURL, False)
If (@error) Then Return SetError(1, 0, 0)

$oHTTP.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")

$oHTTP.Send($sData)
If (@error) Then Return SetError(2, 0, 0)

If ($oHTTP.Status <> $HTTP_STATUS_OK) Then Return SetError(3, 0, 0)

Return SetError(0, 0, $oHTTP.ResponseText)
EndFunc

Func HttpGet($sURL, $sData = "")
Local $oHTTP = ObjCreate("WinHttp.WinHttpRequest.5.1")

$oHTTP.Open("GET", $sURL, False)
If (@error) Then Return SetError(1, 0, 0)

$oHTTP.Send()
If (@error) Then Return SetError(2, 0, 0)

If ($oHTTP.Status <> $HTTP_STATUS_OK) Then Return SetError(3, 0, 0)

Return SetError(0, 0, $oHTTP.ResponseText)
EndFunc

Func _PidGetPath($pid = "", $strComputer = 'localhost')
    If $pid = "" Then $pid = WinGetProcess(WinGetTitle(""))
    $wbemFlagReturnImmediately = 0x10
    $wbemFlagForwardOnly = 0x20
    $colItems = ""
    $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\CIMV2")
    $colItems = $objWMIService.ExecQuery ("SELECT * FROM Win32_Process WHERE ProcessId = " & $pid, "WQL", $wbemFlagReturnImmediately + $wbemFlagForwardOnly)
    If IsObj($colItems) Then
        For $objItem In $colItems
            If $objItem.ExecutablePath Then Return $objItem.ExecutablePath
        Next
    EndIf
EndFunc   ;==>_PidGetPath
 
; #FUNCTION#;===============================================================================
;
; Name...........: _ProcessGetLoadedModules
; Description ...: Returns an array containing the full path of the loaded modules
; Syntax.........: _ProcessGetLoadedModules($iPID)
; Parameters ....:
; Return values .: Success - An array with all the paths
;               : Failure - -1 and @error=1 if the specified process couldn't be opened.
; Author ........: Andreas Karlsson (monoceres) & ProgAndy
; Modified.......:
; Remarks .......:
; Related .......: 
; Link ..........;
; Example .......; No
;
;;==========================================================================================
Func _ProcessGetLoadedModules($iPID)
    Local Const $PROCESS_QUERY_INFORMATION=0x0400
    Local Const $PROCESS_VM_READ=0x0010
    Local $aCall, $hPsapi=DllOpen("Psapi.dll")
    Local $hProcess, $tModulesStruct
    $tModulesStruct=DllStructCreate("hwnd [200]")
    Local $SIZEOFHWND = DllStructGetSize($tModulesStruct)/200
    $hProcess=_WinAPI_OpenProcess(BitOR($PROCESS_QUERY_INFORMATION,$PROCESS_VM_READ),False,$iPID)
    If Not $hProcess Then Return SetError(1,0,-1)
    $aCall=DllCall($hPsapi,"int","EnumProcessModules","ptr",$hProcess,"ptr",DllStructGetPtr($tModulesStruct),"dword",DllStructGetSize($tModulesStruct),"dword*","")
    If $aCall[4]>DllStructGetSize($tModulesStruct) Then
        $tModulesStruct=DllStructCreate("hwnd ["&$aCall[4]/$SIZEOFHWND&"]")
        $aCall=DllCall($hPsapi,"int","EnumProcessModules","ptr",$hProcess,"ptr",DllStructGetPtr($tModulesStruct),"dword",$aCall[4],"dword*","")
    EndIf
    Local $aReturn[$aCall[4]/$SIZEOFHWND]
    For $i=0 To Ubound($aReturn)-1
        
$aCall=DllCall($hPsapi,"dword","GetModuleFileNameExW","ptr",$hProcess,"ptr",DllStructGetData($tModulesStruct,1,$i+1),"wstr","","dword",65536)
$aReturn[$i]=$aCall[3]
    
Next
    _WinAPI_CloseHandle($hProcess)
    DllClose($hPsapi)
    Return $aReturn
EndFunc