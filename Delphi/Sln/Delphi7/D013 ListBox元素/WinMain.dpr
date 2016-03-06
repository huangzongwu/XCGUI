program WinMain;

{$APPTYPE GUI}

uses
  Windows,SysUtils,
  XCGUI in 'XCGUI.pas';


var
  hWindow : Integer ;
  hListBox : Integer ;
  hAdapter : Integer;
  nItem    : Integer;


function OnListBoxButtonClick( bHandled:Integer ): Integer ;stdcall;
var
nItem : Integer;
szText: string;
begin

     nItem := XListBox_GetSelectItem(hListBox);
     FmtStr(szText,'You Select Id is %d',[nItem]);
     MessageBox(0,PChar(szText),'good',MB_OK);
     Result := 0;
end;
function OnListBoxButtonClick1( hEventEle:Integer;bHandled:PBoolean ): Integer ;stdcall;
var
nItem : Integer;
szText: string;
begin

     nItem := XListBox_GetItemIndexFromHXCGUI(hListBox,hEventEle);
    // nItem := XEle_GetTemplateListItemID(hEventEle);
     FmtStr(szText,'�����İ�ť������Ŀid Ϊ %d',[nItem]);
     MessageBox(0,PChar(szText),'good',MB_OK);
     Result := 0;
end;
function OnListBoxTemplateCreateEnd(pList:TlistBox_item_i;pbHanlde: PBoolean): Integer ;stdcall;
var
hBtn     : Integer;
begin
    //����� 4 �� xmlģ���е� itemid = 4 �����
    hBtn := XListBox_GetTemplateObject(hListBox,pList.index,4);
    //if XC_IsHXCGUI(hBtn,XC_BUTTON) then
       //XEle_RegEventC(hBtn,XE_BNCLICK,Integer( @OnListBoxButtonClick ) );
   if  XC_GetObjectType(hBtn) = XC_BUTTON then
      XEle_RegEventC1(hBtn,XE_BNCLICK,Integer( @OnListBoxButtonClick1 ) );

   pbHanlde^ := True;
   Result := 0;
end;
begin

  { TODO -oUser -cConsole Main : Insert code here }
  XInitXCGUI(nil) ; //��ʼ����Դ
  hWindow := XWnd_Create(0,0,500,300,'��ɫ����',0,15);  //��������

  hListBox := XListBox_Create(0,0,500,300,hWindow);
  XListBox_SetItemTemplateXML(hListBox,'ListBox_Item.xml');

  hAdapter := XAdapterTable_Create();
  XListBox_BindAdapter(hListBox,hAdapter);
  XAdapterTable_AddColumn(hAdapter,'name');
  XAdapterTable_AddColumn(hAdapter,'name1');

  nItem := XAdapterTable_AddItemText(hAdapter,'dasemimi-0');
  XAdapterTable_SetItemText(hAdapter,nItem,1,'�Զ���1');

  nItem := XAdapterTable_AddItemText(hAdapter,'dasemimi-1');
  XAdapterTable_SetItemText(hAdapter,nItem,1,'�Զ���2');
  //



  XEle_RegEventC(hListBox,XE_LISTBOX_TEMP_CREATE_END,Integer( @OnListBoxTemplateCreateEnd ) );




  XWnd_ShowWindow(hWindow,5);      //��ʾ����
  XRunXCGUI();                     //���г���
  XExitXCGUI();                    //������Դ
end.






