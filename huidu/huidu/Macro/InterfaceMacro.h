//
//  InterfaceMacro.h
//  Ssdfz
//
//  Created by 王楠 on 16/1/19.
//  Copyright © 2016年 Combanc. All rights reserved.
//  接口宏

#ifndef InterfaceMacro_h
#define InterfaceMacro_h

#define isNilOrNull(obj) (obj == nil || [obj isEqual:[NSNull null]])

#define setObjectForKey(object) \
do { \
[dictionary setObject:object forKey:@#object]; \
} while (0)

#define setOptionalObjectForKey(object) \
do { \
isNilOrNull(object) ?: [dictionary setObject:object forKey:@#object]; \
} while (0)


// BaseURL
#define KBASE_URL (@"baseUrl")//(@"http://192.168.130.84:8888")

#define BASE_URL (KUSERDEFAULT_OBJ4KEY(KBASE_URL))
// 当前时间戳
#define timeSt ([NSString getNowDataWithLongString])
// 版本号  [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define VERSION ([NSString stringWithFormat:@"v%@", @"2.0"])
// APPKEY
#define APPKEY (@"combanc_weike_phone_key")
// MD5加密核对
#define VERIFY ([NSString md5String:[NSString stringWithFormat:@"%@%@%@", timeSt, APPKEY, VERSION]])


#pragma mark -  1.登录

#pragma mark -  1. 登录 --->POST
#define LOGININ_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/login", BASE_URL])
// 参数构造
NS_INLINE NSDictionary *LoginParameter(NSString *userName, NSString *password, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(password);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 2.作业考试（搜索）

#pragma mark - 2.1 获取全部微课程科目 --->POST
#define WEIKE_SUBJECTLIST_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getListSubject", BASE_URL])
// 参数构造
NS_INLINE NSDictionary *WeikeSubjectList(NSString *userName, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 2.2.1 获取作业、考试列表
#define HOMEWORK_getPageBenWork_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getPageBenWork", BASE_URL])
/*
 userName       In String 用户名/登录名/学号 M
 workKind       In String 4：作业 3： 考试 M
 classification In String “0” 查询今日发布的作业 “1”查询除今天外的近期作业 若为科目查询 可为空 O
 subjectId      In String 科目id 可为空 请求时 根据科目请求才有 O
 name           In String 有关键字，则为搜索 不是搜索时，一律为空 O
 pageSize       In Int    每页显示数目( 请求) M
 currentPage    In Int    当前页码 (请求) M
 */

NS_INLINE NSDictionary *HomeworkgetPageBenWork(NSString *userName, NSString *workKind, NSString *classification, NSString *subjectId, NSString *name, NSNumber *currentPage, NSNumber *pageSize, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(workKind);
    setObjectForKey(classification);
    setObjectForKey(subjectId);
    setObjectForKey(name);
    setObjectForKey(currentPage);
    setObjectForKey(pageSize);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 2.2.2 获取作业考试详情
#define HOMEWORK_getPhoneWorkPojo_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getPhoneWorkPojo", BASE_URL])
/*
 userName   In String 用户名/登录名/学号 M
 workKind   In String 4：作业 3： 考试 M
 workId     In String 作业或考试id M
 */
NS_INLINE NSDictionary *HomeworkGetPhoneWorkPojobyidParameter(NSString *userName, NSString *workKind, NSString *workId, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(workKind);
    setObjectForKey(workId);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 2.3.1 试题上传保存答案、作业考试整体提交（选择、判断）

#define HOMEWORK_saveStudentWorkDetail_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/saveStudentWorkDetail", BASE_URL])
/*
 userName   In String 用户名/登录名/学号 M
 testId     In String 试题的id M
 answer     In String 学生作答内容（客观：答案要大写加分号如：A;B 正确;）
 填空，简答： "文字答案插入图片<img src=\"" + url1+ "\" />。文字答案。。再插入一张图片<img src=\"" + url2+ "\" />。"
 url1  url2 是 平台返回的图片地址 M
 
 pointsGet  In float 得到的分数（比如，我传给你的该题满分10分，答对给我10，半对给我5，错了给我0 小数点后两位） M
 answerStatus  In String 单道试题对错情况 0表示错误， 1表示正确， 2表示半对 未作答可为0错误
 
 注：对于客观题，相当于自动阅卷，但是教师没有批阅的情况下，不显示正确答案。
 只要未提交，则可修改。
 */
NS_INLINE NSDictionary *HomeworkSaveStudentWorkDetailParameter(NSString *userName, NSString *workDetailId, NSString *testId, NSString *answer, NSNumber *pointsGet, NSString *answerStatus, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(workDetailId);
    setObjectForKey(testId);
    setObjectForKey(answer);
    setObjectForKey(pointsGet);
    setObjectForKey(answerStatus);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}


#pragma mark - 2.3.2 试题上传保存答案、作业考试整体提交（填空、简答）

#pragma mark - 2.3.2.1 试题上传保存答案、作业考试整体提交（上传图片）
/**
 上传图片包括：填空简单题，提问以及更换头像
 from: 1:提问 2:试题 3:头像
 */
#define UPLOAD_uploadImage_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/uploadImg", BASE_URL])
NS_INLINE NSDictionary *uploadImageParameter(NSString *userName, NSString *from, NSString *order, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(verify);
    setObjectForKey(order);
    setObjectForKey(userName);
    setObjectForKey(time);
    setObjectForKey(from);
    setObjectForKey(appKey);
    setObjectForKey(version);
    return dictionary.copy;
}

#pragma mark - 2.3.2.2 试题上传保存答案、作业考试整体提交（上传填空、简答答案）


#pragma mark - 2.3.3 作业、考试试卷提交

#define HOMEWORK_saveStudentWorkState_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/saveStudentWorkState", BASE_URL])
/*
 userName   In String 用户名/登录名/学号 M
 workId     In String 作业或考试id M
 status     In String 默认传“1”
 */
NS_INLINE NSDictionary *HomeworkSaveStudentWorkStateParameter(NSString *userName, NSString *workKind, NSString *workId, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(workKind);
    setObjectForKey(workId);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}


#pragma mark - 3. 互动答疑

#pragma mark - 3.1 互动答疑列表（单个试题或微课程资源提问列表）

#pragma mark - 3.1.1 获取全部互动答疑列表（获取单个试题或微课程的提问列表）

#define QUESTIONANSWER_getPageBeanForum_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getPageBeanForum", BASE_URL])
/*
 注意：互动答疑界面获取提问列表的接口与试题界面获取提问列表的接口是一个，按照需要传字段。并按照需要取字段。
 
 userName       In String 用户名 M
 forumKind      In String
 微课程：“2” 和 resourceId
 答疑的：forumKind=3
 作业的试题的：   forumKind=5 和  workId   和  testId
 作业整体的提问：forumKind=5 和  workId （考试的试题不可以提问） O
 手机端没有作业整体的提问
 workId         In String 作业或考试id（获取单个试题或微课程的提问列表才需该字段） M
 resourceId     In String 微课程id（获取单个试题或微课程的提问列表才需该字段）
 testId         In String 试题的id（获取单个试题或微课程的提问列表才需该字段） O
 authorAccountId In String User.id用户的id 有值表示查自己提问，没有查所有的
 pageSize       In int 每页显示数目 M
 currentPage    In int 页码 M
 */

NS_INLINE NSDictionary *QuestionAnswerGetPageBeanForumParameter(NSString *userName, NSString *forumKind, NSString *workId, NSString *resourceId, NSString *testId, NSString *authorAccountId, NSNumber *pageSize, NSNumber *currentPage, NSString *time, NSString *appKey, NSString *version, NSString *verify) {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    
    if (forumKind && forumKind.length > 0) {
        setObjectForKey(forumKind);
    }
    if (workId && workId.length > 0) {
        setObjectForKey(workId);
    }
    if (resourceId && resourceId.length > 0) {
        setObjectForKey(resourceId);
    }
    if (testId && testId.length > 0) {
        setObjectForKey(testId);
    }
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 3.1.2 获取单个试题或微课程的提问列表
// 同上，根据需要传字段

#pragma mark - 3.1.3 单个答疑/提问的详情

#define QUESTIONANSWER_getSingleForum_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getSingleForum", BASE_URL])
/*
 userName    In String  用户名 M
 forumId     In String  答疑/提问的id M
 pageSize    In Int     每页显示数目(请求) M
 currentPage In Int     当前页码 (请求)   M
 */
NS_INLINE NSDictionary *QuestionAnswerGetForum(NSString *userName, NSString *forumId, NSNumber *currentPage, NSNumber *pageSize, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(forumId);
    setObjectForKey(currentPage);
    setObjectForKey(pageSize);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 3.2 新增提问
#define QUESTIONANSWER_saveForumPojo_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/saveForumPojo", BASE_URL])
/*
 userName    In String  用户名 M
 forumKind   In String 2 :微课程？ 5：作业 ?： 3: 互动答疑单独提问（单独提问可为空）
 workId      In String 作业或考试id（单独提问可为空） O
 resourceId  In String 微课程ID（单独提问可为空）
 testId      In String 试题的id（单独提问可为空） O
 fromPhoneTitle In String 来源 自己拼 分号 隔开（作业、考试） 作业;数学；第三章测试题 微课程；就直接微课程就行 客户端显示的时候自己分隔一下 然后中间再用空格和点 代替 作业• 数学•第三章测试题 （单独提问可为空） O
 姚：需要新建一个字段
 title       In String 提问的具体问题内容  图片URL “我的文字具体问题……..提问提问 <img src=\”“ + url1+ “\” />;<img src=\”“ + url2+ “\” /> ;<img src=\”“ + url3+ “\” />“
*/

NS_INLINE NSDictionary *QuestionAnswerSaveForumPojo(NSString *userName, NSString *forumKind, NSString *workId, NSString *resourceId, NSString *testId, NSString *fromPhoneTitle, NSString *title, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    if (forumKind && forumKind.length > 0) {
        setObjectForKey(forumKind);
    }
    if (workId && workId.length > 0) {
        setObjectForKey(workId);
    }
    if (resourceId && resourceId.length > 0) {
        setObjectForKey(resourceId);
    }
    if (testId && testId.length > 0) {
        setObjectForKey(testId);
    }
    if (fromPhoneTitle && fromPhoneTitle.length > 0) {
        setObjectForKey(fromPhoneTitle);
    }
    setObjectForKey(title);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}


#pragma mark - 3.3 回答/回复
#define QUESTIONANSWER_saveReplay_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/saveReplay", BASE_URL])
/*
 userName       In String  用户名 M
 forumId        In String  答疑/提问的id M
 replyContent   In String  回复内容 M
 */
NS_INLINE NSDictionary *QuestionAnswerSaveReplay(NSString *userName, NSString *forumId, NSString *replyContent, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(forumId);
    setObjectForKey(replyContent);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 3.4 推送回复给App

#define WEIKE_mergeGT_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/mergeGT", BASE_URL])
/*
 userName	In	String	用户名
 gtCid      In	String	个推返回的cid / ios 是别的
 phoneType	In	String	系统 ANDROID  IOS 注意大写
 gtTag      In	String	分组相关 暂时传空 后期扩展用
 gtAlias	In	String	别名暂时传空 后期扩展用
 */
NS_INLINE NSDictionary *WeikeMergeGTParameter(NSString *userName, NSString *gtCid, NSString *phoneType, NSString *gtTag, NSString *gtAlias, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(gtCid);
    setObjectForKey(phoneType);
    setObjectForKey(gtTag);
    setObjectForKey(gtAlias);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 4. 微课程（视频和其他资源）

#pragma mark - 4.1 获取全部微课程科目
#pragma mark - 4.2 获取（全部）或指定科目对应的微课程列表

#define WEIKE_getPageBenWeiKeChengPojo_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getPageBenWeiKeChengPojo", BASE_URL])
/*
 userName    In String  用户名 M
 subjectId   In String  科目ID 为空则获取全部列表 M
 pageSize    In Int     每页显示数目(请求) M
 currentPage In Int     当前页码 (请求)   M
 */
NS_INLINE NSDictionary *WeikeGetPageBenWeiKeChengPojo(NSString *userName, NSString *subjectId, NSNumber *currentPage, NSNumber *pageSize, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(subjectId);
    setObjectForKey(currentPage);
    setObjectForKey(pageSize);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 4.3 微课程详情的基本信息

#define WEIKE_getWeiKeChengPojoById_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getWeiKeChengPojoById", BASE_URL])
/*
 userName           In String  用户名 M
 courseResourceId   In String  微课程Id M
 */
NS_INLINE NSDictionary *WeikeGetWeiKeChengPojoById(NSString *userName, NSString *courseResourceId, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(courseResourceId);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 4.4 微课程的提问列表
#pragma mark - 4.5 微课程提问新增
#pragma mark - 4.6 微课程中的提问的回复
#pragma mark - 4.7 学生观看微课程视频最后观看位置

#define WEIKE_getStudentResourceLog_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getStudentResourceLog", BASE_URL])
/*
 userName     In String  用户名 M
 resourceId   In String  视频资源Id M
 */
NS_INLINE NSDictionary *WeikeGetStudentResourceLog(NSString *userName, NSString *resourceId, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(resourceId);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 4.8 更新资源点击或播放次数，（若是视频，更新最后播放位置）

#define WEIKE_updateStudentResourceLog_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/updateStudentResourceLog", BASE_URL])
/*
 userName     In String  用户名 M
 resourceId   In String  视频资源Id M
 lastLength   In Int     上次观看 该视频的位置（分钟） 如果不是视频资源 传0
 */
NS_INLINE NSDictionary *WeikeUpdateStudentResourceLog(NSString *userName, NSString *resourceId, NSNumber *lastLength, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(resourceId);
    setObjectForKey(lastLength);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 5. 我的

#pragma mark - 5.1 我的基本信息（登录后已返回）

#pragma mark - 5.1.1 修改头像

#pragma mark - 5.2 错题集

#define MINE_getWorkQuestionErrorPageBean_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getWorkQuestionErrorPageBean", BASE_URL])
/*
 userName    In String  用户名 M
 subjectId   In String  科目ID 为空则获取全部列表 M
 pageSize    In Int     每页显示数目(请求) M
 currentPage In Int     当前页码 (请求)   M
 */
NS_INLINE NSDictionary *MineGetWorkQuestionErrorPageBean(NSString *userName, NSString *subjectId, NSNumber *currentPage, NSNumber *pageSize, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(subjectId);
    setObjectForKey(currentPage);
    setObjectForKey(pageSize);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 5.3 积分

#pragma mark - 5.3.1 我的积分/积分排行榜

#define MINE_getListStudentScore_URL ([NSString stringWithFormat:@"%@/WeikePhoneWebService/api/service/getListStudentScore", BASE_URL])
/*
 userName    In String  用户名 M
*/
NS_INLINE NSDictionary *MineGetListStudentScore(NSString *userName, NSString *time, NSString *appKey, NSString *version, NSString *verify){
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    setObjectForKey(userName);
    setObjectForKey(time);
    setObjectForKey(appKey);
    setObjectForKey(version);
    setObjectForKey(verify);
    return dictionary.copy;
}

#pragma mark - 5.3.2 积分规则

#pragma mark - 5.4 收藏（暂时本地，后期同步数据）

#endif /* InterfaceMacro_h */
