#include "Common.h"

class CWindow_Demo
{
public:
    HWINDOW m_hWindow;
    CWindow_Demo()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 282, 250, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(10, 5, 60, 20,L"close",m_hWindow),button_type_close);
		
        HIMAGE hImage=XImage_LoadFile(L"image\\bk.png");

		HBKINFOM hBkInfoM = XWnd_GetBkInfoManager(m_hWindow);
		XBkInfoM_AddImage(hBkInfoM,window_state_whole_leave,hImage);
        
        XWnd_EnableDrawBk(m_hWindow,FALSE);
		
		XWnd_SetTransparentType(m_hWindow,window_transparent_shaped);
        
        XWnd_EnableDragWindow(m_hWindow,TRUE);
		
        XWnd_RegEventCPP(m_hWindow,WM_DESTROY,&CWindow_Demo::OnDestroy);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
		
    }
    int OnDestroy(BOOL* pbHandled)
    {
        return 0;
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CWindow_Demo  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return TRUE;
}
