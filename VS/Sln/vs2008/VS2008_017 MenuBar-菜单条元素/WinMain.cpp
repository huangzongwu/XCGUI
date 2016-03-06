#include "Common.h"

class CMyWindowMenuBar
{
public:
    HWINDOW m_hWindow;
    HELE    m_MenuBar;
    CMyWindowMenuBar()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 300, 200, L"炫彩界面库窗口", NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
		
        m_MenuBar = XMenuBar_Create(20,40,260,28,m_hWindow);
        XMenuBar_AddButton(m_MenuBar, L"文件");
        XMenuBar_AddButton(m_MenuBar, L"编辑");
        XMenuBar_AddButton(m_MenuBar, L"视图");
        XMenuBar_AddButton(m_MenuBar, L"aaa");
		
        XMenuBar_AddMenuItem(m_MenuBar, 0, 101, L"101");
        XMenuBar_AddMenuItem(m_MenuBar, 0, 102, L"102");
        XMenuBar_AddMenuItem(m_MenuBar, 0, 103, L"103");
		
        XMenuBar_AddMenuItem(m_MenuBar, 1, 201, L"201");
        XMenuBar_AddMenuItem(m_MenuBar, 1, 202, L"202");
        XMenuBar_AddMenuItem(m_MenuBar, 1, 203, L"203");
		
        XMenuBar_AddMenuItem(m_MenuBar, 2, 301, L"301");
		
        XMenuBar_AddMenuItem(m_MenuBar, 0, 1031, L"3-1",103);
        
        XEle_RegEventCPP(m_MenuBar,XE_MENUSELECT,&CMyWindowMenuBar::OnWndMenuSelect);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
    int  OnWndMenuSelect(int nID,BOOL *pbHandled)
    {
        XTRACE("select item %d \n",nID);
        return 0;
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowMenuBar  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return TRUE;
}
