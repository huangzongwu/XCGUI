program WinMain;

{$APPTYPE GUI}

uses
  Windows,
  XCGUI in 'XCGUI.pas';

var
hWindow:Integer ;
hBtn:Integer ;
hImageWnd:Integer ;
hBkInfoM:Integer;
begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,xc_window_style_default);  //��������
  hBtn := XBtn_Create(0,0,50,50,'�ر�',hWindow);
  XBtn_SetType(hBtn,button_type_close);
  hImageWnd := XImage_LoadFileAdaptive('j.JPG',18,21,72,65);
  //���ַ����岼�� | �� �� �� �� �� ���ڳ��� window_state_��ͷ����������
  hBkInfoM := XWnd_GetBkInfoManager(hWindow);
  XBkInfoM_AddImage(hBkInfoM,window_state_body_leave,hImageWnd);


  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.
