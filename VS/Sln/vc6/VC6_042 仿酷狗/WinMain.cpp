#include "Common.h"



class CMyWnd
{
public:
    HWINDOW m_hWindow; //窗口句柄
    HELE    m_hButton; //按钮句柄
	
    BOOL Create() //创建窗口和按钮
    {
        XC_LoadResource(L".\\kugou\\resource.xml",L".\\kugou");
		m_hWindow =(HWINDOW)XC_LoadLayout(L".\\kugou\\layout.xml");
        if(m_hWindow)
        {
			m_hButton =XBtn_Create(10,10,100,25,L"关闭演示",m_hWindow); //创建按钮
			XBtn_SetType(m_hButton,button_type_close);

			m_hBtnMid    = (HELE) XC_GetObjectByID(1);
			m_hBtnLeft   = (HELE) XC_GetObjectByID(2);
			m_hBtnTop    = (HELE) XC_GetObjectByID(3);
			m_hBtnRight  = (HELE) XC_GetObjectByID(4);
			m_hBtnBottom = (HELE) XC_GetObjectByID(5);

			XEle_RegEventCPP(m_hBtnMid,XE_MOUSESTAY,&CMyWnd::OnMouseStay);
			XEle_RegEventCPP(m_hBtnMid,XE_MOUSELEAVE,&CMyWnd::OnMouseLeave);

			XWnd_RegEventCPP(m_hWindow,WM_TIMER,&CMyWnd::OnShowBtnTimer);

            XWnd_ShowWindow(m_hWindow,SW_SHOW); //显示窗口
            return TRUE;
        }
        return FALSE;
    }
	int OnShowBtnTimer(UINT nIDEvent,BOOL *pbHandled)
	{
		switch (nIDEvent)
		{
		case 10:
			{
				switch (m_showIndex)
				{
				case 0:
					XEle_ShowEle(m_hBtnLeft,TRUE);
					break;
				case 1:
					XEle_ShowEle(m_hBtnTop,TRUE);
					break;
				case 2:
					XEle_ShowEle(m_hBtnRight,TRUE);
					break;
				case 3:
					XEle_ShowEle(m_hBtnBottom,TRUE);
					XWnd_KillTimer(m_hWindow,10);
					break;
				}
				XWnd_RedrawWnd(m_hWindow);
				m_showIndex++;
			}
			break;
		case 11:
			{
				switch (m_hideIndex)
				{
				case 0:
					XEle_ShowEle(m_hBtnLeft,FALSE);
					break;
				case 1:
					XEle_ShowEle(m_hBtnTop,FALSE);
					break;
				case 2:
					XEle_ShowEle(m_hBtnRight,FALSE);
					break;
				case 3:
					XEle_ShowEle(m_hBtnBottom,FALSE);
					XWnd_KillTimer(m_hWindow,11);
					break;
				}
				XWnd_RedrawWnd(m_hWindow);
				m_hideIndex++;
			}
			break;
		}
		return 0;
	}
	int OnMouseStay(BOOL *pbHandled)
	{
		m_showIndex = 0;
		XWnd_SetTimer(m_hWindow,10,150);
		return 0;
	}
	int OnMouseLeave(HELE hEleStay,BOOL *pbHandled)
	{
		XWnd_KillTimer(m_hWindow,10); //确保前面不在执行
		m_hideIndex = 0;
		XWnd_SetTimer(m_hWindow,11,150);
		return 0;
	}
	HELE m_hBtnMid;
	HELE m_hBtnLeft;
	HELE m_hBtnTop;
	HELE m_hBtnRight;
	HELE m_hBtnBottom;

	int m_showIndex;
	int m_hideIndex;
};

int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //初始化
    CMyWnd  MyWnd;
    if(MyWnd.Create())
    {
        XRunXCGUI(); //运行
    }
    XExitXCGUI(); //释放资源
    return 0;
}




