program WinMain;

{$APPTYPE GUI}

uses
  Windows,SysUtils,
  XCGUI in 'XCGUI.pas';


var
  hWindow : Integer ;
  hListView : Integer ;
  hAdpterListView : Integer;
  nGroup: Integer;
  nItem : Integer;
  hImage: Integer;

function OnBtnClick(pbHandle : PBoolean):Integer ;stdcall;
begin
  MessageBoxA(0,'dasemimi','good',MB_OK);
  Result := 0;
end;


function OnListViewTemplateCreateEnd(
          pItem:TlistView_item_i;
          pbHandle:PBoolean
          ):Integer ;stdcall;
var
  hEle : Integer;
begin

  hEle := XListView_GetTemplateObjectGroup(hListView,pItem.iGroup,1);
  if XC_IsHXCGUI(hEle,XC_BUTTON) then
    XEle_RegEventC(hEle,XE_BNCLICK,Integer(@OnBtnClick));

end;


begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,15);  //��������

  hListView := XListView_Create(0,0,500,300,hWindow);
  XListView_SetItemTemplateXML(hListView,'ListView_Item.xml');
  hAdpterListView := XAdapterListView_Create();
  XListView_BindAdapter(hListView,hAdpterListView);

  //XAdapterListView_Group_AddColumn(hAdpterListView,'name4');
  XAdapterListView_Group_AddColumn(hAdpterListView,'name3');
  XAdapterListView_Item_AddColumn(hAdpterListView,'name');
  XAdapterListView_Item_AddColumn(hAdpterListView,'name2');




  nGroup := XAdapterListView_Group_AddItemText(hAdpterListView,'����1');

  hImage := XImage_LoadFile('avatar_large.png',True);
  // nItem  := XAdapterListView_Item_AddItemImage(hAdpterListView,nGroup,hImage);
  nItem  := XAdapterListView_Item_AddItemImageEx(hAdpterListView,nGroup,'name',hImage);
  XAdapterListView_Item_SetText(hAdpterListView,nGroup,nItem,1,'ddddd');


  nGroup := XAdapterListView_Group_AddItemText(hAdpterListView,'����2');
  nItem  := XAdapterListView_Item_AddItemImageEx(hAdpterListView,nGroup,'name',hImage);
  XAdapterListView_Item_SetText(hAdpterListView,nGroup,nItem,1,'aaaaa');

 // XEle_RegEventC(hListView,XE_LISTVIEW_TEMP_CREATE_END,Integer(@OnListViewTemplateCreateEnd));


  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.





