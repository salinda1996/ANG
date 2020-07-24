Imports System.Data.SqlClient
Module Conn
    Public con As New SqlConnection
    Dim result As Boolean

    Public Function openDB() As Boolean
        Try
            If con.State = ConnectionState.Closed Then
                con.ConnectionString = "Data Source=SLAB16\SQLEXPRESS;Initial Catalog=press;Integrated Security=True"
                con.Open()
                result = True
            End If

        Catch ex As Exception
            result = False

        End Try
        Return result
    End Function

End Module
