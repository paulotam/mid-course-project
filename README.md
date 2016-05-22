# mid-course-project
GA Mid Course Project 
By Paulo Tam

25/04/2016
Starting to build the UI.

I have create a Calculator Class to handle the math functions.

It works with the basic functions to add subtract divide and multiply whole numbers
It can add to a memoryValue within the Calculate and Subtract from it too, while
doing a recall and a clear. It may not mimic the exact same way for the mem functions.

Bugs :(
There are a few bugs that might have changed the approach i use for next time.

Because I store all the elements numbers as you hit them, then there is issues
when hit 5.0, because its converted and stored as a 5, the .0 isn't recalled
so it would be then 5.2 when you want 5.02, I think maybe next time I would store
as a string, or just modify the display, and to then capture 5.02, then on operation
submit to process.
