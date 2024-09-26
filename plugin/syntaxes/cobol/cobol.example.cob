000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. ExampleCOBOLProgram.
000300* This is the identification division where we name the program.

000400 ENVIRONMENT DIVISION.
000500 INPUT-OUTPUT SECTION.
000600 FILE-CONTROL.
000700     SELECT EmployeeFile ASSIGN TO 'employee.txt'
000800         ORGANIZATION IS LINE SEQUENTIAL.
000900* The environment division describes the file handling.
001000* The SELECT statement defines the file we are going to read,
001100* and LINE SEQUENTIAL specifies it's a text file.

001200 DATA DIVISION.
001300 FILE SECTION.
001400 FD  EmployeeFile.
001500 01  EmployeeRecord.
001600     05 EmployeeID          PIC 9(5).
001700     05 EmployeeName        PIC A(20).
001800     05 EmployeeSalary      PIC 9(6)V99.
001900* In the file section, we define the structure of the input file
002000* records.
002100* EmployeeID is a 5-digit number.
002200* EmployeeName is an alphanumeric string of 20 characters.
002300* EmployeeSalary is a numeric value with 6 digits before and 2
002400* digits after the decimal point.

002500 WORKING-STORAGE SECTION.
002600 01  WS-Totals.
002700     05 WS-EmployeeCount    PIC 9(5) VALUE 0.
002800     05 WS-TotalSalary      PIC 9(8)V99 VALUE 0.
002900* The working-storage section contains variables for counting
003000* employees and accumulating the total salary.
003100* WS-EmployeeCount starts at 0, and WS-TotalSalary starts at 0.00.

003200 01  WS-EndOfFile           PIC X VALUE 'N'.
003300* A flag to indicate the end of the file, initially set to 'N'
003400* (No).

003500 01  WS-DisplayData.
003600     05 WS-DisplayID        PIC 9(5).
003700     05 WS-DisplayName      PIC A(20).
003800     05 WS-DisplaySalary    PIC 9(6)V99.
003900* These variables will hold the employee details temporarily for
004000* display purposes.

004100 PROCEDURE DIVISION.
004200 Main-Processing.
004300     OPEN INPUT EmployeeFile
004400* Open the input file for reading.

004500     PERFORM UNTIL WS-EndOfFile = 'Y'
004600         READ EmployeeFile
004700             AT END
004800                 MOVE 'Y' TO WS-EndOfFile
004900* If the end of the file is reached, set WS-EndOfFile to 'Y'.
005000             NOT AT END
005100                 PERFORM Process-Record
005200* If we have not reached the end, process the current record.
005300         END-READ
005400     END-PERFORM
005500* Keep reading and processing records until the end of the file.

005600     CLOSE EmployeeFile
005700* Close the file after processing all records.

005800     PERFORM Display-Results
005900* Display the final results after all records have been
006000* processed.

006100     STOP RUN.
006200* End the program.

006300 Process-Record.
006400     ADD 1 TO WS-EmployeeCount
006500* Increment the employee count by 1.

006600     ADD EmployeeSalary TO WS-TotalSalary
006700* Add the current employee's salary to the total salary.

006800     MOVE EmployeeID TO WS-DisplayID
006900     MOVE EmployeeName TO WS-DisplayName
007000     MOVE EmployeeSalary TO WS-DisplaySalary
007100* Move the current employee's details to display variables.

007200     DISPLAY 'Processing: ' WS-DisplayID ' ' WS-DisplayName ' '
007300     WS-DisplaySalary.
007400* Display the employee's details.

007500 Display-Results.
007600     DISPLAY 'Total Employees Processed: ' WS-EmployeeCount
007700     DISPLAY 'Total Salary: ' WS-TotalSalary.
007800* Display the final results: the total number of employees and
007900* the total salary.
