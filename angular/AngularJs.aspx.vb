Imports System.Data.SqlClient
Public Class AngularJs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If openDB() Then

            Dim dt As Date = Today
            Dim admin As String = "Test"
            Dim id As Integer = 80006
            Dim item_id As Integer = 80006
            Dim status As String = "in"
            Dim Date1 As String = "24/7/2020"
            Dim cmd As New SqlCommand
            cmd = New SqlCommand("INSERT INTO Quantity VALUES('" & id & "','" & item_id & "','" & 400 & "','" & status & "','" & Date1 & "','" & admin & "')", con)
            Try
                If (A3_photocopy_papers.Text = "") Then
                    MsgBox("Enter Items")
                Else
                    cmd.ExecuteNonQuery()
                    MsgBox("query run")
                    MsgBox("Succespully Stored", MsgBoxStyle.Information, "Success")
                    A3_photocopy_papers.Text = ""
                    A4_photocopy_papers.Text = ""

                End If

            Catch ex As Exception
                'MsgBox(ex)
            Finally
                con.Close()
            End Try

        End If
    End Sub
End Class