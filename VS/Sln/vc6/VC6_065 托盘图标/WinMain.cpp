#include "Common.h"


#define  WM_SHOWTASK (WM_USER+100)

class CTrayEx
{
public:
	int OnWndDestroy(BOOL *pbHandled)
	{
		DeleteTray();
		return 0;
	}
	int OnShowWindow(WPARAM wParam,LPARAM lParam,BOOL *pbHandled)
	{
		if (wParam == TRUE)
		{
			DeleteTray();
		} 
		else
		{
			CreateTray();
			
		}
		return 0;
	}
	void Create(HWINDOW hWindow)
	{
		m_hWindow = hWindow;
		XWnd_RegEventCPP(m_hWindow,WM_SHOWTASK,&CTrayEx::OnWndTray);
		XWnd_RegEventCPP(m_hWindow,WM_DESTROY,&CTrayEx::OnWndDestroy);
		XWnd_RegEventCPP(m_hWindow, XWM_MENU_SELECT, &CTrayEx::OnWndMenuSelect);
		XWnd_RegEventCPP(m_hWindow,WM_SHOWWINDOW,&CTrayEx::OnShowWindow);
	}
	void CreateTray()
	{
		NOTIFYICONDATAW tnd;
		tnd.cbSize=sizeof(NOTIFYICONDATAW);
		tnd.hWnd=XWnd_GetHWND(m_hWindow);
		tnd.uID=100;
		tnd.uFlags=NIF_MESSAGE|NIF_ICON|NIF_TIP;
		tnd.uCallbackMessage=WM_SHOWTASK; //�û��Զ������Ϣ����������������ϳ���ͼ���϶���ʱͼ�귢�͵���Ϣ
		tnd.hIcon=LoadIcon(NULL,IDI_APPLICATION);
		wcscpy(tnd.szTip,L"���Գ���");//ͼ����ʾΪ"���Գ���"
		Shell_NotifyIcon(NIM_ADD,&tnd);//�����������ͼ��
	}
	void DeleteTray()
	{
		NOTIFYICONDATAW nid; 
		nid.cbSize=(DWORD)sizeof(NOTIFYICONDATAW); 
		nid.hWnd=XWnd_GetHWND(m_hWindow); 
		nid.uID=100; 
		nid.uFlags=NIF_ICON|NIF_MESSAGE|NIF_TIP ; 
		nid.uCallbackMessage=WM_SHOWTASK;//�Զ������Ϣ���� 
		nid.hIcon=LoadIcon(NULL,IDI_APPLICATION); 
		wcscpy(nid.szTip,L"��������");    //��Ϣ��ʾ��Ϊ���ƻ��������ѡ� 
		Shell_NotifyIcon(NIM_DELETE,&nid);    //��������ɾ��ͼ�� 
	}
public:
	int  OnWndMenuSelect(int nID,BOOL *pBool)
    {
		switch (nID)
		{
		case 202:
			XWnd_ShowWindow(m_hWindow,SW_SHOW);
			break;
		case 203:
			XWnd_ShowWindow(m_hWindow,SW_HIDE);
			break;
		case 204:
			XWnd_CloseWindow(m_hWindow);
			break;
		}
        XTRACE("menu-XWM_MENU_SELECT item:%d\n",nID);
        return 0;
    }
	int OnWndTray(WPARAM wParam,LPARAM lParam,BOOL *pbHandled)
	{
		
		if(wParam!=100) 
			return 1; 
		switch(lParam) 
		{    
        case WM_RBUTTONUP://�Ҽ�����ʱ������ݲ˵�������ֻ��һ�����رա� 
			{ 
				SetForegroundWindow(XWnd_GetHWND(m_hWindow));
				
				HMENUX hMenu = XMenu_Create();
				XMenu_AddItem(hMenu, 202, L"��ʾ");
				XMenu_AddItem(hMenu, 203, L"����");
				XMenu_AddItem(hMenu, 204, L"�˳�");
				
				POINT pt;
				GetCursorPos(&pt);
				XMenu_Popup(hMenu, XWnd_GetHWND(m_hWindow), pt.x, pt.y);
				
			} 
			break; 
        case WM_LBUTTONDBLCLK://˫������Ĵ��� 
			{ 
				XWnd_ShowWindow(m_hWindow,SW_SHOW);//�򵥵���ʾ���������¶�
			} 
			break; 
        default:
			{
				return 0;
			}
			break;
		} 
		return 0;
	}
	
	
private:
	HWINDOW m_hWindow;
};

class CTray
{
public:
	int OnWndDestroy(BOOL *pbHandled)
	{
		DeleteTray();
		return 0;
	}
	void Create(HWINDOW hWindow)
	{
		m_hWindow = hWindow;
		XWnd_RegEventCPP(m_hWindow,WM_SHOWTASK,&CTray::OnWndTray);
		XWnd_RegEventCPP(m_hWindow,WM_DESTROY,&CTray::OnWndDestroy);
		XWnd_RegEventCPP(m_hWindow, XWM_MENU_SELECT, &CTray::OnWndMenuSelect);
//		XWnd_RegEventCPP(m_hWindow,WM_SYSCOMMAND,&CTray::);
	}
	void CreateTray()
	{
		NOTIFYICONDATAW tnd;
		tnd.cbSize=sizeof(NOTIFYICONDATAW);
		tnd.hWnd=XWnd_GetHWND(m_hWindow);
		tnd.uID=100;
		tnd.uFlags=NIF_MESSAGE|NIF_ICON|NIF_TIP;
		tnd.uCallbackMessage=WM_SHOWTASK; //�û��Զ������Ϣ����������������ϳ���ͼ���϶���ʱͼ�귢�͵���Ϣ
		tnd.hIcon=LoadIcon(NULL,IDI_APPLICATION);
		wcscpy(tnd.szTip,L"���Գ���");//ͼ����ʾΪ"���Գ���"
		Shell_NotifyIcon(NIM_ADD,&tnd);//�����������ͼ��
	}
	void DeleteTray()
	{
		NOTIFYICONDATAW nid; 
		nid.cbSize=(DWORD)sizeof(NOTIFYICONDATAW); 
		nid.hWnd=XWnd_GetHWND(m_hWindow); 
		nid.uID=100; 
		nid.uFlags=NIF_ICON|NIF_MESSAGE|NIF_TIP ; 
		nid.uCallbackMessage=WM_SHOWTASK;//�Զ������Ϣ���� 
		nid.hIcon=LoadIcon(NULL,IDI_APPLICATION); 
		wcscpy(nid.szTip,L"��������");    //��Ϣ��ʾ��Ϊ���ƻ��������ѡ� 
		Shell_NotifyIcon(NIM_DELETE,&nid);    //��������ɾ��ͼ�� 
	}
public:
	int  OnWndMenuSelect(int nID,BOOL *pBool)
    {
		switch (nID)
		{
		case 202:
			XWnd_ShowWindow(m_hWindow,SW_SHOW);
			break;
		case 203:
			XWnd_ShowWindow(m_hWindow,SW_HIDE);
			break;
		case 204:
			XWnd_CloseWindow(m_hWindow);
			break;
		}
        XTRACE("menu-XWM_MENU_SELECT item:%d\n",nID);
        return 0;
    }
	int OnWndTray(WPARAM wParam,LPARAM lParam,BOOL *pbHandled)
	{

		if(wParam!=100) 
			return 1; 
		switch(lParam) 
		{    
        case WM_RBUTTONUP://�Ҽ�����ʱ������ݲ˵�������ֻ��һ�����رա� 
			{ 
				SetForegroundWindow(XWnd_GetHWND(m_hWindow));

				HMENUX hMenu = XMenu_Create();
				XMenu_AddItem(hMenu, 202, L"��ʾ");
				XMenu_AddItem(hMenu, 203, L"����");
				XMenu_AddItem(hMenu, 204, L"�˳�");

				POINT pt;
				GetCursorPos(&pt);
				XMenu_Popup(hMenu, XWnd_GetHWND(m_hWindow), pt.x, pt.y);
				
			} 
			break; 
        case WM_LBUTTONDBLCLK://˫������Ĵ��� 
			{ 
				XWnd_ShowWindow(m_hWindow,SW_SHOW);//�򵥵���ʾ���������¶�
			} 
			break; 
        default:
			{
				return 0;
			}
			break;
		} 
		return 0;
	}


private:
	HWINDOW m_hWindow;
};

class CMyWnd
{
public:
    HWINDOW m_hWindow; //���ھ��
    HELE    m_hButton; //��ť���
	CTray   m_Tray;
	CTrayEx m_TrayEx;
	
    BOOL Create() //�������ںͰ�ť
    {
        m_hWindow=XWnd_Create(0,0,400,300,L"�Ųʽ����-����"); //��������
        if(m_hWindow)
        {
            m_hButton =XBtn_Create(10,10,80,25,L"����",m_hWindow); //������ť
            XEle_RegEventCPP(m_hButton,XE_BNCLICK,&CMyWnd::OnEventBtnClick); //ע�ᰴť����¼�
			
			//m_Tray.Create(m_hWindow);
			m_TrayEx.Create(m_hWindow);
			
            XWnd_ShowWindow(m_hWindow,SW_SHOW); //��ʾ����
            return TRUE;
        }
        return FALSE;
    }

    int OnEventBtnClick(BOOL *pBool) //��ť����¼���Ӧ
    {
//		m_Tray.CreateTray();
		ShowWindow(XWnd_GetHWND(m_hWindow), SW_HIDE);

        *pBool=TRUE; //�Ը��¼���������
        return 0;    //�¼��ķ���ֵ
    }

private:
};

int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    CMyWnd  MyWnd;
    if(MyWnd.Create())
    {
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}




