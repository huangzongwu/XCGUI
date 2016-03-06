#include "Common.h"



class CMyWnd
{
public:
    HWINDOW m_hWindow; //���ھ��
    HELE    m_hButton; //��ť���
	
    BOOL Create() //�������ںͰ�ť
    {
        m_hWindow=XWnd_Create(0,0,400,300,L"�Ųʽ����-����"); //��������
        if(m_hWindow)
        {
            m_hButton =XBtn_Create(10,10,80,25,L"��ť",m_hWindow); //������ť
            XEle_RegEventCPP(m_hButton,XE_BNCLICK,&CMyWnd::OnEventBtnClick); //ע�ᰴť����¼�
			

			//�������֣�Ȼ��󶨲��ֵ����ڶ�������
			HXCGUI hLayoutTop = XLayout_Create();
			XWnd_BindLayoutObject(m_hWindow,window_position_top,hLayoutTop);

			//�ڶ������� ���ò��ִ�СΪ��丸��������������ʱû����
			//����������ֻ���� �ڶ�������Ϊ layout_size_type_fixed layout_size_type_weight
			//ʱ������
			XLayout_SetLayoutHeight(hLayoutTop,layout_size_type_fill,1);
			XLayout_SetLayoutWidth(hLayoutTop,layout_size_type_fill,1);


			//��������
			XWnd_AdjustLayout(m_hWindow);

			//�е�ʱ����Ҫ�鿴һ�²����Ƿ���ȷ���������ò��ֵ���ɫ��Ȼ����ʾ
			//��Ϊ������Ҫ�����������滮Ԫ�ص�����λ�ã�һ���ǲ�����ʾ��
			//������������룬���Է��ڴ��ڴ���֮ǰ
			XC_SetLayoutFrameColor(RGB(255,0,0));
			XC_ShowLayoutFrame(TRUE);

            XWnd_ShowWindow(m_hWindow,SW_SHOW); //��ʾ����
            return TRUE;
        }
        return FALSE;
    }
    int OnEventBtnClick(BOOL *pBool) //��ť����¼���Ӧ
    {
        //������Ϣ��
        MessageBoxW(XWnd_GetHWND(m_hWindow),L"�����˰�ť",L"��ʾ",MB_OK);
        *pBool=TRUE; //�Ը��¼���������
        return 0;    //�¼��ķ���ֵ
    }
};

int APIENTRY _tWinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI(); //��ʼ��
    CMyWnd  MyWnd;
    if(MyWnd.Create())
    {
        XRunXCGUI(); //����
    }
    XExitXCGUI(); //�ͷ���Դ
    return 0;
}




