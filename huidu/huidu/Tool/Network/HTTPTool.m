//
//  HTTPTool.m
//  TestContact
//
//  Created by AlicePan on 16/9/18.
//  Copyright © 2016年 AlicePan. All rights reserved.
//

#import "HTTPTool.h"
//#import "UtilsMacro.h"
//#import "CombancHUD.h"

#define TIMEOUTINTERVAL 70
#define KDOWNLOADALREADY @"此文件已下载，请在已下载中查看"
#define KCHOOSEWRONGTIME @"您选择的结束时间不对，请重新选择"
#define KDOWNLOADSUCCESS @"下载成功"
#define KDOWNLOADFAIL @"下载失败,请稍后再试"

@implementation HTTPTool

#pragma mark - GET

+ (void)getWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    [self requestWithType:@"GET" url:url headers:headers params:params success:success failure:failure];
}

#pragma mark - POST

+ (void)postWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    [self requestWithType:@"POST" url:url headers:headers params:params success:success failure:failure];
}

+ (void)requestWithType:(NSString *)type url:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = TIMEOUTINTERVAL;
    //设置请求头
    if (headers != nil) {
        for (id httpHeaderField in headers.allKeys) {
            id value = headers[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            }else{
                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    if ([type isEqualToString:@"GET"]) {
        [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 请求成功的时候会调用这里的代码
            // 通知外面的block，请求成功了
            if (success) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                success(json);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 请求失败的时候会调用这里的代码
            // 通知外面的block，请求失败了
            if (failure) {
                failure(error);
            }
        }];
    }else if ([type isEqualToString:@"POST"]){
        [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            // 请求成功的时候会调用这里的代码
            // 通知外面的block，请求成功了
            if (success) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                success(json);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            // 请求失败的时候会调用这里的代码
            // 通知外面的block，请求失败了
            if (failure) {
                failure(error);
            }
        }];
    }
}

#pragma mark - POST XML解析

+ (void)postXMLWithURL:(NSString *)url headers:(NSDictionary *)headers params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIMEOUTINTERVAL;
    //设置请求头
    if (headers != nil) {
        for (id httpHeaderField in headers.allKeys) {
            id value = headers[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            }else{
                NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    [manager POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功的时候会调用这里的代码
        // 通知外面的block，请求成功了
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败的时候会调用这里的代码
        // 通知外面的block，请求失败了
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark - SOAP

+ (void)soapWithMethod:(NSString *)method param:(NSString *)params success:(HttpSuccess)success failure:(HttpFailure)failure {
    
}

#pragma mark - UpLoad

+ (void)upLoadWithURL:(NSString *)url param:(NSDictionary *)params image:(UIImage *)image imageName:(NSString *)imageName success:(HttpSuccess)success failure:(HttpFailure)failure{
    
    //将图片存至Temp文件夹下 并拿到其路径
    NSURL *imageUrl = [self writeImageToFile:image imageName:imageName];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // formData是遵守了AFMultipartFormData的对象
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //  avatar
        [formData appendPartWithFileURL:imageUrl name:@"avatar" error:NULL];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            success(json);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)upLoadMutiWithURL:(NSString *)url param:(NSDictionary *)params imageDicArray:(NSArray *)imageDicArray success:(HttpSuccess)success failure:(HttpFailure)failure {
    //存放保存至沙盒中的图片路径
    NSMutableArray *imageUrlArr = [NSMutableArray arrayWithCapacity:10];
    
    dispatch_queue_t queue =  dispatch_queue_create("cccccccccccccc", NULL);
    
    // 将任务添加到队列中
    dispatch_async(queue, ^{
        
        for (NSDictionary *dic in imageDicArray) {
            UIImage *image = dic[@"image"];
            NSString *imageName = dic[@"imageName"];
            //将图片存至Temp文件夹下 并拿到其路径
            
            NSURL *imageUrl = [self writeImageToFile:image imageName:imageName];
            [imageUrlArr addObject:imageUrl];
        }
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        // formData是遵守了AFMultipartFormData的对象
        [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            //遍历
            for (NSURL *imageUrl in imageUrlArr) {
                
                [formData appendPartWithFileURL:imageUrl name:@"attachments" error:NULL];
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                success(json);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    });
}

+ (void)upLoadMutiWithURL:(NSString *)url headers:(NSDictionary *)headers param:(NSDictionary *)params imageDicArray:(NSArray *)imageDicArray success:(HttpSuccess)success failure:(HttpFailure)failure {
    //存放保存至沙盒中的图片路径
    NSMutableArray *imageUrlArr = [NSMutableArray arrayWithCapacity:10];
    dispatch_queue_t queue =  dispatch_queue_create("cccccccccccccc", NULL);
    
    // 将任务添加到队列中
//    dispatch_async(queue, ^{
        for (NSDictionary *dic in imageDicArray) {
            UIImage *image = dic[@"image"];
            NSString *imageName = dic[@"imageName"];
            //将图片存至Temp文件夹下 并拿到其路径
            NSURL *imageUrl = [self writeImageToFile:image imageName:imageName];
            [imageUrlArr addObject:imageUrl];
        }
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        // 设置请求头
        if (headers != nil) {
            for (id httpHeaderField in headers.allKeys) {
                id value = headers[httpHeaderField];
                if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                    [manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
                }else if ([value isKindOfClass:[NSNumber class]]) {
                    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@",value] forHTTPHeaderField:(NSString *)httpHeaderField];
                }else{
                    NSLog(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
                }
            }
        }
        // formData是遵守了AFMultipartFormData的对象
        [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            //遍历
            for (NSURL *imageUrl in imageUrlArr) {
                [formData appendPartWithFileURL:imageUrl name:@"file" error:NULL];
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
                        
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];

                NSFileManager *fileManager = [NSFileManager defaultManager];
                NSString *tempPath = NSTemporaryDirectory();
                NSString *upLoadFilePath = [tempPath stringByAppendingPathComponent:[NSString stringWithFormat:@"upLoadFile"]];
                [fileManager removeItemAtPath:upLoadFilePath error:nil];
                
                success(json);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
//    });
}

#pragma mark - DownLoad

+ (void)downLoadWithUrl:(NSString *)url withName:(NSString *)name withFilePath:(NSString *)path {
//    [CombancHUD show];
//    [CombancHUD setDefaultMaskType:CombancHUDMaskTypeClear];
//    [CombancHUD showWithMaskType:SVProgressHUDMaskTypeClear];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *aFilePath = [docPath stringByAppendingPathComponent:path];
    NSString *fileNamePath = [aFilePath stringByAppendingPathComponent:name];
    
    //path 文件url filePath文件夹url

    if ([fileManager fileExistsAtPath:aFilePath]) {
        //文件夹路径存在
        if ([fileManager fileExistsAtPath:fileNamePath]) {
            //文件存在
//            [CombancHUD showInfoWithStatus:KDOWNLOADALREADY];
        } else {
            //文件不存在
            NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];
                return [filePathURL URLByAppendingPathComponent:name];
            } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                //NSLog(@"File downloaded to: %@", filePath);
                //加载下载后的文件
                if (filePath.absoluteString.length > 0) {
//                    [CombancHUD showSuccessWithStatus:KDOWNLOADSUCCESS];
                } else {
//                    [CombancHUD showErrorWithStatus:KDOWNLOADFAIL];
                }
            }];
            [downloadTask resume];
        }
    } else {
        //文件夹路径不存在
        NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            //创建路径
            [fileManager createDirectoryAtPath:aFilePath withIntermediateDirectories:YES attributes:nil error:nil];
            NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];
            return [filePathURL URLByAppendingPathComponent:name];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            //NSLog(@"File downloaded to: %@", filePath);
            
            //下载文件
            NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];
                return [filePathURL URLByAppendingPathComponent:name];
            } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                //NSLog(@"File downloaded to: %@", filePath);
                //加载下载后的文件
                if (filePath.absoluteString.length > 0) {
//                    [CombancHUD showSuccessWithStatus:KDOWNLOADSUCCESS];
                } else {
//                    [CombancHUD showErrorWithStatus:KDOWNLOADFAIL];
                }
            }];
            [downloadTask resume];
        }];
        [downloadTask resume];
    }
}

+ (void)downLoadWithUrl:(NSString *)url fileName:(NSString *)fileName customFilePath:(NSString *)customFilePath downloadResponse:(DownloadResponse)downloadResponse {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager.securityPolicy setAllowInvalidCertificates:YES];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *aFilePath = [docPath stringByAppendingPathComponent:customFilePath];
    NSString *fileNamePath = [aFilePath stringByAppendingPathComponent:fileName];
    
    //path 文件url filePath文件夹url
    if ([fileManager fileExistsAtPath:aFilePath]) { //文件夹路径存在
        if ([fileManager fileExistsAtPath:fileNamePath]) { //文件存在
            downloadResponse(nil, [NSURL URLWithString:fileNamePath], nil);
        } else { //文件不存在
            NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];
                return [filePathURL URLByAppendingPathComponent:fileName];
            } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                downloadResponse(response, filePath, error);
            }];
            [downloadTask resume];
        }
    } else { //文件夹路径不存在
        NSURLSessionDownloadTask *fileDownloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
            //创建路径
            [fileManager createDirectoryAtPath:aFilePath withIntermediateDirectories:YES attributes:nil error:nil];
            NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];
            return [filePathURL URLByAppendingPathComponent:fileName];
        } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
            //下载文件
            NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];
                return [filePathURL URLByAppendingPathComponent:fileName];
            } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                downloadResponse(response, filePath, error);
            }];
            [downloadTask resume];
        }];
        [fileDownloadTask resume];
    }
}

+ (NSURL *)writeImageToFile:(UIImage *)image imageName:(NSString *)imageName{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *tempPath = NSTemporaryDirectory();
    NSString *upLoadFilePath = [tempPath stringByAppendingPathComponent:[NSString stringWithFormat:@"upLoadFile"]];
    if([fileManager fileExistsAtPath:upLoadFilePath]){
    }else{
        //创建路径
        [fileManager createDirectoryAtPath:upLoadFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSData *data = [[NSData alloc] init];
    if ([image isKindOfClass:[NSString class]]) {
        data = [NSData dataWithContentsOfURL:[NSURL URLWithString:(NSString *)image]];
    }else{
        
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 0.2);
        } else {
            data = UIImagePNGRepresentation(image);
        }
    }
    //创建文件
    if (data) {
        
        [fileManager createFileAtPath:[upLoadFilePath stringByAppendingString:[NSString stringWithFormat:@"/%@",imageName]] contents:data attributes:nil];
    }
    
    //根据路径得到URL
    NSString *thumbUrl = [NSString stringWithFormat:@"%@/%@",upLoadFilePath,imageName];
    //写入文件
    [data writeToFile:thumbUrl atomically:YES];
    NSURL *imgUrl = [NSURL fileURLWithPath:thumbUrl];
    
    return imgUrl;
}


+ (NSURLSessionDownloadTask *)downLoadWithUrl:(NSString *)url withName:(NSString *)name withFilePath:(NSString *)filePath downLoadPrpgrsss:(DownloadProgress)progress state:(CompletionState)completion {
    
    // 1、设置请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    // 2、初始化
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 10000;
    configuration.timeoutIntervalForResource = 10000;
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    // 3、开始下载
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress *_Nonnull downloadProgress) {
        progress(1.0 *downloadProgress.completedUnitCount / downloadProgress.totalUnitCount,1.0 *downloadProgress.totalUnitCount,1.0 *downloadProgress.completedUnitCount);
    } destination:^NSURL *_Nonnull(NSURL *_Nonnull targetPath, NSURLResponse *_Nonnull response) {
        // 这里要返回一个NSURL，其实就是文件的位置路径
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *aFilePath = [docPath stringByAppendingPathComponent:filePath];
        [fileManager createDirectoryAtPath:aFilePath withIntermediateDirectories:YES attributes:nil error:nil];
        NSURL *filePathURL = [NSURL fileURLWithPath:aFilePath];

        //转化为文件路径
        return [filePathURL URLByAppendingPathComponent:name];
    } completionHandler:^(NSURLResponse *_Nonnull response, NSURL *_Nullable filePath, NSError *_Nullable error) {
        // 如果下载的是压缩包的话，可以在这里进行解压
        NSLog(@"error.domain----%@ error.code---%ld error---%@",error.domain,error.code,error);
        // 下载成功
        if (error == nil) {
            completion(YES,@"下载完成",[filePath path]);
        }else{//下载失败的时候，只列举判断了两种错误状态码
            NSString *message = nil;
            if (error.code == - 1005) {
                message = @"网络异常";
            }else if (error.code == -1001){
                message = @"请求超时";
            }else{
                message = @"未知错误";
            }
            completion(NO,message,nil);
        }
    }];
    return task;
}

+ (void)downLoadPause:(NSURLSessionDownloadTask *)task {
    [task suspend];
}

+ (void)downLoadStart:(NSURLSessionDownloadTask *)task {
    [task resume];
}

@end

@implementation AFHTTPSessionManager (SOAP)

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                  soapStringData:(NSData *)soapStringData
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:nil error:&serializationError];
    request.HTTPBody = soapStringData;
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
        
        return nil;
    }
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [self dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            if (failure) {
                failure(dataTask, error);
            }
        } else {
            if (success) {
                success(dataTask, responseObject);
            }
        }
    }];
    [dataTask resume];
    return dataTask;
}

@end
