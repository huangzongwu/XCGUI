using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Runtime.InteropServices;
using XCGUI;


unsafe public delegate int OnBtnClick(bool* pbHandled);
class CWindow
{
    [DllImport("xcgui.dll", EntryPoint = "XEle_RegEventC", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    unsafe public static extern void XEle_RegEventC(int hEle, int nEvent, OnBtnClick pFun);

    [DllImport("user32.dll")]
    public static extern int MessageBoxA(int hWnd, string pText, string pTitle, int nType);
    unsafe private int __OnBtnClick(bool* pbHandled)
    {
        MessageBoxA(0, "炫彩，我是大色", "你好", 0);
        return 0;
    }
    unsafe public void Create()
    {
        XC.XInitXCGUI("");

        int hWindow = XC.XWnd_Create(0, 0, 500, 300, "xcgui", 0, 15);
        int hBtn = XC.XBtn_Create(0, 0, 100, 100, "按钮", hWindow);

        OnBtnClick pBtnClick = new OnBtnClick(__OnBtnClick);

        //  Marshal.AllocCoTaskMem(Marshal.SizeOf(pBtnClick))
        XEle_RegEventC(hBtn, xcConst.XE_BNCLICK, pBtnClick);


        XC.XWnd_ShowWindow(hWindow, 5);

        XC.XRunXCGUI();
        XC.XExitXCGUI();
    }
}

namespace Project1
{
    class RunMain
    {
        static void Main()
        {
            CWindow pWindow = new CWindow();
            pWindow.Create();
        }

    }
}