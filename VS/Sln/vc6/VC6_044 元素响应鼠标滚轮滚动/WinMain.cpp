#include "Common.h"



HWINDOW  hWindow=NULL;
//�¼���Ӧ

int CALLBACK OnMouseWheel(UINT nFlags,POINT *pPt,BOOL *pbHandled)
{
	MessageBoxW(NULL,L"���յ������ֹ�����Ϣ!",L"��ʾ",MB_OK);
	return 0;
}
int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    hWindow=XWnd_Create(0,0,300,200,L"�Ųʽ����-����");//��������
    if(hWindow)
    {
		XBtn_SetType(XBtn_Create(10,10,80,25,L"�ر�",hWindow),button_type_close);

		HELE hChild = XEle_Create(0,0,100,100,hWindow);
		XEle_EnableEvent_XE_MOUSEWHEEL(hChild,TRUE);
		XEle_RegEventC(hChild,XE_MOUSEWHEEL,OnMouseWheel);

        XWnd_ShowWindow(hWindow,SW_SHOW);//��ʾ����
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}


