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

        int hList = XC.XList_Create(0, 0, 300, 200, hWindow);
        XC.XList_SetItemTemplateXML(hList, "List_Item.xml");
        XC.XList_AddColumn(hList, 100);
        XC.XList_AddColumn(hList, 100);

        int hHead = XC.XAdapterMap_Create();
        XC.XList_BindAdapterHeader(hList, hHead);
        XC.XAdapterMap_AddItemText(hHead, "name", "第一列");
        XC.XAdapterMap_AddItemText(hHead, "name2", "第二列");


        int body = XC.XAdapterTable_Create();
        XC.XList_BindAdapter(hList, body);
        XC.XAdapterTable_AddColumn(body, "name");
        XC.XAdapterTable_AddColumn(body, "name2");

        int nItem = XC.XAdapterTable_AddItemText(body, "1.1");
        XC.XAdapterTable_SetItemText(body, nItem, 1, "1.2");


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
