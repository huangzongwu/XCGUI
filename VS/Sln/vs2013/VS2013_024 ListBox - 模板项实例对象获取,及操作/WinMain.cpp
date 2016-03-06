#include "Common.h"

class CMyWindowListBox
{
public:
    HWINDOW m_hWindow;
    HELE    m_hListBox;
    int     m_iIndex_prev; //��ǰѡ��������
    CMyWindowListBox()
    {
        m_iIndex_prev=-1;
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 400, 400, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
		
        m_hListBox=XListBox_Create(20,40,300,310,m_hWindow);
        XListBox_SetItemTemplateXML(m_hListBox,L"ListBox_Item.xml");
        XSView_SetLineSize(m_hListBox,20,20);
        XListBox_EnableMultiSel(m_hListBox,FALSE);
		
        HXCGUI hAdapter=XAdapterTable_Create();
        XListBox_BindAdapter(m_hListBox,hAdapter);
        XAdapterTable_AddColumn(hAdapter,(XC_NAME));
		
        wchar_t  buf[256]={0};
        int  index=0;
        for (int i=0;i<20;i++)
        {
            wsprintf(buf,L"item-%d",i);
            index=XAdapterTable_AddItemTextEx(hAdapter,(XC_NAME),buf);
        }
        //��ѡ���¼�
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_SELECT,&CMyWindowListBox::OnListBoxSelect);
        //��ģ��ʵ��������¼�
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_CREATE_END,&CMyWindowListBox::OnListBoxTemplateCreateEnd);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
    int  OnListBoxTemplateCreateEnd(listBox_item_i* pItem,BOOL *pbHandled)
    {
        //��ȡģ����(itemID=2)��ť
        HELE  hButton=(HELE)XListBox_GetTemplateObject(m_hListBox,pItem->index,2);
        if(XC_IsHXCGUI(hButton,XC_BUTTON))
        {
            XBtn_SetText(hButton,L"��ʼ��");
            //ע�ᰴť����¼�
            XEle_RegEventCPP1(hButton,XE_BNCLICK,&CMyWindowListBox::OnBtnClick);
        }
        *pbHandled=TRUE;
        return 0;
    }
    int  OnListBoxSelect(int iItem,BOOL *pbHandled)
    {
        if(m_iIndex_prev>=0)
        {
            //��ȡģ����(itemID=2)��ť
            HELE  hButton=(HELE)XListBox_GetTemplateObject(m_hListBox,m_iIndex_prev,2);
            if(XC_IsHXCGUI(hButton,XC_BUTTON))
                XBtn_SetText(hButton,L"-δѡ��-");
        }
        m_iIndex_prev=iItem;
        if(iItem>=0)
        {
            //��ȡģ����(itemID=2)��ť
            HELE  hButton=(HELE)XListBox_GetTemplateObject(m_hListBox,iItem,2);
            if(XC_IsHXCGUI(hButton,XC_BUTTON))
                XBtn_SetText(hButton,L"-��ѡ��-");
        }
        *pbHandled=TRUE;
        return 0;
    }
    int OnBtnClick(HELE hEventEle,BOOL *pbHandled)
    {
        //��ȡ��ť��ListBox�е�������
        int nItem=XEle_GetTemplateListItemID(hEventEle);
        if(nItem<0) return 0;

        //��ȡģ����(itemID=1)�ı���
        HXCGUI  hTextBlock=XListBox_GetTemplateObject(m_hListBox,nItem,1);
        if(XC_IsHXCGUI(hTextBlock,XC_SHAPE_TEXT))
        {
            wchar_t  buf[MAX_PATH]={0};
            XShapeText_GetText(hTextBlock,buf,MAX_PATH); //�˺��� 1.8.4.1�汾����
            MessageBox(XEle_GetHWND(hEventEle),buf,L"������˰�ť!",MB_OK);
        }

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
