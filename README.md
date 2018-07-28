## XZImgBrowser
![Dependency Status](https://camo.githubusercontent.com/ca443f86f08ce17c6e2afe65b7dd4224b7027707/687474703a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f762f5344576562496d6167652e7376673f7374796c653d666c6174)
![Reference Status](https://camo.githubusercontent.com/688f74614f907dfe08f0c047a0f42c6b5303152c/687474703a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f6c2f5344576562496d6167652e7376673f7374796c653d666c6174)
<br>一款仿微博的图片浏览器工具<br>特点：实现渐变的放大效果、渐变的位置移动

## Installing

### CocoaPods

XZImgBrowser can be installed using [CocoaPods](https://cocoapods.org/).

If you haven't done so already, you might want to initialize the project, to have it produce a `Podfile` template for you:

```
$ pod init
```

Then, edit the `Podfile`, adding `FMDB`:

```ruby
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MyApp' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for MyApp2

    pod 'XZImgBrowser', '~> 0.0.1'
end
```

Then install the pods:

```
$ pod install
```

Then open the `.xcworkspace` rather than the `.xcodeproj`.

For more information on Cocoapods visit https://cocoapods.org.

<img src="https://camo.githubusercontent.com/ca443f86f08ce17c6e2afe65b7dd4224b7027707/687474703a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f762f5344576562496d6167652e7376673f7374796c653d666c6174" alt="Pod Version" data-canonical-src="http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat" style="max-width:100%;float:left"/>
<img src ="https://camo.githubusercontent.com/688f74614f907dfe08f0c047a0f42c6b5303152c/687474703a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f6c2f5344576562496d6167652e7376673f7374796c653d666c6174" style="max-width:100%;" />



cocoapods : 
##usage
2:调用方法showViewWithArray:(NSArray *)imgArr beginWithIndex:(NSInteger)index即可实现图片浏览<br>
第一个参数传递需要浏览的图片(UIImageView)数组，第二个参数表示默认第几张图片开始浏览。<br><br>
<img src="https://github.com/mrkizy/XZImgBrowser/blob/master/Demo/pic1.png" />
<img src="https://github.com/mrkizy/XZImgBrowser/blob/master/Demo/pic2.png" />
