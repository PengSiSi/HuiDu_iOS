//
//  StringMacro.h
//  QianfengSchool
//
//  Created by AlicePan on 16/5/31.
//  Copyright © 2016年 Combanc. All rights reserved.
//

#ifndef StringMacro_h
#define StringMacro_h

#pragma mark - 秘钥
#define JXHD_KEY ([NSString md5String:[NSString stringWithFormat:@"%@+combanc@jxhd", KUSERDEFAULT_OBJ4KEY(kUserName)]])

#pragma mark - fir
#define FIR_AppId @"58410ab2959d691080000c27"
//内测token 8657ecd5332c5e5efd248d593968b14d
//正式徐顺吉firtoken 496e8b1e1d99957d77e7a6ed1cb4c17e
#define FIR_Token @"496e8b1e1d99957d77e7a6ed1cb4c17e"

#pragma mark - UM
#define UMkey @"5840f0dac62dca21a40017c5"

#pragma mark - 个推
#define kGtAppId @"m8ZGAewAph9xaCtcxrqM98"
#define kGtAppKey @"n9PCpRvQmo61tgPWZg9s7A"
#define kGtAppSecret @"yWNqjgonQC7ZU4tGbxT4A2"

#define APPID_JXHD_NOTICE @"4028b2bd5942fa00015943280185001b"
#define APPID_JXHD_WORK @"4028b2bd5942fa00015943349ca7001e"
#define APPID_JXHD_RESOURCE @"4028b2bd5942fa00015943349cbf001f"
#define APPID_JXHD_ALBUM @"4028b2bd5942fa0001594336c39b0021"
#define APPID_JXHD_BOOK @"4028b2bd5942fa000159433f7ee80023"
#define APPID_JXHD_SHARE @"4028b2bd5942fa00015943442a180025"
#define APPID_JXHD_VOTE @"4028b2bd59435c130159436dc3e30006"
#define APPID_JXHD_ASK @"4028b2bd5943711101594405e1c90004"
#define APPID_JXHD_SCHOOLNOTICE @"402802c95b18fdb7015b1c724455000d"
#define APPID_JXHD_APPROVE @"4028b2bd5942fa000159431551440005"

#define SOURCEID_JXHD @"jxhd"


#pragma mark - 公共CellIdentiifer
//新增左label 右textfield
#define ADD_LABELANDTEXTFIELD_CELL_ID (@"AddTableViewCellWithLabelAndTextFieldIdentifier")
//新增只有textfield
#define ADD_TEXTFIELD_CELL_ID (@"AddTableViewCellWithTextFieldIdentifier")
//新增左右两个label
#define ADD_LABEL_CELL_ID (@"AddTableViewCellWithLabelIdentifier")
//新增带展开收回按钮
#define ADD_FLEXTBTN_CELL_ID (@"AddTableViewCellWithFlexButtonIdentifier")
//新增左右两个label 左右两个imageView
#define ADD_LABELANDIMGV_CELL_ID (@"AddTableViewCellWithLeftRightLabelAndRightImgVIdentifier")
//新增左边label，右边switch
#define ADD_LABELANDSWITCH_CELL_ID (@"AddTableViewCellWithLabelAndSwitchIdentifier")
//评论Cell
#define LIKEANDCOMMENT_CELLID (@"LikeAndCommentTableViewCellIdentifier")

//家校互动 、投票、荐书、通知列表“全部”和“我的”Cell，作业列表“我的”Cell
#define WORKLIST_ALL_CELLID (@"WorkListAllTableViewCellIdentifier")
#define WORKLIST_MINE_CELLID (@"WorkListMineTableViewIdentifier")

// 通知,作业,荐书,投票列表页面的cell
#define COMMON_LIST_CELLID (@"NoticeListTableViewCellIdentifier")

#pragma mark - 网络请求宏
//网络请求提示宏
#define KREQUESTLOADING @"加载中..."
#define KREQUESTSUCCESS @"请求成功"
#define KREQUESTERROR @"网络异常 请稍后再试"
#define kREQUESTSERVICEERROR @"服务器错误"
#define kREQUESTUNKNOWERROR @"未知错误"
#define KREQUESTNODATA @"暂无数据"
#define KREQUESTNOACCESS @"无权限"
#define KREQUESTOVERTIME @"请求超时"
#define KREQUESTLOGINERROR @"登录失败"
#define KREQUESTADDSUCCESS @"添加成功"
#define KREQUESTADDFAILED @"添加失败"
#define KREQUESTOPERATESUCCESS @"操作成功"
#define KREQUESTOPERATEFAILED @"操作失败"
#define KREQUESTCONTAINILLEGALSTRING @"包含非法字符 请重新输入"
#define KREQUESTPLEASEINPUTALLINFO @"请填写完整信息"
#define KREQUESTLIMITCOUNT @"已经达到输入的最大字数了哦"
#define KCONTENTLIMITCOUNT @"已经达到内容输入的最大字数了哦"
#define KVOTEOPTIONLIMITCOUNT @"已经达到投票选项输入的最大字数了哦"
#define KTHMELIMITCOUNT @"主题最多输入100字"
#define KALBUMNAMELIMITCOUNT @"相册名称最多输入100字"
#define KNAMELIMITCOUNT @"名称最多输入100字"
#define KDESCRIPTIONLIMITCOUNT @"描述最多输入100字"
#define KCOMMENTLIMITCOUNT @"评论最多输入100字"
#define KREQUESTADDING @"提交中..."
#define KCOMFIRMDELETE @"确认删除"
#define KREQUESTATLEASTONECONDITION @"至少选择一个搜索条件"
#define KNODOWNLOAD @"您还没有下载哦~"
#define KHAVELIKED @"您已经点过赞了哦~"
#define KCONTENTCANNOTBEEMPTY @"内容不能为空哦~"
#define KCONFIRMAPPROVEPASS @"确认审核通过？"
#define KCONFIRMAPPROVEREFUSE @"确认拒绝审核？"

#define KREQUESTDURATIONHALFSECOND 0.5
#define KREQUESTDURATION 1.0
#define KREQUESTONEANDHALFSECOND 1.5

#pragma mark - jxhd code 提示
#define K_JXHD_CODE_TIP_WRONGPASSWORD @"密码错误"
#define K_JXHD_CODE_TIP_ACCOUNTNOTEXIT @"用户不存在"
#define K_JXHD_CODE_TIP_USENAMEORPASSWORDROERROR @"用户名或密码错误"

/**
 *  请输入文字描述宏
 */
#define INPUTDESCRIPTION @"请输入文字描述"
#define KPLEASEINPUT (@"请输入文字")
#define KPLAEASECHOOSE (@"请选择")
#define KDEVELOPING @"此模块正在开发中，下一版即将上线"
#define KDOWNLOADALREADY @"此文件已下载，请在已下载中查看"
#define KCHOOSEWRONGTIME @"您选择的结束时间不对，请重新选择"
#define KONLYINPUTNUMBER @"您只能输入整数哦~"
#define KINPUTUNZERO @"您不能输入0开头的数字哦~"
#define KDOWNLOADSUCCESS @"下载成功"
#define KDOWNLOADFAIL @"下载失败,请稍后再试"
#define KREPAIRSTILLHAVENOTCOMMENT @"您还有报修未评价，请评价后再添加"
#define KCANNOTDELETETHISCOMMENT (@"您不能删除此评论哟")

#define KREQUESTCHANGEPASSWORDSUCCESS @"密码修改成功"
#define KREQUESTCHANGEPASSWORDFAILED @"密码修改失败"

#pragma mark - 用车和资料印制
//监听用车列表刷新的通知名称
#define Car_BeginRefreshing @"CarBeginRefreshing"
//监听资料印制列表刷新的通知名称
#define DataPrinting_BeginRefreshing @"DataPrintingBeginRefreshing"


#pragma mark - 发短信
#define KGO_SELECT (@"去选择")
#define KALREADY_SELECT (@"已选择")
#define KMESSAGE_PLEASE_INPUT (@"请输入...")
#define KMESSAGE_INPUTDESCRIPTION (@"请输入要发送的短信内容")
#define KMESSAGE_DOT (@",")
#define KMESSAGE_NOTINPUTCONTENT_TIP (@"您还没有输入短信内容哦~")

//以下是前锋学校发短信默认的用户名、密码和短信内容拼接名称
#define KMESSAGE_DEFAULT_USERNAME (@"KBGJH")
#define KMESSAGE_DEFAULT_PASSWORD (@"KBGJH666")
#define KMESSAGE_DEFAULT_SCHOOLNAME (@"【前锋学校】")

#pragma mark - 角色名称字符串
#define KVIRTUALCLASS_NOPERMISSTION_ROLE (@"没有权限")
#define KVIRTUALCLASS_TEACHER_ROLE (@"老师")
#define KVIRTUALCLASS_SENIORLEADER_ROLE (@"年级组长")
#define KVIRTUALCLASS_HEADMASTER_ROLE (@"校长")
#define KVIRTUALCLASS_TEAMLEADER_ROLE (@"教研组长")
#define KVIRTUALCLASS_ADMINISTRATOR_ROLE (@"超级管理员")
#define KVIRTUALCLASS_AUDITOR_ROLE (@"虚拟班级审核员")

#pragma mark - 统计名称字符串
#define KVIRTUALCLASS_STATISTICS_SENIORLEADER_ROLE (@"年级统计")
#define KVIRTUALCLASS_STATISTICS_HEADMASTER_ROLE (@"校长统计")
#define KVIRTUALCLASS_STATISTICS_TEAMLEADER_ROLE (@"教研统计")
#define KVIRTUALCLASS_STATISTICS_ADMINISTRATOR_ROLE (@"超管统计")

#pragma mark - 分页硬编码
#define BOOK_ALL (@"班级荐书")
#define BOOK_MINE (@"我的荐书")
#define WORK_ALL (@"班级学堂")
#define WORK_MINE (@"我的学堂")
#define VOTE_ALL (@"班级投票")
#define VOTE_MINE (@"我的投票")
#define SHARE_ALL (@"班级分享")
#define SHARE_MINE (@"我的分享")

#define K_PAGE_ALL (@"全部")
#define K_PAGE_MINE (@"我的")

#pragma mark - 虚拟教室通知
// 收到推送通知时 应用在前台
#define KReceiveNotificationWithStateActive @"kReceiveNotificationWithStateActive"

//班级信息改变的通知
#define KVIRTUALCLASS_CLASSINFO_NOTICE (@"kVirtualClassClassInfoNotice")
//资料是否有权限增加删除的通知,并且将文件名名字传过来，用于判断是否有重复文件夹
#define KVIRTUALCLASS_RESOURCE_ISUPLOAD_NOTICE (@"kVirtualClassResourceIsUploadNotice")
//记录在学生进入群组之前班级的通知
#define KVIRTUALCLASS_STUDENT_GOGROUP_NOTICE (@"kVirtualClassStudentGoGroupNotice")
//个人信息请求完成通知
#define KMINE_INFO_NOTICE (@"kMineInfoNotice")
//评论请求之后高度变化通知
#define KCOMMENT_HEIGHT_NOTICE (@"kCommentHeightNotice")

// 投票详情返回通知
#define KVOTE_DETAIL_NOTICE (@"KRefreshVoteListNotice")

// 通知详情返回通知
#define KNOTICE_DETAIL_NOTICE (@"KRefreshNoticeListNotice")

//审批列表有无数据，监听ApprovePage界面是否显示批量按钮的通知
#define KNOTICE_APPROVE_LISTDATA_NOTICE (@"kApproveListDataNotice")

#pragma mark - 家校互动字符串
//全文
#define K_SHARE_FULLTEXT (@"全文")
//收起
#define K_SHARE_COLLAPSE (@"收起")
//默认相册
#define K_DEFAULT_ALBUM (@"默认相册")

#define K_APPROVE_SELECT_ALL (@"全部选择")
#define K_APPROVE_DESELECT_ALL (@"取消全选")

#pragma mark - 1.5接口权限字段 的硬编码
//#define K_AUTHORITY_HASCOMMENT (@"comment")
#define K_AUTHORITY_HASOK (@"ok")
//#define K_AUTHORITY_HASONECOMMENT (@"onecomment")
#define K_AUTHORITY_HASNOTICE (@"notice")
#define K_AUTHORITY_HASAFFIX (@"affix")
#define K_AUTHORITY_HASVIDEO (@"video")
#define K_AUTHORITY_HASPICTURE (@"picture")
#define K_AUTHORITY_HASSOUND (@"sound")

#pragma mark -附件下载的文件夹路径
//门户
#define K_NOTIFY_PATH (@"notify") //门户通知
#define K_SCHOOKCALENDAR_PATH (@"schoolCalendar") //校历
#define K_SCHEDULE_PATH (@"schedule") //时间表

//家校互动
#define K_NOTICE_PATH (@"notice") //家校互动通知模块
#define K_WORK_PATH (@"work") //作业模块
#define K_VOTE_PATH (@"vote") //投票模块
#define K_ACTIVITY_PATH (@"activity") //活动模块
#define K_BOOK_PATH (@"book") //荐书模块
#define K_ALBUM_PATH (@"album") //相册模块
#define K_RESOURCE_PATH (@"resource") //资料模块
#define K_SHARE_PATH (@"share") //分享模块
#define K_ASK_PATH (@"ask") //提问模块
#define K_APPENDIX_PATH (@"appendix") //东华门的所有都放在一个文件夹下

#pragma mark - 常用图片名
//选中按钮实心
#define K_RADIO_CHECKED (@"radio_choice")
//选中按钮空心
#define K_RADIO_UNCHECK (@"radio_nochoice")
//暂无图片白色背景
#define K_NOIMAGE_WHITE_BG (@"nopicture_img")
//暂无图片灰色背景
#define K_NOIMAGE_GRAY_BG (@"nopicture_img_big")
//大加号按钮的图片
#define K_PLUSSIGN_PIC_IMG (@"addpictures_img")

//评论回复带附件的图标
#define K_AFFIX_SELECTPHOTO_ICON_IMG (@"picture_icon") //选择图片图标
#define K_AFFIX_TAKEPHOTO_ICON_IMG (@"photograph_icon") //照相图标
#define K_AFFIX_SIGHT_ICON_IMG (@"video_icon") //小视频图标
#define K_AFFIX_VOICE_ICON_IMG (@"soundrecording_icon") //语音图标


#endif /* StringMacro_h */
