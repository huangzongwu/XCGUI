#include "Common.h"

struct my_image_info
{
    HIMAGE hImage1;
    HIMAGE hImage2;
    HIMAGE hImage3;
    HIMAGE hImage4;
    HIMAGE hImage5;
    HIMAGE hImage6;
};

void CreateButton(int left,int top,my_image_info  *pInfo,HWINDOW hWindow)
{
    HELE hButton=XBtn_Create(left,top,37,42,L"A",hWindow);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage1,100); //��Ӷ���֡
    XBtn_AddAnimationFrame(hButton,pInfo->hImage2,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage3,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage4,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage5,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage6,100);
    XBtn_EnableAnimation(hButton,TRUE); //��������
}
void CreateButtonLoop(int left,int top,my_image_info  *pInfo,HWINDOW hWindow)
{
    HELE hButton=XBtn_Create(left,top,37,42,L"B",hWindow);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage1,100); //��Ӷ���֡
    XBtn_AddAnimationFrame(hButton,pInfo->hImage2,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage3,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage4,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage5,100);
    XBtn_AddAnimationFrame(hButton,pInfo->hImage6,100);
    XBtn_EnableAnimation(hButton,TRUE,TRUE); //��������,ѭ������
}

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
	
    HWINDOW hWindow = XWnd_Create(0, 0, 300, 200, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
    XBtn_SetType(XBtn_Create(10, 5, 60, 20,L"close",hWindow),button_type_close);
	
    my_image_info  info;
    info.hImage1=XImage_LoadFile(L"1.png");
    info.hImage2=XImage_LoadFile(L"2.png");
    info.hImage3=XImage_LoadFile(L"3.png");
    info.hImage4=XImage_LoadFile(L"4.png");
    info.hImage5=XImage_LoadFile(L"5.png");
    info.hImage6=XImage_LoadFile(L"6.png");
	
    int left=20;
    int top=50;
    CreateButton(left,top,&info,hWindow); left+=50;
    CreateButton(left,top,&info,hWindow); left+=50;
    CreateButton(left,top,&info,hWindow); left+=50;
    CreateButton(left,top,&info,hWindow); left+=50;
    CreateButton(left,top,&info,hWindow); left+=50;
	
    left=20; top=100;
    CreateButtonLoop(left,top,&info,hWindow); left+=50;
    CreateButtonLoop(left,top,&info,hWindow); left+=50;
    CreateButtonLoop(left,top,&info,hWindow); left+=50;
    CreateButtonLoop(left,top,&info,hWindow); left+=50;
    CreateButtonLoop(left,top,&info,hWindow); left+=50;
	
    XWnd_ShowWindow(hWindow,SW_SHOW);
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}



