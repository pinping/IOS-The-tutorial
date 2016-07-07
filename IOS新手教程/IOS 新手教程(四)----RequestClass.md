#IOS 新手教程(四)----RequestClass

本篇教程主要的功能是: 

```swift
// 需要引入
import Alamofire
import SwiftyJSON
import SVProgressHUD
```
>1.声明一个枚举
>
>2.声明一个全局的请求



## 1.声明一个枚举
### 例子:
```swift
// Represents an HTTP method.
    enum Method: String {
        case GET, POST, PUT, DELETE, OPTIONS, HEAD, PATCH, TRACE, CONNECT
    }
```

## 2.声明一个全局的请求
### 例子:
```swift
func dataSuccess(aDate:JSON) -> JSON {
	//处理请求成功以后的数据处理
}
    
func dataFailure() -> JSON {
    //处理请求失败以后的数据处理
}
    
func allRequestClassUrl(method: Method,aUrl: String, Parameter:Dictionary<String,AnyObject>,aBlock:funcBlockJson){
    
    SVProgressHUD.show()
    Alamofire.request(method, aUrl, parameters:globalParameter(Parameter)).responseJSON {response in
        
        SVProgressHUD.dismiss()
        switch response.result {
        case .Success:
            let err = response.result.value?.valueForKey("errors")
            if (err != nil){
                return;
            }
            
            let aJson = JSON(response.result.value!)
            
            aBlock(self.dataSuccess(aJson))
            break;
        case .Failure(let error):
            //print("GetRequest",error)
            aBlock(self.dataFailure())
            break;
        }
    }
}
```

著作权声明：本文由赵品评(pinping@me.com)原创，欢迎转载分享。请尊重作者劳动，转载时保留该声明和作者博客链接，谢谢