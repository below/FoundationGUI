//
//  ViewController.m
//  FoundationGUI
//
//  Created by Alexander v. Below on 18.03.15.
//  Copyright (c) 2015 Alexander von Below. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)go:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"foundationtool"];
    NSString *input = self.input.stringValue;
    if (path != nil && input != nil) {
        NSString *command = [NSString stringWithFormat:@"%@ %@", path, self.input.stringValue];
        FILE * fp = popen([command UTF8String], "r");
        if (fp == NULL) {
            NSLog(@"Unable to run %@", command);
        }
        else {
            NSMutableString *output = [NSMutableString new];
            char cOut[1024];
            while (fgets(cOut, sizeof(cOut)-1, fp) != NULL) {
                [output appendFormat:@"%s", cOut];
            }
            pclose(fp);
            NSAttributedString *as = [[NSAttributedString alloc] initWithString:output];
            [self.output.textStorage appendAttributedString:as];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
