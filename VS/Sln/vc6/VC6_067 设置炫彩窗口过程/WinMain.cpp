#include "Common.h"



HWINDOW  hWindow=NULL;
LONG_PTR g_oldProc = NULL;
//�¼���Ӧ
int CALLBACK My_EventBtnClick(BOOL *pBool)
{
    //������Ϣ��
    MessageBoxW(XWnd_GetHWND(hWindow),L"�����˰�ť",L"��ʾ",MB_OK);
    *pBool=TRUE; //�Ը��¼���������
    return 0;    //�¼��ķ���ֵ
}

LRESULT CALLBACK WindowProc(  HWND hwnd,      // handle to window
							UINT uMsg,      // message identifier
							WPARAM wParam,  // first message parameter
  LPARAM lParam   // second message parameter
 )
{
	OutputDebugStringW(L"�յ���Ϣ?\r\n");
	return CallWindowProc((WNDPROC)g_oldProc,hwnd,uMsg,wParam,lParam);
}

int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    hWindow=XWnd_Create(0,0,300,200,L"�Ųʽ����-����");//��������
    if(hWindow)
    {
        HELE hButton=XBtn_Create(10,10,80,25,L"��ť",hWindow);//������ť
        XEle_RegEventC(hButton,XE_BNCLICK,My_EventBtnClick);//ע�ᰴť����¼�
		

		g_oldProc = SetWindowLongPtr(XWnd_GetHWND(hWindow),GWLP_WNDPROC,(LONG_PTR)&WindowProc);

        XWnd_ShowWindow(hWindow,SW_SHOW);//��ʾ����
		
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}


