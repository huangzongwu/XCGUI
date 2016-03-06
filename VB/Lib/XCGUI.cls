VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XCGUI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private dll As cFuncCall




Private Sub Class_Initialize()
    Set dll = New cFuncCall
    dll.LibraryName = App.Path + "\xcgui.dll"
End Sub

Private Sub Class_Terminate()
   Set dll = Nothing
End Sub


Public Sub XIniXCGUI()
    dll.FunctionName = "XInitXCGUI"
    dll.CallFunction 0
End Sub

Public Sub XRunXCGUI()
    dll.FunctionName = "XRunXCGUI"
    dll.CallFunction
End Sub


Public Function XWnd_Create(x As Long, y As Long, cx As Long, cy As Long, title As Long, hWnd As Long, style As Long) As Long
    dll.FunctionName = "XWnd_Create"
    XWnd_Create = dll.CallFunction(x, y, cx, cy, title, hWnd, style)
End Function


Public Function XWnd_ShowWindow(ByVal hWindow As Long, ByVal showtype As Long) As Long
        dll.FunctionName = "XWnd_ShowWindow"
        Call dll.CallFunction(hWindow, showtype)
End Function


Public Sub XExitXCGUI()
    dll.FunctionName = "XExitXCGUI"
    dll.CallFunction
End Sub
