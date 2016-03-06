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
		
        m_hListView= XListView_Create(20,40,400,300,m_hWindow);
        XListView_SetItemTemplateXML(m_hListView,L"ListView_Item.xml");
		
        HXCGUI hAdapter=XAdapterListView_Create();
        XAdapterListView_Group_AddColumn(hAdapter,(XC_NAME3));
        XAdapterListView_Item_AddColumn(hAdapter,(XC_NAME));
        XAdapterListView_Item_AddColumn(hAdapter,(XC_NAME2));
		
        XListView_BindAdapter(m_hListView,hAdapter);
		
        int  group1=XAdapterListView_Group_AddItemText(hAdapter,L"group1");
        int  group2=XAdapterListView_Group_AddItemText(hAdapter,L"group2");
		
        HIMAGE hImage=XImage_LoadFile(L"111.jpg");
		
        int index=0;
        wchar_t  temp[MAX_PATH]={0};
		int i = 0;
        for (i=0;i<20;i++)
        {
            wsprintf(temp,L"group1-item-%d",i);
            index=XAdapterListView_Item_AddItemImage(hAdapter,group1,hImage);
            XAdapterListView_Item_SetText(hAdapter,group1,index,1,temp);
        }
		
        for (i=0;i<20;i++)
        {
            wsprintf(temp,L"group2-item-%d",i);
            index=XAdapterListView_Item_AddItemImage(hAdapter,group2,hImage);
            XAdapterListView_Item_SetText(hAdapter,group2,index,1,temp);
        }
        XEle_RegEventCPP(m_hListView,XE_LISTVIEW_SELECT,&CMyWindowListView::OnListViewSelect);
        XEle_RegEventCPP(m_hListView,XE_LISTVIEW_EXPAND,&CMyWindowListView::OnListViewExpand);
		
        XEle_RegEventCPP(m_hListView,XE_LISTVIEW_TEMP_CREATE,&CMyWindowListView::OnTemplateCreate);
        XEle_RegEventCPP(m_hListView,XE_LISTVIEW_TEMP_DESTROY,&CMyWindowListView::OnTemplateDestroy);
        XEle_RegEventCPP(m_hListView,XE_LISTVIEW_TEMP_ADJUST_COORDINATE,&CMyWindowListView::OnTemplateAdjustCoordinate);
        


		//��ȡ��ֱ������
		//(��ע: ������ list �� listbox ֻҪ�ǹ�����ͼ�࣬��������
		// XSView_GetScrollBarV ����ȡ������ ˮƽ�� ���� XSView_GetScrollBarH
		// �����Ҫ�� ģ���ϵ�ṹͼ�������ĵ��� ��Ҷ�������������)
		HELE hSbar = XSView_GetScrollBarV(m_hListView);
		HBKINFOM hBkInfoM = XEle_GetBkInfoManager(hSbar); //��ȡ�������ı���������
		HIMAGE hImageBG = XImage_LoadFile(L"bgV.png",TRUE);
		XBkInfoM_AddImage(hBkInfoM,element_state_flag_leave,hImageBG); //Ȼ����ͼ
		
		
		HELE hBtnUp = XSBar_GetButtonUp(hSbar); //��ȡ��ť
		XBtn_SetStyle(hBtnUp,button_style_default);
		XEle_EnableBkTransparent(hBtnUp,TRUE);
		hBkInfoM = XEle_GetBkInfoManager(hBtnUp); //��ȡ��ť�ı���������
		HIMAGE hImageUp = XImage_LoadFile(L"up.png",FALSE);
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_leave,hImageUp); //Ȼ����ͼ
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_stay,hImageUp); //Ȼ����ͼ
 		
		HELE hBtnDown = XSBar_GetButtonDown(hSbar);
		XBtn_SetStyle(hBtnDown,button_style_default);
		XEle_EnableBkTransparent(hBtnDown,TRUE);
		hBkInfoM = XEle_GetBkInfoManager(hBtnDown); //��ȡ��ť�ı���������
		HIMAGE hImageDown = XImage_LoadFile(L"up.png",FALSE);
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_leave,hImageDown); //Ȼ����ͼ
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_stay,hImageDown); //Ȼ����ͼ
 		

		HELE hSlider = XSBar_GetButtonSlider(hSbar);
		XEle_EnableBkTransparent(hSlider,TRUE);
		hBkInfoM = XEle_GetBkInfoManager(hSlider); //��ȡ��ť�ı���������
		HIMAGE hImageSlider = XImage_LoadFile(L"sliderV.png",TRUE);
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_leave,hImageSlider); //Ȼ����ͼ
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_stay,hImageSlider); //Ȼ����ͼ
		XBkInfoM_AddImage(hBkInfoM,button_state_flag_down,hImageSlider); //Ȼ����ͼ


        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
    int OnListViewSelect(int iGroup,int iItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int OnListViewExpand(int iGroup,BOOL bExpand,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateCreate(listView_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateDestroy(listView_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
    int  OnTemplateAdjustCoordinate(listView_item_i *pItem,BOOL *pbHandled)
    {
        *pbHandled=TRUE;
        return 0;
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowListView  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}
