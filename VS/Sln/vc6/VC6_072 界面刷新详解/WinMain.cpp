#include "Common.h"



class CMyWnd
{
public:
    HWINDOW m_hWindow; //���ھ��
    HELE    m_hButton; //��ť���

	HELE    m_hRichEdit;
	HXCGUI  m_hShapeText;

	HXCGUI  m_hShapeText1;
	
    BOOL Create() //�������ںͰ�ť
    {
        m_hWindow=XWnd_Create(0,0,400,300,L"�Ųʽ����-����"); //��������
        if(m_hWindow)
        {
            m_hButton =XBtn_Create(10,10,80,25,L"��ť",m_hWindow); //������ť
            XEle_RegEventCPP(m_hButton,XE_BNCLICK,&CMyWnd::OnEventBtnClick); //ע�ᰴť����¼�
		
			
			m_hRichEdit = XRichEdit_Create(10,50,100,20,m_hWindow);
			m_hShapeText = XShapeText_Create(10,80,100,20,L"����",m_hWindow);
			m_hShapeText1 = XShapeText_Create(10,110,100,20,L"����",m_hWindow);

			//OnEventBtnClick �뿴��������Ǳ������ӵ��ص�

            XWnd_ShowWindow(m_hWindow,SW_SHOW); //��ʾ����
            return TRUE;
        }
        return FALSE;
    }
    int OnEventBtnClick(BOOL *pBool) //��ť����¼���Ӧ
    {
        //�������ص� �Ųʲ��õ� �û�����ˢ�»���
		//�������Խ�ʡЧ�ʣ���Ϊûˢ��һ�Σ��ڲ��ͱ���
		//����һ�λ��õ����ݵ����ڣ���ҿ��Կ������ע��
		//���룬������һ���ı��͵���ˢ��һ�Σ������൱��
		//���ڴ濽�������Σ�Ч�ʼ���ĵ��£��������������
		//ֻˢ��һ�Σ���ô�����������Ч��

		XRichEdit_SetText(m_hRichEdit,L"�Ųʽ����");
		XShapeText_SetText(m_hShapeText,L"xcgui");
		XShapeText_SetText(m_hShapeText1,L"xcgui1");
		XWnd_RedrawWnd(m_hWindow);
       

// 		XRichEdit_SetText(m_hRichEdit,L"�Ųʽ����");
// 		XWnd_RedrawWnd(m_hWindow);
// 		XShapeText_SetText(m_hShapeText,L"xcgui");
// 		XWnd_RedrawWnd(m_hWindow);
// 		XShapeText_SetText(m_hShapeText1,L"xcgui1");
// 		XWnd_RedrawWnd(m_hWindow);


		//����֪ʶ���Ųʲ��õ�˫���壬�ֲ�ˢ�£��û�����ˢ��
		//�ȵȼ��������Ч��

		//���� �ı���һ�� ����Ԫ�� HELE ��ô��ֻ��Ҫ���� 
		//XEle_RedrawEle ��ˢ�������λ������������ʾ
		//ˢ�¾ֲ��ܴ�����߳���Ч��
		//�˽�����Щ֮�󣬴��ֻҪ���� �������ı������޸���
		//�������Բ������̸ı䣬��Ҫ�϶����ڻ��߼����
		//�Ż���Ч ��Щ�����Ҿ�֪������ô����



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




