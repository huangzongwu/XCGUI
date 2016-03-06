#include "Common.h"

class CMyWindowListView
{
public:
    HWINDOW m_hWindow;
    HELE    m_hListView;
    CMyWindowListView()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 500, 400, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
		
        m_hListView= XListView_Create(20,40,295,150,m_hWindow);

		//����listView����ı�����ɫ
		XEle_EnableDrawFocus(m_hListView,FALSE);
		XEle_AddBkFill(m_hListView,RGB(255,0,0),255);

		//Ӱ�ط�����
		XListView_SetGroupHeight(m_hListView,0);

		XListView_SetAlignSizeLeft(m_hListView,0);
		XListView_SetAlignSizeTop(m_hListView,0); 
		XListView_SetItemSize(m_hListView,30,30); //Ҫ��ʾ��ͼƬ��С
		XListView_SetColumnSpace (m_hListView,1); //�м��
		XListView_SetRowSpace (m_hListView,1);  //�м��
		XSView_SetPadding(m_hListView,1,1,0,0); //���ڼ�����


        XListView_SetItemTemplateXML(m_hListView,L"ListView_Item.xml");
		
		

        HXCGUI hAdapter=XAdapterListView_Create();
        XAdapterListView_Group_AddColumn(hAdapter,(XC_NAME3));
        XAdapterListView_Item_AddColumn(hAdapter,(XC_NAME));
		
        XListView_BindAdapter(m_hListView,hAdapter);		
        int  group1=XAdapterListView_Group_AddItemText(hAdapter,L"group1");

		HBKINFOM hBkInfoM = XListView_GetItemBkInfoManager(m_hListView,list_item_state_leave);
		XBkInfoM_AddFill(hBkInfoM,RGB(255,255,255),255);
		
        int index=0;
        
		int i = 0;
        for (i=1;i<128;i++)
        {
			XAdapterListView_Item_AddItemText(hAdapter,group1,L"");
        }

//���������ʱ�ò�����Щ�¼���ԭ��д�ã�������Ը���
//         XEle_RegEventCPP(m_hListView,XE_LISTVIEW_SELECT,&CMyWindowListView::OnListViewSelect);
//         XEle_RegEventCPP(m_hListView,XE_LISTVIEW_EXPAND,&CMyWindowListView::OnListViewExpand);		
//         XEle_RegEventCPP(m_hListView,XE_LISTVIEW_TEMP_CREATE,&CMyWindowListView::OnTemplateCreate);
//         XEle_RegEventCPP(m_hListView,XE_LISTVIEW_TEMP_DESTROY,&CMyWindowListView::OnTemplateDestroy);
//         XEle_RegEventCPP(m_hListView,XE_LISTVIEW_TEMP_ADJUST_COORDINATE,&CMyWindowListView::OnTemplateAdjustCoordinate);
        

		XEle_RegEventCPP(
			m_hListView,
			XE_LISTVIEW_TEMP_CREATE_END,
			&CMyWindowListView::OnListViewTemplateCreateEnd);

        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
	int OnListViewTemplateCreateEnd(listView_item_i* pItem,BOOL *pbHandled)
	{
		
		//  ���9��xmlģ�������9
		HXCGUI hgif = XListView_GetTemplateObject(m_hListView,pItem->iGroup,pItem->iItem,9);
		if (XC_GetObjectType(hgif) == XC_BUTTON)
		{
			for (int i = 0; i < 10; i++)
			{
				wchar_t buffer[MAX_PATH] = {0};
				wsprintfW(buffer,L".\\68.gif.ifl\\IMG%05d.bmp",i);
				XBtn_AddAnimationFrame((HELE)hgif,XImage_LoadFile(buffer),200);
			}
			XBtn_EnableAnimation((HELE)hgif,TRUE);
		}
		return 0;
	}
//     int OnListViewSelect(int iGroup,int iItem,BOOL *pbHandled)
//     {
//         *pbHandled=TRUE;
//         return 0;
//     }
//     int OnListViewExpand(int iGroup,BOOL bExpand,BOOL *pbHandled)
//     {
//         *pbHandled=TRUE;
//         return 0;
//     }
//     int  OnTemplateCreate(listView_item_i *pItem,BOOL *pbHandled)
//     {
//         *pbHandled=TRUE;
//         return 0;
//     }
//     int  OnTemplateDestroy(listView_item_i *pItem,BOOL *pbHandled)
//     {
//         *pbHandled=TRUE;
//         return 0;
//     }
//     int  OnTemplateAdjustCoordinate(listView_item_i *pItem,BOOL *pbHandled)
//     {
//         *pbHandled=TRUE;
//         return 0;
//     }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowListView  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}
