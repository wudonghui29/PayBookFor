//
//  AppDelegate.h
//  PayBookFor
//
//  Created by Faith on 15-5-14.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class VdiskSession;
@class ViewController;
@class myViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UINavigationController *catalogNavigationController;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

