program WinMain;

{$APPTYPE GUI}

uses
  Windows,SysUtils,
  XCGUI in 'XCGUI.pas';


var
  hWindow : Integer ;
  hEle : Integer ;
  hImageList: array[0..9] of  Integer;
  i : Integer ;
  buff : WideString;

begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,15);  //��������

  hEle := XSView_Create(0,0,500,300,hWindow);
  XEle_Create(0,0,100,100,hEle);

  XSView_SetTotalSize(hEle,800,800);


  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.


