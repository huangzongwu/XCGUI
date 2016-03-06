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

        int hTree = XC.XTree_Create(0,0, 200, 300, hWindow);
        XC.XTree_SetItemTemplateXML(hTree, "..\\..\\Tree_Item.xml");

        int hAdapter = XC.XAdapterTree_Create();
        XC.XTree_BindAdapter(hTree, hAdapter);
        XC.XAdapterTree_AddColumn(hAdapter, "name");

        int nID = XC.XAdapterTree_InsertItemText(hAdapter, "1", xcConst.XC_ID_ROOT, xcConst.XC_ID_LAST);
        XC.XAdapterTree_InsertItemText(hAdapter, "1.1", nID, xcConst.XC_ID_LAST);

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
