#include "Common.h"


#include <iostream>
#include <fstream>

HWINDOW  hWindow=NULL;


int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    hWindow=XWnd_Create(0,0,300,200,L"�Ųʽ����-����");//��������
    if(hWindow)
    {

		HELE hEle = XEle_Create(0,0,100,100,hWindow);

 		std::ifstream ifsm("1.jpg",std::ios::binary|std::ios::in);
		ifsm.seekg(0,std::ios::end);
		int fileSize =ifsm.tellg();
//		char buffer[1574] = {0};
		char* buffer = new char[fileSize];
 
 		ifsm.seekg(0,std::ios::beg);
 		ifsm.read(buffer,fileSize);
 		ifsm.close();

		HIMAGE hImage = XImage_LoadMemory((void*)buffer,fileSize,TRUE);

		HBKINFOM hBkInfoM = XEle_GetBkInfoManager(hEle);
		XBkInfoM_AddImage(hBkInfoM,element_state_flag_leave,hImage);

		//�ϰ汾ʹ�õķ�������Ҫ������
//		XEle_AddBkImage(hEle,hImage);


        XWnd_ShowWindow(hWindow,SW_SHOW);//��ʾ����
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}


