#IOS 新手教程(五)----RequestClassURL

本篇教程主要的功能是: 

本类主要的功能是声明 APP 里面使用的请求URL

```swift
let URL_BASICS = "http://xxxxx.com/api/v2"

/* Login 相关 */
let API_Login_RequestSMS      = "/request_verification_code"// POST
let API_Login_ValidateSMS     = "/validate_verification_code"// POST
let API_Login_SignUp          = "/sign_up"// POST
let API_Login_SignIn          = "/sign_in"// POST
let API_Login_ResetPassword   = "/reset_passwd"// POST
let API_Login_SignOut         = "/sign_out"// POST
let API_Login_FacebookSignIn  = "/facebook_sign_in"// POST
let API_Login_CheckFacebookID = "/check_facebook_id"// GET

/* Finde Date 相关 */
let API_Date_Find    = "/dates/find"// GET
let API_Date_Filter  = "/dates/filter_params"// GET
let API_Date_Apply   = "/dates/apply"// POST
let API_Date_MyDates = "/my_dates"// GET
let API_Date_Follow  = "/dates/follow"// POST
let API_Date_Dislike = "/dates/dislike"// POST
let API_Date_Revert  = "/dates/revert_last_dislike"// POST


/* Finde People 相关 */
let API_People_Find            = "/people/find"// GET
let API_People_Filter          = "/people/filter_params"// GET & POST
let API_People_Invite          = "/people/invite"// POST
let API_People_Dislike         = "/people/dislike"// POST
let API_People_Revert          = "/people/revert_last_dislike"// POST
let API_People_Super           = "/people/super_date"// POST
let API_People_Profile         = "/people/profile"// GET
let API_People_CommonInterests = "/people/common_interests"// GET
let API_People_MutualFriends   = "/people/mutual_friends"// GET
let API_People_Follow          = "/people/follow"// POST
let API_People_Unfollow        = "/people/unfollow"// POST

/* New Date 相关 */
let API_NewDate_ValidateTime = "/new_date/validate_date_time_for_new_date"// GET
let API_NewDate_Step2        = "/new_date/step2"// GET
let API_NewDate_Step3        = "/new_date/step3"// GET
let API_NewDate_Post         = "/my_dates"// POST

/* Chat 相关 */
let API_Chats          = "/chats"// GET
let API_Chats_Messages = "/chats/messages"// GET & POST

/* Chat 相关 */
let API_Merchants = "/merchants"// GET

```

著作权声明：本文由赵品评(pinping@me.com)原创，欢迎转载分享。请尊重作者劳动，转载时保留该声明和作者博客链接，谢谢