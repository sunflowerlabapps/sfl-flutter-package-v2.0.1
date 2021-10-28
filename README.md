# sfl_flutter_package
A Private Flutter Package with Custom Widgets and Feature. Widgets that we can directly used in our Flutter Projects as per project's requirements.

## Available Custom Components
|Name|Developer|Link|Pre Null Safety Tag Ref|Null Safety Tag Ref|Remark|Project Usage|
| :---: | :---: | :---: | :--: | :--: | :--: | :--:|
|SFLButton|Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-button)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Not Any|
|SFLLoader|Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-loader)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|RecWar Chaser, Mobile Ink Tattoos|
|SFLTextFormField|Smit|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-textformfield)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Not Any|
|SFLDialog|Smit|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-dialog)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Not Any|
|SFLToast|Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-toast)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|SoAct|
|SFLImagePicker |Ridham|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-image-picker)|-|-|**`Widget Removed due to package discontinuty`** Futue update in plan.|Not Any|
|SFLImageGallery |Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-image-gallery)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Resolved, SoAct, Mobile Ink Tattos|
|SFLVideoGallery |Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-video-gallery)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Resolved, SoAct|
|SFLEnhancedDialog |Ridham-Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-improved-dialogbox)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Not Any|
|SFLOtpInput |Ridham-Purvik|[Click Here](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package#sfl-otp-input)|[SFL_Flutter_Package_v1.2.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v1.2.0)|[SFL_Flutter_Package_v2.0.0](https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/tags/SFL_Flutter_Package_v2.0.0)|Ready to use with/without `NullSafety`|Not Any|


## SFL Button
`SFLButton` widget is a single widget to be used in place of all other available `Buttons` like `ElevatedButton`, `TextButton`, `OutlinedButton`. Even we can also use this widget in place of `ElevatedButton.icon`, `TextButton.icon` and `OutlinedButton.icon`. 

##### Parameter Info
* `type` : parameter for what kind of `Button` we want to be there on display. It accept one of the values from `text`, `elevated`, `outlined`, `textIcon`, `elevatedIcon`, `outlinedIcon`.
* `child` : value is required to display a child widget for `type` value equals to `text`, `outlined` or `elevated`.
* `onPress` : defined callback for button press. If not passed button will be disabled
* `onLongPress` : defined callback for button long press. It's an optional parameter.
* `style` : defined styling for displayed button using `ButtonStyle` class. More information can be found from [Here](https://api.flutter.dev/flutter/material/ButtonStyle-class.html).
* `focusNode` : defined a FocusNode to be used to get Focus.
* `icon` : required and used to display icon when `type` is having one of values from `textIcon`, `outlinedIcon` or `elevatedIcon`.
* `label` : required and used to display label next to icon when `type` is having one of values from `textIcon`, `outlinedIcon` or `elevatedIcon`.
* `autoFocus` : defined to enable AutoFocus or not. Default to false.
* `clipBehavior` : defaults to `Clip.none`, and must not be null.

##### Other Notes
For `text`, `elevated`, `outlined` values for `type` a child widget is must required to be passed to display inside button. Usually this will be a label to display using `Text` widget.

For `textIcon`, `elevatedIcon`, `outlinedIcon` values for `icon` & `label` is must required to be passed to display icon on left and label on right on button. Usually `icon` will be any `Icon` or `Image` resource and `label` will be `Text` widget.

 
##### SFL Button Examples 
**_For Button without Icon_**
Simple Button views without `Icon` but only with label or any kind of flutter widget.

* **`SFLButtonType.elevated`**
```dart
SFLButton(
    type: SFLButtonType.elevated,
    child: Text('SFL Elevated Button'),
    clipBehavior: Clip.none,
    onPress: () {
        log('Button Clicked');
    },
),
```
<img align="center" src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_button/sfl_elevated_button.png" width="200" height="60" title="Sfl Elevated Button">


* **`SFLButtonType.outlined`**
```dart
SFLButton(
    type: SFLButtonType.outlined,
    child: Text('SFL Outlined Button'),
    clipBehavior: Clip.none,
    onPress: () {
        log('Button Clicked');
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_button/sfl_outlined_button.png" width="200" height="60" title="Sfl Elevated Button">


* **`SFLButtonType.text`**
```dart
SFLButton(
    type: SFLButtonType.text,
    child: Text('SFL Text Button'),
    clipBehavior: Clip.none,
    onPress: () {
        log('Button Clicked');
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_button/sfl_text_button.png" width="200" height="60" title="Sfl Elevated Button">


**_For Button with Icon_**
Simple Button views with `Icon` & `Label` to its right.

* **`SFLButtonType.elevatedIcon`**
```dart
SFLButton(
    type: SFLButtonType.elevatedIcon,
    icon: Icon(Icons.home_filled),
    label: Text('SFL Elevated Icon Button'),
    clipBehavior: Clip.none,
    onPress: () {
        log('Button Clicked');
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_button/sfl_elevated_icon_button.png" width="200" height="60" title="Sfl Elevated Button">


* **`SFLButtonType.outlinedIcon`**
```dart
SFLButton(
    type: SFLButtonType.outlinedIcon,
    icon: Icon(Icons.home_filled),
    label: Text('SFL Outlined Icon Button'),
    clipBehavior: Clip.none,
    onPress: () {
        log('Button Clicked');
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_button/sfl_outlined_icon_button.png" width="200" height="60" title="Sfl Elevated Button">


* **`SFLButtonType.textIcon`**
```dart
SFLButton(
    type: SFLButtonType.textIcon,
    icon: Icon(Icons.home_filled),
    label: Text('SFL Text Icon Button'),
    clipBehavior: Clip.none,
    onPress: () {
        log('Button Clicked');
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_button/sfl_text_icon_button.png" width="200" height="60" title="Sfl Elevated Button">


## SFL Loader
`SFLLoader` widget is a single widget to be used in place of all other available `Loaders` like `CupertinoActivityIndicator`, `CircularProgressIndicator`, `LinearProgressIndicator`. 

##### Parameter Info
* `loaderType` : parameter for what kind of `Loader` we want to be there on display. It accept one of the values from `circular`, `circularNative` and `linear`.
* `value` : parameter will define the progress value of `CircularProgressIndicator` / `LinearProgressIndicator` / `CupertinoActivityIndicator` which has been completed.
* `strokeWidth` : width of Circular/ liner bar of `CircularProgressIndicator` / `LinearProgressIndicator`. If not passed default value is taken as 3
* `backgroundColor` : defined Color for android based `CircularProgressIndicator`. For `LinearProgressIndicator` it will show this color for non-valued part . If not passed `Theme.of(context).backgroundColor` will be taken.
* `valueColor` : defined Color for android based `CircularProgressIndicator`. For `LinearProgressIndicator` it will show this color for valued part . If not passed `Theme.of(context).accentColor` will be taken.
* `radius` : defines the radius of `CircularProgressIndicator` & `CupertinoActivityIndicator`. If not passed default value `15` will be taken.
* `brightness` : defines theme for Cupertino Activity Indicator. Default will be taken from `Theme.of(context).brightness`. For `Brightness.light` dark indicator will be displayed & for `Brightness.dark` light indicator will be displayed.

##### Other Notes
To get valued progress indicator `value` should be passed and if `value` is not passed then `CircularProgressIndicator` / `LinearProgressIndicator` / `CupertinoActivityIndicator` will take `value` as null and Indefenetive version of related widget will be shown.

 
##### SFL Loaders Examples
**`SFLLoaderTypes.circularNative`**
This will give platform specific Circular loader in return.
* **_Circular Native (Infinite loader)_**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.circularNative,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/circular_native_infinite.png" width="200" height="60" title="Circular Native Infinite">


* **_Circular Native (Finite loader)_**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.circularNative,
    value: 0.5,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/circular_native_finite.png" width="200" height="60" title="Circular Native Finite">


**`SFLLoaderTypes.circular`**
This will give Circular loader in return.
* **_Circular (Infinite loader)_**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.circular,
),
```
* **_Circular (Finite loader)_**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.circular,
    value: 0.5,
),
```

* **_Customized colors for Circular Loader_**
To change value color and background color for circular Loader we can pass specific `Color` values for `valueColor` & `backgroundColor` parameters. This will effect for both **finite & infinite Circular loader for `circularNative` & `circular` loader type.**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.circularNative or SFLLoaderTypes.circular,
    valueColor: Colors.orange,
    backgroundColor: Colors.green,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/circular_infinite_colored.png" width="200" height="60" title="Circular Infinite Colored">


<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/circular_finite_colored.png" width="200" height="60" title="Circular Finite Colored">


**`SFLLoaderTypes.linear`**
This will give Linear loader in return.
* **Linear (Infinite loader)_**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.linear,
),
```

* **Linear (Finite loader)_**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.linear,
    value: 0.5,
),
```

<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/linear_finite.png" width="200" height="60" title="Linear Finite">

 
* **_Customized colors for Linear Loader_**
To change value color and background color for linear Loader we can pass specific `Color` values for `valueColor` & `backgroundColor` parameters. This will effect for both **finite & infinite linear loader type.**
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.linear,
    valueColor: Colors.orange,
    backgroundColor: Colors.green,
),
```

<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/linear_infinite_colored.png" width="200" height="60" title="Linear Infinite Colored">


* **_Customized brightness for Circular Native Loader for Platform `iOS` _**
To change brightness for circular loader we can pass specific `Brightness` values to `brightness` parameter. This will effect for both **finite & infinite circular loader type for `circularNative` loader type only.**
`Brightness.dark` will return **_light_** & `Brightness.light` will return **_dark_** `iOS` progress indicator respectively.
```dart
SFLLoader(
    loaderType: SFLLoaderTypes.circularNative,
    brightness: Brightness.dark or Brightness.light,
),
```


<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_loader/circular_ios_brightness.png" width="200" height="60" title="Circular iOS Brightness">





## SFL TextFormField
`SFLTextField` widget is a single widget that return specific TextFormField based on passed `decorationType` value like `filled`, `outlined`, `filledOutlined`. If not passed, `TextFormField` will be return by default.

##### Parameter Info
* `decorationType` : parameter for what kind of `TextFormField` we want to be there on display. It accept one of the values from `filled`, `outlined`, `filledOutlined`.
* `textInputType` : parameter for what kind of Keyboard based on `TextFieldType` value we want to display. It accept one of the values from `text`, `visiblePassword`, `phone`, `emailAddress`, `number` and `multiline`.
* `validatorFunction` : function for Users who want to create their own validations.
* `filledBackgroundColor` : color parameter enabled when the `decorationType` is `filled` or `filledOutlined`.
* `labelColor` : color parameter for label text.
* `hintColor` : color parameter for hint text.
* `inputTextColor` : color parameter for input text.
* `borderColor` : color parameter enabled for border.
* `label` : When the input field is empty and unfocused, the `label` is displayed on top of the input field.
* `hint` : Displayed on top of the `InputDecorator.child` (i.e., at the same location on the screen where text may be entered in the `InputDecorator.child`)
* `focusBorderColor` : color parameter enabled when border is focused.
* `controller` : Controls the text being edited.
* `focusNode` : defined a FocusNode to be used to get Focus.
* `nextNode` : defined a FocusNode to be used to get the next Focus.
* `onSaved` : This is optional block of code can be used to run code when the user saves the form.
* `onChanged` : Called when the user initiates a change to the `TextFormField's` value.
* `textCapitalization` : Configures how the platform keyboard will select an uppercase or lowercase keyboard.
* `editable` : Configures that whether the `TextFormField` is Editable or readonly.
* `validLength` : length that should be accepted by the TextFormField.
* `suffixIcon` : place the icon at the end of the TextFormField.
* `prefixIcon` : place the icon at the starting of the TextFormField.
* `autoCorrect` : defined for Auto Correcting the words.
* `cursorColor` : Cursor Properties for changing the color.
* `cursorRadius` : Cursor Properties for changing the radius.
* `cursorWidth` : Cursor Properties for changing the width.

##### SFL TextField Examples 
**_For TextField without Icon_**
Simple TextField views without `Icon` but only with label or any kind of flutter widget.

* **`SFLTextFieldDecorationType.filled`**
```dart
SFLTextField(
  decorationType: SFLTextFieldDecorationType.filled,
  textInputType: TextInputType.text,
  controller: _textController,
  filledBackgroundColor: Colors.grey[300],
  label: "Simple Text",
  hint: "Enter Text",
  focusNode: _text,
  nextNode: _email,
  onSaved: (term) {
    print("$term");
  },
)
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_textfield/sfl_textfield_filled.png" width="200" height="60" title="TextField Type Filled">

* **`SFLTextFieldDecorationType.outlined`**
```dart
SFLTextField(
    decorationType: SFLTextFieldDecorationType.outlined,
    textInputType: TextInputType.emailAddress,
    filledBackgroundColor: Colors.red,
    controller: _emailController,
    borderColor: Colors.black,
    label: "Email",
    hint: "Enter Email",
    validatorFunction: (term) {
      print("$term");
    },
    suffixIcon: IconButton(
      icon: Icon(Icons.mail),
      onPressed: () {},
    ),
    focusNode: _email,
    nextNode: _password,
    onSaved: (term) {
      print("$term");
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_textfield/sfl_textfield_outlined.png" width="200" height="60" title="TextField Type Outlined">

* **`SFLTextFieldDecorationType.filledOutlined`**
```dart
SFLTextField(
    decorationType: SFLTextFieldDecorationType.filledOutlined,
    filledBackgroundColor: Colors.teal[400],
    prefixIcon: IconButton(
       icon: Icon(Icons.phone),
    ),
    textInputType: TextInputType.phone,
    controller: _phoneNumberController,
    label: "Phone Number",
    labelColor: Colors.black,
    borderColor: Colors.blueGrey[700],
    hint: "Enter Phone Number",
    focusNode: _phoneNumber,
    nextNode: _multiLine,
    onSaved: (term) {
      print("$term");
    },
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_textfield/sfl_textfield_filled_outlined.png" width="200" height="60" title="TextField Type FilledOutlined">




## SFL Dialog
`SFLDialog` class is having a staticky method to return a single Dialog widget based on value passed for parameter `type` of `SFLDialogType` like `PlatformSpecific` or `Default`. If not passed, `SFLDialogType.Default` will return a Default dialog.

##### Parameter Info
* `type` : parameter for what kind of `AlertDialog` we want to be there on display. It accept one of the values from `PlatformSpecific`, `Default`.
* `title` : parameter for the title text of the Dialog.
* `titleTextStyle` : parameter for styling the text of the title.
* `message` : parameter for the message text of the Dialog.
* `messageTextStyle` : parameter for styling the text of the message.
* `positiveButtonText` : parameter for the positive button text.
* `positiveButtonTextStyle` : parameter for styling the positive button text.
* `positiveButtonCallBack` : Function Callback for when button is pressed.
* `negativeButtonText` : parameter for the negative button text.
* `negativeButtonTextStyle` : parameter for styling the negative button text.
* `negativeButtonCallBack` : Function Callback for when button is pressed.
* `neutralButtonText` : parameter for the neutral button text.
* `neutralButtonTextStyle` : parameter for styling the neutral button text.
* `neutralButtonCallBack` : Function Callback for when button is pressed.
* `shape` : parameter for defining the shape of the Dialog.


##### SFL Dialog Examples 
**_For Different Types of SFL Dialog_**

* **`SFLDialogType.PlatformSpecific`**
```dart
SFLDialog.display(
    type: dialogType,
    context: context,
    message: "SFL Platform Specific Dialog",
    title: "Title",
    positiveButtonText: "Ok",
    negativeButtonText: "Cancel",
    negativeButtonCallBack: () {
        Navigator.pop(context);
    },
    positiveButtonCallBack: () {
        Navigator.pop(context);
    },
);
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_dialog/ios_platform.png" width="250" height="150" title="Dialog Android PlatformSpecific">

<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_dialog/android_platform.png" width="250" height="150" title="TDialog iOS PlatformSpecific">


* **`SFLDialogType.Default`**
```dart
SFLDialog.display(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    context: context,
    message: "SFL Default Dialog",
    title: "Title",
    positiveButtonText: "Yes",
    negativeButtonText: "No",
    negativeButtonCallBack: () {
        Navigator.pop(context);
    },
    positiveButtonCallBack: () {
        Navigator.pop(context);
    },
);
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_dialog/default.png" width="250" height="150" title="Dialog Custom Default">

## SFL Toast
`SFLToast` is a class that contain a method `display` to add toast message overlay on the screen by passing `context` and a Widget `child` or a String `message` based on specified direction for specified duration. If both `child` & `message` are passed, `child` parameter will get advantage here. 

##### Parameter Info
* `context` : `BuildContext` of screen on which we need to display toast component or a message. 
* `child` : A Flutter Widget that needs to be displayed as toast on the screen. 
* `message` : A `String` value to be displayed as message.
* `direction` : One of the value from `ToastDirection.top` & `ToastDirection.bottom`. Value `top` will display toast from Top & `bottom` will display from Bottom of the screen respectively.
* `messageStyle` : `TextStyle` value to be used to format passed `message` text value.
* `messageContainerColor` : `Color` value to be used to format password `message` toast background color.
* `duration` : `Duration` value to be used to define total duration for toast `child` or `message` to be displayed. 

##### SFL Toast Examples 
**_Passing String `message` value to display as Toast_**
* **`ToastDirection.top`**
```dart
SFLToast.display(
    context: context,
    duration: Duration(milliseconds: 3000),
    direction: ToastDirection.top,
    messageContainerColor: Colors.deepOrange,
    message: "Toast this Message from Screen Top",
    messageStyle: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
    ),
);
```

* **`ToastDirection.bottom`**
```dart
SFLToast.display(
    context: context,
    duration: Duration(milliseconds: 3000),
    direction: ToastDirection.bottom,
    messageContainerColor: Colors.deepOrange,
    message: "Toast this Message from Screen Bottom",
    messageStyle: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
    ),
);
```

**_Passing Widget `child` value to display as Toast_**

* **`ToastDirection.top`**
```dart
SFLToast.display(
    context: context,
    duration: Duration(milliseconds: _duration * 1000),
    direction: ToastDirection.top,
    child: Card(
        elevation: 3.0,
        borderOnForeground: true,
        color: Colors.black87,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 14.0,
            ),
            child: Text(
                "Toast this message using SFL Toast",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                ),
            ),
        ),
    ),
);
```

* **`ToastDirection.bottom`**
```dart
SFLToast.display(
    context: context,
    duration: Duration(milliseconds: _duration * 1000),
    direction: ToastDirection.bottom,
    child: Card(
        elevation: 3.0,
        borderOnForeground: true,
        color: Colors.black87,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 14.0,
            ),
            child: Text(
                "Toast this message using SFL Toast",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                ),
            ),
        ),
    ),
);
```

<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_toast/sfl_toast_example.gif" width="256" height="512" title="SFL Toast Example">


## SFL Image Picker (`Removed`)
`SFLImagePicker` is image picker that can help you pick `Single Image` or `Multiple Image`. 

##### Parameter Info
* `type` : parameter for what kind of `Image Picker` we want to be there on display. It accept one of the values from `single`, `multiple`.
* `width` : parameter will define `width` of displayed image for both`single`, `multiple`.
* `height` : parameter will define `height`of displayed image for both`single`, `multiple`.
* `crossAxisCount` : parameter will define number of `Rows` that will be displayed with`multiple` image picker.
* `maxImages` :  parameter will define number of `Images` that will be displayed with`multiple` image picker.
* `imageIndex` :  parameter will define index of `Image` that you want to display from multiple images selected with `imageIndex`.
* `activeBarTitle` : defined Color of title bar for image selection screen for `single`and `multiple` image picker.
* `child` : defines the `child` of `single`and `multiple` image picker when no image/images have been sleeted.
* `onImagePick` : defines the call back function. used if you want to use image for any other use then just for display.
* `selectionTitle` : is option to select a title when selection dialog box pops.
* `cameraLabelSubstitute` : is an option to give a different name to button which allows user to pick image from camera.
* `galleryLabelSubstitute` : is an option to give a different name to button which allows user to pick image from gallery.

**_OnImagePick Example**
```dart
 void callBackFormImagePicker(File file, List<Image> images) {
    setState(() {
      _file = file;
      _assetList = images;
    });
  }
```
##### Other Notes
If no `child` is given as parameter the by default Camera icon will be displayed. 
 
##### SFL Image Picker Examples
* **_Single Image Picker Without child_**
A camera icon will be displayed and on tap will take user to select the image.

```dart
 Container(
    height: 100,
    width: 100,
    child: SFLImagePicker(
        type: SFLImagePickerTypes.single,
        onImagePick: callBackFormImagePicker,
    ),
),
```

<img align="center" src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_image_picker/single_Image_picker_without_child.PNG" width="120" height="60" title="Sfl single image picker without child">

* **_Single Image Picker With child_**
A given child will be displayed and on tap will take user to select the image.

```dart
Container(
    height: 100,
    width: 100,
    child: SFLImagePicker(
        type: SFLImagePickerTypes.single,
            child: RaisedButton(
                onPressed: () {},
                child: Text("Select"),
            ),
        onImagePick: callBackFormImagePicker,
    ),
),
```

<img align="center" src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_image_picker/single_Image_picker_with_child.PNG" width="120" height="60" title="Sfl single image picker with child">

* **_Multi Image Picker Without child_**
A camera icon will be displayed and on tap will take user to select the image.

```dart
Container(
    height: 100,
    width: 100,
    child: SFLImagePicker(
        type: SFLImagePickerTypes.multiple,
        onImagePick: callBackFormImagePicker,
    ),
),
```

<img align="center" src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_image_picker/multi_Image_picker_without_child.PNG" width="120" height="60" title="Sfl multiple image picker without child">

* **_Multi Image Picker With child_**
A given child will be displayed and on tap will take user to select the image.

```dart
Container(
    height: 100,
    width: 100,
    child: SFLImagePicker(
        type: SFLImagePickerTypes.single,
            child: RaisedButton(
                onPressed: () {},
                child: Text("Select"),
            ),
        onImagePick: callBackFormImagePicker,
    ),
),
```

<img align="center" src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_image_picker/multi_Image_picker_with_child.PNG" width="120" height="60" title="Sfl multiple image picker with child">


## SFL Image Gallery
`SFLImageGallery` widget helps to display series of network or local `Images` as a Gallery of items with controls on the screen. `Pinch` and `Zoom` feature is also included for an image.
##### Parameter Info
* `images` : List of `URLs` or local images location in case of parameter `isLocal` is `false` & `true` respectively.
* `isLocal`: specify weather we're displaying images from network or local.
* `initialIndex` : Pass initial index of Image to be displayed.
* `prevLabel`: Text label to be displayed in place of `Prev` label. If not specified `Prev` will be displayed by default.
* `nextLabel`: Text label to be displayed in place of `Next` label. If not specified `Next` will be displayed by default.
* `displayLabel` : boolean value specifying weather label should be displayed or not. By default it's true.
* `backWidget` : Flutter widget to be displayed in place of back icon. If not specified platform specific `arrow_back` and `arrow_back_ios` will  be displayed for `Android` and `iOS` respectively.
* `nextWidget`: Alternate widget for move to next image.
* `prevWidget`: Alternate widget for move to previous image.
* `defaultArrowSize` : Specify arrow size displayed besides `Next` and `Prev` label. Default size is [40.0].
* `controllerBackgroundColor` : `Color` value to be used as background color of controls displayed on the screen.

##### SFLImageGallery Examples
* Default Parameter behavior
```dart
SFLImageGallery(
    images: [
        "https://homepages.cae.wisc.edu/~ece533/images/airplane.png",
        "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png",
        "https://homepages.cae.wisc.edu/~ece533/images/fruits.png",
        "https://homepages.cae.wisc.edu/~ece533/images/frymire.png",
    ],
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_image_gallery/sfl_image_gallery_ios.gif" width=“256” height=“512” title=“SFL Image Gallery Example iOS”>
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_image_gallery/sfl_image_gallery_android.gif" width=“256” height=“512” title=“SFL Image Gallery Example Android”>

**_Go through detailed parameter info for more customizations._**

## SFL Video Gallery
`SFLVideoGallery` widget helps to display series of network or local `Videos` as a Gallery of items with controls on the screen. `Play`, `Pause` and `Duration` display feature is also included for a video.
##### Parameter Info
* `videos` : List of `URLs` or local video locations in case of parameter `isLocal` is `false` & `true` respectively.
* `isLocal`: specify weather we're displaying videos from network or local.
* `initialIndex` : Pass initial index of Video to be displayed.
* `backWidget` : Flutter widget to be displayed in place of back icon. If not specified platform specific `arrow_back` and `arrow_back_ios` will  be displayed for `Android` and `iOS` respectively.
* `nextWidget`: Alternate widget for move to next video.
* `prevWidget`: Alternate widget for move to previous video.
* `defaultArrowSize` : Specify arrow size displayed besides `Next` and `Prev` label. Default size is [40.0].
* `controllerBackgroundColor` : `Color` value to be used as background color of controls displayed on the screen.

##### SFLVideoGallery Examples
* Default Parameter behavior
```dart
SFLVideoGallery(
    defaultArrowSize: 35,
    videos: [
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    ],
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_video_gallery/sfl_video_gallery_android.gif" width=“256” height=“512” title=“SFL Video Gallery Example Android”>

**_Go through detailed parameter info for more customizations._**




## SFL Improved DialogBox
`SFLImprovedDialogbox` widget is a single fully customizable widget that will help design your dialogbox. It has 3 basics type of `Dialogbox` like `Alert`, `Confirmation` and `Dialogbox`. Each have its own default use but you can customize them according to your need.  

##### Parameter Info
* `type` : this is must have parameter to decide what kind of `DialogBox` we want to be there on display. It accept one of the values from `alert`, `conformation` and `dialog box`.
* `context` : this is also must have parameter that will provide necessary `BuildContext`.
* `title` : defines the title of the `Dialogbox`.
* `descriptions` : defines what message you want to show to user.
* `positiveText` : this will help you decide what text you want show on you `Conformation` Dialogbox button and text of positive action button on `Dialogbox`type Dialogbox. If no Text is provided default text is 'Done'.
* `positiveTextColor` : this will help you decide what text color you want show on you `Conformation` Dialogbox button and text color of positive action button on `Dialogbox`type Dialogbox. If no color is provided default color is green.
* `onPositiveButtonPress` : this will help you decide what button on `Conformation` Dialogbox and positive action button on `Dialogbox` type Dialogbox will do. If no function is provided, by default buttons will pop the Dialogbox.
* `negativeText` : this will help you decide what text you want show on you `Alert` Dialogbox button and text of negative action button on `Dialogbox`type Dialogbox. If no Text is provided default text is 'Cancel'.
* `negativeTextColor` : this will help you decide what text color you want show on you `Alert` Dialogbox button and text color of negative action button on `Dialogbox`type Dialogbox. If no color is provided default color is red.
* `onNegativeButtonPress` : this will help you decide what button on `Alert` Dialogbox and negative action button on `Dialogbox` type Dialogbox will do. If no function is provided, by default buttons will pop the Dialogbox.  
* `circularAvatarColorConformation` : this will help you decide what circular avatar color you want show on you `Conformation` Dialogbox. If no color is provided default color is green.
* `circularAvatarColorAlert` : this will help you decide what circular avatar color you want show on you `Alert` Dialogbox. If no color is provided default color is red.
* `circularAvatarColorDialog` : this will help you decide what circular avatar color you want show on you `Dialog` Dialogbox. If no color is provided default color is Shade of Yellow.
* `iconConfirmation` : this will help you decide what icon you want to show in circular avatar of `Conformation` Dialogbox. If no icon is provided default icon is tick sign.
* `iconAlert` : this will help you decide what icon you want to show in circular avatar of `Alert` Dialogbox. If no icon is provided default icon is close sign.
* `iconsDialog` : this will help you decide what icon you want to show in circular avatar of `Dialog` Dialogbox. If no icon is provided default icon is Exclamation mark sign.

##### SFL Improved Dialogbox Examples
**`SFLImprovedDialogBoxType.alert`**
This will Proved an Alert box with one button.
* **_SFL Improved Dialogbox (Alert)with no customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "AlertBox",
    type: SFLImprovedDialogBoxType.alert,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/default_alert.PNG" width="200" height="60" title="Default Alert">


* **_SFL Improved Dialogbox (Alert)with Color customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "AlertBox",
    type: SFLImprovedDialogBoxType.alert,
    onNegativeButtonPress: _showSnackBarNegative,
    circularAvatarColorAlert: Colors.black,
    iconAlert: Icon(Icons.dangerous),
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/black_alert.PNG" width="200" height="60" title="Color Customized Alert">

* **_SFL Improved Dialogbox (Alert)with Description customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "AlertBox",
    type: SFLImprovedDialogBoxType.alert,
    onNegativeButtonPress: _showSnackBarNegative,
    descriptions: "There was an error",
    negativeText: "Okay",
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/custome_description_alert.PNG" width="200" height="60" title="Description Customized Alert">


* **_SFL Improved Dialogbox (confirmation)with no customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "confirmation",
    type: SFLImprovedDialogBoxType.confirmation,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/default_confirmation.PNG" width="200" height="60" title="Default Confirmation">


* **_SFL Improved Dialogbox (confirmation)with Color customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "Confirmation",
    type: SFLImprovedDialogBoxType.confirmation,
    onPositiveButtonPress: _showSnackBarPositive,
    circularAvatarColorConformation: Colors.blue,
    iconConfirmation: Icon(Icons.cloud_done_outlined),
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/blue_confirm.PNG" width="200" height="60" title="Color Customized Confirmation">

* **_SFL Improved Dialogbox (confirmation)with Description customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "Confirmation",
    type: SFLImprovedDialogBoxType.alert,
    onNegativeButtonPress: _showSnackBarPositive,
    descriptions: "Operation is done",
    negativeText: "Confirm",
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/custom_description_confirmation.PNG" width="200" height="60" title="Custom Description Confirmation">


* **_SFL Improved Dialogbox (Dialog)with no customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "Dialog Box",
    type: SFLImprovedDialogBoxType.dialog,
    onNegativeButtonPress: _showSnackBarNegative,
    onPositiveButtonPress: _showSnackBarPositive,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/cyan_dialog.PNG" width="200" height="60" title="Default Dialogbox">


* **_SFL Improved Dialogbox (Dialog)with Color customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "Confirmation",
    type: SFLImprovedDialogBoxType.confirmation,
    onPositiveButtonPress: _showSnackBarPositive,
    circularAvatarColorConformation: Colors.blue,
    iconConfirmation: Icon(Icons.cloud_done_outlined),
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/blue_confirm.PNG" width="200" height="60" title="Customer Color Dialog">

* **_SFL Improved Dialogbox (Dialog)with Description customization_**
```dart
SFLImprovedDialog.display(
    context: context,
    title: "Proceed?",
    type: SFLImprovedDialogBoxType.dialog,
    descriptions: "Do you Want to Proceed?",
    onNegativeButtonPress: _showSnackBarNegative,
    onPositiveButtonPress: _showSnackBarPositive,
),
```
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_improved_dialogbox/custome_description_dialog.PNG" width="200" height="60" title="Custom Description Dialog">

## SFL Otp Input
`SFLOtpInput` is set of textfields that will help you make user experience for OTP better. 

##### Parameter Info
* `onSubmitOtp` : `@required` callback calleed when last input digit is entered to get added OTP no.
* `numberOfInputs` : decides how many digits are there in your OTP. Valid values are more than 2 7 if not passed default value if 3.
* `isobscureText` :decides Numbers you enter are hidden or not.
* `obscuringCharacter` : decides which character will be displayed as place holder while input is hidden. If not provided `*` is taken by default. 
* `otpTextFieldHeight` :  will decide height of the input textfield. if not given 50 will be default value.
* `otpTextFieldWidth` : will decide width of the input textfield. if not given 50 will be default value.
* `otpInputType` : decides type of decoration needs to be given to input boxes. Default value is take as `SFLOtpInputTypes.underlined`
* `displayCursor` : decided cursor needs to be displayed or not. 
* `normalBorderColor` : input border color when input is not in focus.
* `focusedBorderColor` : input border color when input is in focus.
* `autoFocus` : decides first input gets auto focus or not. 
 
##### SFL OTP Input Examples
* **SFL OTP Input with `SFLOtpInputTypes.underlined` value to `otpInputType`**
```dart
SFLOtpInput(
    numberOfInputs: 4,
    onSubmitOtp: onReceivedOtp,
    isObscureText: true,
    displayCursor: true,
    otpInputType: SFLOtpInputTypes.underlined,
),
```
* **SFL OTP Input with `SFLOtpInputTypes.square` value to `otpInputType`**
```dart
SFLOtpInput(
    numberOfInputs: 4,
    onSubmitOtp: onReceivedOtp,
    isObscureText: true,
    displayCursor: true,
    otpInputType: SFLOtpInputTypes.square,
),
```
* **SFL OTP Input with `SFLOtpInputTypes.circular` value to `otpInputType`**
```dart
SFLOtpInput(
    numberOfInputs: 4,
    onSubmitOtp: onReceivedOtp,
    isObscureText: true,
    displayCursor: true,
    otpInputType: SFLOtpInputTypes.circular,
),
```
* **Receiving callback method**
```dart
void onReceivedOtp(String otp) {
    log('Entered OTP: $otp');
  }
```

<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_otp_input/sflotp_underline.gif" width="256" height="512" title="SFL OTP Input Underlined">
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_otp_input/sflotp_square.gif" width="256" height="512" title="SFL OTP Input Square">
<img src="https://gitlab.com/sunflowerlab/Repositories/repository/flutter/sfl-flutter-package/-/raw/develop/example/ui_samples/sfl_otp_input/sflotp_circular.gif" width="256" height="512" title="SFL OTP Input Circular">

**_Go through detailed parameter info for more customizations._**
