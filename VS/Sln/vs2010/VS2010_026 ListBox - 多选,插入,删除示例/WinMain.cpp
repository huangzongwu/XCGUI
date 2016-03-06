#include "Common.h"







class CMyWindowListBox
{
public:
    HWINDOW m_hWindow;
    HELE    m_hListBox;
    HELE    m_hRichEidt;
    CMyWindowListBox()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 500, 400, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
    
        m_hListBox=XListBox_Create(20,40,300,310,m_hWindow);
        XListBox_SetItemTemplateXML(m_hListBox,L"ListBox_Item.xml");
        XSView_SetLineSize(m_hListBox,20,20);

        HXCGUI hAdapter=XAdapterTable_Create();
        XListBox_BindAdapter(m_hListBox,hAdapter);
        XAdapterTable_AddColumn(hAdapter,XC_NAME);
        XAdapterTable_AddColumn(hAdapter,XC_NAME2);
        XAdapterTable_AddColumn(hAdapter,XC_NAME3);

        wchar_t  buf[256]={0};
        int  index=0;
        for (int i=0;i<20;i++)
        {
            wsprintf(buf,L"item-%d",i);
            index=XAdapterTable_AddItemTextEx(hAdapter,(XC_NAME),buf);
            if(XC_ID_ERROR!=index)
            {
                wsprintf(buf,L"item-1-%d",i);
                XAdapterTable_SetItemTextEx(hAdapter,index,(XC_NAME2),buf);

                wsprintf(buf,L"item-2-%d",i);
                XAdapterTable_SetItemTextEx(hAdapter,index,(XC_NAME3),buf);
            }
        }

        HELE hButton1=XBtn_Create(330,40,100,18,L"����index=1",m_hWindow);
        XEle_RegEventCPP(hButton1,XE_BNCLICK,&CMyWindowListBox::OnBtnClickAdd);

        HELE hButton2=XBtn_Create(330,62,100,18,L"ɾ��index=1",m_hWindow);
        XEle_RegEventCPP(hButton2,XE_BNCLICK,&CMyWindowListBox::OnBtnClickDel);

        HELE hButton3=XBtn_Create(330,84,100,18,L"ɾ��index=(2-3)",m_hWindow);
        XEle_RegEventCPP(hButton3,XE_BNCLICK,&CMyWindowListBox::OnBtnClickDelEx);

        m_hRichEidt=XRichEdit_Create(330,106,120,200,m_hWindow);
        XSView_ShowSBarV(m_hRichEidt,TRUE);
        XRichEdit_EnableMultiLine(m_hRichEidt,TRUE);

        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_CREATE,&CMyWindowListBox::OnTemplateCreate);
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_DESTROY,&CMyWindowListBox::OnTemplateDestroy);
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_ADJUST_COORDINATE,&CMyWindowListBox::OnTemplateAdjustCoordinate);
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_SELECT,&CMyWindowListBox::OnListBoxSelect);
        
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
    int  OnBtnClickAdd(BOOL *pbHandled)
    {
        HXCGUI hAdapter=XListBox_GetAdapter(m_hListBox);
        XAdapterTable_InsertItemText(hAdapter,1,L"test - insert");
        XEle_RedrawEle(m_hListBox);
        return 0;
    }
    int  OnBtnClickDel(BOOL *pbHandled)
    {
        HXCGUI hAdapter=XListBox_GetAdapter(m_hListBox);
        if(XAdapterTable_DeleteItem(hAdapter,1))
            XEle_RedrawEle(m_hListBox);
        return 0;
    }
    int  OnBtnClickDelEx(BOOL *pbHandled)
    {
        HXCGUI hAdapter=XListBox_GetAdapter(m_hListBox);
        if(XAdapterTable_DeleteItemEx(hAdapter,2,2))
            XEle_RedrawEle(m_hListBox);
        return 0;
    }
    int  OnListBoxSelect(int iItem,BOOL *pbHandled)
    {
        XRichEdit_DeleteAll(m_hRichEidt);
        int array_[100]={0};
        int count =XListBox_GetSelectAll(m_hListBox,array_,100);
        wstring  szItemList;
        wchar_t  name[MAX_PATH]={0};
        HXCGUI hAdapter=XListBox_GetAdapter(m_hListBox);
        for (int i=0;i<count;i++)
        {
            if(XAdapterTable_GetItemText(hAdapter,array_[i],0,name,MAX_PATH))
            {
                szItemList+=name;
                szItemList+=L"\n";
            }
        }
        XRichEdit_SetText(m_hRichEidt,szItemList.c_str());
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateCreate(listBox_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateDestroy(listBox_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateAdjustCoordinate(listBox_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowListBox  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return TRUE;
}

