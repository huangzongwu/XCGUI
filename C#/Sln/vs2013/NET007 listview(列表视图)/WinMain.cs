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

        int hListView = XC.XListView_Create(0, 0, 400, 200, hWindow);
        XC.XListView_SetItemTemplateXML(hListView, "..\\..\\ListView_Item.xml");

        int hAdapter = XC.XAdapterListView_Create();
        XC.XListView_BindAdapter(hListView, hAdapter);
        XC.XAdapterListView_Group_AddColumn(hAdapter, "name3");

        int nGroup = XC.XAdapterListView_Group_AddItemText(hAdapter, "dasemimi");


        XC.XAdapterListView_Item_AddColumn(hAdapter, "name");
        XC.XAdapterListView_Item_AddColumn(hAdapter, "name2");
        int hImage = XC.XImage_LoadFile("..\\..\\2.png", false);
        int nItem = XC.XAdapterListView_Item_AddItemImage(hAdapter, nGroup, hImage);
        XC.XAdapterListView_Item_SetText(hAdapter, nGroup, nItem, 1, "哇咔咔");

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