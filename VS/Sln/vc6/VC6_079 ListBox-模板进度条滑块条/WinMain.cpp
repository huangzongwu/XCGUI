#include "Common.h"

class CMyWindowListBox
{
public:
    HWINDOW m_hWindow;
    HELE    m_hListBox;
    HELE    m_hRichEidt;
	HXCGUI hAdapter;
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

        hAdapter=XAdapterTable_Create();
        XListBox_BindAdapter(m_hListBox,hAdapter);
        XAdapterTable_AddColumn(hAdapter,(XC_NAME));
        XAdapterTable_AddColumn(hAdapter,(XC_NAME2));
        XAdapterTable_AddColumn(hAdapter,(XC_NAME3));
		XAdapterTable_AddColumn(hAdapter,L"pos");

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

				XAdapterTable_SetItemTextEx(hAdapter,index,L"pos",L"0");
            }
        }
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_CREATE_END,&CMyWindowListBox::OnListBoxTemplateCreateEnd);
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_DESTROY,&CMyWindowListBox::OnTemplateDestroy);
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_TEMP_ADJUST_COORDINATE,&CMyWindowListBox::OnTemplateAdjustCoordinate);
        XEle_RegEventCPP(m_hListBox,XE_LISTBOX_SELECT,&CMyWindowListBox::OnListBoxSelect);
        
		srand(GetTickCount());

		XWnd_SetTimer(m_hWindow,100,100);
		XWnd_RegEventCPP(m_hWindow,WM_TIMER,&CMyWindowListBox::OnWndTimer);

        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
	int OnWndTimer(UINT nIDEvent,BOOL *pbHandled)
	{
		int pos = 0;

		for (int i = 0; i < XAdapterTable_GetCount(hAdapter); i++)
		{

			HELE hProgressBar = (HELE)XListBox_GetTemplateObject(m_hListBox,i,2);
			HELE hSliderBar = (HELE)XListBox_GetTemplateObject(m_hListBox,i,3);

			wchar_t outBuffer[MAX_PATH] = {0};
			XAdapterTable_GetItemTextEx(hAdapter,i,L"pos",outBuffer,MAX_PATH*sizeof(wchar_t));
			int pos = _wtoi(outBuffer);

			pos += rand() % 10;
			if (pos > 100)
			{
				pos = 0;
			}

			wchar_t buffer[MAX_PATH] = {0};
			wsprintfW(buffer,L"%d",pos);
			XAdapterTable_SetItemTextEx(hAdapter,i,L"pos",buffer);


			XAdapterTable_SetItemText(hAdapter,i,0,buffer);
		}

		XListBox_RefreshData(m_hListBox);

		XEle_RedrawEle(m_hListBox);
		return 0;
	}

    int  OnListBoxSelect(int iItem,BOOL *pbHandled)
    {

        *pbHandled=TRUE;
        return 0;
    }
    int OnListBoxTemplateCreateEnd(listBox_item_i* pItem,BOOL *pbHandled)
    {
  		wchar_t buffer[MAX_PATH] = {0};
		XAdapterTable_GetItemTextEx(hAdapter,pItem->index,L"pos",buffer,MAX_PATH*sizeof(wchar_t));
		int pos = _wtoi(buffer);

		 HXCGUI hProgress = XListBox_GetTemplateObject(m_hListBox,pItem->index,2);
		 if (XC_IsHXCGUI(hProgress,XC_PROGRESSBAR))
		 {
			 XProgBar_SetRange((HELE)hProgress,100);
			 XProgBar_SetPos((HELE)hProgress,pos);
		 }
		 HXCGUI hSliderBar = XListBox_GetTemplateObject(m_hListBox,pItem->index,3);
		 if (XC_IsHXCGUI(hSliderBar,XC_SLIDERBAR))
		 {
			 XSliderBar_SetRange((HELE)hSliderBar,100);
			 XSliderBar_SetPos((HELE)hSliderBar,pos);
		 }
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
    XC_ShowLayoutFrame(TRUE);
    CMyWindowListBox  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return TRUE;
}
