#include "Common.h"

class CMyWindowTree
{
public:
    HWINDOW m_hWindow;
    HELE    m_hTree;
    CMyWindowTree()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(400, 200, 350, 400, L"炫彩界面库窗口",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
        
        m_hTree= XTree_Create(20,40,300,300,m_hWindow);
        XTree_SetItemTemplateXML(m_hTree,L"Tree_Item.xml");
		
        HXCGUI hAdapter=XAdapterTree_Create();
        XTree_BindAdapter(m_hTree,hAdapter);
        XAdapterTree_AddColumn(hAdapter,(XC_NAME));
        
        wchar_t  buf[256]={0};
        int id=0;
        for (int i=0;i<20;i++)
        {
            wsprintf(buf,L"name-%d-0",i);
            id=XAdapterTree_InsertItemText(hAdapter,buf,XC_ID_ROOT,XC_ID_LAST);
        }
        
        int idc1=XAdapterTree_InsertItemText(hAdapter,L"Item1------1",1,XC_ID_LAST);
        int idc2=XAdapterTree_InsertItemText(hAdapter,L"Item1------2",1,XC_ID_LAST);
        int idc2_1=XAdapterTree_InsertItemText(hAdapter,L"Item1-----2--1",idc2,XC_ID_LAST);
        
        XEle_RegEventCPP(m_hTree,XE_TREE_SELECT,&CMyWindowTree::OnTreeSelect);
        XEle_RegEventCPP(m_hTree,XE_TREE_EXPAND,&CMyWindowTree::OnTreeExpand);
		
        XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_CREATE,&CMyWindowTree::OnTemplateCreate);
		XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_CREATE_END,&CMyWindowTree::OnTreeTemplateCreateEnd);

        XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_DESTROY,&CMyWindowTree::OnTemplateDestroy);
        XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_ADJUST_COORDINATE,&CMyWindowTree::OnTemplateAdjustCoordinate);
		
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
	int OnTreeTemplateCreateEnd(tree_item_i* pItem,BOOL *pbHandled)
	{
		HELE hBtn = (HELE) XTree_GetTemplateObject(m_hTree,pItem->nID,1);

		if (XC_GetObjectType(hBtn) == XC_BUTTON)
		{
			HIMAGE imageUnCheck = XImage_LoadFile(L"收.png");
			HIMAGE imageCheck = XImage_LoadFile(L"开.png");

// 			XBtn_AddBkImage(hBtn,button_state_flag_check_no,imageUnCheck);
// 			XBtn_AddBkImage(hBtn,button_state_flag_check,imageCheck);

			XBtn_SetStyle(hBtn,button_style_default);
			HBKINFOM hBkInfoM  = XEle_GetBkInfoManager(hBtn);
			XBkInfoM_AddImage(hBkInfoM,button_state_flag_check,imageCheck);
			XBkInfoM_AddImage(hBkInfoM,button_state_flag_check_no,imageUnCheck);

		}
		*pbHandled = TRUE;
		return 0;
	}
    int OnTreeSelect(int nItemID,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int OnTreeExpand(int id,BOOL bExpand,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateCreate(tree_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateDestroy(tree_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateAdjustCoordinate(tree_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowTree  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return TRUE;
}
