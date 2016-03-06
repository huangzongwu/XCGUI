#include "Common.h"

class CMyWindowListView
{
public:
    HWINDOW m_hWindow;
    HELE    m_hListView;
	HELE	m_hBtn;
	HXCGUI hAdapter;
    CMyWindowListView()
    {
        Init();
    }

	//ɾ����ʽ1 ɾ�����У�Ȼ����������ֶ�
	void DeleteAll()
	{
		XAdapterListView_DeleteAll(hAdapter);
		
        XAdapterListView_Group_AddColumn(hAdapter,(XC_NAME3));
        XAdapterListView_Item_AddColumn(hAdapter,(XC_NAME));
        XAdapterListView_Item_AddColumn(hAdapter,(XC_NAME2));
		
		int  group1=XAdapterListView_Group_AddItemText(hAdapter,L"group1");
		
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
		XEle_RedrawEle(m_hListView);
	}
	//ɾ�����飬������������ֶ�
	void DeleteAllGrounp()
	{
		XAdapterListView_DeleteAllGroup(hAdapter);
		int  group1=XAdapterListView_Group_AddItemText(hAdapter,L"group1");
		
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
		XEle_RedrawEle(m_hListView);
	}
	void DeleteGrounpItemAll()
	{
		XAdapterListView_Group_DeleteAllChildItem(hAdapter,0);

		int group1 = 0;
		HIMAGE hImage=XImage_LoadFile(L"111.jpg");
		
        int index=0;
        wchar_t  temp[MAX_PATH]={0};
		int i = 0;
        for (i=0;i<20;i++)
        {
            wsprintf(temp,L"group1-new-item-%d",i);
            index=XAdapterListView_Item_AddItemImage(hAdapter,group1,hImage);
            XAdapterListView_Item_SetText(hAdapter,group1,index,1,temp);
        }

		XEle_RedrawEle(m_hListView);
	}
	int OnBtnClick(BOOL *pbHandled)
	{
		DeleteAll();//XAdapterListView_DeleteAll ɾ�����У�Ȼ����������ֶ�	
	// DeleteAllGrounp(); //XAdapterListView_DeleteAllGroup��������������ֶ�
	//	DeleteGrounpItemAll(); //ɾ�������������������
		return 0;
	}
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 500, 400, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
		
		m_hBtn = XBtn_Create(120,0,50,20,L"ceshi",m_hWindow);
		XEle_RegEventCPP(m_hBtn,XE_BNCLICK,&::CMyWindowListView::OnBtnClick);

        m_hListView= XListView_Create(20,40,400,300,m_hWindow);
        XListView_SetItemTemplateXML(m_hListView,L"ListView_Item.xml");
		
        hAdapter=XAdapterListView_Create();
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
