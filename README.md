# ColourLove (updated for iOS7)

This project only purpose is to provide brief, clean and readable code in a dummy application.
It is heavily library based and MVC oriented and shows mecanisms like downloading, storing and displaying data from a webservice.

You are of course invited to use, fork and improve this project using your own knowledge.

## Philosophy

### Architecture

Here is the file hierarchy as is in the project. We aim to have a clear view of our MVC components.

```
.
|-- Classes
|   |-- AppDelegate.h
|   |-- AppDelegate.m
|   |-- Constants.h
|   |-- Models
|   |-- Controllers
|   |-- Views
|   |-- Helpers
|-- Supporting Files
|-- Resources
    |-- Images
|-- Frameworks
|-- Products
|-- Pods.xcconfig
```

### Conventions

In this project I rely on some naming conventions :

#### Classes

- ViewControllers are suffixed by 'VC'
- Models should be self-explanatory and match the server model (if any)
- Custom views should indicate the superclass type (like `ColorCell` which extends `UITableViewCell`)

#### Methods

- Networking methods should always begin with the keyword `request`, like `requestColors`
- User interaction method should always begin with `select`

### Best practices

#### K&R indentation

All code should respect (K&R style : <http://en.wikipedia.org/wiki/Indent_style#K.26R_style>)

``` objective-c
	- (void) foo
	{
	    if(bar == 1){
	        bar = 2;
	    }
	}
```

#### Fast declarations

Use fast declarations as much as possible gives a more readable, less cluttered code.

``` objective-c
// Arrays
// No
[NSArray array];
[NSArray arrayWithObjects:@"foo", @"bar",nil];
[array objectAtIndex:index];
// Yes
@[];
@[@"foo",@"bar"];
array[index];

// Dictionaries
// No
[NSDictionary dictionary];
[NSDictionary dictionaryWithObjects:@"object", @"key",nil];
[dictionary objectForKey:key];
// Yes
@{};
@{@"key" : @"object"};
dictionary[key];

// Numbers
// No
[NSNumber numberWithInt:1];
// Yes
@1;
```

## How to install

Dependencies are managed with CocoaPods, which I recommend you to have a look at : http://cocoapods.org/

    git clone git@github.com:kirualex/ColourLove.git
    cd ColourLove
    gem install cocoapods
    pod setup
    pod install
    open ColourLove.xcworkspace


## Screenshots

### ColorsVC
![1](http://i.imgur.com/Ebf13GA.png)
### PalettesVC
![2](http://i.imgur.com/9l81UDy.png)
### PatternsVC
![3](http://i.imgur.com/4PhR3oJ.png)


##Support a fellow developer !
If this code helped you for your project, consider contributing or donating some BTC to `1A37Am7UsJZYdpVGWRiye2v9JBthQrYw9N`
Thanks !
