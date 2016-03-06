#include "Common.h"



VOID Example_AddFontFile(HDC hdc)
{
	Graphics              graphics(hdc);
	SolidBrush            solidBrush(Color(255, 0, 0, 0));
	INT                   found = 0;
	INT                   count = 0;
	WCHAR                 familyName[50];
	FontFamily*           pFontFamily;
	PrivateFontCollection privateFontCollection;
	
	// Add three font files to the private collection.
	privateFontCollection.AddFontFile(L"Abduction2000.TTF");
//	privateFontCollection.AddFontFile(L"C:\\WINNT\\Fonts\\Cour.ttf");
//	privateFontCollection.AddFontFile(L"C:\\WINNT\\Fonts\\Times.ttf");
	
	// How many font families are in the private collection?
	count = privateFontCollection.GetFamilyCount();
	
	// Allocate a buffer to hold the array of FontFamily objects returned by
	// the GetFamilies method.
	pFontFamily = (FontFamily*)malloc(count * sizeof(FontFamily));
	
	// Get the array of FontFamily objects.
	privateFontCollection.GetFamilies(count, pFontFamily, &found);
	
	for(INT j = 0; j < found; ++j)
	{
		// Get the font family name.
		pFontFamily[j].GetFamilyName(familyName);
		
		// Pass the family name and the address of the private collection to a
		// Font constructor.
		Font* pFont = new Font(familyName, 120, FontStyleRegular,
			UnitPixel, &privateFontCollection);
		
		// Use the font to draw a string.
		graphics.DrawString(
			L"IBM", 
			3,          // string length 
			pFont, 
			PointF(10.0f, (REAL)j*25), 
			&solidBrush);
		
		delete(pFont);
	}
	
	free(pFontFamily);
}


class CMyWindowElement
{
public:
    HWINDOW m_hWindow;
    CMyWindowElement(){
        Init();
    }

	int OnDraw(HDRAW hDraw,BOOL *pbHandled)
	{
		Example_AddFontFile(XDraw_GetHDC(hDraw));
		*pbHandled = TRUE;
		return 0;
	}
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 400, 200, L"ìÅ²Ê½çÃæ¿â´°¿Ú",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(10, 5, 60, 20,L"close",m_hWindow),button_type_close);
		
        HELE hEle=XEle_Create(0,50,400,100,m_hWindow);
		XEle_EnableBkTransparent(hEle,TRUE);
		XEle_RegEventCPP(hEle,XE_PAINT,&CMyWindowElement::OnDraw);


		
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowElement  MyWindowt;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}




