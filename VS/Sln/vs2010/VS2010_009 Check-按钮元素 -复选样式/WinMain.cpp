#include "Common.h"


class CMyWindowCheck
{
public:
    HWINDOW m_hWindow;
    HELE    m_hCheck1;
    HELE    m_hCheck2;
    HELE    m_hCheck3;
    CMyWindowCheck()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 300, 200, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);
		
        m_hCheck1 = XBtn_Create(20, 40, 100, 20, L"Check1", m_hWindow);
        m_hCheck2 = XBtn_Create(20, 70, 100, 20, L"Check2", m_hWindow);
        m_hCheck3 = XBtn_Create(20, 100, 100, 20, L"Check3", m_hWindow);
        XBtn_SetType(m_hCheck1, XC_BUTTON_TYPE_CHECK);
        XBtn_SetType(m_hCheck2, XC_BUTTON_TYPE_CHECK);
        XBtn_SetType(m_hCheck3, XC_BUTTON_TYPE_CHECK);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowCheck  MyWindow;
    XRunXCGUI();
    XExitXCGUI();
    return TRUE;
}




