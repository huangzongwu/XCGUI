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
        int hWindow = XC.XWnd_Create(0, 0, 500, 300, "xcgui", 0, 15);

        int hElePanel = XC.XC_LoadLayout("..\\..\\Pane.xml");
        XC.XWnd_AddEle(hWindow, hElePanel);

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
