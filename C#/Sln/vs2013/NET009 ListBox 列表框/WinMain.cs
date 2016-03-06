using System;
using System.Collections.Generic;
//using System.Linq;
using System.Text;
//using System.Threading.Tasks;
using System.Runtime.InteropServices;
using XCGUI;

unsafe delegate int  OnListBoxTemplateCreateEnd(ref listBox_item_i pItem,bool *pbHandled);

unsafe delegate int OnBtnClick(int hEventEle,bool *pbHandled);

class CWindow
{
    int hListBox = 0;

    [DllImport("xcgui.dll", EntryPoint = "XEle_RegEventC", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    unsafe public static extern void XEle_RegEventCcreateEnd(int hEle, int nEvent, OnListBoxTemplateCreateEnd pFun);


    [DllImport("xcgui.dll", EntryPoint = "XEle_RegEventC1", CharSet = CharSet.Unicode, CallingConvention = CallingConvention.StdCall)]
    unsafe public static extern void XEle_RegEventC1BtnClick(int hEle, int nEvent, OnBtnClick pFun);

    unsafe private int __OnBtnClick(int hEventEle,bool* pbHandled)
    {
        //获取当前点击的按钮所在列表项索引
        int nId = XC.XEle_GetTemplateListItemID(hEventEle);

        return 0;
    }
    unsafe private int __OnListBoxTemplateCreateEnd(ref listBox_item_i pItem,bool *pbHandled)
    {
        int hBtn = XC.XListBox_GetTemplateObject(hListBox,pItem.index,2);

        if (XC.XC_IsHXCGUI(hBtn, xcConst.XC_BUTTON))
        {
            OnBtnClick pBtnClick = new OnBtnClick(__OnBtnClick);
            XEle_RegEventC1BtnClick(hBtn, xcConst.XE_BNCLICK, pBtnClick);
        }


        return 0;
    }

    unsafe public void Create()
    {
        XC.XInitXCGUI("");
        int hWindow = XC.XWnd_Create(0, 0, 500, 400, "xcgui", 0, 15);

        hListBox = XC.XListBox_Create(0, 0, 300, 300, hWindow);
        XC.XListBox_SetItemTemplateXML(hListBox, "..\\..\\ListBox_Item.xml");

        int hAdapter = XC.XAdapterTable_Create();
        XC.XListBox_BindAdapter(hListBox, hAdapter);
        XC.XAdapterTable_AddColumn(hAdapter, "name");
        XC.XAdapterTable_AddColumn(hAdapter, "name1");


        int nItem = XC.XAdapterTable_AddItemText(hAdapter, "dasemimi");
        XC.XAdapterTable_SetItemText(hAdapter, nItem, 1, "xiaosemimi");

        nItem = XC.XAdapterTable_AddItemText(hAdapter, "dasemimi1");
        XC.XAdapterTable_SetItemText(hAdapter, nItem, 1, "xiaosemimi1");

        OnListBoxTemplateCreateEnd pTmplateCreatEnd = new OnListBoxTemplateCreateEnd(__OnListBoxTemplateCreateEnd);
        XEle_RegEventCcreateEnd(hListBox, xcConst.XE_LISTBOX_TEMP_CREATE_END, pTmplateCreatEnd);


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
