++++++++++        Set cell 0 to 10
[                 Loop until cell 0 is zero
  >+++++          Move to cell 1 and add 5 (half of 10)
  <               Move back to cell 0
  -               Decrement cell 0 by 1
]                 End loop (cell 0 will now be 0 and cell 1 will be 50)

>++++++++++       Move to cell 1 and add 10 (50 + 10 = 60)
<                 Move back to cell 0
[                 Loop (does nothing, but shows a loop)
  -               Decrement cell 0
  >               Move to cell 1
  .               Output the value in cell 1 (60, ASCII '<')
  <               Move back to cell 0
]                 End loop

++++++++++        Add 10 to cell 0 (set it to 10)
[                 Start another loop
  >+++++++        Move to cell 1 and add 7 (now it's 67, ASCII 'C')
  <               Move back to cell 0
  -               Decrement cell 0 by 1
]                 End loop (cell 0 is now 0, and cell 1 is 67)

> .               Output the character in cell 1 (ASCII 'C')
