#include "Common.h"



HWINDOW  hWindow=NULL;
HELE g_hEle = NULL;
HXCGUI g_ShapeText = NULL;



#define XE_USER_SETTEXT WM_USER+999




int CALLBACK OnEventProc(HELE hEventEle, UINT nEvent, WPARAM wParam, LPARAM lParam, BOOL *pbHandled)
{
	switch(nEvent)
	{
	case XE_USER_SETTEXT:
		{
			XShapeText_SetText(g_ShapeText,(wchar_t*)wParam);
			XEle_RedrawEle(hEventEle);
		}
		break;
	}
	return 0;
}

int CALLBACK OnSetText(WPARAM wParam,LPARAM lParam,BOOL *pbHandled)
{
	XEle_SendEvent(g_hEle,g_hEle,XE_USER_SETTEXT,wParam,lParam);
	return 0;
}

DWORD WINAPI ThreadPro(LPVOID lpVoid)
{
	SYSTEMTIME tm;
	for (int i = 0; i < 10; i++)
	{
		wchar_t buffer[MAX_PATH] ={0};
		GetSystemTime(&tm);
		wsprintfW(buffer,L"%d:%d",tm.wMinute,tm.wSecond);
		SendMessageW(XWnd_GetHWND(hWindow),XE_USER_SETTEXT,(WPARAM)buffer,wcslen(buffer));
		Sleep(1000);
	}
	return 0;
}

//��Ϣ·�ɷ�ʽ �߳�->�����Զ�����Ϣ����->Ԫ�ع���
//


//�¼���Ӧ
int CALLBACK My_EventBtnClick(BOOL *pBool)
{
    CloseHandle(CreateThread(NULL,0,ThreadPro,NULL,0,NULL));
    *pBool=TRUE; //�Ը��¼���������
    return 0;    //�¼��ķ���ֵ
}

int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    hWindow=XWnd_Create(0,0,300,200,L"�Ųʽ����-����");//��������
    if(hWindow)
    {
		g_hEle = XEle_Create(8,30,100,50,hWindow);
		//��Ϊ��״����û���¼������Դ���һ�� ele��Ϊ����Ȼ����ܸ�����Ϣ
		g_ShapeText = XShapeText_Create(0,0,100,20,L"��ʼ��",g_hEle);
		XEle_RegEventC1(g_hEle,XE_ELEPROCE,OnEventProc);


        HELE hButton=XBtn_Create(10,5,80,20,L"�����߳�",hWindow);//������ť
        XEle_RegEventC(hButton,XE_BNCLICK,My_EventBtnClick);//ע�ᰴť����¼�
		

		XWnd_RegEventC(hWindow,XE_USER_SETTEXT,OnSetText);
        XWnd_ShowWindow(hWindow,SW_SHOW);//��ʾ����
		
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}


