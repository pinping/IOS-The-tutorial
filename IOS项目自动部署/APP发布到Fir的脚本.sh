#!/bin/bash

#计时
SECONDS=0
project_path=$(pwd)
now=$(date +"%Y_%m_%d_%H_%M_%S")
current_user=$(logname)
scheme="XXXXXXXXXXXXXXXXXXXXXX"

configuration="development"
#指定打包所使用的输出方式，目前支持app-store, package, ad-hoc, enterprise, development, 和developer-id，即xcodebuild的method参数
export_method='development'
workspace_path="$project_path/$scheme.xcworkspace"
output_path="/Users/$current_user/XXXXXX"
archive_path="$output_path/$scheme${now}.xcarchive"
ipa_path="$output_path/$scheme${now}.ipa"
ipa_name="$scheme${now}.ipa"
commit_msg="$1"
fir_token="XXXXXXXXXXXXXXXXXXXXXX"

fastlane gym -clean

#先清空前一次build
fastlane gym --workspace ${workspace_path} --scheme ${scheme} --configuration ${configuration} --archive_path ${archive_path} --export_method ${export_method} --output_directory ${output_path} --output_name ${ipa_name}

#上传到fir
fir publish ${ipa_path} -T "${fir_token}" -c "${commit_msg}"

#输出总用时
echo "===Finished. Total time: ${SECONDS}s==="