//
//  Header.h
//  XX_WeChat
//
//  Created by xuejiani on 2017/5/11.
//  Copyright © 2017年 IANI. All rights reserved.
//

#ifndef Header_h
#define Header_h

//Color
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define zkHexColor(hexValue) [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0 green:((float)(((hexValue) & 0xFF00) >> 8))/255.0 blue:((float)((hexValue) & 0xFF))/255.0 alpha:1.0]
#define HexAlphaColor(hexValue,a) [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0 green:((float)(((hexValue) & 0xFF00) >> 8))/255.0 blue:((float)((hexValue) & 0xFF))/255.0 alpha:(a)/1.0f]


// Hook初始化

#define NVConcat_(a, b) a ## b
#define NVConcat(a, b) NVConcat_(a, b)

#define NVConstructor static __attribute__((constructor)) void NVConcat(NVConstructor, __LINE__)()

// 交换示例方法
#define NVHookInstanceMethod(classname, ori_sel, new_sel) \
\
{ \
Class class = objc_getClass(#classname); \
Method ori_method = class_getInstanceMethod(class, ori_sel); \
Method new_method = class_getInstanceMethod(class, new_sel); \
method_exchangeImplementations(ori_method, new_method); \
} \
\

// 交换类方法
#define NVHookClassMethod(classname, ori_sel, new_sel) \
\
{ \
Class class = objc_getClass(#classname); \
Method ori_method = class_getClassMethod(class, ori_sel); \
Method new_method = class_getClassMethod(class, new_sel); \
method_exchangeImplementations(ori_method, new_method); \
} \
\

// .h文件
#define NV_SingletonH(name) + (instancetype)shared##name;

// .m文件
#define NV_SingletonM(name) \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

#endif /* Header_h */
