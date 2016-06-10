#IOS 新手教程(二)

接着上一篇教程

> SuperViewController

> 1.主要是定义加载的方法

> 2.定义ViewController的数据的加载

> 3.定义关闭所以编辑的方法

> 4.定义所有ViewController的背景


## 1.主要是定义加载的方法
### 例子:
```swift
var mBHUD:MBProgressHUD? = nil

override func viewDidLoad() {
        let window:UIWindow = UIApplication.sharedApplication().keyWindow!
        mBHUD = MBProgressHUD.init(view: self.view)
        self.view.addSubview(mBHUD)
        mBHUD.labelText = "PleaseWait"
}
```

## 2.定义ViewController的数据的加载
### 例子:
```swift
//type 1 = Get, 2 = Post
func loadData(type:Int){

}

func loadNewData(){
}

func loadAddData(){
}
```

## 3.定义关闭所以编辑的方法
### 例子:
```swift
func closeEditing() {
        UIApplication.sharedApplication().keyWindow!.endEditing(true)
} 

override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
    closeEditing()
}
```

## 4.定义所有ViewController的背景
### 例子:
```swift
override func viewDidLoad() {
       	super.viewDidLoad()
		self.view.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.94, alpha:1);
}
```
著作权声明：本文由赵品评(pinping@me.com)原创，欢迎转载分享。请尊重作者劳动，转载时保留该声明和作者博客链接，谢谢
