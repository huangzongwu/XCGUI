program WinMain;

{$APPTYPE GUI}

uses
  Windows,
  XCGUI in 'XCGUI.pas';


var
  hWindow:Integer ;
begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ

  XC_LoadResource('QQTest\\resource.xml','QQTest');
  hWindow := XC_LoadLayout('QQTest\\Layout.xml',0);

  XWnd_AdjustLayout(hWindow);
  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.
