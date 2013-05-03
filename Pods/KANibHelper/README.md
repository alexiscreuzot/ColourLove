# KANibHelper

Tired of autolayout and those damn constraints which lack simplicity and flexibility ? Well then this library is made for you. I believe having separate Nib files for 3.5 and 4 inches screens are the way to go if you want to ease up the layout management process and improve your app maintanability.

## How to install

Simply copy :
 * KAViewController.h
 * KAViewController.m

into your project folder and import KAViewController.h

or use cocoapod with this line :
    pod 'KANibHelper', :git => 'https://github.com/kirualex/KANibHelper.git'

## How to use

Just subclass `KAViewController` instead of the usual `UIViewController` in your header file, and you are ready to go !

You can then create a separate Nib file targeting 4 inches screen just by adding the suffix '~iphone4' to your original Nib file (don't forget to specify the class of the file owner and to link the views outlets).
Don't worry if you don't have a specific '~iphone4' Nib for every screens of your app, KAViewController will just fallback on the default Nib for your controller.
You can also add the suffix '~iphone3_5' to your original nib for consistenc, it will work.

Check out the demo if you want to see the details, and don't hesitate to fork me !

### File hierarchy example

![Files](http://i.imgur.com/siMS57M.png)

### Result

![Result](http://i.imgur.com/imUMj0e.jpg)

