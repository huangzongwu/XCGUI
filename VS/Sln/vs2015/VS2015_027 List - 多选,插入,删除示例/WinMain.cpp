#include "Common.h"







class CMyWindowList
{
public:
    HWINDOW m_hWindow;
    HELE    m_hList;
    HELE    m_hRichEidt;
    CMyWindowList()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 700, 400, L"ìÅ²Ê½çÃæ¿â´°¿Ú",NULL, xc_window_style_default);
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

        m_hRichEidt=XRichEdit_Create(525,106,120,200,m_hWindow);
        XSView_ShowSBarV(m_hRichEidt,TRUE);
        XRichEdit_EnableMultiLine(m_hRichEidt,TRUE);

        HELE hButton1=XBtn_Create(525,40,100,18,L"²åÈëindex=1",m_hWindow);
        XEle_RegEventCPP(hButton1,XE_BNCLICK,&CMyWindowList::OnBtnClickInsert);

        HELE hButton2=XBtn_Create(525,62,100,18,L"É¾³ýindex=1",m_hWindow);
        XEle_RegEventCPP(hButton2,XE_BNCLICK,&CMyWindowList::OnBtnClickDel);

        HELE hButton3=XBtn_Create(525,84,100,18,L"É¾³ýindex=(2-3)",m_hWindow);
        XEle_RegEventCPP(hButton3,XE_BNCLICK,&CMyWindowList::OnBtnClickDelEx);

        XEle_RegEventCPP(m_hList,XE_LIST_SELECT,&CMyWindowList::OnListSelect);
        XEle_RegEventCPP(m_hList,XE_LIST_TEMP_CREATE,&CMyWindowList::OnTemplateCreate);
        XEle_RegEventCPP(m_hList,XE_LIST_TEMP_DESTROY,&CMyWindowList::OnTemplateDestroy);
        XEle_RegEventCPP(m_hList,XE_LIST_TEMP_ADJUST_COORDINATE,&CMyWindowList::OnTemplateAdjustCoordinate);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
    int  OnBtnClickInsert(BOOL *pbHandled)
    {
        HXCGUI hAdapter=XList_GetAdapter(m_hList);
        int index=XAdapterTable_InsertItemText(hAdapter,1,L"test-insert");
        XAdapterTable_SetItemText(hAdapter,index,1,L"insert");
        XAdapterTable_SetItemText(hAdapter,index,2,L"insert");
        XEle_RedrawEle(m_hList);
        return 0;
    }
    int  OnBtnClickDel(BOOL *pbHandled)
    {
        HXCGUI hAdapter=XList_GetAdapter(m_hList);
        if(XAdapterTable_DeleteItem(hAdapter,1))
            XEle_RedrawEle(m_hList);
        return 0;
    }
    int  OnBtnClickDelEx(BOOL *pbHandled)
    {
        HXCGUI hAdapter=XList_GetAdapter(m_hList);
        if(XAdapterTable_DeleteItemEx(hAdapter,2,2))
            XEle_RedrawEle(m_hList);
        return 0;
    }
    int  OnListSelect(int iItem,BOOL *pbHandled)
    {
        XTRACE("select item %d \n",iItem);
        XRichEdit_DeleteAll(m_hRichEidt);
        int array_[100]={0};
        int count =XList_GetSelectAll(m_hList,array_,100);
        wstring  szItemList;
        wchar_t  name[MAX_PATH]={0};
        HXCGUI hAdapter=XList_GetAdapter(m_hList);
        for (int i=0;i<count;i++)
        {
            if(XAdapterTable_GetItemTextEx(hAdapter,array_[i],(XC_NAME),name,MAX_PATH))
            {
                szItemList+=name;
                szItemList+=L"\n";
            }
        }
        XRichEdit_SetText(m_hRichEidt,szItemList.c_str());
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateCreate(list_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateDestroy(list_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateAdjustCoordinate(list_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowList  MyWindowt;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}
