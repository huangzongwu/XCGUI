program WinMain;

{$APPTYPE GUI}

uses
  Windows,
  XCGUI in 'XCGUI.pas';

var
hWindow:Integer ;
hBtn:Integer ;
//rt:RECT;
//pRt:TRECT;

function OnClick(pbHandle : PBoolean):Integer;stdcall ;
begin
  MessageBox(0,'�Ų�','��ô�ɫ',MB_OK);
   Result := 0;
end;

begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,xc_window_style_default);  //��������

//  hBtn := XBtn_Create(0,0,50,50,'���ǰ�ť',hWindow);
//  XEle_RegEventC(hBtn,34,Integer(@OnClick) );
//  XWnd_GetBodyRect(hWindow,@rt);
  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.
