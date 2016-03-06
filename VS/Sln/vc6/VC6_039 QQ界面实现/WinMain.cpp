#include "Common.h"




class CMyWindowTree
{
public:
    HWINDOW m_hWindow;
    HELE    m_hTree;
    HIMAGE  m_hVip;
    HIMAGE  m_hQZone;
    HIMAGE  m_hAvatar;
    HIMAGE  m_hAvatarLarge;

    template_info_i  *m_pTemplate_group;
    template_info_i  *m_pTemplate_sel;
    CMyWindowTree()
    {
        m_pTemplate_group=NULL;
        Init();
    }
    void Release()
    {
        if(m_pTemplate_group) XC_TemplateDestroy(m_pTemplate_group);
    }
    void Init()
    {
		XC_LoadResource(L"QQTest\\resource.xml",L"QQTest");
		m_hWindow =(HWINDOW) XC_LoadLayout(L"QQTest\\layout.xml");
//         m_hWindow = XWnd_Create(0, 0, 320, 520, L"炫彩界面库窗口",NULL, xc_window_style_default);
//         XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
//         
		m_hTree= (HELE)XC_GetObjectByID(101);

//        m_hTree= XTree_Create(20,40,280,450,m_hWindow);
        XTree_SetItemHeightDefault(m_hTree,28,54);
        XTree_SetItemTemplateXML(m_hTree,L"Tree_Item_friend.xml");
        XTree_SetItemTemplateXMLSel(m_hTree,L"Tree_Item_friend_sel.xml");
        m_pTemplate_group=XC_LoadTemplate(XC_TREE,L"Tree_Item_group.xml");

        m_hVip=XImage_LoadFile(L"vip.png");
        m_hQZone=XImage_LoadFile(L"QZone.png");
        m_hAvatar=XImage_LoadFile(L"avatar.png");
        m_hAvatarLarge=XImage_LoadFile(L"avatar_large.png");

        HXCGUI hAdapter=XAdapterTree_Create();
        XTree_BindAdapter(m_hTree,hAdapter);
        XAdapterTree_AddColumn(hAdapter,(XC_NAME)); //昵称 分组名
        XAdapterTree_AddColumn(hAdapter,(XC_NAME2)); //签名 
        XAdapterTree_AddColumn(hAdapter,(XC_NAME3)); //小头像
        XAdapterTree_AddColumn(hAdapter,(XC_NAME4)); //大头像
        XAdapterTree_AddColumn(hAdapter,(XC_NAME5)); //VIP 图标
        XAdapterTree_AddColumn(hAdapter,(XC_NAME6)); //空间图标

        wchar_t  buf[256]={0};
        int nGroupID=0;
        int nItemID=0;
        for (int iGroup=0;iGroup<5;iGroup++)
        {
            wsprintf(buf,L"对象分组-%d",iGroup);
            nGroupID=XAdapterTree_InsertItemText(hAdapter,buf,XC_ID_ROOT,XC_ID_LAST);
            XTree_SetItemHeight(m_hTree,nGroupID,26,26);
            for (int i=0;i<3;i++)
            {
                wsprintf(buf,L"我的对象-%d",i);
                nItemID=XAdapterTree_InsertItemText(hAdapter,buf,nGroupID,XC_ID_LAST);
                XAdapterTree_SetItemTextEx(hAdapter,nItemID,(XC_NAME2),L"我的个性签名!");
                XAdapterTree_SetItemImageEx(hAdapter,nItemID,(XC_NAME5),m_hVip);
                XAdapterTree_SetItemImageEx(hAdapter,nItemID,(XC_NAME6),m_hQZone);
                XAdapterTree_SetItemImageEx(hAdapter,nItemID,(XC_NAME3),m_hAvatar);
                XAdapterTree_SetItemImageEx(hAdapter,nItemID,(XC_NAME4),m_hAvatarLarge);
            }
        }

        XEle_RegEventCPP(m_hTree,XE_TREE_SELECT,&CMyWindowTree::OnTreeSelect);
        XEle_RegEventCPP(m_hTree,XE_TREE_EXPAND,&CMyWindowTree::OnTreeExpand);

        XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_CREATE,&CMyWindowTree::OnTemplateCreate);
        XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_DESTROY,&CMyWindowTree::OnTemplateDestroy);
        XEle_RegEventCPP(m_hTree,XE_TREE_TEMP_ADJUST_COORDINATE,&CMyWindowTree::OnTemplateAdjustCoordinate);

		XWnd_AdjustLayout(m_hWindow);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
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
        if(XC_ID_ERROR!=XTree_GetFirstChildItem(m_hTree,pItem->nID))
        {
            if(m_pTemplate_group)
                pItem->pInfo=m_pTemplate_group;
        }
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
    MyWindow.Release();
    XExitXCGUI();
    return TRUE;
}

