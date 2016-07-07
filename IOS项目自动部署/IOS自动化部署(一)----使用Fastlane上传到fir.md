#IOS 自动化部署(一)----使用Fastlane上传到fir


fastlane是一组工具套件，旨在实现iOS应用发布流程的自动化，并且提供一个运行良好的持续部署流程，只需要运行一个简单的命令就可以触发这个流程。

fastlane是一个ruby脚本集合，其中囊括了向苹果商店提交新应用或更新已有应用所需要的最常用任务。

*   deliver: Upload screenshots, metadata, and your app to the App Store
*   supply: Upload your Android app and its metadata to Google Play
*   snapshot: Automate taking localized screenshots of your iOS app on every device
*   screengrab: Automate taking localized screenshots of your Android app on every device
*   frameit: Quickly put your screenshots into the right device frames
*   pem: Automatically generate and renew your push notification profiles
*   sigh: Because you would rather spend your time building stuff than fighting provisioning
*   produce: Create new iOS apps on iTunes Connect and Dev Portal using the command line
*   cert: Automatically create and maintain iOS code signing certificates
*   spaceship: Ruby library to access the Apple Dev Center and iTunes Connect
*   pilot: The best way to manage your TestFlight testers and builds from your terminal
*   boarding: The easiest way to invite your TestFlight beta testers
*   gym: Building your iOS apps has never been easier
*   match: Easily sync your certificates and profiles across your team using Git
*   scan: The easiest way to run tests for your iOS and Mac apps

##概念

*   *.workspace文件
使用 CocoaPods 管理的工程在执行完 pod install 之后生成的workspace文件

*   scheme
显示在Xcode的左上角，run图标的右边，设备选择的左边

*   configuration
在Xcode中选项目，Info tab下会列出所有的configuration，一般有Debug和Release两种

*   provisioning profile
在Xcode中选target，在Build Settings tab下搜索Provisioning Profile，默认应该是Automatic，点击看到下拉列表中的就是所有可用的名称

##脚本执行步骤

1. 清理项目
2. 生成archive
3. 导出ipa
4. 上传到fir

```sh
#!/bin/bash

#计时
SECONDS=0
project_path=$(pwd)
now=$(date +"%Y_%m_%d_%H_%M_%S")
current_user=$(logname)
scheme="your scheme name"

configuration="Release"
#指定打包所使用的输出方式，目前支持app-store, package, ad-hoc, enterprise, development, 和developer-id，即xcodebuild的method参数
export_method='ad-hoc'
workspace_path="$project_path/$scheme.xcworkspace"
output_path="/Users/$current_user/Desktop"
archive_path="$output_path/$scheme${now}.xcarchive"
ipa_path="$output_path/$scheme${now}.ipa"
ipa_name="$scheme${now}.ipa"
commit_msg="$1"
fir_token="your fir token"

#输出设定的变量值
echo "===workspace path: ${workspace_path}==="
echo "===archive path: ${archive_path}==="
echo "===ipa path: ${ipa_path}==="
echo "===export method: ${export_method}==="
echo "===commit msg: $1==="

#先清空前一次build
gym --workspace ${workspace_path} --scheme ${scheme} -clean --configuration ${configuration} --archive_path ${archive_path} --export_method ${export_method} --output_directory ${output_path} --output_name ${ipa_name}

#上传到fir
#fir publish ${ipa_path} -T "${fir_token}" -c "${commit_msg}"

#输出总用时
echo "===Finished. Total time: ${SECONDS}s==="
```