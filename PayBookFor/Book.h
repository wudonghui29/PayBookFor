//
//  Book.h
//  PayBookFor
//
//  Created by Faith on 15-5-15.
//  Copyright (c) 2015年 Faith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * author;

@end
