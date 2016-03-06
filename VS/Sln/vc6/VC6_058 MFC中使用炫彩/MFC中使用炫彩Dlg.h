// MFCÖÐÊ¹ÓÃìÅ²ÊDlg.h : header file
//

#if !defined(AFX_MFCDLG_H__7FE33CA7_8B8E_483A_8CDB_56E8736BDDAE__INCLUDED_)
#define AFX_MFCDLG_H__7FE33CA7_8B8E_483A_8CDB_56E8736BDDAE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CMFCDlg dialog

class CMFCDlg : public CDialog
{
// Construction
public:
	CMFCDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CMFCDlg)
	enum { IDD = IDD_MFC_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMFCDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CMFCDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MFCDLG_H__7FE33CA7_8B8E_483A_8CDB_56E8736BDDAE__INCLUDED_)
