#IOS 自动化部署(一)----介绍工具

#####自动化部署---部署过程的每一个步骤都自动化，可以带来包括效能在内的显著的好处。你可以手工做这些事情，但是很耗时。二者的生产率差异真的很大。一般目前部署过程涉及到应用、环境和部署流程主要的模型。要实现自动化首先要做的是将需要部署的应用、环境和流程进行建模，所以还是需要一个自动化部署系统来支撑。

```
Fastlane    持续集成
http://fastlane.tools
sudo gem install Fastlane
sudo gem install -n /usr/local/bin  fastlane

Jenkins     持续集成
https://jenkins-ci.org/
sudo brew install jenkins

SHENZHEN    iOS开发命令行工具集
http://nomad-cli.com
https://github.com/nomad/Shenzhen
sudo gem install shenzhen
sudo gem install -n /usr/local/bin shenzhen

xctool      命令行打IPA包

sudo brew install xctool   (前面加sudo是为了防止没有权限)

xcodebuild  命令行打IPA包

fir.im-cli  可以通过指令查看, 上传, 编译 iOS/Android 应用.

sudo gem install fir-cli
sudo gem install -n /usr/local/bin fir-cli

```