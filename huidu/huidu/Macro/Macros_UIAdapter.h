/*
 * Instruction: all aspect is width / height
 */

#ifndef Macros_UIAdapter_h
#define Macros_UIAdapter_h

#define K_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define K_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// Constants
#define K_PHONE_6_SCREEN_WIDTH (375.0f)
#define K_PHONE_6_SCREEN_HEIGHT (667.0f)
#define K_PHONE_5_SCREEN_WIDTH (320.f)
#define K_PHONE_5_SCREEN_HEIGHT (568.f)
#define K_STATUS_BAR_HEIGHT (20.f)
#define K_NAVIGATION_BAR_HEIGHT (44.f)
#define K_STATUS_BAR_AND_NAVI_BAR_H (64.0f) // 20.0 + 44.0
#define K_TAB_BAR_H (49.0f)
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

#endif /* Macros_UIAdapter_h */
