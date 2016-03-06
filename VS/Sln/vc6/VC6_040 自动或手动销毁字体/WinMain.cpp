#include "Common.h"



HWINDOW  hWindow=NULL;

//�Զ���������
VOID AutoDestoryFont(HELE hEle)
{
	HFONTX hFontx = XFont_Create(20);
	HFONTX hFontx1 = XFont_Create(30);
	
	XEle_SetFont(hEle,hFontx);
	XEle_SetFont(hEle,hFontx1);
}
//�ֶ���������
VOID ManualDestoryFont(HELE hEle)
{
	
	HFONTX hFontx = XFont_Create(20);
	XFont_EnableAutoDestroy(hFontx,FALSE); //�����ֶ���������

	HFONTX hFontx1 = XFont_Create(30);
	XEle_SetFont(hEle,hFontx);
	XEle_SetFont(hEle,hFontx1);

	XFont_Destroy(hFontx);
}


int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    hWindow=XWnd_Create(0,0,300,200,L"�Ųʽ����-����");//��������
    if(hWindow)
    {
        HELE hButton=XBtn_Create(10,10,80,25,L"��ť",hWindow);//������ť

		
		ManualDestoryFont(hButton);

        XWnd_ShowWindow(hWindow,SW_SHOW);//��ʾ����		
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}


