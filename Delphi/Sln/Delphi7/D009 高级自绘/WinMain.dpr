program WinMain;

{$APPTYPE GUI}

uses
  Windows,
  XCGUI in 'XCGUI.pas';

//function OnPaint(hDraw:Integer ; pbHandled:PBoolean): Integer ;stdcall  ;
//var
//  pt :TPOINT;
//  dc : Integer;
//begin
//
//  dc := XDraw_GetHDC(hDraw);
//  SetTextColor(dc,255);
//  TextOut(dc,0,0,'dasemimi',8);
//
//  pbHandled^ := True;
//  Result := 0;
//end;

function OnPaintEnd(hDraw:Integer ; pbHandled:PBoolean): Integer ;stdcall  ;
var
  pt :POINT;
  dc : Integer;
begin

  XDraw_MoveToEx(hDraw,0,0,@pt);
  XDraw_LineTo(hDraw,100,100);

  pbHandled^ := True;
  Result := 0;
end;

var
  hWindow : Integer ;
  hEle : Integer ;
begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,15);  //��������

  hEle := XEle_Create(0,0,100,100,hWindow);
  XEle_EnableBkTransparent(hEle,True );
  XEle_EnableEvent_XE_PAINT_END(hEle ,True );
 // XEle_RegEventC(hEle,XE_PAINT,Integer(@OnPaint));
  XEle_RegEventC(hEle,XE_PAINT_END,Integer(@OnPaintEnd));
  XWnd_AdjustLayout(hWindow);
  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.
