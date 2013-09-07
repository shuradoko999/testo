//
//  WDAppDelegate.mm
//
//  Created by  on 01/09/2013.
//  Copyright . All rights reserved.
//

#import "WDAppDelegate.h"

void InitInstance();
void InitModule(const struct _stMyModuleInfo* pstModule);
void LoadWDLFile(NSString*);
void InitExec();
void TermExec();
void InitInternalLanguage(int);
void ExecWillResignActive();
void ExecDidBecomeActive();
extern const struct _stMyModuleInfo gstMyModuleInfo1;
void OBJ_InitIOS(UIWindow *pclWindow);
void OBJ_SendApplicationWillResignActive(void);
void OBJ_SendApplicationDidBecomeActive(void);
extern const struct _stMyModuleInfo gstMyModuleInfo3;
extern const struct _stMyModuleInfo gstMyModuleInfo8;
extern const struct _stMyModuleInfo gstMyModuleInfo61;
extern const struct _stMyModuleInfo gstMyModuleInfo68;


@implementation WDAppDelegate

@synthesize window; 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{   
	CGRect screenBounds = [ [ UIScreen mainScreen ] bounds ]; 
	window = [ [ UIWindow alloc ] initWithFrame: screenBounds ];
	
	OBJ_InitIOS(window);
	InitInstance();
	InitInternalLanguage(9);
	InitModule(&gstMyModuleInfo1);
	InitModule(&gstMyModuleInfo3);
	InitModule(&gstMyModuleInfo8);
	InitModule(&gstMyModuleInfo61);
	InitModule(&gstMyModuleInfo68);
	InitExec();
	LoadWDLFile(@"cfdt feuvert");

    
    [window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    	OBJ_SendApplicationWillResignActive();
	ExecWillResignActive();

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    	ExecDidBecomeActive();
	OBJ_SendApplicationDidBecomeActive();

}


- (void)applicationWillTerminate:(UIApplication *)application {
    TermExec();
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
