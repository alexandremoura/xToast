//
//  xToast.m
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


#import "xToast.h"

@implementation xToast
@synthesize text;
@synthesize label;
@synthesize bgDwColor, bgUpColor, borderColor, textColor;

- (id) initWithText:(NSString *) _text{
    if (self = [super init]) {
        text = [_text copy];
    }
    
    self.bgDwColor = BGDWCOLOR;
    self.bgUpColor = BGUPCOLOR;
    self.borderColor = BORDERCOLOR;
    self.textColor = TEXTCOLOR;
    return self;
}

- (void) show{
    [self showAndHideAfter:SHOWTIME];
}

+ (xToast *) makeText:(NSString *) _text{
    xToast *toast = [[xToast alloc] initWithText:_text];
    return toast;
}

- (void) hide{
    [UIView animateWithDuration:DURATION animations:^{
        label.alpha = 0.0f; 
    }];
}

- (void) showAndHideAfter: (int) seconds{
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize textSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(245, 60)];
    int width = textSize.width+50;
    int height = textSize.height+8;
    CGPoint point = CGPointMake(window.frame.size.width/2, window.frame.size.height-45);
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, window.frame.size.height - 45, width, height)];
    label.center = point;
    UILabel *labelGradiente = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    labelGradiente.backgroundColor = [UIColor clearColor];
    labelGradiente.textColor = self.textColor;
    labelGradiente.font = font;
    labelGradiente.text = text;
    labelGradiente.numberOfLines = 0;
    labelGradiente.TextAlignment = UITextAlignmentCenter;
    
    UIView* gradientViewH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    CAGradientLayer *gradientH = [CAGradientLayer layer];
    gradientH.frame = gradientViewH.bounds;
    gradientH.colors = [NSArray arrayWithObjects:(id)self.bgUpColor.CGColor,
                        (id)self.bgDwColor.CGColor, nil];
    [gradientViewH.layer insertSublayer:gradientH atIndex:0];
    
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 2.0f;
    label.layer.borderColor = self.borderColor.CGColor;
    
    [label insertSubview:gradientViewH atIndex:0];
    [label insertSubview:labelGradiente atIndex:1];
    
    [window addSubview:label];
    [self performSelector:@selector(hide) withObject:nil afterDelay:seconds];
}

@end

