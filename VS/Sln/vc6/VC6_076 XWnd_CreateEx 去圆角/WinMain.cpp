#include "Common.h"





class CMyWindowButton
{
public:
    HWINDOW m_hWindow;
    HELE    m_hButton_close;
    HELE    m_hButton;

    CMyWindowButton(){
        Init();
    }
    void Init()
    {
		XC_RegisterWindowClassName(L"��ɫ����");
		m_hWindow = XWnd_CreateEx(WS_EX_CLIENTEDGE,L"��ɫ����",L"����IP",WS_OVERLAPPED|WS_VISIBLE,0, 0, 300, 200);

		
		

        XWnd_ShowWindow(m_hWindow,SW_SHOW);

		XWnd_RegEventCPP(m_hWindow,WM_PAINT,&CMyWindowButton::OnWndDrawWindow);
    }
	int OnWndDrawWindow(HDRAW hDraw,BOOL *pbHandled)
	{
		SetWindowRgn(XWnd_GetHWND(m_hWindow),NULL,FALSE);
		return 0;
	}

};



int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowButton  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}




