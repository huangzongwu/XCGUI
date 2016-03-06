Attribute VB_Name = "WinMain"
'Ver xcgui 1.8.9 +  time 2015.10.22


Option Explicit



Private Function L(data As String) As Long
L = StrPtr(StrConv(data, vbWide))
End Function

Private Sub Main()
    Dim xc As XCGUI
    Set xc = New XCGUI
    xc.XIniXCGUI
    Dim hWindow As Long
    hWindow = xc.XWnd_Create(0, 0, 300, 200, L("ìÅ²ÊVBÀý×Ó"), 0, 15)
    If hWindow <> 0 Then
        xc.XWnd_ShowWindow hWindow, 5
        xc.XRunXCGUI
    End If
    xc.XExitXCGUI
    Set xc = Nothing
End Sub

