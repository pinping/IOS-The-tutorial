##iOS推送总结----点击通知栏消息跳转到指定的页面

1. APP关闭的时候收到推送，点击通知栏消息跳转到指定的页面
2. APP在前台的时候收到推送,点击通知栏消息跳转到指定的页面
3. APP在后台的时候收到推送,点击通知栏消息跳转到指定的页面


### 例子 针对1.的处理
#### Objective-C
```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions  {  
     [self jumpToViewController:launchOptions];  
  
    return YES;  
}  
  
#pragma mark —页面跳转  
- (void)jumpViewController:(NSDictionary*)tfdic  {  
     NSDictionary *remoteNotification = [tfdic objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];  
      
    if ([CHPaInterface isUserLogin])  {  
      for (NSString *tfStr in remoteNotification)  {  
        if ([tfStr isEqualToString:@"careline"])  {  
            ViewController *_viewController =  [[ViewController alloc]init];  
            [_viewController loadAPNSInfoDic:remoteNotification];  
            UINavigationController *nav= (UINavigationController *)self.window.rootViewController;  
            [nav pushViewController:_viewController animated:YES];  
        }  
      }  
    }  
}  
```

### 例子针对2.的处理
#### Objective-C
```Objective-C
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo  
{  
    //当APP在前台运行时，不做处理  
    if( [UIApplication sharedApplication].applicationState == UIApplicationStateActive)  
    {  
    }  
      
      //当APP在后台运行时，当有通知栏消息时，点击它，就会执行下面的方法跳转到相应的页面  
    else if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive)  
    {  
        if ([CHPatyInterface isUserLogin])  
        {  
            NSLog(@"收到推送:%@",userInfo);  
            for (NSString *tfStr in userInfo)  
            {  
                if ([tfStr isEqualToString:@"careline"])  
                {  
                    ViewController *_viewController =  [[ViewController alloc]init];  
                    [_viewController loadAPNSInfoDic:userInfo];  
                    UINavigationController *nav= (UINavigationController *)self.window.rootViewController;  
                    [nav pushViewController:_viewController animated:YES];  
                }  
            }  
        }  
    }  
}  
```
#### swift
```swift
func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject:AnyObject], fetchCompletionHandler completionHandler: ( UIBackgroundFetchResult ) -> Void ) {

        if UIApplication.sharedApplication().applicationState == UIApplicationState.Active {
            
            NSNotificationCenter.defaultCenter().postNotificationName("receptionNotification",
                                                                      object: self, userInfo: userInfo)
            
        } else if UIApplication.sharedApplication().applicationState == UIApplicationState.Inactive {
            
            if userDefaults != nil {
                print("收到推送:\(userInfo)")
                
                NSNotificationCenter.defaultCenter().postNotificationName("backgroundNotification",
                                                                          object: self, userInfo: userInfo)
        }
    }
```
