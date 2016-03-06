Attribute VB_Name = "XCGUI"
'xcgui.bas Ver 1.8.4.1
'Time 2015-6-19
'by 大色秘密
'url www.xcgui.com

Declare Function XC_UnicodeToAnsi Lib "xcgui.dll" (ByVal pIn As String, ByVal inLen As Long, ByVal pOut As String, ByVal outLen As Long) As Long
Declare Function XC_AnsiToUnicode Lib "xcgui.dll" (ByVal pIn As String, ByVal inLen As Long, ByVal pOut As String, ByVal outLen As Long) As Long
Declare Sub XC_DebugToFileInfo Lib "xcgui.dll" (ByVal pInfo As String)
Declare Function XC_IsHELE Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XC_IsHWINDOW Lib "xcgui.dll" (ByVal hWindow As Long) As Boolean
Declare Function XC_IsShape Lib "xcgui.dll" (ByVal hShape As Long) As Boolean
Declare Function XC_IsHXCGUI Lib "xcgui.dll" (ByVal hXCGUI As Long, ByVal ntype As Long) As Boolean
Declare Function XC_IsSViewExtend Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XC_GetObjectType Lib "xcgui.dll" (ByVal hXCGUI As Long) As Long
Declare Function XC_GetObjectByID Lib "xcgui.dll" (ByVal nID As Long) As Long
Declare Function XC_RectInRect Lib "xcgui.dll" (ByVal pRect1 As rect, ByVal pRect2 As rect) As Boolean
Declare Sub XC_CombineRect Lib "xcgui.dll" (ByVal pDest As rect, ByVal pSrc1 As rect, ByVal pSrc2 As rect)
Declare Sub XC_ShowLayoutFrame Lib "xcgui.dll" (ByVal bShow As Boolean)
Declare Sub XC_SetLayoutFrameColor Lib "xcgui.dll" (ByVal color As Long)
Declare Function XC_LoadLayout Lib "xcgui.dll" (ByVal pFileName As String) As Long
Declare Function XC_LoadResource Lib "xcgui.dll" (ByVal pFileName As String, ByVal pDir As String) As Boolean
Declare Function XC_TemplateLoad Lib "xcgui.dll" (ByVal ntype As Long, ByVal pFileName As String) As template_info_i
Declare Sub XC_TemplateDestroy Lib "xcgui.dll" (ByVal pInfo As template_info_i)
Declare Function XInitXCGUI Lib "xcgui.dll" (ByVal pText As String) As Boolean
Declare Sub XRunXCGUI Lib "xcgui.dll" ()
Declare Sub XExitXCGUI Lib "xcgui.dll" ()
Declare Function XBtn_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal pName As String, ByVal hParent As Long) As Long
Declare Function XBtn_IsCheck Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XBtn_SetCheck Lib "xcgui.dll" (ByVal hEle As Long, ByVal bCheck As Boolean) As Boolean
Declare Sub XBtn_SetState Lib "xcgui.dll" (ByVal hEle As Long, ByVal nState As Long)
Declare Function XBtn_GetState Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XBtn_SetStyle Lib "xcgui.dll" (ByVal hEle As Long, ByVal nStyle As Long)
Declare Function XBtn_GetStyle Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XBtn_SetType Lib "xcgui.dll" (ByVal hEle As Long, ByVal ntype As Long)
Declare Function XBtn_GetType Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XBtn_SetGroupID Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long)
Declare Function XBtn_GetGroupID Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XBtn_SetBindEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal hBindEle As Long)
Declare Function XBtn_GetBindEle Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XBtn_SetTextAlign Lib "xcgui.dll" (ByVal hEle As Long, ByVal flag As Long)
Declare Function XBtn_GetTextAlign Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XBtn_SetIconAlign Lib "xcgui.dll" (ByVal hEle As Long, ByVal align As Long)
Declare Sub XBtn_SetOffset Lib "xcgui.dll" (ByVal hEle As Long, ByVal x As Long, ByVal y As Long)
Declare Sub XBtn_SetOffsetIcon Lib "xcgui.dll" (ByVal hEle As Long, ByVal x As Long, ByVal y As Long)
Declare Sub XBtn_SetIconSpace Lib "xcgui.dll" (ByVal hEle As Long, ByVal size As Long)
Declare Sub XBtn_GetText Lib "xcgui.dll" (ByVal hEle As Long, ByVal pOut As String, ByVal nlen As Long)
Declare Sub XBtn_SetText Lib "xcgui.dll" (ByVal hEle As Long, ByVal pName As String)
Declare Sub XBtn_SetImageLeave Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XBtn_SetImageStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XBtn_SetImageDown Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XBtn_SetImageCheck Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XBtn_SetImageDisable Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XBtn_SetIcon Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Function XComboBox_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XComboBox_SetSelItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal iIndex As Long) As Boolean
Declare Sub XComboBox_BindApapter Lib "xcgui.dll" (ByVal hEle As Long, ByVal hAdapter As Long)
Declare Sub XComboBox_SetItemTemplateXML Lib "xcgui.dll" (ByVal hEle As Long, ByVal pXmlFile As String)
Declare Sub XComboBox_EnableDrawButton Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XComboBox_EnableEdit Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEdit As Boolean)
Declare Sub XComboBox_SetImageStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XComboBox_SetImageDown Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XAdapter_Destroy Lib "xcgui.dll" (ByVal hAdapter As Long)
Declare Function XAdapterListView_Create Lib "xcgui.dll" () As Long
Declare Function XAdapterListView_Group_AddColumn Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String) As Long
Declare Function XAdapterListView_Group_AddItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pValue As String) As Long
Declare Function XAdapterListView_Group_AddItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal pValue As String) As Long
Declare Function XAdapterListView_Group_AddItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal hImage As Long) As Long
Declare Function XAdapterListView_Group_AddItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal hImage As Long) As Long
Declare Function XAdapterListView_Item_AddColumn Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String) As Long
Declare Function XAdapterListView_Item_AddItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal pValue As String) As Long
Declare Function XAdapterListView_Item_AddItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal pName As String, ByVal pValue As String) As Long
Declare Function XAdapterListView_Item_AddItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal hImage As Long) As Long
Declare Function XAdapterListView_Item_AddItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal pName As String, ByVal hImage As Long) As Long
Declare Function XAdapterListView_Item_SetText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal iColumn As Long, ByVal pValue As String) As Boolean
Declare Function XAdapterListView_Item_SetTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal pName As String, ByVal pValue As String) As Boolean
Declare Function XAdapterListView_Item_SetImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal iColumn As Long, ByVal hImage As Long) As Boolean
Declare Function XAdapterListView_Item_SetImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal pName As String, ByVal hImage As Long) As Boolean
Declare Sub XAdapterListView_DeleteAll Lib "xcgui.dll" (ByVal hAdapter As Long)
Declare Function XAdapterListView_Item_GetTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal pName As String, ByVal pOut As String, ByVal nOutLen As Long) As Boolean
Declare Function XAdapterListView_Item_GetImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal pName As String) As Long
Declare Function XAdapterTable_Create Lib "xcgui.dll" () As Long
Declare Function XAdapterTable_AddColumn Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String) As Long
Declare Function XAdapterTable_AddItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pValue As String) As Long
Declare Function XAdapterTable_AddItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal pValue As String) As Long
Declare Function XAdapterTable_AddItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal hImage As Long) As Long
Declare Function XAdapterTable_AddItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal hImage As Long) As Long
Declare Function XAdapterTable_InsertItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pValue As String) As Boolean
Declare Function XAdapterTable_InsertItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pName As String, ByVal pValue As String) As Boolean
Declare Function XAdapterTable_InsertItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal hImage As Long) As Boolean
Declare Function XAdapterTable_InsertItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pName As String, ByVal hImage As Long) As Boolean
Declare Function XAdapterTable_SetItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal iColumn As Long, ByVal pValue As String) As Boolean
Declare Function XAdapterTable_SetItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pName As String, ByVal pValue As String) As Boolean
Declare Function XAdapterTable_SetItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal iColumn As Long, ByVal hImage As Long) As Boolean
Declare Function XAdapterTable_SetItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pName As String, ByVal hImage As Long) As Boolean
Declare Function XAdapterTable_DeleteItem Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long) As Boolean
Declare Function XAdapterTable_DeleteItemEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal nCount As Long) As Boolean
Declare Function XAdapterTable_GetCount Lib "xcgui.dll" (ByVal hAdapter As Long) As Long
Declare Function XAdapterTable_GetCountColumn Lib "xcgui.dll" (ByVal hAdapter As Long) As Long
Declare Function XAdapterTable_GetItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal iColumn As Long, ByVal pOut As String, ByVal nOutLen As Long) As Boolean
Declare Function XAdapterTable_GetItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal iColumn As Long) As Long
Declare Function XAdapterTable_GetItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pName As String, ByVal pOut As String, ByVal nOutLen As Long) As Boolean
Declare Function XAdapterTable_GetItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal iItem As Long, ByVal pName As String) As Long
Declare Function XAdapterTree_Create Lib "xcgui.dll" () As Long
Declare Function XAdapterTree_AddColumn Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String) As Long
Declare Function XAdapterTree_InsertItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pValue As String, ByVal nParentID As Long, ByVal insertID As Long) As Long
Declare Function XAdapterTree_InsertItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal pValue As String, ByVal nParentID As Long, ByVal insertID As Long) As Long
Declare Function XAdapterTree_InsertItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal hImage As Long, ByVal nParentID As Long, ByVal insertID As Long) As Long
Declare Function XAdapterTree_InsertItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal hImage As Long, ByVal nParentID As Long, ByVal insertID As Long) As Long
Declare Function XAdapterTree_GetCount Lib "xcgui.dll" (ByVal hAdapter As Long) As Long
Declare Function XAdapterTree_GetCountColumn Lib "xcgui.dll" (ByVal hAdapter As Long) As Long
Declare Function XAdapterTree_SetItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal nID As Long, ByVal iColumn As Long, ByVal pValue As String) As Boolean
Declare Function XAdapterTree_SetItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal nID As Long, ByVal pName As String, ByVal pValue As String) As Boolean
Declare Function XAdapterTree_SetItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal nID As Long, ByVal iColumn As Long, ByVal hImage As Long) As Boolean
Declare Function XAdapterTree_SetItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal nID As Long, ByVal pName As String, ByVal hImage As Long) As Boolean
Declare Function XAdapterTree_GetItemTextEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal nID As Long, ByVal pName As String, ByVal pOut As String, ByVal nOutLen As Long) As Boolean
Declare Function XAdapterTree_GetItemImageEx Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal nID As Long, ByVal pName As String) As Long
Declare Function XAdapterMap_Create Lib "xcgui.dll" () As Long
Declare Function XAdapterMap_AddItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal pValue As String) As Boolean
Declare Function XAdapterMap_AddItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal hImage As Long) As Boolean
Declare Function XAdapterMap_GetCount Lib "xcgui.dll" (ByVal hAdapter As Long) As Long
Declare Function XAdapterMap_GetItemText Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String, ByVal pOut As String, ByVal nOutLen As Long) As Boolean
Declare Function XAdapterMap_GetItemImage Lib "xcgui.dll" (ByVal hAdapter As Long, ByVal pName As String) As Long
Declare Function XDraw_Create Lib "xcgui.dll" (ByVal hdc As Long) As Long
Declare Sub XDraw_Destroy Lib "xcgui.dll" (ByVal hDraw As Long)
Declare Sub XDraw_SetOffset Lib "xcgui.dll" (ByVal hDraw As Long, ByVal x As Long, ByVal y As Long)
Declare Sub XDraw_GetOffset Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pX As Long, ByVal pY As Long)
Declare Sub XDraw_RestoreGDIOBJ Lib "xcgui.dll" (ByVal hDraw As Long)
Declare Function XDraw_GetHDC Lib "xcgui.dll" (ByVal hDraw As Long) As Long
Declare Sub XDraw_SetBrushColor Lib "xcgui.dll" (ByVal hDraw As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XDraw_SetTextAlign Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nFlag As Long)
Declare Sub XDraw_SetFontX Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hFontx As Long)
Declare Sub XDraw_SetFont Lib "xcgui.dll" (ByVal hDraw As Long, ByVal size As Long)
Declare Sub XDraw_SetFont2 Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pName As String, ByVal size As Long)
Declare Sub XDraw_SetFont3 Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pLogFont As LOGFONT)
Declare Function XDraw_SetBkMode Lib "xcgui.dll" (ByVal hDraw As Long, ByVal bTransparent As Boolean) As Long
Declare Function XDraw_CreateSolidBrush Lib "xcgui.dll" (ByVal hDraw As Long, ByVal crColor As Long) As Long
Declare Function XDraw_CreatePen Lib "xcgui.dll" (ByVal hDraw As Long, ByVal fnPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Declare Function XDraw_CreateRectRgn Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nLeftRect As Long, ByVal nTopRect As Long, ByVal nRightRect As Long, ByVal nBottomRect As Long) As Long
Declare Function XDraw_CreateRoundRectRgn Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nLeftRect As Long, ByVal nTopRect As Long, ByVal nRightRect As Long, ByVal nBottomRect As Long, ByVal nWidthEllipse As Long, ByVal nHeightEllipse As Long) As Long
Declare Function XDraw_CreatePolygonRgn Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pPt As Point, ByVal cPoints As Long, ByVal fnPolyFillMode As Long) As Long
Declare Function XDraw_SelectClipRgn Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hrgn As Long) As Long
Declare Sub XDraw_FillRect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect)
Declare Sub XDraw_FillRectColor Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect, ByVal color As Long, ByVal alpha As Byte)
Declare Function XDraw_FillRgn Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hrgn As Long, ByVal hbr As Long) As Boolean
Declare Sub XDraw_FillEllipse Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect)
Declare Sub XDraw_DrawEllipse Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect)
Declare Sub XDraw_FillRoundRect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect, ByVal nWidth As Long, ByVal nHeight As Long)
Declare Sub XDraw_DrawRoundRect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect, ByVal nWidth As Long, ByVal nHeight As Long)
Declare Function XDraw_Rectangle Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nLeftRect As Long, ByVal nTopRect As Long, ByVal nRightRect As Long, ByVal nBottomRect As Long) As Boolean
Declare Sub XDraw_DrawGroupBox_Rect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect, ByVal pName As String, ByVal textColor As Long, ByVal textAlpha As Byte, ByVal pOffset As Point)
Declare Sub XDraw_DrawGroupBox_RoundRect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect, ByVal pName As String, ByVal textColor As Long, ByVal textAlpha As Byte, ByVal pOffset As Point, ByVal nWidth As Long, ByVal nHeight As Long)
Declare Sub XDraw_GradientFill2 Lib "xcgui.dll" (ByVal hDraw As Long, ByVal color1 As Long, ByVal alpha1 As Byte, ByVal color2 As Long, ByVal alpha2 As Byte, ByVal pRect As rect, ByVal mode As Long)
Declare Function XDraw_GradientFill4 Lib "xcgui.dll" (ByVal hDraw As Long, ByVal color1 As Long, ByVal color2 As Long, ByVal color3 As Long, ByVal color4 As Long, ByVal pRect As rect, ByVal mode As Long) As Boolean
Declare Function XDraw_FrameRgn Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hrgn As Long, ByVal hbr As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Boolean
Declare Sub XDraw_FrameRect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect)
Declare Sub XDraw_FocusRect Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pRect As rect)
Declare Sub XDraw_DrawLine Lib "xcgui.dll" (ByVal hDraw As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
Declare Function XDraw_MoveToEx Lib "xcgui.dll" (ByVal hDraw As Long, ByVal x As Long, ByVal y As Long, ByVal lpPoint As Point) As Boolean
Declare Function XDraw_LineTo Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nXEnd As Long, ByVal nYEnd As Long) As Boolean
Declare Function XDraw_Polyline Lib "xcgui.dll" (ByVal hDraw As Long, ByVal pArrayPt As Point, ByVal arrayPtSize As Long) As Boolean
Declare Sub XDraw_Dottedline Lib "xcgui.dll" (ByVal hDraw As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
Declare Function XDraw_SetPixel Lib "xcgui.dll" (ByVal hDraw As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Declare Sub XDraw_Check Lib "xcgui.dll" (ByVal hDraw As Long, ByVal x As Long, ByVal y As Long, ByVal color As Long, ByVal bCheck As Boolean)
Declare Function XDraw_DrawIconEx Lib "xcgui.dll" (ByVal hDraw As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Boolean
Declare Function XDraw_BitBlt Lib "xcgui.dll" (ByVal hDrawDest As Long, ByVal nXDest As Long, ByVal nYDest As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hdcSrc As Long, ByVal nXSrc As Long, ByVal nYSrc As Long, ByVal dwRop As Long) As Boolean
Declare Function XDraw_BitBlt2 Lib "xcgui.dll" (ByVal hDrawDest As Long, ByVal nXDest As Long, ByVal nYDest As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hDrawSrc As Long, ByVal nXSrc As Long, ByVal nYSrc As Long, ByVal dwRop As Long) As Boolean
Declare Function XDraw_AlphaBlend Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nXOriginDest As Long, ByVal nYOriginDest As Long, ByVal nWidthDest As Long, ByVal nHeightDest As Long, ByVal hdcSrc As Long, ByVal nXOriginSrc As Long, ByVal nYOriginSrc As Long, ByVal nWidthSrc As Long, ByVal nHeightSrc As Long, ByVal alpha As Long) As Boolean
Declare Sub XDraw_TriangularArrow Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hBrush As Long, ByVal align As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XDraw_Image Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal x As Long, ByVal y As Long)
Declare Sub XDraw_Image2 Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XDraw_ImageStretch Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XDraw_ImageAdaptive Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal pRect As rect)
Declare Sub XDraw_ImageExTile Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal pRect As rect, ByVal flag As Long)
Declare Sub XDraw_ImageSuper Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal pRect As rect, ByVal bClip As Boolean)
Declare Sub XDraw_ImageSuper2 Lib "xcgui.dll" (ByVal hDraw As Long, ByVal hImage As Long, ByVal pRcDest As rect, ByVal pSrcRect As rect)
Declare Sub XDraw_DrawText Lib "xcgui.dll" (ByVal hDraw As Long, ByVal lpString As String, ByVal nCount As Long, ByVal lpRect As rect)
Declare Sub XDraw_DrawTextUnderline Lib "xcgui.dll" (ByVal hDraw As Long, ByVal lpString As String, ByVal nCount As Long, ByVal lpRect As rect, ByVal colorLine As Long, ByVal alphaLine As Byte)
Declare Sub XDraw_TextOut Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nXStart As Long, ByVal nYStart As Long, ByVal lpString As String, ByVal cbString As Long)
Declare Sub XDraw_TextOutA Lib "xcgui.dll" (ByVal hDraw As Long, ByVal nXStart As Long, ByVal nYStart As Long, ByVal lpString As String)
Declare Sub XDraw_SetAlpha Lib "xcgui.dll" (ByVal hDraw As Long, ByVal alpha As Byte)
Declare Sub XDraw_SetAlphaEx Lib "xcgui.dll" (ByVal hdc As Long, ByVal alpha As Byte)
Declare Function XEle_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XEle_RegEventEx Lib "xcgui.dll" (ByVal hEle As Long, ByVal pEvent As Long)
Declare Function XEle_RemoveEventEx Lib "xcgui.dll" (ByVal hEle As Long, ByVal pEvent As Long) As Boolean
Declare Sub XEle_RegEventC Lib "xcgui.dll" (ByVal hEle As Long, ByVal nEvent As Long, ByVal pFun As Long)
Declare Sub XEle_RegEventC1 Lib "xcgui.dll" (ByVal hEle As Long, ByVal nEvent As Long, ByVal pFun As Long)
Declare Sub XEle_RegEventC2 Lib "xcgui.dll" (ByVal hEle As Long, ByVal nEvent As Long, ByVal pFun As Long)
Declare Function XEle_RemoveEventC Lib "xcgui.dll" (ByVal hEle As Long, ByVal nEvent As Long, ByVal pFun As Long) As Boolean
Declare Function XEle_SendEvent Lib "xcgui.dll" (ByVal hEle As Long, ByVal hEventEle As Long, ByVal nEvent As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Declare Function XEle_PostEvent Lib "xcgui.dll" (ByVal hEle As Long, ByVal hEventEle As Long, ByVal nEvent As Long, ByVal wParam As Long, ByVal lParam As Long) As Boolean
Declare Function XEle_IsShow Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsEnable Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsEnableFocus Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsDrawFocus Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsBorder Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsEnableEvent_XE_PAINT_END Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsMouseThrough Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XEle_IsBkTransparent Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Sub XEle_Enable Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_EnableFocus Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_EnableDrawFocus Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_EnableEvent_XE_PAINT_END Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_EnableBkTransparent Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_EnableBorder Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_EnableMouseThrough Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Function XEle_SetRect Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect, ByVal bRedraw As Boolean) As Boolean
Declare Sub XEle_SetRectLogic Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect, ByVal bRedraw As Boolean)
Declare Sub XEle_GetRect Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Sub XEle_GetRectLogic Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Sub XEle_GetClientRect Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Sub XEle_GetWndClientRect Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Function XEle_GetWidth Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XEle_GetHeight Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_RectWndClientToEleClient Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Sub XEle_PointWndClientToEleClient Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point)
Declare Sub XEle_RectClientToWndClient Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Sub XEle_PointClientToWndClient Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point)
Declare Function XEle_AddEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal hChildEle As Long) As Boolean
Declare Function XEle_InsertEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal hChildEle As Long, ByVal hDestEle As Long) As Boolean
Declare Sub XELE_RemoveEle Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XEle_AddShape Lib "xcgui.dll" (ByVal hEle As Long, ByVal hShape As Long) As Boolean
Declare Sub XEle_ShowEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal bShow As Boolean)
Declare Function XEle_GetType Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XEle_GetHWND Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XEle_GetHWINDOW Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetCursor Lib "xcgui.dll" (ByVal hEle As Long, ByVal hCursor As Long)
Declare Function XEle_GetCursor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetID Lib "xcgui.dll" (ByVal hEle As Long, ByVal id As Long)
Declare Function XEle_GetID Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XEle_GetParentEle Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetBkColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XEle_GetBkColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetBorderColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XEle_GetBorderColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetTextColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XEle_GetTextColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetFocusBorderColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XEle_GetFocusBorderColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetFont Lib "xcgui.dll" (ByVal hEle As Long, ByVal hFontx As Long)
Declare Function XEle_GetFont Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetAlpha Lib "xcgui.dll" (ByVal hEle As Long, ByVal alpha As Byte)
Declare Function XEle_GetChildCount Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XEle_GetChildByIndex Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long) As Long
Declare Function XEle_GetChildByID Lib "xcgui.dll" (ByVal hEle As Long, ByVal id As Long) As Long
Declare Function XEle_HitChildEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point) As Long
Declare Sub XEle_BindLayoutObject Lib "xcgui.dll" (ByVal hEle As Long, ByVal hLayout As Long)
Declare Function XEle_GetLayoutObject Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetUserData Lib "xcgui.dll" (ByVal hEle As Long, ByVal nData As Long)
Declare Function XEle_GetUserData Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_GetContentSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal pSize As size)
Declare Sub XEle_SetCapture Lib "xcgui.dll" (ByVal hEle As Long, ByVal b As Boolean)
Declare Sub XEle_SetLayoutWidth Lib "xcgui.dll" (ByVal hEle As Long, ByVal nFlag As Long, ByVal nWidth As Long)
Declare Sub XEle_SetLayoutHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal nFlag As Long, ByVal nHeight As Long)
Declare Sub XEle_GetLayoutWidth Lib "xcgui.dll" (ByVal hEle As Long, ByVal pFlag As Long, ByVal pWidth As Long)
Declare Sub XEle_GetLayoutHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal pFlag As Long, ByVal pHeight As Long)
Declare Sub XEle_RedrawEle Lib "xcgui.dll" (ByVal hEle As Long)
Declare Sub XEle_RedrawRect Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Sub XEle_Destroy Lib "xcgui.dll" (ByVal hEle As Long)
Declare Sub XEle_SetImage Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Sub XEle_EnableTransparentChannel Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Function XEle_GetTemplateListItemID Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XEle_GetTemplateListItemGroupID Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XEle_SetToolTip Lib "xcgui.dll" (ByVal hEle As Long, ByVal pText As String)
Declare Sub XEle_GetToolTip Lib "xcgui.dll" (ByVal hEle As Long, ByVal pOut As String, ByVal nOutLen As Long)
Declare Sub XEle_EnableToolTip Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XEle_AdjustLayout Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XEle_RegEventTest Lib "xcgui.dll" (ByVal nEvent As Long, ByVal pParamType As Long) As Boolean
Declare Function XFont_Create Lib "xcgui.dll" (ByVal size As Long) As Long
Declare Function XFont_Create2 Lib "xcgui.dll" (ByVal pName As String, ByVal size As Long, ByVal bBold As Boolean, ByVal bItalic As Boolean, ByVal bUnderline As Boolean, ByVal bStrikeOut As Boolean) As Long
Declare Function XFont_CreateEx Lib "xcgui.dll" (ByVal pFontInfo As LOGFONTW) As Long
Declare Function XFont_CreateFromHFONT Lib "xcgui.dll" (ByVal hFont As Long) As Long
Declare Sub XFont_Destroy Lib "xcgui.dll" (ByVal hFontx As Long)
Declare Function XFont_GetHFONT Lib "xcgui.dll" (ByVal hFontx As Long) As Long
Declare Function XFrameWnd_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal pTitle As String, ByVal hWndParent As Long, ByVal XCStyle As Long) As Long
Declare Function XFrameWnd_CreateEx Lib "xcgui.dll" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hWndParent As Long, ByVal XCStyle As Long) As Long
Declare Sub XFrameWnd_GetLayoutAreaRect Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pRect As rect)
Declare Sub XFrameWnd_SetView Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hEle As Long)
Declare Function XFrameWnd_AddPane Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hPaneDest As Long, ByVal hPaneNew As Long, ByVal align As String) As Boolean
Declare Function XImage_LoadFile Lib "xcgui.dll" (ByVal pImageName As String, ByVal bStretch As Boolean) As Long
Declare Function XImage_LoadFileAdaptive Lib "xcgui.dll" (ByVal pImageName As String, ByVal leftSize As Long, ByVal topSize As Long, ByVal rightSize As Long, ByVal bottomSize As Long) As Long
Declare Function XImage_LoadFileRect Lib "xcgui.dll" (ByVal pImageName As String, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long) As Long
Declare Function XImage_LoadResAdaptive Lib "xcgui.dll" (ByVal id As Long, ByVal pType As String, ByVal leftSize As Long, ByVal topSize As Long, ByVal rightSize As Long, ByVal bottomSize As Long) As Long
Declare Function XImage_LoadRes Lib "xcgui.dll" (ByVal id As Long, ByVal pType As String, ByVal bStretch As Boolean) As Long
Declare Function XImage_LoadZip Lib "xcgui.dll" (ByVal pZipFileName As String, ByVal pImageName As String, ByVal pPassword As String, ByVal bStretch As Boolean) As Long
Declare Function XImage_LoadZipAdaptive Lib "xcgui.dll" (ByVal pZipFileName As String, ByVal pImageName As String, ByVal pPassword As String, ByVal x1 As Long, ByVal x2 As Long, ByVal y1 As Long, ByVal y2 As Long) As Long
Declare Function XImage_LoadZipRect Lib "xcgui.dll" (ByVal pZipFileName As String, ByVal pImageName As String, ByVal pPassword As String, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long) As Long
Declare Function XImage_LoadMemory Lib "xcgui.dll" (ByVal pBuffer As Long, ByVal nSize As Long, ByVal bStretch As Boolean) As Long
Declare Function XImage_LoadMemoryRect Lib "xcgui.dll" (ByVal pBuffer As Long, ByVal nSize As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal bStretch As Boolean) As Long
Declare Function XImage_LoadMemoryAdaptive Lib "xcgui.dll" (ByVal pBuffer As Long, ByVal nSize As Long, ByVal leftSize As Long, ByVal topSize As Long, ByVal rightSize As Long, ByVal bottomSize As Long) As Long
Declare Function XImage_LoadFromImage Lib "xcgui.dll" (ByVal pImage As Long) As Long
Declare Function XImage_LoadFileFromExtractIcon Lib "xcgui.dll" (ByVal pImageName As String) As Long
Declare Function XImage_LoadFileFromHICON Lib "xcgui.dll" (ByVal hIcon As Long) As Long
Declare Function XImage_LoadFileFromHBITMAP Lib "xcgui.dll" (ByVal hBitmap As Long) As Long
Declare Function XImage_IsStretch Lib "xcgui.dll" (ByVal hImage As Long) As Boolean
Declare Function XImage_IsAdaptive Lib "xcgui.dll" (ByVal hImage As Long) As Boolean
Declare Function XImage_IsTile Lib "xcgui.dll" (ByVal hImage As Long) As Boolean
Declare Function XImage_SetDrawType Lib "xcgui.dll" (ByVal hImage As Long, ByVal ntype As Long) As Boolean
Declare Function XImage_SetDrawTypeAdaptive Lib "xcgui.dll" (ByVal hImage As Long, ByVal leftSize As Long, ByVal topSize As Long, ByVal rightSize As Long, ByVal bottomSize As Long) As Boolean
Declare Sub XImage_SetTranColor Lib "xcgui.dll" (ByVal hImage As Long, ByVal color As Long)
Declare Sub XImage_SetTranColorEx Lib "xcgui.dll" (ByVal hImage As Long, ByVal color As Long, ByVal tranColor As Byte)
Declare Sub XImage_EnableTranColor Lib "xcgui.dll" (ByVal hImage As Long, ByVal bEnable As Boolean)
Declare Sub XImage_EnableAutoDestroy Lib "xcgui.dll" (ByVal hImage As Long, ByVal bEnable As Boolean)
Declare Sub XImage_EnableCenter Lib "xcgui.dll" (ByVal hImage As Long, ByVal bCenter As Boolean)
Declare Function XImage_IsCenter Lib "xcgui.dll" (ByVal hImage As Long) As Boolean
Declare Function XImage_GetDrawType Lib "xcgui.dll" (ByVal hImage As Long) As Long
Declare Function XImage_GetWidth Lib "xcgui.dll" (ByVal hImage As Long) As Long
Declare Function XImage_GetHeight Lib "xcgui.dll" (ByVal hImage As Long) As Long
Declare Sub XImage_Release Lib "xcgui.dll" (ByVal hImage As Long)
Declare Sub XImage_Destroy Lib "xcgui.dll" (ByVal hImage As Long)
Declare Function XLayout_Create Lib "xcgui.dll" () As Long
Declare Sub XLayout_Destroy Lib "xcgui.dll" (ByVal hLayout As Long)
Declare Sub XLayout_AddEle Lib "xcgui.dll" (ByVal hLayout As Long, ByVal hEle As Long)
Declare Sub XLayout_AddLayoutObject Lib "xcgui.dll" (ByVal hLayout As Long, ByVal hLayoutObject As Long)
Declare Sub XLayout_AddShape Lib "xcgui.dll" (ByVal hLayout As Long, ByVal hShape As Long)
Declare Sub XLayout_RemoveChild Lib "xcgui.dll" (ByVal hLayout As Long, ByVal hChild As Long)
Declare Sub XLayout_AdjustLayout Lib "xcgui.dll" (ByVal hLayout As Long)
Declare Sub XLayout_SetRectFrame Lib "xcgui.dll" (ByVal hLayout As Long, ByVal pRect As rect)
Declare Sub XLayout_GetRect Lib "xcgui.dll" (ByVal hLayout As Long, ByVal pRect As rect)
Declare Sub XLayout_GetRectFrame Lib "xcgui.dll" (ByVal hLayout As Long, ByVal pRect As rect)
Declare Function XLayout_GetWindow Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Function XLayout_GetEle Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Function XLayout_GetParentLayout Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Sub XLayout_SetID Lib "xcgui.dll" (ByVal hLayout As Long, ByVal nID As Long)
Declare Sub XLayout_SetHorizon Lib "xcgui.dll" (ByVal hLayout As Long, ByVal bHorizon As Boolean)
Declare Sub XLayout_SetAlignH Lib "xcgui.dll" (ByVal hLayout As Long, ByVal nFlag As Long)
Declare Sub XLayout_SetAlignV Lib "xcgui.dll" (ByVal hLayout As Long, ByVal nFlag As Long)
Declare Sub XLayout_SetPadding Lib "xcgui.dll" (ByVal hLayout As Long, ByVal left As Long, ByVal top As Long, ByVal right As Long, ByVal bottom As Long)
Declare Sub XLayout_SetSpace Lib "xcgui.dll" (ByVal hLayout As Long, ByVal nSpace As Long)
Declare Sub XLayout_SetLayoutWidth Lib "xcgui.dll" (ByVal hLayout As Long, ByVal nFlag As Long, ByVal nWidth As Long)
Declare Sub XLayout_SetLayoutHeight Lib "xcgui.dll" (ByVal hLayout As Long, ByVal nFlag As Long, ByVal nHeight As Long)
Declare Sub XLayout_GetLayoutWidth Lib "xcgui.dll" (ByVal hLayout As Long, ByVal pFlag As Long, ByVal pWidth As Long)
Declare Sub XLayout_GetLayoutHeight Lib "xcgui.dll" (ByVal hLayout As Long, ByVal pFlag As Long, ByVal pHeight As Long)
Declare Function XLayout_GetWidth Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Function XLayout_GetHeight Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Function XLayout_GetWidthIn Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Function XLayout_GetHeightIn Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Sub XLayout_GetContentSize Lib "xcgui.dll" (ByVal hLayout As Long, ByVal pSize As size)
Declare Sub XLayout_ShowLayout Lib "xcgui.dll" (ByVal hLayout As Long, ByVal bShow As Boolean)
Declare Function XLayout_GetChildCount Lib "xcgui.dll" (ByVal hLayout As Long) As Long
Declare Function XLayout_GetChildType Lib "xcgui.dll" (ByVal hLayout As Long, ByVal index As Long) As Long
Declare Function XLayout_GetChild Lib "xcgui.dll" (ByVal hLayout As Long, ByVal index As Long) As Long
Declare Function XListBox_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XListBox_SetStyle Lib "xcgui.dll" (ByVal hEle As Long, ByVal style As Long)
Declare Function XListBox_SetItemData Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal nUserData As Long) As Boolean
Declare Function XListBox_GetItemData Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long) As Long
Declare Function XListBox_SetItemInfo Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal pItem As listBox_item_Info_i) As Boolean
Declare Function XListBox_GetItemInfo Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal pItem As listBox_item_Info_i) As Boolean
Declare Sub XListBox_SetItemColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XListBox_GetItemColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XListBox_SetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XListBox_GetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XListBox_SetItemColorStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XListBox_GetItemColorStay Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XListBox_SetSelectItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long) As Boolean
Declare Function XListBox_GetSelectItem Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XListBox_CancelSelectItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long) As Boolean
Declare Function XListBox_CancelSelectAll Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XListBox_GetSelectAll Lib "xcgui.dll" (ByVal hEle As Long, ByVal pArray As Long, ByVal nArraySize As Long) As Long
Declare Function XListBox_GetSelectCount Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XListBox_GetItemMouseStay Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XListBox_SelectAll Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Sub XListBox_SetItemHeightDefault Lib "xcgui.dll" (ByVal hEle As Long, ByVal nHeight As Long, ByVal nSelHeight As Long)
Declare Sub XListBox_GetItemHeightDefault Lib "xcgui.dll" (ByVal hEle As Long, ByVal pHeight As Long, ByVal pSelHeight As Long)
Declare Function XListBox_HitTest Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point) As Long
Declare Function XListBox_HitTestOffset Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point) As Long
Declare Function XListBox_SetItemTemplateXML Lib "xcgui.dll" (ByVal hEle As Long, ByVal pXmlFile As String) As Boolean
Declare Function XListBox_GetTemplateObject Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal nTempItemID As Long) As Long
Declare Sub XListBox_EnableMultiSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XListBox_BindAdapter Lib "xcgui.dll" (ByVal hEle As Long, ByVal hAdapter As Long)
Declare Function XListBox_GetAdapter Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XList_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XList_AddColumn Lib "xcgui.dll" (ByVal hEle As Long, ByVal width As Long) As Long
Declare Function XList_InsertColumn Lib "xcgui.dll" (ByVal hEle As Long, ByVal width As Long, ByVal iItem As Long) As Long
Declare Sub XList_SetStyle Lib "xcgui.dll" (ByVal hEle As Long, ByVal style As Long)
Declare Sub XList_SetColumnWidth Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal width As Long)
Declare Sub XList_SetColumnMinWidth Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal width As Long)
Declare Function XList_DeleteColumn Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long) As Boolean
Declare Sub XList_DeleteColumnAll Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XList_SetItemData Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal iSubItem As Long, ByVal data As Long) As Boolean
Declare Function XList_GetItemData Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal iSubItem As Long) As Long
Declare Function XList_SetSelectItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long) As Boolean
Declare Function XList_GetSelectItem Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XList_GetSelectAll Lib "xcgui.dll" (ByVal hEle As Long, ByVal pArray As Long, ByVal nArraySize As Long) As Long
Declare Function XList_GetHeaderHELE Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XList_BindAdapter Lib "xcgui.dll" (ByVal hEle As Long, ByVal hAdapter As Long)
Declare Sub XList_BindAdapterHeader Lib "xcgui.dll" (ByVal hEle As Long, ByVal hAdapter As Long)
Declare Function XList_GetAdapter Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XList_SetItemTemplateXML Lib "xcgui.dll" (ByVal hEle As Long, ByVal pXmlFile As String) As Boolean
Declare Function XList_GetTemplateObject Lib "xcgui.dll" (ByVal hEle As Long, ByVal iItem As Long, ByVal nTempItemID As Long) As Long
Declare Sub XList_SetHeaderHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal height As Long)
Declare Function XList_GetHeaderHeight Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XList_SetItemColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XList_SetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XList_SetItemColorStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XList_GetItemColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XList_GetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XList_GetItemColorStay Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XList_SetItemHeightDefault Lib "xcgui.dll" (ByVal hEle As Long, ByVal nHeight As Long, ByVal nSelHeight As Long)
Declare Sub XList_GetItemHeightDefault Lib "xcgui.dll" (ByVal hEle As Long, ByVal pHeight As Long, ByVal pSelHeight As Long)
Declare Function XList_HitTest Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point, ByVal piItem As Long, ByVal piSubItem As Long) As Boolean
Declare Function XList_HitTestOffset Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point, ByVal piItem As Long, ByVal piSubItem As Long) As Boolean
Declare Sub XList_RefreshData Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XListView_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XListView_BindAdapter Lib "xcgui.dll" (ByVal hEle As Long, ByVal hAdapter As Long)
Declare Function XListView_GetAdapter Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XListView_SetItemTemplateXML Lib "xcgui.dll" (ByVal hEle As Long, ByVal pXmlFile As String) As Boolean
Declare Function XListView_GetTemplateObject Lib "xcgui.dll" (ByVal hEle As Long, ByVal iGroup As Long, ByVal iItem As Long, ByVal nTempItemID As Long) As Long
Declare Function XListView_GetTemplateObjectGroup Lib "xcgui.dll" (ByVal hEle As Long, ByVal iGroup As Long, ByVal nTempItemID As Long) As Long
Declare Function XListView_HitTest Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point, ByVal pOutGroup As Long, ByVal pOutItem As Long) As Boolean
Declare Function XListView_HitTestOffset Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point, ByVal pOutGroup As Long, ByVal pOutItem As Long) As Long
Declare Function XListView_SetSelectItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal iGroup As Long, ByVal iItem As Long) As Boolean
Declare Function XListView_GetSelectItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal piGroup As Long, ByVal piItem As Long) As Boolean
Declare Sub XListView_SetColumnSpace Lib "xcgui.dll" (ByVal hEle As Long, ByVal space As Long)
Declare Sub XListView_SetRowSpace Lib "xcgui.dll" (ByVal hEle As Long, ByVal space As Long)
Declare Sub XListView_SetAlignSizeLeft Lib "xcgui.dll" (ByVal hEle As Long, ByVal size As Long)
Declare Sub XListView_SetAlignSizeTop Lib "xcgui.dll" (ByVal hEle As Long, ByVal size As Long)
Declare Sub XListView_SetItemSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XListView_GetItemSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal pSize As size)
Declare Sub XListView_SetGroupHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal height As Long)
Declare Function XListView_GetGroupHeight Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XListView_SetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XListView_SetItemBorderColorSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XListView_SetItemColorStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XListView_SetItemBorderColorStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XListView_SetItemColorLeave Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XListView_SetItemBorderColorLeave Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XListView_ExpandGroup Lib "xcgui.dll" (ByVal hEle As Long, ByVal iGroup As Long, ByVal bExpand As Boolean) As Boolean
Declare Function XMenuBar_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XMenuBar_AddButton Lib "xcgui.dll" (ByVal hEle As Long, ByVal pText As String) As Long
Declare Sub XMenuBar_AddMenuItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long, ByVal id As Long, ByVal pText As String, ByVal parentId As Long, ByVal uFlags As Long)
Declare Sub XMenuBar_InsertMenuItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long, ByVal id As Long, ByVal pText As String, ByVal uFlags As Long, ByVal insertID As Long)
Declare Sub XMenuBar_SetButtonHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal height As Long)
Declare Function XMenu_Create Lib "xcgui.dll" () As Long
Declare Sub XMenu_AddItem Lib "xcgui.dll" (ByVal hMenu As Long, ByVal nID As Long, ByVal pText As String, ByVal parentId As Long, ByVal uFlags As Long)
Declare Sub XMenu_InsertItem Lib "xcgui.dll" (ByVal hMenu As Long, ByVal id As Long, ByVal pText As String, ByVal uFlags As Long, ByVal insertID As Long)
Declare Sub XMenu_SetAutoDestroy Lib "xcgui.dll" (ByVal hMenu As Long, ByVal bAuto As Boolean)
Declare Function XMenu_Popup Lib "xcgui.dll" (ByVal hMenu As Long, ByVal hParentWnd As Long, ByVal x As Long, ByVal y As Long, ByVal hParentEle As Long, ByVal uFlags As Long) As Boolean
Declare Sub XMenu_DestroyMenu Lib "xcgui.dll" (ByVal hMenu As Long)
Declare Sub XMenu_CloseMenu Lib "xcgui.dll" (ByVal hMenu As Long)
Declare Function XMenu_SetItemText Lib "xcgui.dll" (ByVal hMenu As Long, ByVal id As Long, ByVal pText As String) As Boolean
Declare Function XMenu_SetItemFlags Lib "xcgui.dll" (ByVal hMenu As Long, ByVal id As Long, ByVal uFlags As Long) As Boolean
Declare Sub XMenu_SetItemHeight Lib "xcgui.dll" (ByVal hMenu As Long, ByVal height As Long)
Declare Function XMenu_GetItemHeight Lib "xcgui.dll" (ByVal hMenu As Long) As Long
Declare Function XMenu_GetLeftWidth Lib "xcgui.dll" (ByVal hMenu As Long) As Long
Declare Function XMenu_GetLeftSpaceText Lib "xcgui.dll" (ByVal hMenu As Long) As Long
Declare Function XModalWnd_Create Lib "xcgui.dll" (ByVal nWidth As Long, ByVal nHeight As Long, ByVal pTitle As String, ByVal hWndParent As Long, ByVal XCStyle As Long) As Long
Declare Sub XModalWnd_EnableAutoClose Lib "xcgui.dll" (ByVal hWindow As Long, ByVal bEnable As Boolean)
Declare Function XModalWnd_DoModal Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Sub XModalWnd_EndModal Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nResult As Long)
Declare Function XPane_Create Lib "xcgui.dll" (ByVal pName As String, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hFrameWnd As Long, ByVal id As Long) As Long
Declare Sub XPane_SetView Lib "xcgui.dll" (ByVal hEle As Long, ByVal hView As Long)
Declare Function XProgBar_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XProgBar_SetRange Lib "xcgui.dll" (ByVal hEle As Long, ByVal range As Long)
Declare Function XProgBar_GetRange Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XProgBar_SetSpaceTwo Lib "xcgui.dll" (ByVal hEle As Long, ByVal leftSize As Long, ByVal rightSize As Long)
Declare Sub XProgBar_SetPos Lib "xcgui.dll" (ByVal hEle As Long, ByVal pos As Long)
Declare Function XProgBar_GetPos Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XProgBar_SetHorizon Lib "xcgui.dll" (ByVal hEle As Long, ByVal bHorizon As Boolean)
Declare Sub XProgBar_SetImageLoad Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Function XPGrid_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XPGrid_AddItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal pName As String, ByVal ntype As Long, ByVal nParentID As Long) As Long
Declare Function XPGrid_AddItemString Lib "xcgui.dll" (ByVal hEle As Long, ByVal pName As String, ByVal pValue As String, ByVal nParentID As Long) As Long
Declare Sub XPGrid_DeleteAll Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XPGrid_GetItemHELE Lib "xcgui.dll" (ByVal hEle As Long, ByVal nItemID As Long) As Long
Declare Sub XPGrid_SetWidth Lib "xcgui.dll" (ByVal hEle As Long, ByVal nWidth As Long)
Declare Function XPGrid_SetItemValue Lib "xcgui.dll" (ByVal hEle As Long, ByVal nItemID As Long, ByVal pValue As String) As Boolean
Declare Function XPGrid_SetItemValueInt Lib "xcgui.dll" (ByVal hEle As Long, ByVal nItemID As Long, ByVal nValue As Long) As Boolean
Declare Function XPGrid_HitTest Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point, ByVal pbExpandButton As Boolean) As Long
Declare Function XPGrid_HitTestOffset Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point, ByVal pbExpandButton As Boolean) As Long
Declare Function XRichEditColor_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XRichEditColor_SetColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long)
Declare Function XRichEditColor_GetColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XRichEditSet_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XRichEditFile_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XRichEditFile_SetOpenFileType Lib "xcgui.dll" (ByVal hEle As Long, ByVal pType As String)
Declare Sub XRichEditFile_SetDefaultFile Lib "xcgui.dll" (ByVal hEle As Long, ByVal pFile As String)
Declare Sub XRichEditFile_SetRelativeDir Lib "xcgui.dll" (ByVal hEle As Long, ByVal pDir As String)
Declare Sub XRichEditFolder_SetDefaultDir Lib "xcgui.dll" (ByVal hEle As Long, ByVal pDir As String)
Declare Function XRichEdit_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XRichEdit_InsertString Lib "xcgui.dll" (ByVal hEle As Long, ByVal iRow As Long, ByVal iColumn As Long, ByVal pString As String)
Declare Sub XRichEdit_EnableReadOnly Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XRichEdit_EnableMultiLine Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XRichEdit_EnablePassword Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XRichEdit_EnableEvent_XE_RICHEDIT_CHANGE Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XRichEdit_SetText Lib "xcgui.dll" (ByVal hEle As Long, ByVal pString As String)
Declare Sub XRichEdit_SetTextInt Lib "xcgui.dll" (ByVal hEle As Long, ByVal nVaule As Long)
Declare Function XRichEdit_GetText Lib "xcgui.dll" (ByVal hEle As Long, ByVal pOut As String, ByVal nlen As Long) As Long
Declare Function XRichEdit_GetTextLength Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XRichEdit_SetRowHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal nHeight As Long)
Declare Function XRichEdit_GetCurrentRow Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XRichEdit_GetCurrentColumn Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XRichEdit_GetRowCount Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XRichEdit_GetRowLength Lib "xcgui.dll" (ByVal hEle As Long, ByVal iRow As Long) As Long
Declare Function XRichEdit_GetSelectText Lib "xcgui.dll" (ByVal hEle As Long, ByVal pOut As String, ByVal nlen As Long) As Long
Declare Sub XRichEdit_CancelSelect Lib "xcgui.dll" (ByVal hEle As Long)
Declare Sub XRichEdit_SetSelectBkColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XRichEdit_isEmpty Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XRichEdit_SelectAll Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XRichEdit_DeleteSelect Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Sub XRichEdit_DeleteAll Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XRichEdit_ClipboardCopy Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XRichEdit_ClipboardPaste Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSBar_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XSBar_SetRange Lib "xcgui.dll" (ByVal hEle As Long, ByVal range As Long)
Declare Function XSBar_GetRange Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XSBar_ShowButton Lib "xcgui.dll" (ByVal hEle As Long, ByVal bShow As Boolean)
Declare Sub XSBar_SetSliderLength Lib "xcgui.dll" (ByVal hEle As Long, ByVal length As Long)
Declare Sub XSBar_SetSliderMinLength Lib "xcgui.dll" (ByVal hEle As Long, ByVal minLength As Long)
Declare Function XSBar_SetHorizon Lib "xcgui.dll" (ByVal hEle As Long, ByVal bHorizon As Boolean) As Boolean
Declare Function XSBar_GetSliderMaxLength Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSBar_ScrollUp Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSBar_ScrollDown Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSBar_ScrollTop Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSBar_ScrollBottom Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSBar_ScrollPos Lib "xcgui.dll" (ByVal hEle As Long, ByVal pos As Long) As Boolean
Declare Function XSBar_GetButtonUp Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSBar_GetButtonDown Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSBar_GetButtonSlider Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSView_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XSView_SetTotalSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal cx As Long, ByVal cy As Long) As Boolean
Declare Sub XSView_GetTotalSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal pSize As size)
Declare Function XSView_SetLineSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal nHeight As Long, ByVal nWidth As Long) As Boolean
Declare Sub XSView_GetLineSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal pSize As size)
Declare Function XSView_GetViewPosH Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSView_GetViewPosV Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSView_GetViewWidth Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSView_GetViewHeight Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XSView_GetViewRect Lib "xcgui.dll" (ByVal hEle As Long, ByVal pRect As rect)
Declare Function XSView_GetScrollBarH Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSView_GetScrollBarV Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XSView_SetPadding Lib "xcgui.dll" (ByVal hEle As Long, ByVal left As Long, ByVal top As Long, ByVal right As Long, ByVal bottom As Long)
Declare Sub XSView_GetPadding Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPadding As PaddingSize_)
Declare Function XSView_ScrollPosH Lib "xcgui.dll" (ByVal hEle As Long, ByVal pos As Long) As Boolean
Declare Function XSView_ScrollPosV Lib "xcgui.dll" (ByVal hEle As Long, ByVal pos As Long) As Boolean
Declare Function XSView_ScrollPosXH Lib "xcgui.dll" (ByVal hEle As Long, ByVal posX As Long) As Boolean
Declare Function XSView_ScrollPosYV Lib "xcgui.dll" (ByVal hEle As Long, ByVal posY As Long) As Boolean
Declare Sub XSView_ShowSBarH Lib "xcgui.dll" (ByVal hEle As Long, ByVal bShow As Boolean)
Declare Sub XSView_ShowSBarV Lib "xcgui.dll" (ByVal hEle As Long, ByVal bShow As Boolean)
Declare Sub XSView_EnableAutoShowScrollBar Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Function XSView_ScrollLeftLine Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollRightLine Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollTopLine Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollDownLine Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollLeft Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollRight Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollTop Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XSView_ScrollBottom Lib "xcgui.dll" (ByVal hEle As Long) As Boolean
Declare Function XShape_GetParentEle Lib "xcgui.dll" (ByVal hShape As Long) As Long
Declare Function XShape_GetParentLayout Lib "xcgui.dll" (ByVal hShape As Long) As Long
Declare Sub XShape_SetID Lib "xcgui.dll" (ByVal hShape As Long, ByVal nID As Long)
Declare Function XShape_GetID Lib "xcgui.dll" (ByVal hShape As Long) As Long
Declare Sub XShape_Redraw Lib "xcgui.dll" (ByVal hShape As Long)
Declare Function XShape_GetWidth Lib "xcgui.dll" (ByVal hShape As Long) As Long
Declare Function XShape_GetHeight Lib "xcgui.dll" (ByVal hShape As Long) As Long
Declare Sub XShape_GetRect Lib "xcgui.dll" (ByVal hShape As Long, ByVal pRect As rect)
Declare Sub XShape_SetRect Lib "xcgui.dll" (ByVal hShape As Long, ByVal pRect As rect)
Declare Sub XShape_GetContentSize Lib "xcgui.dll" (ByVal hShape As Long, ByVal pSize As size)
Declare Sub XShape_ShowLayout Lib "xcgui.dll" (ByVal hShape As Long, ByVal bShow As Boolean)
Declare Sub XShape_AdjustLayout Lib "xcgui.dll" (ByVal hShape As Long)
Declare Sub XShape_Destroy Lib "xcgui.dll" (ByVal hShape As Long)
Declare Function XTextBlock_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal pName As String, ByVal hParent As Long) As Long
Declare Sub XTextBlock_SetText Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal pName As String)
Declare Sub XTextBlock_SetFont Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal hFontx As Long)
Declare Sub XTextBlock_SetTextColor Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XTextBlock_GetTextColor Lib "xcgui.dll" (ByVal hTextBlock As Long) As Long
Declare Sub XTextBlock_SetTextAlign Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal align As Long)
Declare Sub XTextBlock_SetOffset Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal x As Long, ByVal y As Long)
Declare Sub XTextBlock_SetLayoutWidth Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal nFlag As Long, ByVal width As Long)
Declare Sub XTextBlock_SetLayoutHeight Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal nFlag As Long, ByVal height As Long)
Declare Sub XTextBlock_GetLayoutWidth Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal pFlag As Long, ByVal pWidth As Long)
Declare Sub XTextBlock_GetLayoutHeight Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal pFlag As Long, ByVal pHeight As Long)
Declare Function XShapePic_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XShapePic_SetImage Lib "xcgui.dll" (ByVal hShape As Long, ByVal hImage As Long)
Declare Sub XShapePic_SetLayoutWidth Lib "xcgui.dll" (ByVal hShape As Long, ByVal nFlag As Long, ByVal width As Long)
Declare Sub XShapePic_SetLayoutHeight Lib "xcgui.dll" (ByVal hShape As Long, ByVal nFlag As Long, ByVal height As Long)
Declare Sub XShapePic_GetLayoutWidth Lib "xcgui.dll" (ByVal hShape As Long, ByVal pFlag As Long, ByVal pWidth As Long)
Declare Sub XShapePic_GetLayoutHeight Lib "xcgui.dll" (ByVal hShape As Long, ByVal pFlag As Long, ByVal pHeight As Long)
Declare Function XShapeRect_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XShapeRect_SetBorderColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XShapeRect_SetFillColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XShapeRect_SetRoundAngle Lib "xcgui.dll" (ByVal hShape As Long, ByVal nWidth As Long, ByVal nHeight As Long)
Declare Sub XShapeRect_GetRoundAngle Lib "xcgui.dll" (ByVal hShape As Long, ByVal pWidth As Long, ByVal pHeight As Long)
Declare Sub XShapeRect_EnableBorder Lib "xcgui.dll" (ByVal hShape As Long, ByVal bEnable As Boolean)
Declare Sub XShapeRect_EnableFill Lib "xcgui.dll" (ByVal hShape As Long, ByVal bEnable As Boolean)
Declare Sub XShapeRect_EnableRoundAngle Lib "xcgui.dll" (ByVal hShape As Long, ByVal bEnable As Boolean)
Declare Function XShapeEllipse_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XShapeEllipse_SetBorderColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XShapeEllipse_SetFillColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XShapeEllipse_EnableBorder Lib "xcgui.dll" (ByVal hShape As Long, ByVal bEnable As Boolean)
Declare Sub XShapeEllipse_EnableFill Lib "xcgui.dll" (ByVal hShape As Long, ByVal bEnable As Boolean)
Declare Function XShapeGroupBox_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal pName As String, ByVal hParent As Long) As Long
Declare Sub XShapeGroupBox_SetBorderColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XShapeGroupBox_SetTextColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XShapeGroupBox_SetFontX Lib "xcgui.dll" (ByVal hShape As Long, ByVal hFontx As Long)
Declare Sub XShapeGroupBox_SetTextOffset Lib "xcgui.dll" (ByVal hShape As Long, ByVal offsetX As Long, ByVal offsetY As Long)
Declare Sub XShapeGroupBox_SetRoundAngle Lib "xcgui.dll" (ByVal hShape As Long, ByVal nWidth As Long, ByVal nHeight As Long)
Declare Sub XShapeGroupBox_SetText Lib "xcgui.dll" (ByVal hShape As Long, ByVal pText As String)
Declare Sub XShapeGroupBox_GetTextOffset Lib "xcgui.dll" (ByVal hShape As Long, ByVal pOffsetX As Long, ByVal pOffsetY As Long)
Declare Sub XShapeGroupBox_GetRoundAngle Lib "xcgui.dll" (ByVal hShape As Long, ByVal pWidth As Long, ByVal pHeight As Long)
Declare Sub XShapeGroupBox_EnableRoundAngle Lib "xcgui.dll" (ByVal hShape As Long, ByVal bEnable As Boolean)
Declare Function XShapeLine_Create Lib "xcgui.dll" (ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long, ByVal hParent As Long) As Long
Declare Sub XShapeLine_SetPosition Lib "xcgui.dll" (ByVal hShape As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
Declare Sub XShapeLine_SetColor Lib "xcgui.dll" (ByVal hShape As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XSliderBar_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Sub XSliderBar_SetRange Lib "xcgui.dll" (ByVal hEle As Long, ByVal range As Long)
Declare Function XSliderBar_GetRange Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XSliderBar_SetButtonWidth Lib "xcgui.dll" (ByVal hEle As Long, ByVal width As Long)
Declare Sub XSliderBar_SetButtonHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal height As Long)
Declare Sub XSliderBar_SetSpaceTwo Lib "xcgui.dll" (ByVal hEle As Long, ByVal leftSize As Long, ByVal rightSize As Long)
Declare Sub XSliderBar_SetPos Lib "xcgui.dll" (ByVal hEle As Long, ByVal pos As Long)
Declare Function XSliderBar_GetPos Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XSliderBar_GetButton Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XSliderBar_SetHorizon Lib "xcgui.dll" (ByVal hEle As Long, ByVal bHorizon As Boolean)
Declare Sub XSliderBar_SetImageLoad Lib "xcgui.dll" (ByVal hEle As Long, ByVal hImage As Long)
Declare Function XTabBar_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XTabBar_AddLabel Lib "xcgui.dll" (ByVal hEle As Long, ByVal pName As String) As Long
Declare Function XTabBar_InsertLabel Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long, ByVal pName As String) As Long
Declare Function XTabBar_DeleteLabel Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long) As Boolean
Declare Sub XTabBar_DeleteLabelAll Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XTabBar_GetLabel Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long) As Long
Declare Function XTabBar_GetSelect Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XTabBar_GetLabelSpacing Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XTabBar_GetLabelCount Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XTabBar_SetLabelSpacing Lib "xcgui.dll" (ByVal hEle As Long, ByVal spacing As Long)
Declare Sub XTabBar_SetSelect Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long)
Declare Sub XTabBar_SetUp Lib "xcgui.dll" (ByVal hEle As Long)
Declare Sub XTabBar_SetDown Lib "xcgui.dll" (ByVal hEle As Long)
Declare Sub XTabBar_EnableTile Lib "xcgui.dll" (ByVal hEle As Long, ByVal bTile As Boolean)
Declare Sub XTabBar_EnableClose Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XTabBar_SetCloseSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal pSize As size)
Declare Sub XTabBar_SetTurnButtonSize Lib "xcgui.dll" (ByVal hEle As Long, ByVal pSize As size)
Declare Function XTextLink_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal pName As String, ByVal hParent As Long) As Long
Declare Sub XTextLink_EnableUnderlineLeave Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XTextLink_EnableUnderlineStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Sub XTextLink_SetTextColorStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XTextLink_SetUnderlineColorLeave Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XTextLink_SetUnderlineColorStay Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XToolBar_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XToolBar_InsertEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal hNewEle As Long, ByVal index As Long) As Long
Declare Function XToolBar_InsertSeparator Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long) As Long
Declare Sub XToolBar_EnableButtonMenu Lib "xcgui.dll" (ByVal hEle As Long, ByVal bEnable As Boolean)
Declare Function XToolBar_GetHEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long) As Long
Declare Function XToolBar_GetButtonLeft Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XToolBar_GetButtonRight Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XToolBar_GetButtonMenu Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XToolBar_DeleteEle Lib "xcgui.dll" (ByVal hEle As Long, ByVal index As Long)
Declare Sub XToolBar_DeleteAllEle Lib "xcgui.dll" (ByVal hEle As Long)
Declare Function XTree_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hParent As Long) As Long
Declare Function XTree_SetItemTemplateXML Lib "xcgui.dll" (ByVal hEle As Long, ByVal pXmlFile As String) As Boolean
Declare Function XTree_SetItemTemplateXMLSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal pXmlFile As String) As Boolean
Declare Sub XTree_SetStyle Lib "xcgui.dll" (ByVal hEle As Long, ByVal style As Long)
Declare Function XTree_SetItemData Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long, ByVal nUserData As Long) As Boolean
Declare Function XTree_GetItemData Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long) As Long
Declare Function XTree_SetSelectItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long) As Boolean
Declare Function XTree_GetSelectItem Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XTree_IsExpand Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long) As Boolean
Declare Function XTree_ExpandItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long, ByVal bExpand As Boolean) As Boolean
Declare Function XTree_HitTest Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point) As Long
Declare Function XTree_HitTestOffet Lib "xcgui.dll" (ByVal hEle As Long, ByVal pPt As Point) As Long
Declare Function XTree_GetFirstChildItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long) As Long
Declare Function XTree_GetNextSiblingItem Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long) As Long
Declare Sub XTree_SetIndentation Lib "xcgui.dll" (ByVal hEle As Long, ByVal nWidth As Long)
Declare Function XTree_GetIndentation Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XTree_SetItemHeightDefault Lib "xcgui.dll" (ByVal hEle As Long, ByVal nHeight As Long, ByVal nSelHeight As Long)
Declare Sub XTree_GetItemHeightDefault Lib "xcgui.dll" (ByVal hEle As Long, ByVal pHeight As Long, ByVal pSelHeight As Long)
Declare Sub XTree_SetItemHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long, ByVal nHeight As Long, ByVal nSelHeight As Long)
Declare Sub XTree_GetItemHeight Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long, ByVal pHeight As Long, ByVal pSelHeight As Long)
Declare Sub XTree_SetItemColor Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XTree_SetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Function XTree_GetItemColor Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XTree_GetItemColorSel Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Function XTree_GetTemplateObject Lib "xcgui.dll" (ByVal hEle As Long, ByVal nID As Long, ByVal nTempItemID As Long) As Long
Declare Sub XTree_BindAdapter Lib "xcgui.dll" (ByVal hEle As Long, ByVal hAdapter As Long)
Declare Function XTree_GetAdapter Lib "xcgui.dll" (ByVal hEle As Long) As Long
Declare Sub XWnd_RegEventEx Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pEvent As Long)
Declare Function XWnd_RemoveEventEx Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pEvent As Long) As Boolean
Declare Function XWnd_RemovegEvent Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nEvent As Long, ByVal pFun As Long) As Boolean
Declare Function XWnd_Create Lib "xcgui.dll" (ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal pTitle As String, ByVal hWndParent As Long, ByVal XCStyle As Long) As Long
Declare Function XWnd_CreateEx Lib "xcgui.dll" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal hWndParent As Long, ByVal XCStyle As Long) As Long
Declare Function XWnd_AddEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hEle As Long) As Boolean
Declare Function XWnd_InsertEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hChildEle As Long, ByVal hDestEle As Long) As Boolean
Declare Function XWnd_AddShape Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hShape As Long) As Boolean
Declare Function XWnd_GetHWND Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Sub XWnd_EnableDragBorder Lib "xcgui.dll" (ByVal hWindow As Long, ByVal bEnable As Boolean)
Declare Sub XWnd_EnableDragWindow Lib "xcgui.dll" (ByVal hWindow As Long, ByVal bEnable As Boolean)
Declare Sub XWnd_EnableDrawBk Lib "xcgui.dll" (ByVal hWindow As Long, ByVal bEnable As Boolean)
Declare Sub XWnd_RedrawWnd Lib "xcgui.dll" (ByVal hWindow As Long)
Declare Sub XWnd_RedrawWndRect Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pRect As rect, ByVal bImmediately As Boolean)
Declare Sub XWnd_SetFocusEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hFocusEle As Long)
Declare Function XWnd_GetFocusEle Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Sub XWnd_SetCursor Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hCursor As Long)
Declare Function XWnd_GetCursor Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Function XWnd_SetCursorSys Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hCursor As Long) As Long
Declare Sub XWnd_SetFont Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hFontx As Long)
Declare Sub XWnd_SetID Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nID As Long)
Declare Function XWnd_GetID Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Sub XWnd_SetCaptureEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hEle As Long)
Declare Function XWnd_GetCaptureEle Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Function XWnd_SetLayoutEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nFlag As Long, ByVal hEle As Long) As Boolean
Declare Function XWnd_GetLayoutEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nFlag As Long) As Long
Declare Sub XWnd_BindLayoutObject Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nFlag As Long, ByVal hLayout As Long)
Declare Function XWnd_GetLayoutObject Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nFlag As Long) As Long
Declare Sub XWnd_SetLayoutBkColor Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nFlag As Long, ByVal color As Long, ByVal alpha As Byte)
Declare Sub XWnd_SetLayoutSize Lib "xcgui.dll" (ByVal hWindow As Long, ByVal left As Long, ByVal top As Long, ByVal right As Long, ByVal bottom As Long)
Declare Sub XWnd_GetLayoutSize Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pBorderSize As BorderSize_)
Declare Sub XWnd_SetDragBorderSize Lib "xcgui.dll" (ByVal hWindow As Long, ByVal left As Long, ByVal top As Long, ByVal right As Long, ByVal bottom As Long)
Declare Sub XWnd_GetDragBorderSize Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pSize As BorderSize_)
Declare Sub XWnd_SetMinimumSize Lib "xcgui.dll" (ByVal hWindow As Long, ByVal width As Long, ByVal height As Long)
Declare Function XWnd_HitChildEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pPt As Point) As Long
Declare Function XWnd_GetChildCount Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Function XWnd_GetChildByIndex Lib "xcgui.dll" (ByVal hWindow As Long, ByVal index As Long) As Long
Declare Function XWnd_GetChildByID Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nID As Long) As Long
Declare Function XWnd_GetEle Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nID As Long) As Long
Declare Sub XWnd_GetDrawRect Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pRcPaint As rect)
Declare Function XWnd_ShowWindow Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nCmdShow As Long) As Boolean
Declare Sub XWnd_AdjustLayout Lib "xcgui.dll" (ByVal hWindow As Long)
Declare Sub XWnd_CloseWindow Lib "xcgui.dll" (ByVal hWindow As Long)
Declare Sub XWnd_CreateCaret Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hEle As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XWnd_SetCaretSize Lib "xcgui.dll" (ByVal hWindow As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XWnd_SetCaretPos Lib "xcgui.dll" (ByVal hWindow As Long, ByVal x As Long, ByVal y As Long)
Declare Sub XWnd_SetCaretPosEx Lib "xcgui.dll" (ByVal hWindow As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long, ByVal height As Long)
Declare Sub XWnd_SetCaretColor Lib "xcgui.dll" (ByVal hWindow As Long, ByVal color As Long)
Declare Sub XWnd_ShowCaret Lib "xcgui.dll" (ByVal hWindow As Long, ByVal bShow As Boolean)
Declare Sub XWnd_DestroyCaret Lib "xcgui.dll" (ByVal hWindow As Long)
Declare Function XWnd_GetCaretHELE Lib "xcgui.dll" (ByVal hWindow As Long) As Long
Declare Function XWnd_GetClientRect Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pRect As rect) As Boolean
Declare Sub XWnd_GetBodyRect Lib "xcgui.dll" (ByVal hWindow As Long, ByVal pRect As rect)
Declare Function XWnd_SetTimer Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nIDEvent As Long, ByVal uElapse As Long) As Long
Declare Function XWnd_KillTimer Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nIDEvent As Long) As Boolean
Declare Sub XWnd_SetImage Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hImage As Long)
Declare Sub XWnd_SetImageLayout Lib "xcgui.dll" (ByVal hWindow As Long, ByVal hImage As Long, ByVal nFlag As Long)
Declare Sub XWnd_SetTransparentFlag Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nFlag As Long)
Declare Sub XWnd_SetTransparentAlpha Lib "xcgui.dll" (ByVal hWindow As Long, ByVal alpha As Byte)
Declare Sub XWnd_SetTransparentColor Lib "xcgui.dll" (ByVal hWindow As Long, ByVal color As Long)
Declare Function XWnd_RegEventTest Lib "xcgui.dll" (ByVal nEvent As Long, ByVal pParamType As Long) As Boolean
Declare Sub XTextBlock_GetText Lib "xcgui.dll" (ByVal hTextBlock As Long, ByVal pOut As String, ByVal nOutLen As Long)
Declare Sub XWnd_RegEventC Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nEvent As Long, ByVal pFun As Long)
Declare Sub XWnd_RegEventC1 Lib "xcgui.dll" (ByVal hWindow As Long, ByVal nEvent As Long, ByVal pFun As Long)


Declare Function ClientToScreen Lib "User32.dll" (ByVal hWnd As Long, ByRef pPt As Point) As Long


Type rect

    x As Long
    y As Long
    cx As Long
    cy As Long

End Type

Type Point

    x As Long
    y As Long

End Type

Type size

    cx As Long
    cy As Long

End Type

Type template_info_i

    info As Long

End Type

Type BorderSize_

    leftSize As Long
    topSize As Long
    RightSzie As Long
    bottom As Long

End Type

Type SpaceSize_

    leftSize As Long
    topSize As Long
    RightSzie As Long
    bottom As Long

End Type

Type PaddingSize_

    leftSize As Long
    topSize As Long
    RightSzie As Long
    bottom As Long

End Type

Type listBox_item_i

    nUserData As Long
    nHeight As Long
    nSelHeight As Long
    bSelect As Long
    index As Long
    rcItem As rect
    hLayout As Long
    pInfo As Long

End Type

Type LOGFONTW

    lfHeight As Long
    lfWidth As Long
    lfEscapement As Long
    lfOrientation As Long
    lfWeight As Long
    lfItalic As Byte
    lfUnderline As Byte
    lfStrikeOut As Byte
    lfCharSet As Byte
    lfOutPrecision As Byte
    lfClipPrecision As Byte
    lfQuality As Byte
    lfPitchAndFamily As Byte
    lfFaceName(32) As Integer

End Type

Type LOGFONT

    lfHeight As Long
    lfWidth As Long
    lfEscapement As Long
    lfOrientation As Long
    lfWeight As Long
    lfItalic As Byte
    lfUnderline As Byte
    lfStrikeOut As Byte
    lfCharSet As Byte
    lfOutPrecision As Byte
    lfClipPrecision As Byte
    lfQuality As Byte
    lfPitchAndFamily As Byte
    lfFaceName(32) As Byte

End Type

Type listBox_item_Info_i

    nUserData As Long
    nHeight As Long
    nSelHeight As Long

End Type

Type list_item_i

    index As Long
    iSubItem As Long
    nUserData As Long
    bSelect As Long
    rcItem As rect
    hLayout As Long
    pInfo  As Long

End Type

Type list_header_item_i

    nState As Long
    nUserData As Long
    bSelect As Long
    rcItem As rect

End Type

Type tree_item_i

    nID As Long
    nDepth As Long
    nState As Long
    nHeight As Long
    nSelHeight As Long
    nUserData As Long
    bSelect As Long
    bExpand As Long
    rcItem As rect
    hLayout As Long
    pInfo As Long

End Type

Type listView_item_i

    iGroup As Long
    iItem As Long
    userData As Long
    state As Long
    bSelect As Long
    rect As rect
    hLayout As Long
    pInfo As Long

End Type

Type layout_info_i

    width As Long
    height As Long

End Type

Public Const XC_ERROR                           As Long = -1    '///<错误类型

Public Const XC_WINDOW                          As Long = 1    '///<窗口

Public Const XC_MODALWINDOW                     As Long = 2    '///<模态窗口

Public Const XC_FRAMEWND                        As Long = 3    '///<框架窗口

Public Const XC_FLOATWND                        As Long = 4    '///<浮动窗口

Public Const XC_COMBOBOXWINDOW                  As Long = 11    '//comboBoxWindow_        组合框弹出下拉列表窗口

Public Const XC_POPUPMENUWINDOW                 As Long = 12    '//popupMenuWindow_       弹出菜单主窗口

Public Const XC_POPUPMENUCHILDWINDOW            As Long = 13    '//popupMenuChildWindow_  弹出菜单子窗口

Public Const XC_ELE                             As Long = 21    '///<基础元素

Public Const XC_BUTTON                          As Long = 22    '///<按钮

Public Const XC_RICHEDIT                        As Long = 23    '///<富文本编辑框

Public Const XC_COMBOBOX                        As Long = 24    '///<下拉组合框元素

Public Const XC_SCROLLBAR                       As Long = 25    '///<滚动条元素

Public Const XC_SCROLLVIEW                      As Long = 26    '///<滚动视图元素

Public Const XC_LIST                            As Long = 27    '///<列表元素

Public Const XC_LISTBOX                         As Long = 28    '///<列表框元素

Public Const XC_LISTVIEW                        As Long = 29    '大图标

Public Const XC_TREE                            As Long = 30    '///<树元素

Public Const XC_MENUBAR                         As Long = 31    '///<菜单条

Public Const XC_SLIDERBAR                       As Long = 32    '///<滑动条

Public Const XC_PROGRESSBAR                     As Long = 33    '///<进度条

Public Const XC_TOOLBAR                         As Long = 34    '///<工具条

Public Const XC_MONTHCAL                        As Long = 35    '///<月历元素

Public Const XC_DATETIME                        As Long = 36    '///<时间元素

Public Const XC_PROPERTYGRID                    As Long = 37    '///<属性网格

Public Const XC_RICHEDIT_COLOR                  As Long = 38    '///<颜色选择元素

Public Const XC_RICHEDIT_SET                    As Long = 39    '

Public Const XC_TABBAR                          As Long = 40    '///<tab条

Public Const XC_TEXTLINK                        As Long = 41    '///<文本链接按钮

Public Const XC_PANE                            As Long = 42    '///<布局窗格

Public Const XC_PANE_SPLIT                      As Long = 43    '///<布局窗格拖动分割条

Public Const XC_MENUBAR_BUTTON                  As Long = 44    '///<菜单条上的按钮

Public Const XC_TOOLBAR_BUTTON                  As Long = 45    '///<工具条上按钮

Public Const XC_PROPERTYPAGE_LABEL              As Long = 46    '///<属性页标签按钮

Public Const XC_PIER                            As Long = 47    '///<窗格停靠码头

Public Const XC_BUTTON_MENU                     As Long = 48    '///<弹出菜单按钮

Public Const XC_VIRTUAL_ELE                     As Long = 49    '///<虚拟元素

Public Const XC_RICHEDIT_FILE                   As Long = 50    '///<RichEditFile 文件选择编辑框

Public Const XC_RICHEDIT_FOLDER                 As Long = 51    '///<RichEditFolder  文件夹选择编辑框

Public Const XC_LIST_HEADER                     As Long = 52    '///<列表头元素

Public Const XC_SHAPE                           As Long = 61    '///<形状对象

Public Const XC_TEXT_BLOCK                      As Long = 62    '///<形状对象-文本块

Public Const XC_SHAPE_PICTURE                   As Long = 63    '///<形状对象-图片

Public Const XC_SHAPE_RECT                      As Long = 64    '///<形状对象-矩形

Public Const XC_SHAPE_ELLIPSE                   As Long = 65    '///<形状对象-圆

Public Const XC_SHAPE_LINE                      As Long = 66    '///<形状对象-直线

Public Const XC_SHAPE_GROUPBOX                  As Long = 67    '///<形状对象-组框

Public Const XC_MENU                            As Long = 81    '///<弹出菜单

Public Const XC_IMAGE                           As Long = 82    '///<图片操作

Public Const XC_HDRAW                           As Long = 83    '///<绘图操作

Public Const XC_FONT                            As Long = 84    '///<炫彩字体

Public Const XC_FLASH                           As Long = 85    '///<flash

Public Const XC_PANE_CELL                       As Long = 86    '

Public Const XC_WEB                             As Long = 87    '

Public Const XC_LAYOUT_OBJECT                   As Long = 101    '

Public Const XC_ADAPTER_TABLE                   As Long = 102    '

Public Const XC_ADAPTER_TREE                    As Long = 103    '

Public Const XC_ADAPTER_LISTVIEW                As Long = 104    '

Public Const XC_ADAPTER_MAP                     As Long = 105    '

Public Const XC_LAYOUT_LISTVIEW                 As Long = 111    '

Public Const XC_LAYOUT_LIST                     As Long = 112    '

Public Const XC_LAYOUT_OBJECT_GROUP             As Long = 113    '

Public Const XC_LAYOUT_OBJECT_ITEM              As Long = 114    '

Public Const XC_LAYOUT_PANEL                    As Long = 115    '

Public Const align_any                          As Long = 1    '

Public Const align_left                         As Long = 2    '

Public Const align_top                          As Long = 3    '

Public Const align_right                        As Long = 4    '

Public Const align_bottom                       As Long = 5    '

Public Const align_group_member                 As Long = 6    '//组成员

Public Const layout_align_left                  As Long = 1    '

Public Const layout_align_top                   As Long = 2    '

Public Const layout_align_right                 As Long = 3    '

Public Const layout_align_bottom                As Long = 4    '

Public Const layout_align_center                As Long = 5    '

Public Const layout_align_equidistant           As Long = 6    '

Public Const pane_state_any                     As Long = 0    '

Public Const pane_state_lock                    As Long = 1    '

Public Const pane_state_dock                    As Long = 2    '

Public Const pane_state_float                   As Long = 3    '

Public Const pane_state_hide                    As Long = 4    '

Public Const XC_SY_CAPTION                      As Long = 1 ' ///<top布局,如果指定该属性,默认为绑定标题栏元素

Public Const XC_SY_BORDER                       As Long = 2 ' ///<边框,指定默认上下左右布局大小,如果没有指定,那么边框布局大小为0

Public Const XC_SY_CENTER                       As Long = 4 ' ///<窗口居中

Public Const XC_SY_DRAG_BORDER                  As Long = 8 ' ///<拖动窗口边框

Public Const XC_SY_DRAG_WINDOW                  As Long = 16 ' ///<拖动窗口

Public Const XWM_WINDPROC                       As Long = 28672 '   //注册窗口处理过程

Public Const XWM_DRAW_T                         As Long = 28681 ' //窗口绘制,内部使用, wParam:0, lParam:0

Public Const XWM_MENUSELECT                     As Long = 28676 '//菜单选择 wParam:菜单项ID, lParam:0

Public Const XWM_MENUEXIT                       As Long = 28677 '//菜单退出 wParam:0, lParam:0

Public Const XWM_COMBOBOX_POPUP_DROPLIST        As Long = 28678 ' //弹出下拉组框列表,内部使用

Public Const XC_WINDOW_TOP                      As Long = 1 '//上

Public Const XC_WINDOW_BOTTOM                   As Long = 2 '//下

Public Const XC_WINDOW_LEFT                     As Long = 3 '//左

Public Const XC_WINDOW_RIGHT                    As Long = 4 '//右

Public Const XC_WINDOW_TOPLEFT                  As Long = 5 '//左上角

Public Const XC_WINDOW_TOPRIGHT                 As Long = 6 '//右上角

Public Const XC_WINDOW_BOTTOMLEFT               As Long = 7 '//左下角

Public Const XC_WINDOW_BOTTOMRIGHT              As Long = 8 '//右下角

Public Const XC_WINDOW_CAPTION                  As Long = 9 '//标题栏移动窗口区域

Public Const XC_LAYOUT_TOP                      As Long = 1 ' ///<top

Public Const XC_WIND_TRANSPARENT_NO             As Long = 0 '///<默认窗口,不透明

Public Const XC_WIND_TRANSPARENT_SHAPED         As Long = 1 '///<透明窗口,带透明通道,异型.

Public Const XC_WIND_TRANSPARENT_SHADOW         As Long = 2 '///<阴影窗口,带透明通道,边框阴影,窗口透明或半透明,当前未启用.

Public Const XC_WIND_TRANSPARENT_SIMPLE         As Long = 4 '///<透明窗口,不带透明通道,指定半透明度,指定透明色.

Public Const XC_WIND_TRANSPARENT_WIN7           As Long = 8 '///<WIN7玻璃窗口,需要WIN7开启特效,当前未启用.

Public Const XC_ID_ROOT                         As Long = 0 '  ///<根节点

Public Const XM_SELECT                          As Long = 1 '  ///<选择

Public Const XM_DISABLED                        As Long = 2 '  ///<禁用

Public Const XM_CHECK                           As Long = 4 '  ///<勾选

Public Const XM_POPUP                           As Long = 8 '  ///<弹出

Public Const XM_SEPARATOR                       As Long = 16 ' ///<分隔栏 ID号任意,ID号被忽略

Public Const XM_LEFT_TOP                        As Long = 0 '  ///<左上角

Public Const XM_LEFT_BOTTOM                     As Long = 1 '  ///<左下角

Public Const XM_RIGHT_TOP                       As Long = 2 '  ///<右上角

Public Const XM_RIGHT_BOTTOM                    As Long = 3 '  ///<右下角

Public Const XM_CENTER_LEFT                     As Long = 4 '  ///<左居中

Public Const XM_CENTER_TOP                      As Long = 5 '  ///<上居中

Public Const XM_CENTER_RIGHT                    As Long = 6 '  ///<右居中

Public Const XM_CENTER_BOTTOM                   As Long = 7 '  ///<下居中

Public Const IDM_CLIP                           As Long = 1000000000 '   ///<剪切

Public Const IDM_COPY                           As Long = 1000000001 '   ///<复制

Public Const IDM_PASTE                          As Long = 1000000002 '   ///<粘贴

Public Const IDM_DELETE                         As Long = 1000000003 '   ///<删除

Public Const IDM_SELECTALL                      As Long = 1000000004 '   ///<全选

Public Const IDM_DELETEALL                      As Long = 1000000005 '   ///<清空

Public Const XC_IMAGE_DEFAULT                   As Long = 0 ' ///<默认

Public Const XC_IMAGE_STRETCH                   As Long = 1 ' ///<拉伸

Public Const XC_IMAGE_ADAPTIVE                  As Long = 2 ' ///<自适应

Public Const XC_IMAGE_TILE                      As Long = 3 ' ///<平铺

Public Const STATE_LEAVE                        As Long = 0 '  ///<离开

Public Const STATE_DOWN                         As Long = 1 '  ///<按下

Public Const STATE_STAY                         As Long = 2 '  ///<停留

Public Const XC_BUTTON_TYPE_DEFAULT             As Long = 0 '///<默认类型

Public Const XC_BUTTON_TYPE_CHECK               As Long = 1 '///<复选按钮

Public Const XC_BUTTON_TYPE_RADIO               As Long = 2 '///<单选按钮

Public Const XC_BUTTON_TYPE_CLOSE               As Long = 3 '///<窗口关闭按钮

Public Const XC_BUTTON_TYPE_MIN                 As Long = 4 '///<窗口最小化按钮

Public Const XC_BUTTON_TYPE_MAX                 As Long = 5 '///<窗口最大化还原按钮

Public Const XC_BUTTON_STYLE_DEFAULT            As Long = 0 ' ///<默认风格

Public Const XC_BUTTON_STYLE_CHECK              As Long = 1 ' ///<复选按钮

Public Const XC_BUTTON_STYLE_RADIO              As Long = 2 ' ///<单选按钮

Public Const XC_BUTTON_STYLE_SCROLLBAR_UP       As Long = 3 ' ///<水平滚动条,上按钮

Public Const XC_BUTTON_STYLE_SCROLLBAR_DOWN     As Long = 4 ' ///<水平滚动条,下按钮

Public Const XC_BUTTON_STYLE_SCROLLBAR_LEFT     As Long = 5 ' ///<水平滚动条,左按钮

Public Const XC_BUTTON_STYLE_SCROLLBAR_RIGHT    As Long = 6 ' ///<水平滚动条,右按钮

Public Const XC_BUTTON_STYLE_SCROLLBAR_SLIDER   As Long = 7 ' ///<滚动条,滑块

Public Const XC_BUTTON_STYLE_TABBAR_BUTTON      As Long = 8 ' ///<TabBar上的按钮

Public Const XC_ICON_ALIGN_LEFT                 As Long = 0 ' ///<图标在左边

Public Const XC_ICON_ALIGN_TOP                  As Long = 1 ' ///<图标在顶部

Public Const XC_ICON_ALIGN_RIGHT                As Long = 2 ' ///<图标在右边

Public Const XC_ICON_ALIGN_BOTTOM               As Long = 3 ' ///<图标在底部

Public Const XC_LAYOUT_SIZE_Size                As Long = 0 '  ///<指定大小

Public Const XC_LAYOUT_SIZE_Fill                As Long = 1 '  ///<fill 填充父

Public Const XC_LAYOUT_SIZE_Auto                As Long = 2 '  ///<auto 自动大小,根据内容计算大小

Public Const XC_LAYOUT_SIZE_Weight              As Long = 3 '  ///<weight 延伸,填充剩余空间

Public Const XC_LAYOUT_SIZE_Disable             As Long = 4 '  ///<disable 不使用

Public Const XC_LIST_STYLE_DRAW_LEAVE           As Long = 1 ' ///<绘制鼠标离开状态项背景

Public Const XC_LIST_STYLE_DRAW_SELECT          As Long = 2 ' ///<绘制鼠标选择状态项背景

Public Const XC_LIST_STYLE_DRAW_STAY            As Long = 4 ' ///<绘制鼠标停留状态项项背景

Public Const XC_LISTBOX_STYLE_DRAW_LEAVE        As Long = 1 ' ///<绘制鼠标离开状态项背景

Public Const XC_LISTBOX_STYLE_DRAW_SELECT       As Long = 2 ' ///<绘制鼠标选择状态项背景

Public Const XC_LISTBOX_STYLE_DRAW_STAY         As Long = 4 ' ///<绘制鼠标停留状态项项背景

Public Const XC_TREE_STYLE_DRAW_LEAVE           As Long = 1 ' ///<绘制鼠标离开状态项背景

Public Const XC_TREE_STYLE_DRAW_SELECT          As Long = 2 ' ///<绘制鼠标选择状态项背景

Public Const IDM_LOCK                           As Long = 1000000006 '   ///<锁定

Public Const IDM_DOCK                           As Long = 1000000007 '   ///<停靠

Public Const IDM_FLOAT                          As Long = 1000000008 '   ///<浮动

Public Const IDM_HIDE                           As Long = 1000000009 '   ///<隐藏

Public Const XE_ELEPROCE                        As Long = 1 '    ///元素事件处理过程

Public Const XE_PAINT_END                       As Long = 3 '    //元素及子元素绘制完成后触发,需要启用该功能,XEle_EnableEvent_XE_PAINT_END();

Public Const XE_MOUSESTAY                       As Long = 6 '  ///停留

Public Const XE_MOUSEHOVER                      As Long = 7 '  ///悬停

Public Const XE_MOUSELEAVE                      As Long = 8 '  ///离开

Public Const XE_MOUSEWHEEL                      As Long = 9 ' //鼠标滚轮  wParam:标识,lParam:POINT坐标

Public Const XE_DESTROY                         As Long = 33 '  //元素销毁

Public Const XE_BUTTON_CHECK                    As Long = 35 ' //按钮选中事件

Public Const XE_SHOW                            As Long = 37 ' //wParam:TRUE或FALSE, lParam:0

Public Const XE_KEYDOWN                         As Long = 39 '//wParam和lParam参数与标准消息相同

Public Const XE_CHAR                            As Long = 40 '  //wParam和lParam参见MSDN

Public Const XE_SETCURSOR                       As Long = 53 ' // SetCursor

Public Const XE_SCROLLVIEW_SCROLL_H             As Long = 54 ' //滚动视图 滚动事件 wParam:滚动点,lParam:0 (滚动视图触发,表明滚动视图已滚动完成)

Public Const XE_SCROLLVIEW_SCROLL_V             As Long = 55 ' //滚动视图 滚动事件 wParam:滚动点,lParam:0 (滚动视图触发,表明滚动视图已滚动完成)

Public Const XE_SBAR_SCROLL                     As Long = 56 '  //滚动条滚动事件 wParam:滚动点,lParam:0 (滚动条触发)

Public Const XE_MENUSELECT                      As Long = 57 ' //菜单项选择 wParam:菜单ID,lParam:0

Public Const XE_MENUEXIT                        As Long = 58 '//菜单退出

Public Const XE_COMBOBOX_SELECT                 As Long = 71 '  //组合框项选择

Public Const XE_TREE_TEMP_CREATE                As Long = 121 '

Public Const XE_TREE_TEMP_DESTROY               As Long = 123 '

Public Const XE_TREE_TEMP_ADJUST_COORDINATE     As Long = 124 '

Public Const XE_TREE_DRAWITEM                   As Long = 125 '

Public Const XC_WINDOW_BODY                     As Long = 10 '

Public Const XE_PAINT                           As Long = 2 '

Public Const XE_PAINT_SCROLLVIEW                As Long = 4 '

Public Const XE_MOUSEMOVE                       As Long = 5 '

Public Const XE_LBUTTONDOWN                     As Long = 10 '

Public Const XE_LBUTTONUP                       As Long = 11 '

Public Const XE_RBUTTONDOWN                     As Long = 12 '

Public Const XE_RBUTTONUP                       As Long = 13 '

Public Const XE_LBUTTONDBCLICK                  As Long = 14 '

Public Const XE_RBUTTONDBCLICK                  As Long = 15 '

Public Const XE_SETFOCUS                        As Long = 31 '

Public Const XE_KILLFOCUS                       As Long = 32 '

Public Const XE_BNCLICK                         As Long = 34 '

Public Const XE_SIZE                            As Long = 36 '

Public Const XE_SETFONT                         As Long = 38 '

Public Const XE_SETCAPTURE                      As Long = 51 '

Public Const XE_KILLCAPTURE                     As Long = 52 '

Public Const XE_SLIDERBAR_CHANGE                As Long = 59 '

Public Const XE_PROGRESSBAR_CHANGE              As Long = 60 '

Public Const XE_COMBOBOX_POPUP_LIST             As Long = 72 '

Public Const XE_COMBOBOX_EXIT_LIST              As Long = 73 '

Public Const XE_LISTBOX_TEMP_CREATE             As Long = 81 '

Public Const XE_LISTBOX_TEMP_CREATE_END         As Long = 82 '

Public Const XE_LISTBOX_TEMP_DESTROY            As Long = 83 '

Public Const XE_LISTBOX_TEMP_ADJUST_COORDINATE  As Long = 84 '

Public Const XE_LISTBOX_DRAWITEM                As Long = 85 '

Public Const XE_LISTBOX_SELECT                  As Long = 86 '

Public Const XE_LIST_TEMP_CREATE                As Long = 101 '

Public Const XE_LIST_TEMP_CREATE_END            As Long = 102 '

Public Const XE_LIST_TEMP_DESTROY               As Long = 103 '

Public Const XE_LIST_TEMP_ADJUST_COORDINATE     As Long = 104 '

Public Const XE_LIST_DRAWITEM                   As Long = 105 '

Public Const XE_LIST_SELECT                     As Long = 106 '

Public Const XE_LIST_HEADER_DRAWITEM            As Long = 107 '

Public Const XE_LIST_HEADER_CLICK               As Long = 108 '

Public Const XE_LIST_HEADER_WIDTH_CHANGE        As Long = 109 '

Public Const XE_TREE_TEMP_CREATE_END            As Long = 122 '

Public Const XE_TREE_SELECT                     As Long = 126 '

Public Const XE_TREE_EXPAND                     As Long = 127 '

Public Const XE_LISTVIEW_TEMP_CREATE            As Long = 141 '

Public Const XE_LISTVIEW_TEMP_CREATE_END        As Long = 142 '

Public Const XE_LISTVIEW_TEMP_DESTROY           As Long = 143 '

Public Const XE_LISTVIEW_TEMP_ADJUST_COORDINATE As Long = 144 '

Public Const XE_LISTVIEW_DRAWITEM               As Long = 145 '

Public Const XE_LISTVIEW_SELECT                 As Long = 146 '

Public Const XE_LISTVIEW_EXPAND                 As Long = 147 '

Public Const XE_PGRID_VALUE_CHANGE              As Long = 161 '

Public Const XE_RICHEDIT_CHANGE                 As Long = 162 '

Public Const XE_RICHEDIT_SET                    As Long = 201 '

Public Const XE_PGRID_ITEM_SET                  As Long = 202 '

Public Const XE_TABBAR_SELECT                   As Long = 221 '

Public Const XE_TABBAR_DELETE                   As Long = 222 '

Public Const XC_PARAM_int                       As Long = 1 '

Public Const XC_PARAM_uint                      As Long = 2 '

Public Const XC_PARAM_BOOL                      As Long = 3 '

Public Const XC_PARAM_CHAR                      As Long = 4 '

Public Const XC_PARAM_BYTE                      As Long = 5 '

Public Const XC_PARAM_HXCGUI                    As Long = 6 '

Public Const XC_PARAM_HWINDOW                   As Long = 7 '

Public Const XC_PARAM_HELE                      As Long = 8 '

Public Const XC_PARAM_HIMAGE                    As Long = 9 '

Public Const XC_PARAM_HDRAW                     As Long = 10 '

Public Const XC_PARAM_P_RECT                    As Long = 11 '

Public Const XC_PARAM_P_POINT                   As Long = 12 '

Public Const XC_PARAM_P_SIZE                    As Long = 13 '

Public Const XC_PARAM_P_BOOL                    As Long = 14 '

Public Const XC_PARAM_P_listBox_item_i          As Long = 15 '

Public Const XC_PARAM_P_list_header_item_i      As Long = 16 '

Public Const XC_PARAM_P_list_item_i             As Long = 17 '

Public Const XC_PARAM_P_listView_item_i         As Long = 18 '

Public Const XC_PARAM_P_tree_item_i             As Long = 19 '

Public Const XC_FUN_int_w_uint_uint_uint_bPtr   As Long = 1 '

Public Const XC_FUN_int_w_uint_ptPtr_bPtr       As Long = 2 '

Public Const XC_FUN_int_w_hDraw_bPtr            As Long = 3 '

Public Const XC_ID_ERROR                        As Long = -1 '  ///<ID错误

Public Const XC_ID_FIRST                        As Long = -2 '  ///<插入开始位置

Public Const XC_ID_LAST                         As Long = -3 '  ///<插入末尾位置

Public Const XC_SY_DEFALT                       As Long = 15




Public Function L(ByVal szSrc As String) As String

Dim szDes As String

 szDes = StrConv(szSrc, vbUnicode)

L = szDes
End Function




