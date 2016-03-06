#include "Common.h"

class CMyWindowElement
{
public:
    HWINDOW m_hWindow;

	HELE	m_hBtn1;
	HELE	m_hBtn2;

	HELE    m_hEle;
	HELE	m_hEle1;
	HELE	m_hEle2;

	double m_a;
	double m_t;
	double m_v0;
	double m_tCur;
    CMyWindowElement(){
        Init();
    }
	int OnWndTimer(UINT nIDEvent,BOOL *pbHandled)
	{
		switch (nIDEvent)
		{
		case 100:
			{
				if (m_tCur > m_t)
				{
					XWnd_KillTimer(m_hWindow,100);
					break;
				}

				double tt = (m_tCur*m_tCur);
				double s = m_v0*m_tCur-0.5*m_a*tt;

				SetCurRect(m_hEle,m_hEle1,m_hEle2,s);

				XEle_RedrawEle(m_hEle);
				m_tCur+=0.01;
			}
			break;
		}
		return 0;
	}

	VOID SetCurRect(HELE hEleOrg,HELE hEle1,HELE hEle2,double s)
	{
		RECT rcOrg;
		XEle_GetClientRect(hEleOrg,&rcOrg);
		
		RECT rc1 = rcOrg;
		
		rc1.left -= s;
		rc1.right-= s;	
		
		XEle_SetRect(hEle1,&rc1);
		
		RECT rc2 = rcOrg;
		rc2.left = rcOrg.right;
		rc2.right= rc2.left+rcOrg.right;
		
		rc2.left -= s;
		rc2.right-= s;

		XEle_SetRect(hEle2,&rc2);
	}

	VOID fuwei(HELE hEleOrg,HELE hEle1,HELE hEle2)
	{
		RECT rcOrg;
		XEle_GetClientRect(hEleOrg,&rcOrg);

		RECT rc1 = rcOrg;
		XEle_SetRect(hEle1,&rcOrg);

		RECT rc2 = rcOrg;
		rc2.left = rc1.right;
		rc2.right= rc2.left+rcOrg.right;

		XEle_SetRect(hEle2,&rc2);
	}
	double calc_V0(double s,double t)
	{
		return s*2/t;
	}
	double Calc_a(double v0,double t)
	{
		return v0/t;
	}
	int OnBtnClick(BOOL *pbHandled)
	{

		XWnd_SetTimer(m_hWindow,100,10);
		return 0;
	}
	int OnBtnClick1(BOOL *pbHandled)
	{
		fuwei(m_hEle,m_hEle1,m_hEle2);
		m_tCur = 0;
		XEle_RedrawEle(m_hEle);
		return 0;
	}
    void Init()
    {
		XC_LoadResource(L"Animal\\resource.xml",L"Animal");
		m_hWindow = (HWINDOW)XC_LoadLayout(L"Animal\\layout.xml");
		
		m_hBtn1 = (HELE)XC_GetObjectByID(100);
		m_hBtn2 = (HELE)XC_GetObjectByID(101);

		XEle_RegEventCPP(m_hBtn1,XE_BNCLICK,&CMyWindowElement::OnBtnClick);
		XEle_RegEventCPP(m_hBtn2,XE_BNCLICK,&CMyWindowElement::OnBtnClick1);

		m_hEle  = (HELE)XC_GetObjectByID(200);
		m_hEle1 = (HELE)XC_GetObjectByID(201);
		m_hEle2 = (HELE)XC_GetObjectByID(202);

		XWnd_AdjustLayout(m_hWindow);


		XWnd_RegEventCPP(m_hWindow,WM_TIMER,&CMyWindowElement::OnWndTimer);

		
 		RECT rtOrg;
 		XEle_GetClientRect(m_hEle,&rtOrg);
 //		XEle_SetRect(m_hEle1,&rtOrg);

		fuwei(m_hEle,m_hEle1,m_hEle2);

		m_tCur = 0;
		m_t = 0.5;
		
		m_v0 = calc_V0(rtOrg.right,m_t);
		m_a = Calc_a(m_v0,m_t);

// 		V0 = at;
// 		(at*at)/2a;

//		Vt = V0 + a*t;
//		S  = ( Vt^2 - V0^2 ) /2a
//		100 = (X*X)/2*0.2;
// 		s*2 = *a*t^2;
// ---------------
//      4

//		vt的平方—v0的平方=2ax

        XWnd_ShowWindow(m_hWindow,SW_SHOW);
    }
};

int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPTSTR lpCmdLine, int nCmdShow)
{
    XInitXCGUI();
    CMyWindowElement  MyWindowt;
    XRunXCGUI();
    XExitXCGUI();
    return 0;
}




