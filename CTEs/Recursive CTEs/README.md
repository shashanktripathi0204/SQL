While working with recursive CTEs it is useful to think of them, divided into three componenets:-

1st -> Anchor member
The first item in the series that the rest of the series builds upon => in this case its simply 1,
This anchor member needs to expressed as a select query

2nd -> The recursive Member
This is where the recursion happens

3rd -> Termination condition
Logical Conditon that ensures that execution will stop after certain time