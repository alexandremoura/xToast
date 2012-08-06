xToast
======

The eXtendable Toast Message for iOS development

How to use

First copy the two files (xToast.h and xToast.m) to your XCode Project.
Then, import the xToast.h to header file that you need the Toast Message.
Done, the xToast is ready for use.

The simple usage is [[xToast makeText:@"Your message here!"] show]

You can configure the Gradient, Border and Text colors.
Initiate the xToast by this way [xToast myToast = [xToast makeText:@"Your Message Here!"]]
Don't use the show method now.
The Methods setTextColor, setBorderColor, setBgUpColor and setBgDwColor can be use to configure the toast.
For example, to changes the Text Color use [myToast setTextColor:[UIColor blackColor]];
Now, use the show method do show the toast.
You can use the method showAndHideAfter:seconds to define a time that toast stay showed before the hide fade effect


