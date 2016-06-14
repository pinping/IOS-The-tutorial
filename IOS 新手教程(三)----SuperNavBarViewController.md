#IOS 新手教程(三)----SuperNavBarViewController

接着上一篇教程

```swift
// TODO: Block声明
typealias funcBlock = ()->()
typealias funcBlockJson = (JSON)->()
typealias funcBlockInts = (Int,Int)->()
typealias funcBlockInt = (Int)->()
typealias funcBlockId = (AnyObject)->()
typealias funcBlockStr = (String)->()
typealias funcBlockStrRet = (String)->String
```
> SuperNavBarViewController

> 1.Navigation Bar Title 的颜色大小文字类容

> 2.Navigation Button

> 3.Navigation Button sender



## 1.主要是定义加载的方法
### 例子:
```swift
let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0
let IPHONE4 = (UIScreen.instancesRespondToSelector(Selector("currentMode")) ? CGSizeEqualToSize(CGSizeMake(640, 960),(UIScreen.mainScreen().currentMode?.size)!) : false)
let SCREENWIDTH = UIScreen.mainScreen().bounds.size.width
let SCREENHEIGHT = UIScreen.mainScreen().bounds.size.height
var DEFAULTS = NSUserDefaults.standardUserDefaults()

var mBHUD:MBProgressHUD? = nil

override func viewDidLoad() {
        let window:UIWindow = UIApplication.sharedApplication().keyWindow!
        mBHUD = MBProgressHUD.init(view: self.view)
        self.view.addSubview(mBHUD)
        mBHUD.labelText = "PleaseWait"
}
```

## 2.Navigation Button
### 例子:
```swift
func setBarItem(aStr: String,aImg: String,aAction: Selector) -> UIBarButtonItem {
    var barItem:UIBarButtonItem?
    if !aStr.isEmpty && !aImg.isEmpty {
        barItem = self.setBarButtonItem(aStr, aImg: aImg, aAction: aAction, aFrame: CGRectMake(0.0,0.0,50,22))
    } else {
        if aStr.isEmpty {
            let tempImg = UIImage(named: aImg)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            barItem = UIBarButtonItem.init(image: tempImg, style: UIBarButtonItemStyle.Plain, target: self, action: aAction)
        }
        if aImg.isEmpty {
            barItem = UIBarButtonItem.init(title: aStr, style: UIBarButtonItemStyle.Plain, target: self, action: aAction)
        }
    }
    return barItem!
}
    
func setBarButtonItem(aStr: String,aImg: String,aAction: Selector,aFrame: CGRect) -> UIBarButtonItem {
    
    let backButton: UIButton = self.setBarButton(aStr, aImg: aImg, aAction: aAction, aFrame: aFrame);
    let tempBarButtonItem: UIBarButtonItem = UIBarButtonItem.init(customView: backButton)
    tempBarButtonItem.tintColor = UIColor.whiteColor()
    return tempBarButtonItem
}
    
func setBarButton(aStr: String,aImg: String,aAction: Selector,aFrame: CGRect) -> UIButton{
    let backButton: UIButton = UIButton(type: UIButtonType.Custom)
    backButton.frame = aFrame
    if !aStr.isEmpty || !aImg.isEmpty {
        backButton.titleLabel!.textAlignment = NSTextAlignment.Center
        backButton.setTitle(aStr, forState: UIControlState.Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        backButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
        backButton.titleLabel!.font = UIFont.boldSystemFontOfSize(14)
        backButton.setBackgroundImage( UIImage.init(named:aImg), forState: UIControlState.Normal)
    } else {
        if !aStr.isEmpty || aImg.isEmpty {
            backButton.titleLabel!.textAlignment = NSTextAlignment.Center
            backButton.setTitle(aStr, forState: UIControlState.Normal)
            backButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            backButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
            backButton.titleLabel!.font = UIFont.boldSystemFontOfSize(14)
        }
        if !aImg.isEmpty || aStr.isEmpty {
            backButton.setImage( UIImage.init(named:aImg), forState: UIControlState.Normal)
        }
    }
    backButton.addTarget(self, action:aAction, forControlEvents: UIControlEvents.TouchUpInside)
    return backButton
}
    
func setBarButtonStr(aStr: String, Image aImg: UIImage) -> UIBarButtonItem {
    let tempBarButtonItem: UIBarButtonItem = UIBarButtonItem()
    tempBarButtonItem.image = aImg
    tempBarButtonItem.title = aStr
    return tempBarButtonItem
}
```

## 3.Navigation Button sender
### 例子:
```swift
@IBAction func back(sender: AnyObject) {
    self.navigationController?.popViewControllerAnimated(true)
}
    
@IBAction func backPop(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
}
 
@IBAction func edit(sender: AnyObject) {
    
}

func buttonNumber(aNum: Int32) -> UIBarButtonItem {
    let buttonItem: UIBarButtonItem = UIBarButtonItem()
    switch aNum {
    case 1:
        buttonItem.action = "back:"
        break
    case 2:
        buttonItem.action = "backPop:"
        break
    case 3:
        buttonItem.action = "edit:"
        break
    default:
        
        break
    }
    return buttonItem
}
```

著作权声明：本文由赵品评(pinping@me.com)原创，欢迎转载分享。请尊重作者劳动，转载时保留该声明和作者博客链接，谢谢