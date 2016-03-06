#include "Common.h"



class CWindow_Demo
{
public:
    HWINDOW m_hWindow;
	HELE	m_hEle;
	HELE	m_hEleView;
    CWindow_Demo()
    {
        Init();
    }
void Init()
	{
		//	XC_SetLayoutFrameColor(RGB(255,0,0));
		//	XC_ShowLayoutFrame(TRUE);
		m_hWindow = XWnd_Create(0, 0, 350, 250, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
		XBtn_SetType(XBtn_Create(10, 5, 60, 20,L"close",m_hWindow),button_type_close);
		XWnd_RegEventCPP(m_hWindow,WM_DESTROY,&CWindow_Demo::OnDestroy);

		m_hEle = XEle_Create(20,50,250,150,m_hWindow);
		//XEle_AddBkFill(m_hEle,RGB(0,128,0),255);

		HXCGUI  hLayout = XLayout_Create();
		XEle_BindLayoutObject(m_hEle,hLayout);
		XLayout_SetLayoutWidth(hLayout,layout_size_type_fill,1);
		XLayout_SetLayoutHeight(hLayout,layout_size_type_fill,1);

		m_hEleView = XEle_Create(8,30,150,150,m_hEle);
		XEle_AddBkFill(m_hEleView,RGB(0,0,120),55);
		XEle_EnableMouseThrough(m_hEleView, TRUE);
		XLayout_AddEle(hLayout,m_hEleView);

		HELE hSbar = XSBar_Create(0,0,20,100,m_hEle);
		XLayout_AddEle(hLayout,hSbar);

		XEle_SetLayoutWidth(m_hEleView,layout_size_type_weight,1);
		XEle_SetLayoutHeight(m_hEleView,layout_size_type_fill,1);

		XEle_AdjustLayoutObject(m_hEle);

		XEle_RegEventCPP(m_hEleView,XE_PAINT,&CWindow_Demo::OnDraw);
		XWnd_ShowWindow(m_hWindow,SW_SHOW);
}
int OnDraw(HDRAW hDraw,BOOL *pbHandled)
{
	// 		RECT rt = {100,50,200,100};
// 		XDraw_GradientFill2(hDraw,RGB(255,0,0),255,RGB(0,255,0),255,&rt,GRADIENT_FILL_RECT_H);
// 		//���������Ĵ��룬���޷����Ƴ�������Ľ������ġ���ʱ��Ҫ
// 		*pbHandled = TRUE;
// 		//���������������Ϣ����ô��ı����޷���ʾ��������ȷ�����������������Ĵ���


//		���Ҫ���ԣ�����ע������Ĵ��룬�������ע��ȡ�������������ܿ���Ч����

		RECT rtBkInfoM = {0,0,250,150};
		HBKINFOM hBkInfoM = XEle_GetBkInfoManager(m_hEleView);
		XBkInfoM_Draw(hBkInfoM,element_state_flag_leave,hDraw,&rtBkInfoM);

		RECT rt = {100,50,200,100};
		XDraw_GradientFill2(hDraw,RGB(255,0,0),255,RGB(0,255,0),255,&rt,GRADIENT_FILL_RECT_H);
		*pbHandled = TRUE;

		return 0;
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





