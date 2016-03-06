using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Runtime.InteropServices;
using XCGUI;


class CWindow
{
    unsafe public void Create()
    {
        XC.XInitXCGUI("");
        int hWindow = XC.XC_LoadLayout("..\\..\\Layout.xml",0);

        int hBtn = XC.XC_GetObjectByID(10);


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
