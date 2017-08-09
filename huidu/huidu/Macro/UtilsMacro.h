//
//  UtilsMacro.h
//  Ssdfz
//
//  Created by 王楠 on 16/1/19.
//  Copyright © 2016年 Combanc. All rights reserved.
//  通用宏

#ifndef UtilsMacro_h
#define UtilsMacro_h

#pragma mark - 颜色
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/)\
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

// 验证服务器返回的字符串数据
#define VerifyValue(value)\
({id tmp;\
if ([value isKindOfClass:[NSNull class]]){\
tmp = @"";}\
else\
{tmp = value;}\
tmp;\
})\

#pragma mark - NSLog扩展

// NSLog扩展
#define NSLog(format, ...) do {                                                                          \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

#pragma mark - 使用NSUserDefaults 存储的相关字段和方法

// 用户基本信息的宏
#define KUSERNAME @"kUserName"
#define KPASSWORD @"kPassWord"
#define KACCESSTOKEN @"kAccessToken"
#define KUSERTYPE @"kUserType" // 用户身份类型 (1：表示教师, 2：表示学生)
#define KSERVERIP @"kServerIP"
#define KVERIFY @"kVerify"
#define KJGH @"kJGH"    // 个人信息教工号
#define KNEWSTYPE @"kNewsType"
#define KNOTICETYPE @"kNoticeType"
#define KCNAME @"KCName" //用户中文姓名
#define KGETUICLIENTID @"kGeTuiClientId"
#define KDEVICETOKEN @"kDeviceToken"
#define KREMBERPASSWORD @"kRemberPassWord" // 记住密码
#define KAUTOLOGIN @"kAutoLogin"  // 自动登录
#define KCHECKNOTICATIONSETTING @"kCheckNoticationSetting" // 检测是否开启通知设置

// 个人信息的校验key
#define KVERIFYKEY @"cpzy2016"

#define kHandshakePassword @"handshakePassword"

// 从NSUserDefaults中根据key取值
#define KUSERDEFAULT_OBJ4KEY(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
// 设置NSUserDefaults的 obj 和 key
#define KUSERDEFAULT_SETOBJ4KEY(obj,key) [[NSUserDefaults standardUserDefaults]setObject:obj forKey:key]

#define KRETURNCODE(code) [code isEqualToString:@"1"]

// 资源下载路径名
#define KDOWNLOADPATH @"ResourceDownPath"
// 资源下载的Realm数据库名字 databaseName
#define KDOWNLOADDATABASENAME @"DownLoadDataBaseName"
// 消息
#define KMESSAGEDATABASENAME @"MessageDataBase"
// 作业考试列表
#define KHOMEWORKDATABASENAME @"HomeWorkDataBaseName"

// Realm数据库版本
#define KDOWNLOADDATABASENAMEVERSION 1.0

#define KMicrolectureCourseResourceId @"kMicrolectureCourseResourceId"
#define KMicrolectureCourseResourceName @"kMicrolectureCourseResourceName"
#define KMicrolectureCourseResourceUrl @"kMicrolectureCourseResourceUrl"
#define KMicrolectureCourseResourceSmallPictureUrl @"KMicrolectureCourseResourceSmallPictureUrl"
#define KMicrolectureCourseResourceType @"kMicrolectureCourseResourceType"


#define KSUBJECT_chemistry @"化学"
#define KSUBJECT_chinese @"语文"
#define KSUBJECT_comprehensive @"综合"
#define KSUBJECT_english @"英语"
#define KSUBJECT_general @"通用"
#define KSUBJECT_science @"科学"
#define KSUBJECT_music @"音乐"
#define KSUBJECT_sport @"体育"

#define KSUBJECT_geography @"地理"
#define KSUBJECT_history @"历史"
#define KSUBJECT_biology @"生物"
#define KSUBJECT_maths @"数学"
#define KSUBJECT_physics @"物理"
#define KSUBJECT_politics @"政治"

#define KTAGITEMHEIGHT @"kTagItemHeight"

#pragma mark - 网络请求提示信息

// 弹框提示信息
#define KREQUESTLOADING @"加载中..."
#define KREQUESTSUCCESS @"请求成功"
#define KREQUESTERROR @"网络异常 请稍后再试"
#define kREQUESTSERVICEERROR @"服务器错误"
#define kREQUESTSERVICECONNECTERROR @"无法连接服务器"
#define kREQUESTUNKNOWERROR @"加载信息失败"
#define KREQUESTNODATA @"暂无数据"
#define KREQUESTNOACCESS @"无权限"
#define KREQUESTOVERTIME @"请求超时"
#define KREQUESTLOGINERROR @"登录失败"
#define KREQUESTERRORPASSWORD @"密码错误"
#define KREQUESTADDSUCCESS @"添加成功"
#define KREQUESTADDFAILED @"添加失败"
#define KREQUESTOPERATESUCCESS @"操作成功"
#define KREQUESTOPERATEFAILED @"操作失败"
#define KREQUESTCONTAINILLEGALSTRING @"包含非法字符 请重新输入"
#define KREQUESTPLEASEINPUTALLINFO @"请填写完整信息"
#define KREQUESTLIMITCOUNT @"标题最多输入100字"
#define KCONTENTLIMITCOUNT @"内容最多输入100字"
#define KDESCRIPTIONLIMITCOUNT @"描述最多输入100字"
#define KCOMMENTLIMITCOUNT @"评论最多输入100字"
#define KREQUESTADDING @"提交中..."
#define KREQUESTATLEASTONECONDITION @"至少选择一个搜索条件"
#define KREQUESTDOWNLOADING @"下载中..."
#define KREQUESTDOWNLOADSUCCESS @"下载成功"
#define KREQUESTDOWNLOADFAILED @"下载失败"
#define KREQUESTUPLOADSUCCESS @"上传成功"
#define KREQUESTUPLOADFAILED @"上传失败"
#define KREQUESTCHANGEPASSWORDSUCCESS @"密码修改成功"
#define KREQUESTCHANGEPASSWORDFAILED @"密码修改失败"
#define KREQUESTCLEANSUCCESS @"已清理"
#define KDOCUMENTOPENERROR @"文件打开失败"
#define KREQUESTDURATIONHALFSECOND 0.5
#define KREQUESTDURATION 1.0
#define KREQUESTONEANDHALFSECOND 1.5
#define KOPENAPPFAILD @"请检查是否安装该应用"
#define KANSWERSUCCESS @"回答成功"
#define KANSWERFAILD @"回答失败"
#define KINPUTUSERNAME @"请输入用户名"
#define KINPUTPASSWORD @"请输入密码"
#define KUSERNAMEERROR @"用户名错误"
#define KPASSWORDERROR @"密码错误"
#define KNONEUSER @"没有该用户"

#pragma mark - 通知常量

#define kMessageBtnShowNotification @"kMessageBtnShowNotification"
#define kMessageBtnClickNotification @"kMessageBtnClickNotification"

#define kMistakesTitleChangledNotification @"MistakesTitleChangledNotification"

#define kDownLoadProgressNotification @"kDownLoadProgressNotification"

#pragma mark - 视图坐标计算

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// Constants
#define K_PHONE_6_SCREEN_WIDTH (375.0f)
#define K_PHONE_6_SCREEN_HEIGHT (667.0f)
#define K_PHONE_5_SCREEN_WIDTH (320.f)
#define K_PHONE_5_SCREEN_HEIGHT (568.f)
#define K_STATUS_BAR_HEIGHT (20.f)
#define K_NAVIGATION_BAR_HEIGHT (44.f)
#define K_STATUS_BAR_AND_NAVI_BAR_HEIGHT (64.0f) // 20.0 + 44.0
#define K_TAB_BAR_HEIGHT (49.0f)
#define K_SEGMENTED_CONTROL_HEIGHT (29.f)
#define K_TOOL_BAR_HEIGHT (44.f)
#define K_SEARCH_BAR_HEIGHT (44.f)
#define K_TEXT_FIELD_HEIGHT (30.f)
#define K_SWITCH_HEIGHT (31.f)
#define K_ACTIVITY_INDICATOR_WH (20.f)
#define K_STEPPER_HEIGHT (29.f)
#define K_AD_BANNER_HEIGHT (66.f)
#define K_FLEXBTN_CELL_HEIGHT (120.f)
// Expressions
#define isScreenWidthEqual320 (fabs([UIScreen mainScreen].bounds.size.width - 320.f) < DBL_EPSILON)
#define isScreenWidthEqual375 (fabs([UIScreen mainScreen].bounds.size.width - 375.f) < DBL_EPSILON)
#define isScreenWidthEqual414 (fabs([UIScreen mainScreen].bounds.size.width - 414.f) < DBL_EPSILON)
#define isScreenHeightEqual480 (fabs([UIScreen mainScreen].bounds.size.height - 480.f) < DBL_EPSILON)
// Macros With Parameter
#define K_DEPENDED_SCREEN_WIDTH K_PHONE_6_SCREEN_WIDTH
#define K_DEPENDED_SCREEN_HEIGHT K_PHONE_6_SCREEN_HEIGHT

#define getWidth(w) ((float)w / K_DEPENDED_SCREEN_WIDTH * K_SCREEN_WIDTH)
#define getHeight(h) ((float)h / K_DEPENDED_SCREEN_HEIGHT * K_SCREEN_HEIGHT)
#define getPoint(x, y) (CGPointMake((getWidth(x), getHeight(y))))
#define getRect(x, y, w, h) (CGRectMake(getWidth(x), getHeight(y), getWidth(w), getHeight(h)))
#define getEdgeInsets(top, left, bottom, right) (UIEdgeInsetsMake(getHeight(top), getWidth(left), getHeight(bottom), getWidth(right)))

#define getHeightKeepWHAspect(w, aspect) ((float)(w) / (float)(aspect))
#define getHeightKeepWHAspectAndWidthEqualScreenW(h) ((float)h / K_DEPENDED_SCREEN_WIDTH * K_SCREEN_WIDTH)
#define getSizeKeepWHAspect1(w, aspect) (CGSizeMake(getWidth(w), getWidth(w) / (float)(aspect)))
#define getSizeKeepWHAspect2(w, h) getSizeKeepWHAspect1(w, (float)w / (float)h)

#define getWidthWithWHAspect(h, aspect) ((float)h * (float)aspect)
#define getSizeKeepHeightFitWholeScreen(w, h) (CGSizeMake(getWidthWithWHAspect(K_SCREEN_HEIGHT, (float)w / (float)h), K_SCREEN_HEIGHT))

// 视图坐标计算
#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kViewWidth(view) view.frame.size.width
#define kViewHeight(view) view.frame.size.height
#define kViewXPoint(view) view.frame.origin.x
#define kViewYPoint(view) view.frame.origin.y
#define kViewRightPoint(view) (view.frame.origin.x+view.frame.size.width)
#define kViewBottomPoint(view) (view.frame.origin.y+view.frame.size.height)

#pragma mark - 系统版本
// 判断系统版本是否是iOS9
#define KIsIOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0
#define KIsIOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
#define KIsIOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#define KIsIOS6 [[[UIDevice currentDevice] systemVersion] hasPrefix:@"6"]
#define KIsIOS5 [[[UIDevice currentDevice] systemVersion] hasPrefix:@"5"]
// 获取系统版本 (NSString)
#define KIOS_Version_NSString [UIDevice currentDevice].systemVersion
// 获取系统版本 (float)
#define KIOS_Version_Float [[[UIDevice currentDevice] systemVersion] floatValue]
// 获取当前语言
#define KCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#pragma mark - other
// 列表页请求cell的个数
#define PAGECOUNT 10
// 图片大小大于800kb的时候就压缩
#define FILE_MAXSIZE 800


#endif /* UtilsMacro_h */
