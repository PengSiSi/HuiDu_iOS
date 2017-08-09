//
//  HTTPTool.h
//  TestContact
//
//  Created by AlicePan on 16/9/18.
//  Copyright © 2016年 AlicePan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/**
 请求成功后的回调

 @param json 服务器返回的JSON数据
 */
typedef void (^HttpSuccess)(id json);

/**
 请求失败后的回调

 @param error 错误信息
 */
typedef void (^HttpFailure)(NSError *error);

typedef void (^DownloadResponse)(NSURLResponse *response, NSURL *filePath, NSError *error);

/**
 文件下载进度回调

 @param progress 进度
 @param total 文件总大小
 @param current 当前已下载大小
 */
typedef void (^DownloadProgress)(CGFloat progress, CGFloat total, CGFloat current);

/**
 文件下载完成回调

 @param state 是否已经下载完成
 @param message 提示信息
 @param filePath 文件下载路径
 */
typedef void (^CompletionState)(BOOL state, NSString *message, NSString *filePath);

@interface HTTPTool : NSObject

/**
 *  发送一POST请求
 *
 *  @param url     请求路径
 *  @param headers 请求headers参数
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)postWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

/**
 *  发送一GET请求
 *
 *  @param url     请求路径
 *  @param headers 请求headers参数
 *  @param params  请求参数
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)getWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;


+ (void)soapWithMethod:(NSString *)method param:(NSString *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

+ (void)postXMLWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

/**
 *  上传图片
 *
 *  @param url          请求路径
 *  @param params       请求参数
 *  @param image        上传的图片
 *  @param imageName    上传的图片名
 *  @param success      请求成功后的回调
 *  @param failure      请求失败后的回调
 */
+ (void)upLoadWithURL:(NSString *)url param:(NSDictionary *)params image:(UIImage *)image imageName:(NSString *)imageName success:(HttpSuccess)success failure:(HttpFailure)failure;

/**
 *  上传多张图片
 *
 *  @param url          请求路径
 *  @param params       请求参数
 *  @param imageDicArray     上传的图片字典 包含图片和图片名 {@"imageName":@"name.png",@"image":@"UIImage"}
 *  @param success      请求成功后的回调
 *  @param failure      请求失败后的回调
 */
+ (void)upLoadMutiWithURL:(NSString *)url param:(NSDictionary *)params imageDicArray:(NSArray *)imageDicArray success:(HttpSuccess)success failure:(HttpFailure)failure;

+ (void)upLoadMutiWithURL:(NSString *)url headers:(NSDictionary *)headers param:(NSDictionary *)params imageDicArray:(NSArray *)imageDicArray success:(HttpSuccess)success failure:(HttpFailure)failure;

/**
 *  下载文件
 *
 *  @param url     文件路径
 *  @param name 文件保存的名称
 *  @param path 文件的Document下的哪个文件夹下
 */
+ (void)downLoadWithUrl:(NSString *)url withName:(NSString *)name withFilePath:(NSString *)path;

+ (void)downLoadWithUrl:(NSString *)url fileName:(NSString *)fileName customFilePath:(NSString *)customFilePath downloadResponse:(DownloadResponse)downloadResponse;

/**
  下载文件

 @param url Url地址
 @param name 文件保存的名称
 @param filePath 文件的Document下的哪个文件夹下
 @param progress 下载进度回调
 @param completion 下载完成回调
 */

+ (NSURLSessionDownloadTask *)downLoadWithUrl:(NSString *)url withName:(NSString *)name withFilePath:(NSString *)filePath downLoadPrpgrsss:(DownloadProgress)progress state:(CompletionState)completion;

/**
 暂停下载任务

 @param task task
 */
+ (void)downLoadPause:(NSURLSessionDownloadTask *)task;

/**
 继续下载任务

 @param task task
 */
+ (void)downLoadStart:(NSURLSessionDownloadTask *)task;


@end

@interface AFHTTPSessionManager (SOAP)

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                  soapStringData:(NSData *)soapStringData
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end
