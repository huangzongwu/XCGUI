#include "Common.h"



HWINDOW  hWindow=NULL;


wchar_t g_szInput[MAX_PATH] = {0};



class CFontX
{
public:
	CFontX(int nSize): m_hFontx(0)
	{
		m_hFontx = XFont_Create(nSize);
	}
	~CFontX()
	{
		XFont_Destroy(m_hFontx);
	}
	HFONT GetHFont()
	{
		return XFont_GetHFONT(m_hFontx);
	}
private:
	HFONTX m_hFontx;
};
class CMemPad
{
public:
	CMemPad(HDRAW hDraw)
	{
		m_hMem = XDraw_GetHDC(hDraw);
	}
	~CMemPad()
	{
	}
	BOOL GetTextSize(CFontX* pFont,const wchar_t* lpText,int nLen,SIZE* pSize)
	{
		HGDIOBJ hObj = SelectObject(m_hMem,pFont->GetHFont());
		BOOL bOK = GetTextExtentPoint32W(m_hMem,lpText,nLen,pSize);
		SelectObject(m_hMem,hObj);
		return bOK;
	}
	VOID TextOut(CFontX* pFont,int x,int y,wchar_t* pText,int nlen)
	{
//		SetTextColor(m_hMem,RGB(255,0,0));
		HGDIOBJ hObj = SelectObject(m_hMem,pFont->GetHFont());
		::TextOutW(m_hMem,x,y,pText,nlen);
		SelectObject(m_hMem,hObj);
	}
	VOID DrawRect(int x,int y,int cx,int cy)
	{
		Rectangle(m_hMem,x,y,cx,cy);
	}
private:
	HDC m_hMem;
};


int CALLBACK OnPaintEnd(HELE hEventEle,HDRAW hDraw,BOOL *pbHandled)
{

	CMemPad memPad(hDraw);
	CFontX mFont(20);
	SIZE mSize;
	memPad.GetTextSize(&mFont,g_szInput,wcslen(g_szInput),&mSize);
	memPad.DrawRect(10,10,mSize.cx+10,mSize.cy+10);
	memPad.TextOut(&mFont,10,10,g_szInput,wcslen(g_szInput));
	
	*pbHandled = TRUE;
	return 0;
}

int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //初始化
    hWindow=XWnd_Create(0,0,300,200,L"炫彩界面库-窗口");//创建窗口
    if(hWindow)
    {
		XBtn_SetType(XBtn_Create(200, 5, 60, 20,L"close",hWindow),button_type_close);

// 		HELE hEle = XEle_Create(0,0,200,200,hWindow);
// 
// 
// 		XEle_EnableEvent_XE_PAINT_END(hEle,TRUE);
// 		XEle_RegEventC1(hEle,XE_PAINT_END,OnPaintEnd);

		XEle_Create(0,0,50,50,hWindow);

		XEle_Create(50,0,50,50,hWindow);

//		XEle_SetFont(hEle,XFont_Create(20));

		wcscat(g_szInput,L"炫彩界面库");

        XWnd_ShowWindow(hWindow,SW_SHOW);//显示窗口
        XRunXCGUI(); //运行
    }
    XExitXCGUI(); //释放资源
    return 0;
}


