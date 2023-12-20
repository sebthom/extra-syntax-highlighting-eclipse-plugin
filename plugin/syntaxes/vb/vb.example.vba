Sub GreetUser()
    ' Display a greeting message
    MsgBox "Hello, welcome to VBA programming!", vbInformation
End Sub

Sub CalculateSumAndProduct()
    ' Declare variables
    Dim number1 As Integer
    Dim number2 As Integer
    Dim sum As Integer
    Dim product As Integer

    ' Assign values to variables
    number1 = 5
    number2 = 10

    ' Perform arithmetic operations
    sum = number1 + number2
    product = number1 * number2

    ' Display results
    MsgBox "Sum: " & sum & vbCrLf & "Product: " & product, vbInformation
End Sub

Sub ConditionalStatementExample()
    ' Declare variables
    Dim value As Integer

    ' Prompt the user for input
    value = InputBox("Enter a number:")

    ' Perform a conditional check
    If value > 10 Then
        MsgBox "The entered value is greater than 10.", vbInformation
    Else
        MsgBox "The entered value is not greater than 10.", vbInformation
    End If
End Sub
