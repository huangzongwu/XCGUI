#include "Common.h"



class CFrameWindow_Demo
{
public:
    HWINDOW m_hWindow;
    HELE    m_hPane1;
    HELE    m_hPane2;
    HELE    m_hPane3;
	HELE    m_hPane4;
    HELE    m_hPane5;
    HELE    m_hPane6;
	HELE    m_hPane7;
	HELE    m_hPane8;

    CFrameWindow_Demo()
    {
        m_hPane1=NULL;
        m_hPane2=NULL;
        m_hPane3=NULL;
        Init();
    }
    void Init()
    {
        m_hWindow = XFrameWnd_Create(0, 0, 600, 400, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(3,3,20,20,L"X",m_hWindow),button_type_close);
		
		HELE hView = XEle_Create(200,10,100,100,m_hWindow);

		XFrameWnd_SetView(m_hWindow,hView);

        m_hPane1=XPane_Create(L"�������",200,200,m_hWindow); //��������
        m_hPane2=XPane_Create(L"����ͼ",200,200,m_hWindow);
        m_hPane3=XPane_Create(L"���Թ���",200,200,m_hWindow);
		m_hPane4=XPane_Create(L"�Ŷ���Դ",200,200,m_hWindow); //��������
        m_hPane5=XPane_Create(L"��ʼҳ",200,200,m_hWindow);
        m_hPane6=XPane_Create(L"������",200,200,m_hWindow);
		m_hPane7=XPane_Create(L"������",200,200,m_hWindow); //��������
		m_hPane8=XPane_Create(L"���",200,200,m_hWindow); //��������
		
        XFrameWnd_AddPane(m_hWindow,NULL,m_hPane1,align_left); //��Ӵ���
		XFrameWnd_AddPane(m_hWindow,NULL,m_hPane5,align_right);
        XFrameWnd_AddPane(m_hWindow,NULL,m_hPane6,align_right);
		XFrameWnd_AddPane(m_hWindow,NULL,m_hPane8,align_bottom);

        XFrameWnd_MergePane(m_hWindow, m_hPane1, m_hPane2); //�ϲ�����
		XFrameWnd_MergePane(m_hWindow, m_hPane1, m_hPane3); //�ϲ�����
		XFrameWnd_MergePane(m_hWindow, m_hPane1, m_hPane4); //�ϲ�����

		XFrameWnd_MergePane(m_hWindow, m_hPane6, m_hPane7); //�ϲ�����
		
        //XFrameWnd_SetView(m_hWindow,XEle_Create(0,0,100,100,m_hWindow)); //��������ͼ
        XWnd_RegEventCPP(m_hWindow,WM_RBUTTONUP,&CFrameWindow_Demo::OnWndRButtonUp);
        XWnd_RegEventCPP(m_hWindow, XWM_MENU_SELECT, &CFrameWindow_Demo::OnWndMenuSelect);
        
        XWnd_AdjustLayout(m_hWindow);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
    int  OnWndRButtonUp(UINT nFlags,POINT *pPt,BOOL *pbHandled)
    {
        POINT pt=*pPt;
		
        //���������˵�
        HMENUX hMenu=XMenu_Create();
        XMenu_AddItem(hMenu,201,L"����1");
        XMenu_AddItem(hMenu,202,L"����2");
        XMenu_AddItem(hMenu,203,L"����3");
		
        ClientToScreen(XWnd_GetHWND(m_hWindow),&pt);
        XMenu_Popup(hMenu,XWnd_GetHWND(m_hWindow),pt.x,pt.y);
        return 0;
    }
    int OnWndMenuSelect(int nID,BOOL *pbHandled)
    {
        XTRACE("menu id %d \n", nID);
        switch(nID)
        {
        case 201:
            {
                if(NULL==m_hPane1) return 0;
                if(XPane_IsShowPane(m_hPane1))
                    XPane_HidePane(m_hPane1);
                else
                    XPane_ShowPane(m_hPane1);
            }break;
        case 202:
            {
                if(NULL==m_hPane2) return 0;
                if(XPane_IsShowPane(m_hPane2))
                    XPane_HidePane(m_hPane2);
                else
                    XPane_ShowPane(m_hPane2);
            }break;
        case 203:
            {
                if(NULL==m_hPane3) return 0;
                if(XPane_IsShowPane(m_hPane3))
                    XPane_HidePane(m_hPane3);
                else
                    XPane_ShowPane(m_hPane3);
            }break;
        }
        return 0;
    }
};



int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    //XC_ShowLayoutFrame(TRUE);
    CFrameWindow_Demo  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
	
    return 0;
}


