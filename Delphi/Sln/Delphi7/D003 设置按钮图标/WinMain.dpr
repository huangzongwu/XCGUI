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

  hBtn := XBtn_Create(0,0,50,50,'��ť',hWindow);
  //Ϊ��ť����ͼ��
  XBtn_SetIcon(hBtn,XImage_LoadFile('Zhong.png',False));
  //���ð�ťͼ��������
  XBtn_SetIconAlign(hBtn,button_icon_align_top);


  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.
