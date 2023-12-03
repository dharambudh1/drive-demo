# Drive Demo

## Information
This demo application simplifies the integration of Google Drive into Flutter apps, allowing users to seamlessly access their files and folders without leaving the app.

This demo application provides integration of Google Drive functionality into a Flutter app. This demo application allows users to sign in to their Google accounts, view their Google Drive content within the app, and download and import the selected files.

## Features
- Browsing User Google Drive Files
- Searching User Google Drive Files
- Downloading User Google Drive Files
- Adaptive user interface for Android and iOS

## Important
If you see an error in ```home_screen.dart``` file (lines no. 13 and 72) do the following:\
Open: ```/Users/<Your-Name>/.pub-cache/hosted/pub.dev/googledrivehandler-1.0.5/lib/googledrivehandler.dart```

Replace:
```
export 'src/googledrivehandler_functions.dart';
```

With
```
export 'src/googledrivehandler_functions.dart';
export 'src/googledrivehandler_screen.dart';
```

## Preview
![alt text](https://i.postimg.cc/90cxRxcT/imgonline-com-ua-twotoone-o5-JQFe-Fe-Doftrd-I.png "img")
