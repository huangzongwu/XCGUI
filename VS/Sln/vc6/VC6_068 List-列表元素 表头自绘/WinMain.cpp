#include "Common.h"

class CMyWindowList
{
public:
    HWINDOW m_hWindow;
    HELE    m_hList;
    CMyWindowList()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 550, 380, L"ìÅ²Ê½çÃæ¿â´°¿Ú",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
		
        m_hList= XList_Create(20,40,500,300,m_hWindow);
        XList_SetItemTemplateXML(m_hList,L"List_Item.xml");
        XSView_SetLineSize(m_hList,20,20);
		
        XList_AddColumn(m_hList,100);
        XList_AddColumn(m_hList,100);
        XList_AddColumn(m_hList,100);
		
        HXCGUI hAdapterHeader=XAdapterMap_Create();
        XList_BindAdapterHeader(m_hList,hAdapterHeader);
        XAdapterMap_AddItemText(hAdapterHeader,(XC_NAME),L"aaa");
        XAdapterMap_AddItemText(hAdapterHeader,(XC_NAME2),L"bbb");
        XAdapterMap_AddItemText(hAdapterHeader,(XC_NAME3),L"ccc");
        XAdapterMap_AddItemText(hAdapterHeader,(XC_NAME4),L"test");
		
        HXCGUI hAdapter=XAdapterTable_Create();
        XList_BindAdapter(m_hList,hAdapter);
        XAdapterTable_AddColumn(hAdapter,(XC_NAME));
        XAdapterTable_AddColumn(hAdapter,(XC_NAME2));
        XAdapterTable_AddColumn(hAdapter,(XC_NAME3));
		
        XList_SetColumnWidth(m_hList,0,150);
        XList_SetColumnWidth(m_hList,1,150);
        XList_SetColumnWidth(m_hList,2,150);
		
        wchar_t tmp[MAX_PATH]={0};
        for (int i=0;i<20;i++)
        {
            wsprintf(tmp,L"item-%d",i);
            XAdapterTable_AddItemText(hAdapter,tmp);
			
            wsprintf(tmp,L"child-%d-1",i);  XAdapterTable_SetItemText(hAdapter,i,1,tmp);
            wsprintf(tmp,L"child-%d-2",i);  XAdapterTable_SetItemText(hAdapter,i,2,tmp);
        }

		HELE hEleHeader = XList_GetHeaderHELE(m_hList);

		srand(GetTickCount());

		XEle_RegEventCPP(hEleHeader,XE_LIST_HEADER_DRAWITEM,&CMyWindowList::OnListHeaderDrawItem);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
	int OnListHeaderDrawItem(HDRAW hDraw, list_header_item_i* pItem, BOOL *pbHandled)
	{

		XDraw_SetBrushColor(hDraw,rand());
		XDraw_FillRect(hDraw,&pItem->rcItem);
		

		*pbHandled = TRUE;
		return 0;
	}
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowList  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}
