program WinMain;

{$APPTYPE GUI}

uses
  Windows,
  XCGUI in 'XCGUI.pas';

var
hWindow:Integer ;
hBtn:Integer ;
hImageWnd:Integer ;
hImage:Integer ;
begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,xc_window_style_default);  //��������
  hBtn := XBtn_Create(0,0,50,20,'�ر�',hWindow);
  XBtn_SetType(hBtn,button_type_close);


  hBtn := XBtn_Create(100,150,34,28,'',hWindow );
  //139 * 28  {34 *28 }
  hImage :=  XImage_LoadFileRect('taskmgrwnd_toolbar_vip_icon.png',
  0,0,34,28);
  XBtn_AddBkImage(hBtn,button_state_leave,hImage);

  hImage :=  XImage_LoadFileRect('taskmgrwnd_toolbar_vip_icon.png',
  35,0,34,28);
  XBtn_AddBkImage(hBtn,button_state_stay,hImage);

   hImage :=  XImage_LoadFileRect('taskmgrwnd_toolbar_vip_icon.png',
  70,0,34,28);
  XBtn_AddBkImage(hBtn,button_state_down,hImage);

  hImage :=  XImage_LoadFileRect('taskmgrwnd_toolbar_vip_icon.png',
  105,0,34,28);
  XBtn_AddBkImage(hBtn,button_state_disable,hImage);

  XEle_EnableBkTransparent(hBtn ,True );
  XEle_EnableDrawFocus(hBtn ,False);

  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.
