unit XCGUI;
// 1.9.5.8 xcgui www.xcgui.com    by Dasemimi 交流群: 2283362 验证 XCGUIdelphi模块
// timestamp 2016.2.21
interface
//SysUtils;
Type
    LOGFONT = record
    lfHeight : Integer         ;
    lfWidth : Integer          ;
    lfEscapement : Integer     ;
    lfOrientation : Integer    ;
    lfWeight : Integer         ;
    lfItalic : Byte         ;
    lfUnderline : Byte      ;
    lfStrikeOut : Byte      ;
    lfCharSet : Byte        ;
    lfOutPrecision : Byte   ;
    lfClipPrecision : Byte  ;
    lfQuality : Byte        ;
    lfPitchAndFamily : Byte ;
    lfFaceName : Array[ 0..32 ] Of AnsiChar    ;
end;
    TLOGFONT = ^LOGFONT;

Type
    LOGFONTW = record
    lfHeight : Integer         ;
    lfWidth : Integer          ;
    lfEscapement : Integer     ;
    lfOrientation : Integer    ;
    lfWeight : Integer         ;
    lfItalic : Byte         ;
    lfUnderline : Byte      ;
    lfStrikeOut : Byte      ;
    lfCharSet : Byte        ;
    lfOutPrecision : Byte   ;
    lfClipPrecision : Byte  ;
    lfQuality : Byte        ;
    lfPitchAndFamily : Byte ;
    lfFaceName : Array[ 0..32 ] Of WideChar    ;
end;
    TLOGFONTW = ^LOGFONTW;

type
  SIZE  = record
  cx : Integer ;
  cy : Integer ;
end;
TSIZE = ^SIZE ;
type
  POINT = record
  x : Integer;
  y : Integer;
end;
  TPOINT = ^Pointer;
type
  RECT = record
  x : Integer;
  y : Integer;
  cx: Integer;
  cy: Integer;
end;
  TRECT = ^RECT;

type
  POINTF = record
  x : Real;
  y : Real;
end;
  TPOINTF = ^POINTF;
  
type
BorderSize_ = record
 leftSize:Integer;
 topSize:Integer;
 rightSize:Integer;
 bottomSize:Integer;
end;
TBorderSize_ = ^BorderSize_;

TSpaceSize_  = ^BorderSize_;
TPaddingSize_= ^BorderSize_;


type
RECTF = record
 left:Integer;
 top:Integer;
 right:Integer;
 bottom:Integer;
end;
TRECTF = ^RECTF;

type
Position = record
 iRow:Integer;
 iColumn:Integer;
end;
TPosition = ^Position;

type
template_info_i = record
 info:Integer;
end;
Ttemplate_info_i = ^template_info_i;

type
listBox_item_i = record
 nUserData:Integer;
 nHeight:Integer;
 nSelHeight:Integer;
 nState:Integer;
 index:Integer;
 rcItem:RECT;
 hLayout:Integer;
 Info:Integer;
end;
TlistBox_item_i = ^listBox_item_i;

type
listBox_item_Info_i = record
 nUserData:Integer;
 nHeight:Integer;
 nSelHeight:Integer;
end;
TlistBox_item_Info_i = ^listBox_item_Info_i;

type
listView_item_id_i = record
 iGroup:Integer;
 iItem:Integer;
end;
TlistView_item_id_i = ^listView_item_id_i;

type
list_item_i = record
 index:Integer;
 iSubItem:Integer;
 nUserData:Integer;
 nState:Integer;
 rcItem:RECT;
 hLayout:Integer;
 Info:Integer;
end;
Tlist_item_i = ^list_item_i;

type
list_header_item_i = record
 index:Integer;
 nUserData:Integer;
 nState:Integer;
 rcItem:RECT;
 hLayout:Integer;
 Info:Integer;
end;
Tlist_header_item_i = ^list_header_item_i;

type
tree_item_i = record
 nID:Integer;
 nDepth:Integer;
 nState:Integer;
 nHeight:Integer;
 nSelHeight:Integer;
 nUserData:Integer;
 bExpand:LongBool;
 rcItem:RECT;
 hLayout:Integer;
 Info:Integer;
end;
Ttree_item_i = ^tree_item_i;

type
listView_item_i = record
 iGroup:Integer;
 iItem:Integer;
 nUserData:Integer;
 nState:Integer;
 rcItem:RECT;
 hLayout:Integer;
 Info:Integer;
end;
TlistView_item_i = ^listView_item_i;

type
layout_info_i = record
 widthType:Integer;
 heightType:Integer;
 width:Smallint;
 height:Smallint;
end;
Tlayout_info_i = ^layout_info_i;

type
menu_popupWnd_i = record
 hWindow:Integer;
 nParentID:Integer;
end;
Tmenu_popupWnd_i = ^menu_popupWnd_i;

type
menu_drawBackground_i = record
 hMenu:Integer;
 hWindow:Integer;
 nParentID:Integer;
end;
Tmenu_drawBackground_i = ^menu_drawBackground_i;

type
menu_drawItem_i = record
 hMenu:Integer;
 hWindow:Integer;
 nID:Integer;
 nState:Integer;
 rcItem:RECT;
 hIcon:Integer;
 Text:PWideChar;
end;
Tmenu_drawItem_i = ^menu_drawItem_i;

type
monthCal_item_i = record
 nDay:Integer;
 nType:Integer;
 nState:Integer;
 rcItem:RECT;
end;
TmonthCal_item_i = ^monthCal_item_i;




function XDateTime_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDateTime_SetStyle (hEle:Integer;nStyle:Integer);stdcall;far; external 'xcgui.dll';
function XDateTime_GetStyle (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDateTime_GetTime (hEle:Integer;pnHour:Integer;pnMinute:Integer;pnSecond:Integer);stdcall;far; external 'xcgui.dll';
procedure XDateTime_SetTime (hEle:Integer;nHour:Integer;nMinute:Integer;nSecond:Integer);stdcall;far; external 'xcgui.dll';
procedure XDateTime_GetDate (hEle:Integer;pnYear:Integer;pnMonth:Integer;pnDay:Integer);stdcall;far; external 'xcgui.dll';
procedure XDateTime_SetDate (hEle:Integer;nYear:Integer;nMonth:Integer;nDay:Integer);stdcall;far; external 'xcgui.dll';
function XDateTime_GetSelBkColor (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDateTime_SetSelBkColor (hEle:Integer;crSelectBk:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XDateTime_GetButton (hEle:Integer;nType:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMonthCal_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XMonthCal_SetToday (hEle:Integer;nYear:Integer;nMonth:Integer;nDay:Integer);stdcall;far; external 'xcgui.dll';
procedure XMonthCal_GetToday (hEle:Integer;pnYear:Integer;pnMonth:Integer;pnDay:Integer);stdcall;far; external 'xcgui.dll';
procedure XMonthCal_SeSelDate (hEle:Integer;nYear:Integer;nMonth:Integer;nDay:Integer);stdcall;far; external 'xcgui.dll';
procedure XMonthCal_GetSelDate (hEle:Integer;pnYear:Integer;pnMonth:Integer;pnDay:Integer);stdcall;far; external 'xcgui.dll';
function XMonthCal_GetButton (hEle:Integer;nType:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_UnicodeToAnsi (pIn:PWideChar;inLen:Integer;pOut:PChar;outLen:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_AnsiToUnicode (pIn:PChar;inLen:Integer;pOut:PWideChar;outLen:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XC_DebugToFileInfo (pInfo:PChar);stdcall;far; external 'xcgui.dll';
function XC_IsHELE (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_IsHWINDOW (hWindow:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_IsShape (hShape:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_IsHXCGUI (hXCGUI:Integer;nType:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_hWindowFromHWnd (hWnd:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_RegisterWindowClassName (pClassName:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_IsSViewExtend (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_GetObjectType (hXCGUI:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_GetObjectByID (nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_GetResIDValue (pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
procedure XC_SetPaintFrequency (nMilliseconds:Integer);stdcall;far; external 'xcgui.dll';
function XC_RectInRect (pRect1:TRECT;pRect2:TRECT) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XC_CombineRect (pDest:TRECT;pSrc1:TRECT;pSrc2:TRECT);stdcall;far; external 'xcgui.dll';
procedure XC_ShowLayoutFrame (bShow:LongBool);stdcall;far; external 'xcgui.dll';
procedure XC_EnableDebugFile (bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XC_SetLayoutFrameColor (color:Integer);stdcall;far; external 'xcgui.dll';
procedure XC_EnableErrorMessageBox (bEnabel:LongBool);stdcall;far; external 'xcgui.dll';
function XC_LoadLayout (pFileName:PWideChar;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_LoadLayoutFromString (pStringXML:PChar;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XC_LoadResource (pFileName:PWideChar;pDir:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_LoadResourceFromString (pStringXML:PChar;pDir:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XC_LoadTemplate (nType:Integer;pFileName:PWideChar) : Ttemplate_info_i;stdcall;far; external 'xcgui.dll';
function XC_LoadTemplateFromString (nType:Integer;pStringXML:PChar) : Ttemplate_info_i;stdcall;far; external 'xcgui.dll';
procedure XC_TemplateDestroy (pInfo:Ttemplate_info_i);stdcall;far; external 'xcgui.dll';
procedure XC_GetTextSize (pString:PWideChar;length:Integer;hFontX:Integer;pOutSize:TSIZE);stdcall;far; external 'xcgui.dll';
function XC_GetDefaultFont () : Integer;stdcall;far; external 'xcgui.dll';
procedure XC_SetDefaultFont (hFontX:Integer);stdcall;far; external 'xcgui.dll';
procedure XC_InitFont (pFont:TLOGFONTW;pName:PWideChar;size:Integer;bBold:LongBool;bItalic:LongBool;bUnderline:LongBool;bStrikeOut:LongBool);stdcall;far; external 'xcgui.dll';
function XC_Malloc (size:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XC_Free (p:Integer);stdcall;far; external 'xcgui.dll';
procedure _XC_SetType (hXCGUI:Integer;nType:Integer);stdcall;far; external 'xcgui.dll';
procedure _XC_AddType (hXCGUI:Integer;nType:Integer);stdcall;far; external 'xcgui.dll';
procedure _XC_BindData (hXCGUI:Integer;data:Integer);stdcall;far; external 'xcgui.dll';
function _XC_GetBindData (hXCGUI:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XInitXCGUI (pText:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XRunXCGUI ();stdcall;far; external 'xcgui.dll';
procedure XExitXCGUI ();stdcall;far; external 'xcgui.dll';
function XBkInfoM_Create () : Integer;stdcall;far; external 'xcgui.dll';
procedure XBkInfoM_Destroy (hBkInfoM:Integer);stdcall;far; external 'xcgui.dll';
function XBkInfoM_SetBkInfo (hBkInfoM:Integer;pText:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBkInfoM_AddBorder (hBkInfoM:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XBkInfoM_AddFill (hBkInfoM:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XBkInfoM_AddImage (hBkInfoM:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XBkInfoM_GetCount (hBkInfoM:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBkInfoM_Clear (hBkInfoM:Integer);stdcall;far; external 'xcgui.dll';
function XBkInfoM_Draw (hBkInfoM:Integer;nState:Integer;hDraw:Integer;pRect:TRECT) : LongBool;stdcall;far; external 'xcgui.dll';
function XBkInfoM_DrawEx (hBkInfoM:Integer;nState:Integer;hDraw:Integer;pRect:TRECT;nStateFilter:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XBtn_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;pName:PWideChar;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XBtn_IsCheck (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XBtn_SetCheck (hEle:Integer;bCheck:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetState (hEle:Integer;nState:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetState (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XBtn_GetStateEx (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetStyle (hEle:Integer;nStyle:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetStyle (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetType (hEle:Integer;nType:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetType (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetGroupID (hEle:Integer;nID:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetGroupID (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetBindEle (hEle:Integer;hBindEle:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetBindEle (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetTextAlign (hEle:Integer;nFlags:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetTextAlign (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_SetIconAlign (hEle:Integer;align:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_SetOffset (hEle:Integer;x:Integer;y:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_SetOffsetIcon (hEle:Integer;x:Integer;y:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_SetIconSpace (hEle:Integer;size:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_GetText (hEle:Integer;pOut:PWideChar;nOutLen:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_SetText (hEle:Integer;pName:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XBtn_SetIcon (hEle:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_SetIconDisable (hEle:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_AddAnimationFrame (hEle:Integer;hImage:Integer;uElapse:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_EnableAnimation (hEle:Integer;bEnable:LongBool;bLoopPlay:LongBool);stdcall;far; external 'xcgui.dll';
procedure XBtn_AddBkBorder (hEle:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XBtn_AddBkFill (hEle:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XBtn_AddBkImage (hEle:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XBtn_GetBkInfoCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XBtn_ClearBkInfo (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XComboBox_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XComboBox_SetSelItem (hEle:Integer;iIndex:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XComboBox_GetButtonRect (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XComboBox_SetButtonSize (hEle:Integer;size:Integer);stdcall;far; external 'xcgui.dll';
procedure XComboBox_SetDropHeight (hEle:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
function XComboBox_GetDropHeight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XComboBox_BindApapter (hEle:Integer;hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XComboBox_GetApapter (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XComboBox_SetItemTemplateXML (hEle:Integer;pXmlFile:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XComboBox_SetItemTemplateXMLFromString (hEle:Integer;pStringXML:PChar);stdcall;far; external 'xcgui.dll';
procedure XComboBox_EnableDrawButton (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XComboBox_EnableEdit (hEle:Integer;bEdit:LongBool);stdcall;far; external 'xcgui.dll';
procedure XComboBox_AddBkBorder (hEle:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XComboBox_AddBkFill (hEle:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XComboBox_AddBkImage (hEle:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XComboboX_GetBkInfoCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XComboBox_ClearBkInfo (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XComboBox_GetSelItem (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XComboBox_GetState (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XAdapter_Destroy (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XAdapterListView_Create () : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_AddColumn (hAdapter:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_AddItemText (hAdapter:Integer;pValue:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_AddItemTextEx (hAdapter:Integer;pName:PWideChar;pValue:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_AddItemImage (hAdapter:Integer;hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_AddItemImageEx (hAdapter:Integer;pName:PWideChar;hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_SetText (hAdapter:Integer;iGroup:Integer;iColumn:Integer;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_SetTextEx (hAdapter:Integer;iGroup:Integer;pName:PWideChar;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_SetImage (hAdapter:Integer;iGroup:Integer;iColumn:Integer;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_SetImageEx (hAdapter:Integer;iGroup:Integer;pName:PWideChar;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_GetCount (hAdapter:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_GetCount (hAdapter:Integer;iGroup:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_AddColumn (hAdapter:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_AddItemText (hAdapter:Integer;iGroup:Integer;pValue:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_AddItemTextEx (hAdapter:Integer;iGroup:Integer;pName:PWideChar;pValue:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_AddItemImage (hAdapter:Integer;iGroup:Integer;hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_AddItemImageEx (hAdapter:Integer;iGroup:Integer;pName:PWideChar;hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_SetText (hAdapter:Integer;iGroup:Integer;iItem:Integer;iColumn:Integer;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_SetTextEx (hAdapter:Integer;iGroup:Integer;iItem:Integer;pName:PWideChar;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_SetImage (hAdapter:Integer;iGroup:Integer;iItem:Integer;iColumn:Integer;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_SetImageEx (hAdapter:Integer;iGroup:Integer;iItem:Integer;pName:PWideChar;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Group_DeleteItem (hAdapter:Integer;iGroup:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XAdapterListView_Group_DeleteAllChildItem (hAdapter:Integer;iGroup:Integer);stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_DeleteItem (hAdapter:Integer;iGroup:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XAdapterListView_DeleteAll (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
procedure XAdapterListView_DeleteAllGroup (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
procedure XAdapterListView_DeleteAllItem (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
procedure XAdapterListView_DeleteColumnGroup (hAdapter:Integer;iColumn:Integer);stdcall;far; external 'xcgui.dll';
procedure XAdapterListView_DeleteColumnItem (hAdapter:Integer;iColumn:Integer);stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_GetTextEx (hAdapter:Integer;iGroup:Integer;iItem:Integer;pName:PWideChar;pOut:PWideChar;nOutLen:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterListView_Item_GetImageEx (hAdapter:Integer;iGroup:Integer;iItem:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_Create () : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_AddColumn (hAdapter:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_SetColumn (hAdapter:Integer;pColName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_AddItemText (hAdapter:Integer;pValue:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_AddItemTextEx (hAdapter:Integer;pName:PWideChar;pValue:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_AddItemImage (hAdapter:Integer;hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_AddItemImageEx (hAdapter:Integer;pName:PWideChar;hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_InsertItemText (hAdapter:Integer;iItem:Integer;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_InsertItemTextEx (hAdapter:Integer;iItem:Integer;pName:PWideChar;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_InsertItemImage (hAdapter:Integer;iItem:Integer;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_InsertItemImageEx (hAdapter:Integer;iItem:Integer;pName:PWideChar;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_SetItemText (hAdapter:Integer;iItem:Integer;iColumn:Integer;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_SetItemTextEx (hAdapter:Integer;iItem:Integer;pName:PWideChar;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_SetItemImage (hAdapter:Integer;iItem:Integer;iColumn:Integer;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_SetItemImageEx (hAdapter:Integer;iItem:Integer;pName:PWideChar;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_DeleteItem (hAdapter:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_DeleteItemEx (hAdapter:Integer;iItem:Integer;nCount:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XAdapterTable_DeleteItemAll (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
procedure XAdapterTable_DeleteColumnAll (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XAdapterTable_GetCount (hAdapter:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_GetCountColumn (hAdapter:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_GetItemText (hAdapter:Integer;iItem:Integer;iColumn:Integer;pOut:PWideChar;nOutLen:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_GetItemImage (hAdapter:Integer;iItem:Integer;iColumn:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTable_GetItemTextEx (hAdapter:Integer;iItem:Integer;pName:PWideChar;pOut:PWideChar;nOutLen:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTable_GetItemImageEx (hAdapter:Integer;iItem:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_Create () : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_AddColumn (hAdapter:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_SetColumn (hAdapter:Integer;pColName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_InsertItemText (hAdapter:Integer;pValue:PWideChar;nParentID:Integer;insertID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_InsertItemTextEx (hAdapter:Integer;pName:PWideChar;pValue:PWideChar;nParentID:Integer;insertID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_InsertItemImage (hAdapter:Integer;hImage:Integer;nParentID:Integer;insertID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_InsertItemImageEx (hAdapter:Integer;pName:PWideChar;hImage:Integer;nParentID:Integer;insertID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_GetCount (hAdapter:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_GetCountColumn (hAdapter:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_SetItemText (hAdapter:Integer;nID:Integer;iColumn:Integer;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTree_SetItemTextEx (hAdapter:Integer;nID:Integer;pName:PWideChar;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTree_SetItemImage (hAdapter:Integer;nID:Integer;iColumn:Integer;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTree_SetItemImageEx (hAdapter:Integer;nID:Integer;pName:PWideChar;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTree_GetItemTextEx (hAdapter:Integer;nID:Integer;pName:PWideChar;pOut:PWideChar;nOutLen:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterTree_GetItemImageEx (hAdapter:Integer;nID:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterTree_DeleteItem (hAdapter:Integer;nID:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XAdapterTree_DeleteItemAll (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
procedure XAdapterTree_DeleteColumnAll (hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XAdapterMap_Create () : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterMap_AddItemText (hAdapter:Integer;pName:PWideChar;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterMap_AddItemImage (hAdapter:Integer;pName:PWideChar;hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterMap_DeleteItem (hAdapter:Integer;pName:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterMap_GetCount (hAdapter:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XAdapterMap_GetItemText (hAdapter:Integer;pName:PWideChar;pOut:PWideChar;nOutLen:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XAdapterMap_GetItemImage (hAdapter:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
//procedure _XC_DebugPrintf (level:Integer;pFormat:PChar;点点点:Integer);stdcall;far; external 'xcgui.dll';
//procedure _XC_DebugPrintfW (level:Integer;pFormat:PWideChar;点点点:Integer);stdcall;far; external 'xcgui.dll';
//procedure xtrace (pFormat:PChar;点点点:Integer);stdcall;far; external 'xcgui.dll';
//procedure xtracew (pFormat:PWideChar;点点点:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_Create (hdc:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDraw_Destroy (hDraw:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetOffset (hDraw:Integer;x:Integer;y:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_GetOffset (hDraw:Integer;pX:Integer;pY:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_RestoreGDIOBJ (hDraw:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_GetHDC (hDraw:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDraw_SetBrushColor (hDraw:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetTextAlign (hDraw:Integer;nFlag:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetTextVertical (hDraw:Integer;bVertical:LongBool);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetFontX (hDraw:Integer;hFontx:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetFont (hDraw:Integer;size:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetFont2 (hDraw:Integer;pName:PWideChar;size:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetFont3 (hDraw:Integer;pLogFont:TLOGFONT);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetLineWidth (hDraw:Integer;nWidth:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_SetBkMode (hDraw:Integer;bTransparent:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDraw_EnableSmoothingMode (hDraw:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XDraw_CreateSolidBrush (hDraw:Integer;crColor:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XDraw_CreatePen (hDraw:Integer;fnPenStyle:Integer;nWidth:Integer;crColor:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XDraw_CreateRectRgn (hDraw:Integer;nLeftRect:Integer;nTopRect:Integer;nRightRect:Integer;nBottomRect:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XDraw_CreateRoundRectRgn (hDraw:Integer;nLeftRect:Integer;nTopRect:Integer;nRightRect:Integer;nBottomRect:Integer;nWidthEllipse:Integer;nHeightEllipse:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XDraw_CreatePolygonRgn (hDraw:Integer;pPt:TPOINT;cPoints:Integer;fnPolyFillMode:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XDraw_SelectClipRgn (hDraw:Integer;hRgn:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDraw_FillRect (hDraw:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_FillRectColor (hDraw:Integer;pRect:TRECT;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XDraw_FillRgn (hDraw:Integer;hrgn:Integer;hbr:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XDraw_FillEllipse (hDraw:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawEllipse (hDraw:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_FillRoundRect (hDraw:Integer;pRect:TRECT;nWidth:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawRoundRect (hDraw:Integer;pRect:TRECT;nWidth:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_Rectangle (hDraw:Integer;nLeftRect:Integer;nTopRect:Integer;nRightRect:Integer;nBottomRect:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawGroupBox_Rect (hDraw:Integer;pRect:TRECT;pName:PWideChar;textColor:Integer;textAlpha:Byte;pOffset:TPOINT);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawGroupBox_RoundRect (hDraw:Integer;pRect:TRECT;pName:PWideChar;textColor:Integer;textAlpha:Byte;pOffset:TPOINT;nWidth:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_GradientFill2 (hDraw:Integer;color1:Integer;alpha1:Byte;color2:Integer;alpha2:Byte;pRect:TRECT;mode:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_GradientFill4 (hDraw:Integer;color1:Integer;color2:Integer;color3:Integer;color4:Integer;pRect:TRECT;mode:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XDraw_GradientFill (hDraw:Integer;pPoints:TPOINTF;nCount:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
function XDraw_FrameRgn (hDraw:Integer;hrgn:Integer;hbr:Integer;nWidth:Integer;nHeight:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XDraw_FrameRect (hDraw:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_FocusRect (hDraw:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawLine (hDraw:Integer;x1:Integer;y1:Integer;x2:Integer;y2:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_MoveToEx (hDraw:Integer;X:Integer;Y:Integer;lpPoint:TPOINT) : LongBool;stdcall;far; external 'xcgui.dll';
function XDraw_LineTo (hDraw:Integer;nXEnd:Integer;nYEnd:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XDraw_Polyline (hDraw:Integer;pArrayPt:TPOINT;arrayPtSize:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XDraw_Dottedline (hDraw:Integer;x1:Integer;y1:Integer;x2:Integer;y2:Integer);stdcall;far; external 'xcgui.dll';
function XDraw_SetPixel (hDraw:Integer;X:Integer;Y:Integer;crColor:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XDraw_Check (hDraw:Integer;x:Integer;y:Integer;color:Integer;bCheck:LongBool);stdcall;far; external 'xcgui.dll';
function XDraw_DrawIconEx (hDraw:Integer;xLeft:Integer;yTop:Integer;hIcon:Integer;cxWidth:Integer;cyWidth:Integer;istepIfAniCur:Integer;hbrFlickerFreeDraw:Integer;diFlags:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XDraw_BitBlt (hDrawDest:Integer;nXDest:Integer;nYDest:Integer;nWidth:Integer;nHeight:Integer;hdcSrc:Integer;nXSrc:Integer;nYSrc:Integer;dwRop:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XDraw_BitBlt2 (hDrawDest:Integer;nXDest:Integer;nYDest:Integer;nWidth:Integer;nHeight:Integer;hDrawSrc:Integer;nXSrc:Integer;nYSrc:Integer;dwRop:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XDraw_AlphaBlend (hDraw:Integer;nXOriginDest:Integer;nYOriginDest:Integer;nWidthDest:Integer;nHeightDest:Integer;hdcSrc:Integer;nXOriginSrc:Integer;nYOriginSrc:Integer;nWidthSrc:Integer;nHeightSrc:Integer;alpha:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XDraw_TriangularArrow (hDraw:Integer;align:Integer;x:Integer;y:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawPolygon (hDraw:Integer;points:TPOINT;nCount:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawPolygonF (hDraw:Integer;points:TPOINTF;nCount:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_FillPolygon (hDraw:Integer;points:TPOINT;nCount:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_FillPolygonF (hDraw:Integer;points:TPOINTF;nCount:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_Image (hDraw:Integer;hImage:Integer;x:Integer;y:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_Image2 (hDraw:Integer;hImage:Integer;x:Integer;y:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_ImageStretch (hDraw:Integer;hImage:Integer;x:Integer;y:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_ImageAdaptive (hDraw:Integer;hImage:Integer;pRect:TRECT;bOnlyBorder:LongBool);stdcall;far; external 'xcgui.dll';
procedure XDraw_ImageExTile (hDraw:Integer;hImage:Integer;pRect:TRECT;flag:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_ImageSuper (hDraw:Integer;hImage:Integer;pRect:TRECT;bClip:LongBool);stdcall;far; external 'xcgui.dll';
procedure XDraw_ImageSuper2 (hDraw:Integer;hImage:Integer;pRcDest:TRECT;pSrcRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawText (hDraw:Integer;lpString:PWideChar;nCount:Integer;lpRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XDraw_DrawTextUnderline (hDraw:Integer;lpString:PWideChar;nCount:Integer;lpRect:TRECT;colorLine:Integer;alphaLine:Byte);stdcall;far; external 'xcgui.dll';
procedure XDraw_TextOut (hDraw:Integer;nXStart:Integer;nYStart:Integer;lpString:PWideChar;cbString:Integer);stdcall;far; external 'xcgui.dll';
procedure XDraw_TextOutEx (hDraw:Integer;nXStart:Integer;nYStart:Integer;lpString:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XDraw_TextOutA (hDraw:Integer;nXStart:Integer;nYStart:Integer;lpString:PChar);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetAlpha (hDraw:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XDraw_SetAlphaEx (hdc:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XEle_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_RegEventEx (hEle:Integer;pEvent:Integer);stdcall;far; external 'xcgui.dll';
function XEle_RemoveEventEx (hEle:Integer;pEvent:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XEle_RegEventC (hEle:Integer;nEvent:Integer;pFun:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_RegEventC1 (hEle:Integer;nEvent:Integer;pFun:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_RegEventC2 (hEle:Integer;nEvent:Integer;pFun:Integer);stdcall;far; external 'xcgui.dll';
function XEle_RemoveEventC (hEle:Integer;nEvent:Integer;pFun:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_SendEvent (hEle:Integer;hEventEle:Integer;nEvent:Integer;wParam:Integer;lParam:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_PostEvent (hEle:Integer;hEventEle:Integer;nEvent:Integer;wParam:Integer;lParam:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsShow (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsEnable (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsEnableFocus (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsDrawFocus (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsEnableEvent_XE_PAINT_END (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsMouseThrough (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsBkTransparent (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsKeyTab (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsSwitchFocus (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_IsEnable_XE_MOUSEWHEEL (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XEle_Enable (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableFocus (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableDrawFocus (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableEvent_XE_PAINT_END (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableBkTransparent (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableMouseThrough (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableKeyTab (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableSwitchFocus (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableEvent_XE_MOUSEWHEEL (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XEle_SetRect (hEle:Integer;pRect:TRECT;bRedraw:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_SetRectEx (hEle:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer;bRedraw:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_SetRectLogic (hEle:Integer;pRect:TRECT;bRedraw:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XEle_GetRect (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XEle_GetRectLogic (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XEle_GetClientRect (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XEle_GetWndClientRect (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
function XEle_GetWidth (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetHeight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_RectWndClientToEleClient (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XEle_PointWndClientToEleClient (hEle:Integer;pPt:TPOINT);stdcall;far; external 'xcgui.dll';
procedure XEle_RectClientToWndClient (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XEle_PointClientToWndClient (hEle:Integer;pPt:TPOINT);stdcall;far; external 'xcgui.dll';
function XEle_AddEle (hEle:Integer;hChildEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_InsertEle (hEle:Integer;hChildEle:Integer;hDestEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XEle_RemoveEle (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XEle_AddShape (hEle:Integer;hShape:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_SetZOrder (hEle:Integer;index:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XEle_SetZOrderEx (hEle:Integer;hDestEle:Integer;nType:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XEle_ShowEle (hEle:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
function XEle_GetType (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetHWND (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetHWINDOW (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetCursor (hEle:Integer;hCursor:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetCursor (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetID (hEle:Integer;id:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetID (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetParentEle (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetParent (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetTextColor (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XEle_GetTextColor (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetFocusBorderColor (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XEle_GetFocusBorderColor (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetFont (hEle:Integer;hFontx:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetFont (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetAlpha (hEle:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XEle_GetChildCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetChildByIndex (hEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetChildByID (hEle:Integer;id:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetChildShapeCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetChildShapeByIndex (hEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_HitChildEle (hEle:Integer;pPt:TPOINT) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_BindLayoutObject (hEle:Integer;hLayout:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetLayoutObject (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetParentLayoutObject (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_SetUserData (hEle:Integer;nData:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetUserData (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_GetContentSize (hEle:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
procedure XEle_SetCapture (hEle:Integer;b:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_SetLayoutWidth (hEle:Integer;nType:Integer;nWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_SetLayoutHeight (hEle:Integer;nType:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_GetLayoutWidth (hEle:Integer;pType:Integer;pWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_GetLayoutHeight (hEle:Integer;pType:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_RedrawEle (hEle:Integer;bImmediate:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_RedrawRect (hEle:Integer;pRect:TRECT;bImmediate:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_Destroy (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_AddBkBorder (hEle:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_AddBkFill (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XEle_AddBkImage (hEle:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetBkInfoCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XEle_ClearBkInfo (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XEle_GetBkInfoManager (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_GetStateFlags (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XEle_DrawFocus (hEle:Integer;hDraw:Integer;pRect:TRECT) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XEle_EnableTransparentChannel (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_SetToolTip (hEle:Integer;pText:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XEle_GetToolTip (hEle:Integer;pOut:PWideChar;nOutLen:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_EnableToolTip (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XEle_AdjustLayoutObject (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XEle_AdjustLayout (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XEle_RegEventTest (nEvent:Integer;pParamType:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XFont_Create (size:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XFont_Create2 (pName:PWideChar;size:Integer;bBold:LongBool;bItalic:LongBool;bUnderline:LongBool;bStrikeOut:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XFont_CreateEx (pFontInfo:TLOGFONTW) : Integer;stdcall;far; external 'xcgui.dll';
function XFont_CreateFromHFONT (hFont:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XFont_EnableAutoDestroy (hFontX:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XFont_Destroy (hFontX:Integer);stdcall;far; external 'xcgui.dll';
function XFont_GetHFONT (hFontX:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XFrameWnd_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;pTitle:PWideChar;hWndParent:Integer;XCStyle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XFrameWnd_CreateEx (dwExStyle:Integer;lpClassName:PWideChar;lpWindowName:PWideChar;dwStyle:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer;hWndParent:Integer;XCStyle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XFrameWnd_GetLayoutAreaRect (hWindow:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XFrameWnd_SetView (hWindow:Integer;hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XFrameWnd_SetPaneSplitBarColor (hWindow:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XFrameWnd_AddPane (hWindow:Integer;hPaneDest:Integer;hPaneNew:Integer;align:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XFrameWnd_MergePane (hWindow:Integer;hPaneDest:Integer;hPaneNew:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XImage_LoadFile (pImageName:PWideChar;bStretch:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadFileAdaptive (pImageName:PWideChar;leftSize:Integer;topSize:Integer;rightSize:Integer;bottomSize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadFileRect (pImageName:PWideChar;x:Integer;y:Integer;cx:Integer;cy:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadResAdaptive (id:Integer;pType:PWideChar;leftSize:Integer;topSize:Integer;rightSize:Integer;bottomSize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadRes (id:Integer;pType:PWideChar;bStretch:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadZip (pZipFileName:PWideChar;pImageName:PWideChar;pPassword:PWideChar;bStretch:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadZipAdaptive (pZipFileName:PWideChar;pImageName:PWideChar;pPassword:PWideChar;x1:Integer;x2:Integer;y1:Integer;y2:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadZipRect (pZipFileName:PWideChar;pImageName:PWideChar;pPassword:PWideChar;x:Integer;y:Integer;cx:Integer;cy:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadMemory (pBuffer:Integer;nSize:Integer;bStretch:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadMemoryRect (pBuffer:Integer;nSize:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer;bStretch:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadMemoryAdaptive (pBuffer:Integer;nSize:Integer;leftSize:Integer;topSize:Integer;rightSize:Integer;bottomSize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadFromImage (pImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadFileFromExtractIcon (pImageName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadFileFromHICON (hIcon:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_LoadFileFromHBITMAP (hBitmap:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_IsStretch (hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XImage_IsAdaptive (hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XImage_IsTile (hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XImage_SetDrawType (hImage:Integer;nType:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XImage_SetDrawTypeAdaptive (hImage:Integer;leftSize:Integer;topSize:Integer;rightSize:Integer;bottomSize:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XImage_SetTranColor (hImage:Integer;color:Integer);stdcall;far; external 'xcgui.dll';
procedure XImage_SetTranColorEx (hImage:Integer;color:Integer;tranColor:Byte);stdcall;far; external 'xcgui.dll';
function XImage_SetRotateAngle (hImage:Integer;fAngle:real) : real;stdcall;far; external 'xcgui.dll';
procedure XImage_EnableTranColor (hImage:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XImage_EnableAutoDestroy (hImage:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XImage_EnableCenter (hImage:Integer;bCenter:LongBool);stdcall;far; external 'xcgui.dll';
function XImage_IsCenter (hImage:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XImage_GetDrawType (hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_GetWidth (hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XImage_GetHeight (hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XImage_Release (hImage:Integer);stdcall;far; external 'xcgui.dll';
procedure XImage_Destroy (hImage:Integer);stdcall;far; external 'xcgui.dll';
function _Image_AddRef (hImage:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure _Image_Release (hImage:Integer);stdcall;far; external 'xcgui.dll';
function XLayout_Create () : Integer;stdcall;far; external 'xcgui.dll';
procedure XLayout_Destroy (hLayout:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_AddEle (hLayout:Integer;hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_AddLayoutObject (hLayout:Integer;hLayoutObject:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_AddShape (hLayout:Integer;hShape:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_RemoveChild (hLayout:Integer;hChild:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_AdjustLayout (hLayout:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetRectFrame (hLayout:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XLayout_GetRect (hLayout:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XLayout_GetRectFrame (hLayout:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
function XLayout_GetWindow (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetEle (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetParentLayout (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetParent (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XLayout_SetID (hLayout:Integer;nID:Integer);stdcall;far; external 'xcgui.dll';
function XLayout_GetID (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XLayout_SetHorizon (hLayout:Integer;bHorizon:LongBool);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetAlignH (hLayout:Integer;nAlign:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetAlignV (hLayout:Integer;nAlign:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetPadding (hLayout:Integer;left:Integer;top:Integer;right:Integer;bottom:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetSpace (hLayout:Integer;nSpace:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetLayoutWidth (hLayout:Integer;nType:Integer;nWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_SetLayoutHeight (hLayout:Integer;nType:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_GetLayoutWidth (hLayout:Integer;pType:Integer;pWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XLayout_GetLayoutHeight (hLayout:Integer;pType:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
function XLayout_GetWidth (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetHeight (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetWidthIn (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetHeightIn (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XLayout_GetContentSize (hLayout:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
procedure XLayout_ShowLayout (hLayout:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
function XLayout_GetChildCount (hLayout:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetChildType (hLayout:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XLayout_GetChild (hLayout:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XLayout_Draw (hLayout:Integer;hDraw:Integer);stdcall;far; external 'xcgui.dll';
procedure Layout_SetEle (hLayout:Integer;hParent:Integer);stdcall;far; external 'xcgui.dll';
function XListBox_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListBox_SetDrawItemBkFlags (hEle:Integer;nFlags:Integer);stdcall;far; external 'xcgui.dll';
function XListBox_SetItemData (hEle:Integer;iItem:Integer;nUserData:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_GetItemData (hEle:Integer;iItem:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_SetItemInfo (hEle:Integer;iItem:Integer;pItem:TlistBox_item_Info_i) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_GetItemInfo (hEle:Integer;iItem:Integer;pItem:TlistBox_item_Info_i) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XListBox_AddItemBkBorder (hEle:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XListBox_AddItemBkFill (hEle:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XListBox_AddItemBkImage (hEle:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XListBox_GetItemBkInfoCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListBox_ClearItemBkInfo (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XListBox_SetSelectItem (hEle:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_GetSelectItem (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_CancelSelectItem (hEle:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_CancelSelectAll (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_GetSelectAll (hEle:Integer;pArray:Integer;nArraySize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_GetSelectCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_GetItemMouseStay (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_SelectAll (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XListBox_SetItemHeightDefault (hEle:Integer;nHeight:Integer;nSelHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XListBox_GetItemHeightDefault (hEle:Integer;pHeight:Integer;pSelHeight:Integer);stdcall;far; external 'xcgui.dll';
function XListBox_GetItemIndexFromHXCGUI (hEle:Integer;hXCGUI:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_HitTest (hEle:Integer;pPt:TPOINT) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_HitTestOffset (hEle:Integer;pPt:TPOINT) : Integer;stdcall;far; external 'xcgui.dll';
function XListBox_SetItemTemplateXML (hEle:Integer;pXmlFile:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_SetItemTemplateXMLFromString (hEle:Integer;pStringXML:PChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XListBox_GetTemplateObject (hEle:Integer;iItem:Integer;nTempItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListBox_EnableMultiSel (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XListBox_BindAdapter (hEle:Integer;hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XListBox_GetAdapter (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListBox_RefreshData (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XList_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_AddColumn (hEle:Integer;width:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_InsertColumn (hEle:Integer;width:Integer;iItem:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XList_EnableMultiSel (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XList_EnableDragChangeColumnWidth (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XList_SetDrawItemBkFlags (hEle:Integer;style:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_SetColumnWidth (hEle:Integer;iItem:Integer;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_SetColumnMinWidth (hEle:Integer;iItem:Integer;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_SetColumnWidthFixed (hEle:Integer;iColumn:Integer;bFixed:LongBool);stdcall;far; external 'xcgui.dll';
function XList_GetColumnWidth (hEle:Integer;iColumn:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_GetColumnCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_DeleteColumn (hEle:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XList_DeleteColumnAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XList_SetItemData (hEle:Integer;iItem:Integer;iSubItem:Integer;data:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XList_GetItemData (hEle:Integer;iItem:Integer;iSubItem:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_SetSelectItem (hEle:Integer;iItem:Integer;bSelect:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XList_GetSelectItem (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_GetSelectItemCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XList_SetSelectAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XList_GetSelectAll (hEle:Integer;pArray:Integer;nArraySize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_CancelSelectItem (hEle:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XList_CancelSelectAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XList_GetHeaderHELE (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XList_BindAdapter (hEle:Integer;hAdapter:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_BindAdapterHeader (hEle:Integer;hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XList_GetAdapter (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_SetItemTemplateXML (hEle:Integer;pXmlFile:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XList_SetItemTemplateXMLFromString (hEle:Integer;pStringXML:PChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XList_GetTemplateObject (hEle:Integer;iItem:Integer;nTempItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_GetItemIndexFromHXCGUI (hEle:Integer;hXCGUI:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_GetHeaderTemplateObject (hEle:Integer;iItem:Integer;nTempItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XList_GetHeaderItemIndexFromHXCGUI (hEle:Integer;hXCGUI:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XList_SetHeaderHeight (hEle:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
function XList_GetHeaderHeight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XList_AddItemBkBorder (hEle:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_AddItemBkFill (hEle:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XList_AddItemBkImage (hEle:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XList_GetItemBkInfoCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XList_ClearItemBkInfo (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_SetItemHeightDefault (hEle:Integer;nHeight:Integer;nSelHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XList_GetItemHeightDefault (hEle:Integer;pHeight:Integer;pSelHeight:Integer);stdcall;far; external 'xcgui.dll';
function XList_HitTest (hEle:Integer;pPt:TPOINT;piItem:Integer;piSubItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XList_HitTestOffset (hEle:Integer;pPt:TPOINT;piItem:Integer;piSubItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XList_RefreshData (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XListView_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListView_BindAdapter (hEle:Integer;hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XListView_GetAdapter (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListView_SetItemTemplateXML (hEle:Integer;pXmlFile:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XListView_SetItemTemplateXMLFromString (hEle:Integer;pStringXML:PChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XListView_GetTemplateObject (hEle:Integer;iGroup:Integer;iItem:Integer;nTempItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListView_GetTemplateObjectGroup (hEle:Integer;iGroup:Integer;nTempItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListView_GetItemIDFromHXCGUI (hEle:Integer;hXCGUI:Integer;piGroup:Integer;piItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListView_HitTest (hEle:Integer;pPt:TPOINT;pOutGroup:Integer;pOutItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListView_HitTestOffset (hEle:Integer;pPt:TPOINT;pOutGroup:Integer;pOutItem:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListView_EnableMultiSel (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XListView_SetDrawItemBkFlags (hEle:Integer;nFlags:Integer);stdcall;far; external 'xcgui.dll';
function XListView_SetSelectItem (hEle:Integer;iGroup:Integer;iItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListView_GetSelectItem (hEle:Integer;piGroup:Integer;piItem:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XListView_GetSelectItemCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListView_GetSelectItemAll (hEle:Integer;pArray:listView_item_id_i;nArraySize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListView_SetSelectItemAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_CancelSelectItemAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_SetColumnSpace (hEle:Integer;space:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_SetRowSpace (hEle:Integer;space:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_SetAlignSizeLeft (hEle:Integer;size:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_SetAlignSizeTop (hEle:Integer;size:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_SetItemSize (hEle:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_GetItemSize (hEle:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
procedure XListView_SetGroupHeight (hEle:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
function XListView_GetGroupHeight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListView_SetGroupUserData (hEle:Integer;iGroup:Integer;nData:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_SetItemUserData (hEle:Integer;iGroup:Integer;iItem:Integer;nData:Integer);stdcall;far; external 'xcgui.dll';
function XListView_GetGroupUserData (hEle:Integer;iGroup:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XListView_GetItemUserData (hEle:Integer;iGroup:Integer;iItem:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListView_AddItemBkBorder (hEle:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_AddItemBkFill (hEle:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XListView_AddItemBkImage (hEle:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XListView_GetItemBkInfoCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XListView_ClearItemBkInfo (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XListView_RefreshData (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XListView_ExpandGroup (hEle:Integer;iGroup:Integer;bExpand:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XMenuBar_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMenuBar_AddButton (hEle:Integer;pText:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
procedure XMenuBar_SetButtonHeight (hEle:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
function XMenuBar_GetMenu (hEle:Integer;nIndex:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMenuBar_DeleteButton (hEle:Integer;nIndex:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XMenu_Create () : Integer;stdcall;far; external 'xcgui.dll';
procedure XMenu_AddItem (hMenu:Integer;nID:Integer;pText:PWideChar;parentId:Integer;nFlags:Integer);stdcall;far; external 'xcgui.dll';
procedure XMenu_AddItemIcon (hMenu:Integer;nID:Integer;pText:PWideChar;nParentID:Integer;hImage:Integer;nFlags:Integer);stdcall;far; external 'xcgui.dll';
procedure XMenu_InsertItem (hMenu:Integer;nID:Integer;pText:PWideChar;nFlags:Integer;insertID:Integer);stdcall;far; external 'xcgui.dll';
procedure XMenu_InsertItemIcon (hMenu:Integer;nID:Integer;pText:PWideChar;hIcon:Integer;nFlags:Integer;insertID:Integer);stdcall;far; external 'xcgui.dll';
procedure XMenu_SetAutoDestroy (hMenu:Integer;bAuto:LongBool);stdcall;far; external 'xcgui.dll';
procedure XMenu_EnableDrawBackground (hMenu:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XMenu_EnableDrawItem (hMenu:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XMenu_Popup (hMenu:Integer;hParentWnd:Integer;x:Integer;y:Integer;hParentEle:Integer;nPosition:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XMenu_DestroyMenu (hMenu:Integer);stdcall;far; external 'xcgui.dll';
procedure XMenu_CloseMenu (hMenu:Integer);stdcall;far; external 'xcgui.dll';
procedure XMenu_SetBkImage (hMenu:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XMenu_SetItemText (hMenu:Integer;nID:Integer;pText:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XMenu_GetItemText (hMenu:Integer;nID:Integer;pOut:PWideChar;nOutLen:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XMenu_GetItemTextLength (hMenu:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMenu_SetItemIcon (hMenu:Integer;nID:Integer;hIcon:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XMenu_SetItemFlags (hMenu:Integer;nID:Integer;uFlags:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XMenu_SetItemHeight (hMenu:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
function XMenu_GetItemHeight (hMenu:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XMenu_SetBorderColor (hMenu:Integer;crColor:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XMenu_GetLeftWidth (hMenu:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMenu_GetLeftSpaceText (hMenu:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMenu_GetItemCount (hMenu:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XMenu_SetItemCheck (hMenu:Integer;nID:Integer;bCheck:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XMenu_IsItemCheck (hMenu:Integer;nID:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XModalWnd_Create (nWidth:Integer;nHeight:Integer;pTitle:PWideChar;hWndParent:Integer;XCStyle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XModalWnd_CreateEx (dwExStyle:Integer;lpClassName:PWideChar;lpWindowName:PWideChar;dwStyle:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer;hWndParent:Integer;XCStyle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XModalWnd_EnableAutoClose (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XModalWnd_DoModal (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XModalWnd_EndModal (hWindow:Integer;nResult:Integer);stdcall;far; external 'xcgui.dll';
function XPane_Create (pName:PWideChar;nWidth:Integer;nHeight:Integer;hFrameWnd:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XPane_SetView (hEle:Integer;hView:Integer);stdcall;far; external 'xcgui.dll';
function XPane_IsShowPane (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XPane_SetTitle (hEle:Integer;pTitle:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XPane_GetTitle (hEle:Integer;pOut:PWideChar;nOutLen:Integer);stdcall;far; external 'xcgui.dll';
procedure XPane_SetCaptionHeight (hEle:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
function XPane_GetCaptionHeight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XPane_HidePane (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XPane_ShowPane (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XPane_DockPane (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XPane_LockPane (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XPane_FloatPane (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XFloatWnd_EnableCaptionContent (hWindow:Integer;bEnable:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XFloatWnd_GetCaptionLayout (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XFloatWnd_GetCaptionShapeText (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XFloatWnd_GetCaptionButtonClose (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XFloatWnd_SetTitle (hWindow:Integer;pTitle:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XFloatWnd_GetTitle (hWindow:Integer;pOut:PWideChar;nOutLen:Integer);stdcall;far; external 'xcgui.dll';
function XProgBar_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XProgBar_SetRange (hEle:Integer;range:Integer);stdcall;far; external 'xcgui.dll';
function XProgBar_GetRange (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XProgBar_SetSpaceTwo (hEle:Integer;leftSize:Integer;rightSize:Integer);stdcall;far; external 'xcgui.dll';
procedure XProgBar_SetPos (hEle:Integer;pos:Integer);stdcall;far; external 'xcgui.dll';
function XProgBar_GetPos (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XProgBar_SetHorizon (hEle:Integer;bHorizon:LongBool);stdcall;far; external 'xcgui.dll';
procedure XProgBar_SetImageLoad (hEle:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XPGrid_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XPGrid_AddItem (hEle:Integer;pName:PWideChar;nType:Integer;nParentID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XPGrid_AddItemString (hEle:Integer;pName:PWideChar;pValue:PWideChar;nParentID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XPGrid_DeleteAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XPGrid_GetItemHELE (hEle:Integer;nItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XPGrid_SetWidth (hEle:Integer;nWidth:Integer);stdcall;far; external 'xcgui.dll';
function XPGrid_SetItemValue (hEle:Integer;nItemID:Integer;pValue:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XPGrid_SetItemValueInt (hEle:Integer;nItemID:Integer;nValue:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XPGrid_GetItemValue (hEle:Integer;nItemID:Integer) : PWideChar;stdcall;far; external 'xcgui.dll';
function XPGrid_HitTest (hEle:Integer;pPt:TPOINT;pbExpandButton:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XPGrid_HitTestOffset (hEle:Integer;pPt:TPOINT;pbExpandButton:LongBool) : Integer;stdcall;far; external 'xcgui.dll';
function XPGrid_ExpandItem (hEle:Integer;nItemID:Integer;bExpand:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XPGrid_GetSelItem (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XPGrid_SetSelItem (hEle:Integer;nItemID:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEditColor_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEditColor_SetColor (hEle:Integer;color:Integer);stdcall;far; external 'xcgui.dll';
function XRichEditColor_GetColor (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEditSet_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEditFile_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEditFile_SetOpenFileType (hEle:Integer;pType:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XRichEditFile_SetDefaultFile (hEle:Integer;pFile:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XRichEditFile_SetRelativeDir (hEle:Integer;pDir:PWideChar);stdcall;far; external 'xcgui.dll';
function XRichEditFolder_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEditFolder_SetDefaultDir (hEle:Integer;pDir:PWideChar);stdcall;far; external 'xcgui.dll';
function XRichEdit_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_InsertString (hEle:Integer;pString:PWideChar;pFont:TLOGFONTW;color:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_InsertImage (hEle:Integer;hImage:Integer;pImagePath:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_InsertGif (hEle:Integer;hImage:Integer;pImagePath:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_InsertStringEx (hEle:Integer;iRow:Integer;iColumn:Integer;pString:PWideChar;pFont:TLOGFONTW;color:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_InsertImageEx (hEle:Integer;iRow:Integer;iColumn:Integer;hImage:Integer;pImagePath:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_InsertGifEx (hEle:Integer;iRow:Integer;iColumn:Integer;hImage:Integer;pImagePath:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnableReadOnly (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnableMultiLine (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnablePassword (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnableEvent_XE_RICHEDIT_CHANGE (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnableAutoWrap (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnableAutoCancelSel (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_EnableAutoSelAll (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_SetText (hEle:Integer;pString:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_SetTextInt (hEle:Integer;nVaule:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_GetText (hEle:Integer;pOut:PWideChar;len:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_GetHTMLFormat (hEle:Integer;pOut:PWideChar;len:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_GetData (hEle:Integer;pDataSize:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEdit_InsertData (hEle:Integer;pData:Integer;iRow:Integer;iColumn:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_GetTextLength (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_SetRowHeight (hEle:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_GetCurrentRow (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEdit_GetCurrentColumn (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_SetCurrentPos (hEle:Integer;iRow:Integer;iColumn:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_GetRowCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEdit_GetRowLength (hEle:Integer;iRow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEdit_GetSelectText (hEle:Integer;pOut:PWideChar;len:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XRichEdit_GetSelectPosition (hEle:Integer;pBegin:TPosition;pEnd:TPosition) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_SetSelect (hEle:Integer;iStartRow:Integer;iStartCol:Integer;iEndRow:Integer;iEndCol:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_SetItemFontEx (hEle:Integer;beginRow:Integer;beginColumn:Integer;endRow:Integer;endColumn:Integer;pFont:TLOGFONTW) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_SetItemColorEx (hEle:Integer;beginRow:Integer;beginColumn:Integer;endRow:Integer;endColumn:Integer;color:Integer;alpha:Byte) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_CancelSelect (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XRichEdit_SetSelectBkColor (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XRichEdit_IsEmpty (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_SelectAll (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_DeleteSelect (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XRichEdit_DeleteAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XRichEdit_ClipboardCut (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_ClipboardCopy (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XRichEdit_ClipboardPaste (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSBar_SetRange (hEle:Integer;range:Integer);stdcall;far; external 'xcgui.dll';
function XSBar_GetRange (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSBar_ShowButton (hEle:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
procedure XSBar_SetSliderLength (hEle:Integer;length:Integer);stdcall;far; external 'xcgui.dll';
procedure XSBar_SetSliderMinLength (hEle:Integer;minLength:Integer);stdcall;far; external 'xcgui.dll';
function XSBar_SetHorizon (hEle:Integer;bHorizon:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_GetSliderMaxLength (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSBar_ScrollUp (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_ScrollDown (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_ScrollTop (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_ScrollBottom (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_ScrollPos (hEle:Integer;pos:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSBar_GetButtonUp (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSBar_GetButtonDown (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSBar_GetButtonSlider (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSView_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSView_SetTotalSize (hEle:Integer;cx:Integer;cy:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XSView_GetTotalSize (hEle:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
function XSView_SetLineSize (hEle:Integer;nWidth:Integer;nHeight:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XSView_GetLineSize (hEle:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
function XSView_GetViewPosH (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSView_GetViewPosV (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSView_GetViewWidth (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSView_GetViewHeight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSView_GetViewRect (hEle:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
function XSView_GetScrollBarH (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSView_GetScrollBarV (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSView_SetPadding (hEle:Integer;left:Integer;top:Integer;right:Integer;bottom:Integer);stdcall;far; external 'xcgui.dll';
procedure XSView_GetPadding (hEle:Integer;pPadding:TPaddingSize_);stdcall;far; external 'xcgui.dll';
function XSView_ScrollPosH (hEle:Integer;pos:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollPosV (hEle:Integer;pos:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollPosXH (hEle:Integer;posX:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollPosYV (hEle:Integer;posY:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XSView_ShowSBarH (hEle:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
procedure XSView_ShowSBarV (hEle:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
procedure XSView_EnableAutoShowScrollBar (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XSView_ScrollLeftLine (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollRightLine (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollTopLine (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollBottomLine (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollLeft (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollRight (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollTop (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XSView_ScrollBottom (hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XShape_GetParentEle (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XShape_GetParentLayout (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XShape_GetHWINDOW (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XShape_GetParent (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShape_SetID (hShape:Integer;nID:Integer);stdcall;far; external 'xcgui.dll';
function XShape_GetID (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShape_Redraw (hShape:Integer);stdcall;far; external 'xcgui.dll';
function XShape_GetWidth (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XShape_GetHeight (hShape:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShape_GetRect (hShape:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XShape_SetRect (hShape:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
procedure XShape_GetContentSize (hShape:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
procedure XShape_ShowLayout (hShape:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
procedure XShape_AdjustLayout (hShape:Integer);stdcall;far; external 'xcgui.dll';
procedure XShape_Destroy (hShape:Integer);stdcall;far; external 'xcgui.dll';
function XShapeText_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;pName:PWideChar;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetText (hTextBlock:Integer;pName:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XShapeText_GetText (hTextBlock:Integer;pOut:PWideChar;nOutLen:Integer);stdcall;far; external 'xcgui.dll';
function XShapeText_GetTextLength (hTextBlock:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetFont (hTextBlock:Integer;hFontx:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetTextColor (hTextBlock:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XShapeText_GetTextColor (hTextBlock:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetTextAlign (hTextBlock:Integer;align:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetOffset (hTextBlock:Integer;x:Integer;y:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetLayoutWidth (hTextBlock:Integer;nType:Integer;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeText_SetLayoutHeight (hTextBlock:Integer;nType:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeText_GetLayoutWidth (hTextBlock:Integer;pType:Integer;pWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeText_GetLayoutHeight (hTextBlock:Integer;pType:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
function XShapePic_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapePic_SetImage (hShape:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapePic_SetLayoutWidth (hShape:Integer;nType:Integer;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapePic_SetLayoutHeight (hShape:Integer;nType:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapePic_GetLayoutWidth (hShape:Integer;pType:Integer;pWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapePic_GetLayoutHeight (hShape:Integer;pType:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
function XShapeGif_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeGif_SetImage (hShape:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGif_SetLayoutWidth (hShape:Integer;nType:Integer;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGif_SetLayoutHeight (hShape:Integer;nType:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGif_GetLayoutWidth (hShape:Integer;pType:Integer;pWidth:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGif_GetLayoutHeight (hShape:Integer;pType:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
function XShapeRect_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeRect_SetBorderColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XShapeRect_SetFillColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XShapeRect_SetRoundAngle (hShape:Integer;nWidth:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeRect_GetRoundAngle (hShape:Integer;pWidth:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeRect_EnableBorder (hShape:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XShapeRect_EnableFill (hShape:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XShapeRect_EnableRoundAngle (hShape:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XShapeEllipse_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeEllipse_SetBorderColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XShapeEllipse_SetFillColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XShapeEllipse_EnableBorder (hShape:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XShapeEllipse_EnableFill (hShape:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XShapeGroupBox_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;pName:PWideChar;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_SetBorderColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_SetTextColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_SetFontX (hShape:Integer;hFontX:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_SetTextOffset (hShape:Integer;offsetX:Integer;offsetY:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_SetRoundAngle (hShape:Integer;nWidth:Integer;nHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_SetText (hShape:Integer;pText:PWideChar);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_GetTextOffset (hShape:Integer;pOffsetX:Integer;pOffsetY:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_GetRoundAngle (hShape:Integer;pWidth:Integer;pHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeGroupBox_EnableRoundAngle (hShape:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XShapeLine_Create (x1:Integer;y1:Integer;x2:Integer;y2:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XShapeLine_SetPosition (hShape:Integer;x1:Integer;y1:Integer;x2:Integer;y2:Integer);stdcall;far; external 'xcgui.dll';
procedure XShapeLine_SetColor (hShape:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XSliderBar_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetRange (hEle:Integer;range:Integer);stdcall;far; external 'xcgui.dll';
function XSliderBar_GetRange (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetButtonWidth (hEle:Integer;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetButtonHeight (hEle:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetSpaceTwo (hEle:Integer;leftSize:Integer;rightSize:Integer);stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetPos (hEle:Integer;pos:Integer);stdcall;far; external 'xcgui.dll';
function XSliderBar_GetPos (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XSliderBar_GetButton (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetHorizon (hEle:Integer;bHorizon:LongBool);stdcall;far; external 'xcgui.dll';
procedure XSliderBar_SetImageLoad (hEle:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XTabBar_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_AddLabel (hEle:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_InsertLabel (hEle:Integer;index:Integer;pName:PWideChar) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_DeleteLabel (hEle:Integer;index:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XTabBar_DeleteLabelAll (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XTabBar_GetLabel (hEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_GetLabelClose (hEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_GetButtonLeft (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_GetButtonRight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_GetSelect (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_GetLabelSpacing (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTabBar_GetLabelCount (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTabBar_SetLabelSpacing (hEle:Integer;spacing:Integer);stdcall;far; external 'xcgui.dll';
procedure XTabBar_SetSelect (hEle:Integer;index:Integer);stdcall;far; external 'xcgui.dll';
procedure XTabBar_SetUp (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XTabBar_SetDown (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XTabBar_EnableTile (hEle:Integer;bTile:LongBool);stdcall;far; external 'xcgui.dll';
procedure XTabBar_EnableClose (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XTabBar_SetCloseSize (hEle:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
procedure XTabBar_SetTurnButtonSize (hEle:Integer;pSize:TSIZE);stdcall;far; external 'xcgui.dll';
function XTabBar_ShowLabel (hEle:Integer;index:Integer;bShow:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XTextLink_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;pName:PWideChar;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTextLink_EnableUnderlineLeave (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XTextLink_EnableUnderlineStay (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XTextLink_SetTextColorStay (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XTextLink_SetUnderlineColorLeave (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XTextLink_SetUnderlineColorStay (hEle:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
function XToolBar_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XToolBar_InsertEle (hEle:Integer;hNewEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XToolBar_InsertSeparator (hEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XToolBar_EnableButtonMenu (hEle:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
function XToolBar_GetHEle (hEle:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XToolBar_GetButtonLeft (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XToolBar_GetButtonRight (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XToolBar_GetButtonMenu (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XToolBar_SetSpace (hEle:Integer;nSize:Integer);stdcall;far; external 'xcgui.dll';
procedure XToolBar_DeleteEle (hEle:Integer;index:Integer);stdcall;far; external 'xcgui.dll';
procedure XToolBar_DeleteAllEle (hEle:Integer);stdcall;far; external 'xcgui.dll';
function XTree_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;hParent:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_SetItemTemplateXML (hEle:Integer;pXmlFile:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_SetItemTemplateXMLSel (hEle:Integer;pXmlFile:PWideChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_SetItemTemplateXMLFromString (hEle:Integer;pStringXML:PChar) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_SetItemTemplateXMLSelFromString (hEle:Integer;pStringXML:PChar) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XTree_SetDrawItemBkFlags (hEle:Integer;nFlags:Integer);stdcall;far; external 'xcgui.dll';
function XTree_SetItemData (hEle:Integer;nID:Integer;nUserData:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_GetItemData (hEle:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_SetSelectItem (hEle:Integer;nID:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_GetSelectItem (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_IsExpand (hEle:Integer;nID:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_ExpandItem (hEle:Integer;nID:Integer;bExpand:LongBool) : LongBool;stdcall;far; external 'xcgui.dll';
function XTree_HitTest (hEle:Integer;pPt:TPOINT) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_HitTestOffet (hEle:Integer;pPt:TPOINT) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_GetFirstChildItem (hEle:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_GetNextSiblingItem (hEle:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_GetParentItem (hEle:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTree_SetIndentation (hEle:Integer;nWidth:Integer);stdcall;far; external 'xcgui.dll';
function XTree_GetIndentation (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTree_SetItemHeight (hEle:Integer;nID:Integer;nHeight:Integer;nSelHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XTree_GetItemHeight (hEle:Integer;nID:Integer;pHeight:Integer;pSelHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XTree_AddItemBkBorder (hEle:Integer;nState:Integer;color:Integer;alpha:Byte;width:Integer);stdcall;far; external 'xcgui.dll';
procedure XTree_AddItemBkFill (hEle:Integer;nState:Integer;color:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XTree_AddItemBkImage (hEle:Integer;nState:Integer;hImage:Integer);stdcall;far; external 'xcgui.dll';
function XTree_GetItemBkInfoCount (hEle:Integer;nState:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTree_ClearItemBkInfo (hEle:Integer;nState:Integer);stdcall;far; external 'xcgui.dll';
procedure XTree_SetItemHeightDefault (hEle:Integer;nHeight:Integer;nSelHeight:Integer);stdcall;far; external 'xcgui.dll';
procedure XTree_GetItemHeightDefault (hEle:Integer;pHeight:Integer;pSelHeight:Integer);stdcall;far; external 'xcgui.dll';
function XTree_GetTemplateObject (hEle:Integer;nID:Integer;nTempItemID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XTree_GetItemIDFromHXCGUI (hEle:Integer;hXCGUI:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTree_BindAdapter (hEle:Integer;hAdapter:Integer);stdcall;far; external 'xcgui.dll';
function XTree_GetAdapter (hEle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XTree_RefreshData (hEle:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_RegEventEx (hWindow:Integer;pEvent:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_RemoveEventEx (hWindow:Integer;pEvent:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XWnd_RegEventC (hWindow:Integer;nEvent:Integer;pFun:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_RegEventC1 (hWindow:Integer;nEvent:Integer;pFun:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_RemovegEvent (hWindow:Integer;nEvent:Integer;pFun:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XWnd_Create (x:Integer;y:Integer;cx:Integer;cy:Integer;pTitle:PWideChar;hWndParent:Integer;XCStyle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_CreateEx (dwExStyle:Integer;lpClassName:PWideChar;lpWindowName:PWideChar;dwStyle:Integer;x:Integer;y:Integer;cx:Integer;cy:Integer;hWndParent:Integer;XCStyle:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_AddEle (hWindow:Integer;hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XWnd_InsertEle (hWindow:Integer;hChildEle:Integer;hDestEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XWnd_AddShape (hWindow:Integer;hShape:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XWnd_GetHWND (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_EnableDragBorder (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_EnableDragWindow (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_EnableDragCaption (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_EnableDrawBk (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_EnableAutoFocus (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_EnableMaxWindow (hWindow:Integer;bEnable:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_RedrawWnd (hWindow:Integer;bImmediate:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_RedrawWndRect (hWindow:Integer;pRect:TRECT;bImmediate:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetFocusEle (hWindow:Integer;hFocusEle:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_GetFocusEle (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetStayHELE (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_SetCursor (hWindow:Integer;hCursor:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_GetCursor (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_SetCursorSys (hWindow:Integer;hCursor:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_SetFont (hWindow:Integer;hFontx:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetID (hWindow:Integer;nID:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_GetID (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_SetCaptureEle (hWindow:Integer;hEle:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_GetCaptureEle (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_BindLayoutEle (hWindow:Integer;nPosition:Integer;hEle:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XWnd_GetLayoutEle (hWindow:Integer;nPosition:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_BindLayoutObject (hWindow:Integer;nPosition:Integer;hLayout:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_GetLayoutObject (hWindow:Integer;nPosition:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_SetLayoutSize (hWindow:Integer;left:Integer;top:Integer;right:Integer;bottom:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_GetLayoutSize (hWindow:Integer;pBorderSize:TBorderSize_);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetDragBorderSize (hWindow:Integer;left:Integer;top:Integer;right:Integer;bottom:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_GetDragBorderSize (hWindow:Integer;pSize:TBorderSize_);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetMinimumSize (hWindow:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_HitChildEle (hWindow:Integer;pPt:TPOINT) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetChildCount (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetChildByIndex (hWindow:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetChildByID (hWindow:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetEle (hWindow:Integer;nID:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetChildShapeCount (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetChildShapeByIndex (hWindow:Integer;index:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_GetDrawRect (hWindow:Integer;pRcPaint:TRECT);stdcall;far; external 'xcgui.dll';
function XWnd_ShowWindow (hWindow:Integer;nCmdShow:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XWnd_AdjustLayout (hWindow:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_AdjustLayoutObject (hWindow:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_CloseWindow (hWindow:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_CreateCaret (hWindow:Integer;hEle:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetCaretSize (hWindow:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetCaretPos (hWindow:Integer;x:Integer;y:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetCaretPosEx (hWindow:Integer;x:Integer;y:Integer;width:Integer;height:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetCaretColor (hWindow:Integer;color:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_ShowCaret (hWindow:Integer;bShow:LongBool);stdcall;far; external 'xcgui.dll';
procedure XWnd_DestroyCaret (hWindow:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_GetCaretHELE (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_GetClientRect (hWindow:Integer;pRect:TRECT) : LongBool;stdcall;far; external 'xcgui.dll';
procedure XWnd_GetBodyRect (hWindow:Integer;pRect:TRECT);stdcall;far; external 'xcgui.dll';
function XWnd_SetTimer (hWindow:Integer;nIDEvent:Integer;uElapse:Integer) : Integer;stdcall;far; external 'xcgui.dll';
function XWnd_KillTimer (hWindow:Integer;nIDEvent:Integer) : LongBool;stdcall;far; external 'xcgui.dll';
function XWnd_GetBkInfoManager (hWindow:Integer) : Integer;stdcall;far; external 'xcgui.dll';
procedure XWnd_SetTransparentType (hWindow:Integer;nType:Integer);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetTransparentAlpha (hWindow:Integer;alpha:Byte);stdcall;far; external 'xcgui.dll';
procedure XWnd_SetTransparentColor (hWindow:Integer;color:Integer);stdcall;far; external 'xcgui.dll';
function XWnd_RegEventTest (nEvent:Integer;pParamType:Integer) : LongBool;stdcall;far; external 'xcgui.dll';



const
const
 XC_ERROR = -1 ; /////<错误类型
 XC_WINDOW = 1 ; /////<窗口
 XC_MODALWINDOW = 2 ; /////<模态窗口
 XC_FRAMEWND = 3 ; /////<框架窗口
 XC_FLOATWND = 4 ; /////<浮动窗口
 XC_COMBOBOXWINDOW = 11 ; ////comboBoxWindow_        组合框弹出下拉列表窗口
 XC_POPUPMENUWINDOW = 12 ; ////popupMenuWindow_       弹出菜单主窗口
 XC_POPUPMENUCHILDWINDOW = 13 ; ////popupMenuChildWindow_  弹出菜单子窗口
 XC_ELE = 21 ; /////<基础元素
 XC_BUTTON = 22 ; /////<按钮
 XC_RICHEDIT = 23 ; /////<富文本编辑框
 XC_COMBOBOX = 24 ; /////<下拉组合框元素
 XC_SCROLLBAR = 25 ; /////<滚动条元素
 XC_SCROLLVIEW = 26 ; /////<滚动视图元素
 XC_LIST = 27 ; /////<列表元素
 XC_LISTBOX = 28 ; /////<列表框元素
 XC_LISTVIEW = 29 ; //大图标
 XC_TREE = 30 ; /////<树元素
 XC_MENUBAR = 31 ; /////<菜单条
 XC_SLIDERBAR = 32 ; /////<滑动条
 XC_PROGRESSBAR = 33 ; /////<进度条
 XC_TOOLBAR = 34 ; /////<工具条
 XC_MONTHCAL = 35 ; /////<月历元素
 XC_DATETIME = 36 ; /////<时间元素
 XC_PROPERTYGRID = 37 ; /////<属性网格
 XC_RICHEDIT_COLOR = 38 ; /////<颜色选择元素
 XC_RICHEDIT_SET = 39 ; //
 XC_TABBAR = 40 ; /////<tab条
 XC_TEXTLINK = 41 ; /////<文本链接按钮
 XC_PANE = 42 ; /////<布局窗格
 XC_PANE_SPLIT = 43 ; /////<布局窗格拖动分割条
 XC_MENUBAR_BUTTON = 44 ; /////<菜单条上的按钮
 XC_TOOLBAR_BUTTON = 45 ; /////<工具条上按钮
 XC_PROPERTYPAGE_LABEL = 46 ; /////<属性页标签按钮
 XC_PIER = 47 ; /////<窗格停靠码头
 XC_BUTTON_MENU = 48 ; /////<弹出菜单按钮
 XC_VIRTUAL_ELE = 49 ; /////<虚拟元素
 XC_RICHEDIT_FILE = 50 ; /////<RichEditFile 文件选择编辑框
 XC_RICHEDIT_FOLDER = 51 ; /////<RichEditFolder  文件夹选择编辑框
 XC_LIST_HEADER = 52 ; /////<列表头元素
 XC_SHAPE = 61 ; /////<形状对象
 XC_SHAPE_TEXT = 62 ; /////<形状对象-文本
 XC_SHAPE_PICTURE = 63 ; /////<形状对象-图片
 XC_SHAPE_RECT = 64 ; /////<形状对象-矩形
 XC_SHAPE_ELLIPSE = 65 ; /////<形状对象-圆
 XC_SHAPE_LINE = 66 ; /////<形状对象-直线
 XC_SHAPE_GROUPBOX = 67 ; /////<形状对象-组框
 XC_SHAPE_GIF = 68 ; /////<形状对象-GIF
 XC_MENU = 81 ; /////<弹出菜单
 XC_IMAGE = 82 ; /////<图片操作
 XC_HDRAW = 83 ; /////<绘图操作
 XC_FONT = 84 ; /////<炫彩字体
 XC_FLASH = 85 ; /////<flash
 XC_PANE_CELL = 86 ; //
 XC_WEB = 87 ; //
 XC_LAYOUT_OBJECT = 101 ; /////<布局对象LayoutObject
 XC_ADAPTER = 102 ; //
 XC_ADAPTER_TABLE = 103 ; /////<数据适配器AdapterTable
 XC_ADAPTER_TREE = 104 ; /////<数据适配器AdapterTree
 XC_ADAPTER_LISTVIEW = 105 ; /////<数据适配器AdapterListView
 XC_ADAPTER_MAP = 106 ; /////<数据适配器AdapterMap
 XC_LAYOUT_LISTVIEW = 111 ; //
 XC_LAYOUT_LIST = 112 ; //
 XC_LAYOUT_OBJECT_GROUP = 113 ; //
 XC_LAYOUT_OBJECT_ITEM = 114 ; //
 XC_LAYOUT_PANEL = 115 ; //
 XC_BKINFOM = 116 ; //
 xc_window_style_nothing = 0 ; /////<什么也没有
 xc_window_style_caption = 1 ; //默认为绑定标题栏元素
 xc_window_style_border = 2 ; //那么边框布局大小为0
 xc_window_style_center = 4 ; /////<窗口居中
 xc_window_style_drag_border = 8 ; /////<拖动窗口边框
 xc_window_style_drag_window = 16 ; /////<拖动窗口
 xc_window_style_allow_maxWindow = 32 ; /////允许窗口最大化
 xc_window_style_default = 47 ; //
 xc_window_style_default2 = 43 ; //
 xc_window_style_modal = 7 ; //
 window_position_error = -1 ; /////<错误
 window_position_top = 0 ; /////<top
 window_position_bottom = 1 ; /////<bottom
 window_position_left = 2 ; /////<left
 window_position_right = 3 ; /////<right
 window_position_body = 4 ; /////<body
 window_position_window = 5 ; /////<window 整个窗口
 window_transparent_false = 0 ; //不透明
 window_transparent_shaped = 1 ; //异型
 window_transparent_shadow = 2 ; //当前未启用.
 window_transparent_simple = 3 ; //指定透明色.
 window_transparent_win7 = 4 ; //当前未启用.
 menu_item_flags_normal = 0 ; /////<正常
 menu_item_flags_select = 1 ; /////<选择
 menu_item_flags_check = 2 ; /////<勾选
 menu_item_flags_popup = 4 ; /////<弹出
 menu_item_flags_separator = 8 ; //ID号被忽略
 menu_item_flags_disable = 16 ; /////<禁用
 menu_popup_position_left_top = 0 ; /////<左上角
 menu_popup_position_left_bottom = 1 ; /////<左下角
 menu_popup_position_right_top = 2 ; /////<右上角
 menu_popup_position_right_bottom = 3 ; /////<右下角
 menu_popup_position_center_left = 4 ; /////<左居中
 menu_popup_position_center_top = 5 ; /////<上居中
 menu_popup_position_center_right = 6 ; /////<右居中
 menu_popup_position_center_bottom = 7 ; /////<下居中
 image_draw_type_default = 0 ; /////<默认
 image_draw_type_stretch = 1 ; /////<拉伸
 image_draw_type_adaptive = 2 ; //九宫格
 image_draw_type_tile = 3 ; /////<平铺
 image_draw_type_fixed_ratio = 4 ; //按照原始比例压缩显示图片
 image_draw_type_adaptive_border = 5 ; /////<九宫格不绘制中间区域
 common_state3_leave = 0 ; /////<离开
 common_state3_stay = 1 ; /////<停留
 common_state3_down = 2 ; /////<按下
 button_state_leave = 0 ; /////<离开状态
 button_state_stay = 1 ; /////<停留状态
 button_state_down = 2 ; /////<按下状态
 button_state_check = 3 ; /////<选中状态
 button_state_disable = 4 ; /////<禁用状态
 button_type_default = 0 ; /////<默认类型
 button_type_check = 1 ; /////<复选按钮
 button_type_radio = 2 ; /////<单选按钮
 button_type_close = 3 ; /////<窗口关闭按钮
 button_type_min = 4 ; /////<窗口最小化按钮
 button_type_max = 5 ; /////<窗口最大化还原按钮
 button_style_default = 0 ; /////<默认风格
 button_style_check = 1 ; /////<复选按钮
 button_style_radio = 2 ; /////<单选按钮
 button_style_scrollbar_up = 3 ; //上按钮
 button_style_scrollbar_down = 4 ; //下按钮
 button_style_scrollbar_left = 5 ; //左按钮
 button_style_scrollbar_right = 6 ; //右按钮
 button_style_scrollbar_slider = 7 ; //滑块
 button_style_tabBar_button = 8 ; /////<TabBar上的按钮
 button_style_toolBar_left = 9 ; /////<ToolBar左滚动按钮
 button_style_toolBar_right = 10 ; /////<ToolBar右滚动按钮
 button_style_pane_close = 11 ; /////<窗格关闭按钮
 button_style_pane_lock = 12 ; /////<窗格锁定按钮
 button_style_pane_menu = 13 ; /////<窗格下拉菜单按钮
 button_style_pane_dockH = 14 ; /////<框架窗口左边或右边码头上按钮
 button_style_pane_dockV = 15 ; /////<框架窗口上边或下边码头上按钮
 comboBox_state_leave = 0 ; /////<鼠标离开状态
 comboBox_state_stay = 1 ; /////<鼠标停留状态
 comboBox_state_down = 2 ; /////<按下状态
 list_item_state_leave = 0 ; /////<项鼠标离开状态
 list_item_state_stay = 1 ; /////<项鼠标停留状态
 list_item_state_select = 2 ; /////<项选择状态
 tree_item_state_leave = 0 ; /////<项鼠标离开状态
 tree_item_state_select = 1 ; /////<项选择状态
 button_icon_align_left = 0 ; /////<图标在左边
 button_icon_align_top = 1 ; /////<图标在顶部
 button_icon_align_right = 2 ; /////<图标在右边
 button_icon_align_bottom = 3 ; /////<图标在底部
 layout_size_type_fixed = 0 ; /////<指定大小
 layout_size_type_fill = 1 ; /////<fill 填充父
 layout_size_type_auto = 2 ; //根据内容计算大小
 layout_size_type_weight = 3 ; //按照比例分配剩余空间
 layout_size_type_disable = 4 ; /////<disable 不使用
 list_drawItemBk_flags_nothing = 0 ; /////<不绘制
 list_drawItemBk_flags_leave = 1 ; /////<绘制鼠标离开状态项背景
 list_drawItemBk_flags_stay = 2 ; /////<绘制鼠标选择状态项背景
 list_drawItemBk_flags_select = 4 ; /////<绘制鼠标停留状态项项背景
 list_drawItemBk_flags_group_leave = 8 ; //当项为组时
 messageBox_flags_other = 0 ; /////<其他
 messageBox_flags_ok = 1 ; /////<确定按钮
 messageBox_flags_cancel = 2 ; /////<取消按钮
 propertyGrid_item_type_text = 0 ; //字符串类型
 propertyGrid_item_type_edit = 1 ; /////<编辑框
 propertyGrid_item_type_edit_color = 2 ; /////<颜色选择元素
 propertyGrid_item_type_edit_file = 3 ; /////<文件选择编辑框
 propertyGrid_item_type_edit_set = 4 ; /////<设置
 propertyGrid_item_type_comboBox = 5 ; /////<组合框
 propertyGrid_item_type_group = 6 ; /////<组
 zorder_top = 1 ; /////<最上面
 zorder_bottom = 2 ; /////<最下面
 zorder_before = 3 ; /////<指定目标下面
 zorder_after = 4 ; /////<指定目标上面
 layout_align_left = 0 ; //
 layout_align_top = 1 ; //
 layout_align_right = 2 ; //
 layout_align_bottom = 3 ; //
 layout_align_center = 4 ; //
 layout_align_equidistant = 5 ; //
 align_error = -1 ; //
 align_left = 0 ; //
 align_top = 1 ; //
 align_right = 2 ; //
 align_bottom = 3 ; //
 align_center = 4 ; //
 dock_align_left = 0 ; //
 dock_align_top = 1 ; //
 dock_align_right = 2 ; //
 dock_align_bottom = 3 ; //
 pane_state_any = 0 ; //
 pane_state_lock = 1 ; //
 pane_state_dock = 2 ; //
 pane_state_float = 3 ; //
 bkInfo_type_error = 0 ; //
 bkInfo_type_fill = 1 ; /////<填充
 bkInfo_type_border = 2 ; /////<边框
 bkInfo_type_image = 3 ; /////<图片
 bkInfo_type_triangle = 4 ; /////<三角形
 bkInfo_type_rectangle = 5 ; /////<矩形
 bkInfo_type_ellipse = 6 ; /////<圆形
 bkInfo_type_roundRect = 7 ; /////<圆角矩形
 window_state_flag_nothing = 0 ; /////<无
 window_state_whole_leave = 1 ; /////<整个窗口
 window_state_body_leave = 2 ; /////<窗口-body
 window_state_top_leave = 4 ; /////<窗口-top
 window_state_bottom_leave = 8 ; /////<窗口-bottom
 window_state_left_leave = 16 ; /////<窗口-left
 window_state_right_leave = 32 ; /////<窗口-right
 element_state_flag_nothing = 0 ; /////<无
 element_state_flag_enable = 1 ; /////<启用
 element_state_flag_disable = 2 ; /////<禁用
 element_state_flag_focus = 4 ; /////<焦点
 element_state_flag_focus_no = 8 ; /////<无焦点
 element_state_flag_leave = 16 ; /////<鼠标离开
 element_state_flag_stay = 32 ; /////<为扩展模块保留
 element_state_flag_down = 64 ; /////<为扩展模块保留
 button_state_flag_leave = 16 ; /////<鼠标离开
 button_state_flag_stay = 32 ; /////<鼠标停留
 button_state_flag_down = 64 ; /////<鼠标按下
 button_state_flag_check = 128 ; /////<选中
 button_state_flag_check_no = 256 ; /////<未选中
 button_state_flag_WindowRestore = 512 ; ////窗口还原
 button_state_flag_WindowMaximize = 1024 ; ////窗口最大化
 comboBox_state_flag_leave = 16 ; /////<鼠标离开
 comboBox_state_flag_stay = 32 ; /////<鼠标停留
 comboBox_state_flag_down = 64 ; /////<鼠标按下
 listBox_state_flag_item_leave = 128 ; /////<项鼠标离开
 listBox_state_flag_item_stay = 256 ; /////<项鼠标停留
 listBox_state_flag_item_select = 512 ; /////<项选择
 listBox_state_flag_item_select_no = 1024 ; /////<项未选择
 list_state_flag_item_leave = 128 ; /////<项鼠标离开
 list_state_flag_item_stay = 256 ; /////<项鼠标停留
 list_state_flag_item_select = 512 ; /////<项选择
 list_state_flag_item_select_no = 1024 ; /////<项未选择
 listView_state_flag_item_leave = 128 ; /////<项鼠标离开
 listView_state_flag_item_stay = 256 ; /////<项鼠标停留
 listView_state_flag_item_select = 512 ; /////<项选择
 listView_state_flag_item_select_no = 1024 ; /////<项未选择
 listView_state_flag_group_leave = 2048 ; /////<组鼠标离开
 listView_state_flag_group_stay = 4096 ; /////<组鼠标停留
 listView_state_flag_group_select = 8192 ; /////<组选择
 listView_state_flag_group_select_no = 16384 ; /////<组未选择
 tree_state_flag_item_leave = 128 ; /////<项鼠标离开
 tree_state_flag_item_stay = 256 ; //暂未使用
 tree_state_flag_item_select = 512 ; /////<项选择
 tree_state_flag_item_select_no = 1024 ; /////<项未选择
 monthCal_state_flag_leave = 16 ; /////<离开状态
 monthCal_state_flag_item_leave = 128 ; /////< 项-离开
 monthCal_state_flag_item_stay = 256 ; /////< 项-停留
 monthCal_state_flag_item_down = 512 ; /////< 项-按下
 monthCal_state_flag_item_select = 1024 ; /////< 项-选择
 monthCal_state_flag_item_select_no = 2048 ; /////< 项-未选择
 monthCal_state_flag_item_today = 4096 ; /////< 项-今天
 monthCal_state_flag_item_other = 8192 ; /////< 项-上月及下月
 monthCal_state_flag_item_last_month = 16384 ; /////< 项-上月
 monthCal_state_flag_item_cur_month = 32768 ; /////< 项-当月
 monthCal_state_flag_item_next_month = 65536 ; /////< 项-下月
 propertyGrid_state_flag_item_leave = 128 ; //
 propertyGrid_state_flag_item_stay = 256 ; //
 propertyGrid_state_flag_item_select = 512 ; //
 propertyGrid_state_flag_item_select_no = 1024 ; //
 pane_state_flag_leave = 128 ; //
 pane_state_flag_stay = 256 ; //
 pane_state_flag_caption = 512 ; //
 pane_state_flag_body = 1024 ; //
 monthCal_button_type_today = 0 ; /////< 今天按钮
 monthCal_button_type_last_year = 1 ; /////< 上一年
 monthCal_button_type_next_year = 2 ; /////< 下一年
 monthCal_button_type_last_month = 3 ; /////< 上一月
 monthCal_button_type_next_month = 4 ; /////< 下一月
 XWM_WINDPROC = 28672 ; //
 XWM_REDRAW_ELE = 28675 ; //
 XWM_DRAW_T = 28673 ; //
 XWM_MENU_POPUP = 28677 ; //
 XWM_MENU_POPUP_WND = 28678 ; //
 XWM_MENU_SELECT = 28679 ; //
 XWM_MENU_EXIT = 28680 ; //
 XWM_MENU_DRAW_BACKGROUND = 28681 ; //
 XWM_MENU_DRAWITEM = 28682 ; //
 XWM_COMBOBOX_POPUP_DROPLIST = 28683 ; //
 XWM_FLOAT_PANE = 28684 ; //
 XC_WINDOW_BODY = 10 ; //
 IDM_CLIP = 1000000000 ; //
 IDM_COPY = 1000000001 ; //
 IDM_PASTE = 1000000002 ; //
 IDM_DELETE = 1000000003 ; //
 IDM_SELECTALL = 1000000004 ; //
 IDM_DELETEALL = 1000000005 ; //
 IDM_LOCK = 1000000006 ; //
 IDM_DOCK = 1000000007 ; //
 IDM_FLOAT = 1000000008 ; //
 IDM_HIDE = 1000000009 ; //
 XE_LBUTTONDOWN = 10 ; //
 XE_LBUTTONUP = 11 ; //
 XE_RBUTTONDOWN = 12 ; //
 XE_RBUTTONUP = 13 ; //
 XE_LBUTTONDBCLICK = 14 ; //
 XE_RBUTTONDBCLICK = 15 ; //
 XE_SETFOCUS = 31 ; //
 XE_KILLFOCUS = 32 ; //
 XE_DESTROY = 33 ; //
 XE_BNCLICK = 34 ; //
 XE_BUTTON_CHECK = 35 ; //
 XE_SIZE = 36 ; //
 XE_SHOW = 37 ; //
 XE_SETFONT = 38 ; //
 XE_KEYDOWN = 39 ; //
 XE_CHAR = 40 ; //
 XE_SETCAPTURE = 51 ; //
 XE_KILLCAPTURE = 52 ; //
 XE_SETCURSOR = 53 ; //
 XE_SCROLLVIEW_SCROLL_H = 54 ; //
 XE_SCROLLVIEW_SCROLL_V = 55 ; //
 XE_SBAR_SCROLL = 56 ; //
 XE_MENU_POPUP = 57 ; //
 XE_MENU_POPUP_WND = 58 ; //
 XE_MENU_SELECT = 59 ; //
 XE_MENU_DRAW_BACKGROUND = 60 ; //
 XE_MENU_DRAWITEM = 61 ; //
 XE_MENU_EXIT = 62 ; //
 XE_SLIDERBAR_CHANGE = 63 ; //
 XE_PROGRESSBAR_CHANGE = 64 ; //
 XE_COMBOBOX_SELECT = 71 ; //
 XE_COMBOBOX_POPUP_LIST = 72 ; //
 XE_COMBOBOX_EXIT_LIST = 73 ; //
 XE_LISTBOX_TEMP_CREATE = 81 ; //
 XE_LISTBOX_TEMP_CREATE_END = 82 ; //
 XE_LISTBOX_TEMP_DESTROY = 83 ; //
 XE_LISTBOX_TEMP_ADJUST_COORDINATE = 84 ; //
 XE_LISTBOX_DRAWITEM = 85 ; //
 XE_LISTBOX_SELECT = 86 ; //
 XE_LIST_TEMP_CREATE = 101 ; //
 XE_LIST_TEMP_CREATE_END = 102 ; //
 XE_LIST_TEMP_DESTROY = 103 ; //
 XE_LIST_TEMP_ADJUST_COORDINATE = 104 ; //
 XE_LIST_DRAWITEM = 105 ; //
 XE_LIST_SELECT = 106 ; //
 XE_LIST_HEADER_DRAWITEM = 107 ; //
 XE_LIST_HEADER_CLICK = 108 ; //
 XE_LIST_HEADER_WIDTH_CHANGE = 109 ; //
 XE_LIST_HEADER_TEMP_CREATE = 110 ; //
 XE_LIST_HEADER_TEMP_CREATE_END = 111 ; //
 XE_LIST_HEADER_TEMP_DESTROY = 112 ; //
 XE_LIST_HEADER_TEMP_ADJUST_COORDINATE = 113 ; //
 XE_TREE_TEMP_CREATE = 121 ; //
 XE_TREE_TEMP_CREATE_END = 122 ; //
 XE_TREE_TEMP_DESTROY = 123 ; //
 XE_TREE_TEMP_ADJUST_COORDINATE = 124 ; //
 XE_TREE_DRAWITEM = 125 ; //
 XE_TREE_SELECT = 126 ; //
 XE_TREE_EXPAND = 127 ; //
 XE_LISTVIEW_TEMP_CREATE = 141 ; //
 XE_LISTVIEW_TEMP_CREATE_END = 142 ; //
 XE_LISTVIEW_TEMP_DESTROY = 143 ; //
 XE_LISTVIEW_TEMP_ADJUST_COORDINATE = 144 ; //
 XE_LISTVIEW_DRAWITEM = 145 ; //
 XE_LISTVIEW_SELECT = 146 ; //
 XE_LISTVIEW_EXPAND = 147 ; //
 XE_PGRID_VALUE_CHANGE = 151 ; //
 XE_PGRID_ITEM_SET = 152 ; //
 XE_PGRID_ITEM_SELECT = 153 ; //
 XE_RICHEDIT_CHANGE = 161 ; //
 XE_RICHEDIT_SET = 162 ; //
 XE_TABBAR_SELECT = 221 ; //
 XE_TABBAR_DELETE = 222 ; //
 XE_MONTHCAL_CHANGE = 231 ; //
 XE_DATETIME_CHANGE = 241 ; //
 XE_DATETIME_POPUP_MONTHCAL = 242 ; //
 XE_DATETIME_EXIT_MONTHCAL = 243 ; //
 XE_DROPFILES = 250 ; //
 XC_PARAM_HIMAGE = 10 ; //
 XC_PARAM_HDRAW = 11 ; //
 XC_PARAM_P_RECT = 12 ; //
 XC_PARAM_P_POINT = 13 ; //
 XC_PARAM_P_SIZE = 14 ; //
 XC_PARAM_P_BOOL = 15 ; //
 XC_PARAM_P_listBox_item_i = 16 ; //
 XC_PARAM_P_list_header_item_i = 17 ; //
 XC_PARAM_P_list_item_i = 18 ; //
 XC_PARAM_P_listView_item_i = 19 ; //
 XC_PARAM_P_tree_item_i = 20 ; //
 XC_PARAM_P_menu_popupWnd = 21 ; //
 XC_PARAM_P_menu_drawBackground = 22 ; //
 XC_PARAM_P_menu_drawItem = 23 ; //
 XC_PARAM_HDROP = 24 ; //
 XC_WINDOW_TOP = 1 ; //
 XC_WINDOW_BOTTOM = 2 ; //
 XC_WINDOW_LEFT = 3 ; //
 XC_WINDOW_RIGHT = 4 ; //
 XC_WINDOW_TOPLEFT = 5 ; //
 XC_WINDOW_TOPRIGHT = 6 ; //
 XC_WINDOW_BOTTOMLEFT = 7 ; //
 XC_WINDOW_BOTTOMRIGHT = 8 ; //
 XC_WINDOW_CAPTION = 9 ; //
 XC_ID_ROOT = 0 ; //
 XE_ELEPROCE = 1 ; //
 XE_PAINT_END = 3 ; //
 XE_MOUSESTAY = 6 ; //
 XE_MOUSEHOVER = 7 ; //
 XE_MOUSELEAVE = 8 ; //
 XE_MOUSEWHEEL = 9 ; //
 XE_PAINT = 2 ; //
 XE_PAINT_SCROLLVIEW = 4 ; //
 XE_MOUSEMOVE = 5 ; //
 XC_PARAM_int = 1 ; //
 XC_PARAM_uint = 2 ; //
 XC_PARAM_BOOL = 3 ; //
 XC_PARAM_CHAR = 4 ; //
 XC_PARAM_BYTE = 5 ; //
 XC_PARAM_HXCGUI = 6 ; //
 XC_PARAM_HWINDOW = 7 ; //
 XC_PARAM_HELE = 8 ; //
 XC_PARAM_HMENUX = 9 ; //
 XC_ID_ERROR = -1 ; //
 XC_ID_FIRST = -2 ; //
 XC_ID_LAST = -3 ; //



implementation
end.
