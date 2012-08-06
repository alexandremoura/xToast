//
//  xToast.h
//  xToast - The eXtendable Toast Message for iOS Development
//
// Copyright (c) 2012, Alexandre Moura
// All rights reserved.
//  
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//  
//  Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//  Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

// Duration time of fade animation, in seconds
#define DURATION 1

// Time before start fade animation, in seconds
#define SHOWTIME 1

// Default colors of Background Gradient
#define BGUPCOLOR [[UIColor blackColor] colorWithAlphaComponent:.7]
#define BGDWCOLOR [[UIColor blackColor] colorWithAlphaComponent:.85]

// Default Border Color
#define BORDERCOLOR [[UIColor whiteColor] colorWithAlphaComponent:1]

//Default Text Color
#define TEXTCOLOR [[UIColor whiteColor] colorWithAlphaComponent:1]

@interface xToast : NSObject {
}
@property (strong) NSString *text;
@property (strong) UILabel *label;
@property (strong) UIColor *bgUpColor;
@property (strong) UIColor *bgDwColor;
@property (strong) UIColor *borderColor;
@property (strong) UIColor *textColor;

- (void) show;
+ (xToast *) makeText:(NSString *) text;
- (void) hide;
- (void) showAndHideAfter: (int) seconds;
@end