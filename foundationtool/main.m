//
//  main.m
//  foundationtool
//
//  Created by Alexander v. Below on 18.03.15.
//  Copyright (c) 2015 Alexander von Below. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSBundle *mainBundle = [NSBundle mainBundle];
        printf("mainBundle: %s\n", mainBundle.description.UTF8String);
        NSString *lipsumPath = [mainBundle pathForResource:@"lipsum" ofType:@"txt"];
        if (lipsumPath != nil) {
            NSString *lipsum = [NSString stringWithContentsOfFile:lipsumPath usedEncoding:nil error:nil];
            printf("Lipsum: %s\n", lipsum.UTF8String);
        }
        else {
            puts("Did not find Lipsum");
        }
        NSArray *arguments = [NSProcessInfo processInfo].arguments;
        if (arguments.count > 1) {
            printf("Hello, %s\n", ((NSString *)arguments[1]).UTF8String);
        }
        else {
            puts("No argument provided!");
        }
    }
    return 0;
}
