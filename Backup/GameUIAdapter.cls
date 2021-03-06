VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "GameUIAdapter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'@Folder("PacManEngine.UI")
'//"Abstract" class
Option Explicit
Implements IGameUIEvents
Implements IGameUICommands


Private mCommandsUI As IGameUICommands

Public Event DirectionalKeyPressed(vbKeyCode As KeyCode)
Public Event GameStarted()


Public Sub Init(viewUI As IGameUICommands)
    Set mCommandsUI = viewUI
    Set viewUI.Events = Me
End Sub

Public Sub Deconstruct()
    Set mCommandsUI.Events = Nothing
End Sub

Private Sub Class_Terminate()
    Set mCommandsUI = Nothing
    Debug.Print TypeName(Me) & " terminating..."
End Sub

'//IGameUICommands Support
Private Sub IGameUICommands_DrawGhost()
    mCommandsUI.DrawGhost
End Sub

Private Sub IGameUICommands_DrawMap(map() As Tile)
    mCommandsUI.DrawMap map
End Sub

Private Sub IGameUICommands_DrawPacman()
    mCommandsUI.DrawPacman
End Sub




Private Property Set IGameUICommands_Events(ByVal RHS As GameUIAdapter)
    '//never let this actually get set
End Property

Private Property Get IGameUICommands_Events() As GameUIAdapter
    Set IGameUICommands_Events = Me
End Property

Private Sub IGameUIEvents_OnDirectionalKeyPress(vbKey As KeyCode)
    RaiseEvent DirectionalKeyPressed(vbKey)
End Sub

'//IGameUIEvents Support
'Private Sub IGameUIEvents_OnDirectionalKeyPress(vbKey As KeyCodes)
'    RaiseEvent DirectionalKeyPressed(vbKey)
'End Sub

Private Sub IGameUIEvents_OnGameStarted()
    RaiseEvent GameStarted
End Sub
