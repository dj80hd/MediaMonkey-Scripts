' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
' This script allows you to append a string to the title
' name.  For example appending things like
' (Mono Version) or (Original Master)
'
' This file can be replaced  in one of the future versions,
' so please if you want to modify it, make  a copy, do your
' modifications  in that copy and  change Scripts.ini  file 
' appropriately. 
' If you do not do this, you will lose  all your changes in
' this script when you install a new version of MediaMonkey
'
' To install this script add the following line to 
' C:\Program Files\MediaMonkey\Scripts\Scripts.ini
'
' [AppendTitle]
' FileName=AppendTitle.vbs
' ProcName=AppendTitle
' Order=11
' DisplayName=Append Track Title
' Description=Append Track Title
' Language=VBScript
' ScriptType=0
'
' And copy this file into the 
' C:\Program Files\MediaMonkey\Scripts\ directory.
' (on a 64 bit machine it will be  "Program Files (x86)" in the above path.
' 
' Note: the MediaMonkey scripts directory may vary depending
' on where you installed it.
' !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


Sub AppendTitle
  ' Define variables
  Dim list, itm, i, tmp

  ' Get list of selected tracks from MediaMonkey
  Set list = SDB.CurrentSongList 
  If list.Count=0 Then
    Exit Sub
  End If

  Set UI = SDB.UI

  ' Create the window to be shown
  Set Form = UI.NewForm
  Form.Common.SetRect 0, 0, 400, 180
  Form.FormPosition = 4   ' Screen Center
  Form.BorderStyle = 3    ' Dialog
  Form.Caption = SDB.Localize("Append Title")

  Set Lbl = UI.NewLabel( Form)
  Lbl.Common.SetRect 10,15,370,40
  Lbl.AutoSize = False
  Lbl.Multiline = True
  Lbl.Caption = SDB.LocalizedFormat( "This will modify the Title of %d selected tracks. Do you want to proceed?", list.Count, 0, 0)     ' TODO:  Localize

  Set Lbl = UI.NewLabel( Form)
  Lbl.Common.SetRect 10,65,280,20
  Lbl.Caption = SDB.Localize("Append To Title:")

  Set SE = UI.NewEdit( Form)
  SE.Common.SetRect Lbl.Common.Left+Lbl.Common.Width+10, 61, 50, 20
  ' SE.MinValue = 1
  ' SE.MaxValue = 9999
  ' SE.Value = 1

  Set Btn = UI.NewButton( Form)
  Btn.Caption = SDB.Localize("OK")
  Btn.Common.SetRect 115,100,75,25
  Btn.ModalResult = 1
  Btn.Default = true

  Set Btn = UI.NewButton( Form)
  Btn.Caption = SDB.Localize("Cancel")
  Btn.Common.SetRect 220,100,75,25
  Btn.ModalResult = 2
  Btn.Cancel = true
  
  if Form.ShowModal=1 then
    ' Process all selected tracks
    For i=0 To list.count-1
      Set itm = list.Item(i)
      itm.Title = itm.Title + SE.Text
    Next
    list.UpdateAll
  End If
End Sub
