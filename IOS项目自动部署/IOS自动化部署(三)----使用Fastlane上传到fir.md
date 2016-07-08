#IOS 自动化部署(三)----使用Fastlane上传到fir

本篇介绍:
>通过Ruby脚本,完成 使用Fastlane上传到fir.
>
>把上面的代码 保存到项目文件里面, 放在终端里面执行 fastlane fir .
>
	
	
```Ruby
fastlane_version "1.97.2"
default_platform :ios

platform :ios do

  before_all do
    # ENV["SLACK_URL"] = "https://hooks.slack.com/services/..."
    cocoapods
    push_to_git_remote
    pwd
  end

  desc "Runs all the tests"
  lane :test do
    scan
  end
  
  desc "把项目编译打包成.ipa上传到fir"
  lane :fir do
    scheme="xxxxx"
    fir_token= "xxxxx"
    ipa_path = "/Users/mac/Desktop/" + Time.now.strftime("%Y-%m-%d")
    ipa_name = ""+scheme+".ipa"
    gym(
      workspace: ""+scheme+".xcworkspace",
      scheme: scheme,
      clean: true,
      configuration: "Release",
      export_method: 'ad-hoc',
      # both of these flags are required for ad hoc
      # include_bitcode: true,
      # include_symbols: false,
      archive_path: ipa_path+"/"+scheme,
      output_directory: ipa_path,
      output_name: ipa_name,
      # use_legacy_build_api: true
    )
    outipa_path = ipa_path+"/"+scheme+".ipa"
    say outipa_path
    say fir_token
    sh "fir publish "+outipa_path+" -T "+fir_token+" -c $1"
  end

  desc "清除已经构建的IPA 等文件"
  lane :clean do
    clean_build_artifacts
  end

  # You can define as many lanes as you want
  after_all do |lane|
    
  end

  error do |lane, exception|

  end
end
```