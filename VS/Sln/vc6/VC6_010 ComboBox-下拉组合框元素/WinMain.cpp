#include "Common.h"

class CWindow_Demo
{
public:
    HWINDOW m_hWindow;
    CWindow_Demo()
    {
        Init();
    }
    void Init()
    {
        m_hWindow = XWnd_Create(0, 0, 300, 200, L"�Ųʽ���ⴰ��",NULL, xc_window_style_default);
        XBtn_SetType(XBtn_Create(5, 3, 60, 20, L"Close", m_hWindow),button_type_close);

        HELE hComboBox=XComboBox_Create(20,40,120,20,m_hWindow);
        XComboBox_SetItemTemplateXML(hComboBox,L"ComboBox_ListBox_Item.xml");
        XRichEdit_SetText(hComboBox,L"123");

        HXCGUI hAdapter=XAdapterTable_Create();
        XComboBox_BindApapter(hComboBox,hAdapter);
        XAdapterTable_AddColumn(hAdapter,(XC_NAME));

        wchar_t  buf[256]={0};
        for (int i=0;i<20;i++)
        {
            wsprintf(buf,L"name-%d-0",i);
            XAdapterTable_AddItemText(hAdapter,buf);
        }
		XWnd_AdjustLayout(m_hWindow);
        XWnd_ShowWindow(m_hWindow,SW_SHOW);
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
