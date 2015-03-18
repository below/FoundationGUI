//
//  ViewController.h
//  FoundationGUI
//
//  Created by Alexander v. Below on 18.03.15.
//  Copyright (c) 2015 Alexander von Below. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *input;
@property (unsafe_unretained) IBOutlet NSTextView *output;


@end

