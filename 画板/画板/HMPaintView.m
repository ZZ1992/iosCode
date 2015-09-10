//
//  HMPaintView.m
//  画板
//
//  Created by YaguangZhu on 15/9/10.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#import "HMPaintView.h"
#import "HMPaintPath.h"
@interface HMPaintView()

@property(nonatomic,strong)UIBezierPath *path;

@property(nonatomic,strong)NSMutableArray *paths;

@end

@implementation HMPaintView

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    
    return _paths;
}
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos = [self pointWithTouches:touches];
    
    HMPaintPath *path = [HMPaintPath paintPathWithLineWidth:_width color:_color startPoint:pos];
    
    
    _path =path;
    [self.paths addObject:path];
 
    
}
-(void)awakeFromNib
{
    _width = 2;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pos = [self pointWithTouches:touches];
    [_path addLineToPoint:pos];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if (!self.paths.count) return;
  
    for (HMPaintPath *path in self.paths) {
        if ([path isKindOfClass:[UIImage class]]) {
             UIImage *image = (UIImage *)path;
        [image drawAtPoint:CGPointZero];

        }else
        {
             [path.color set]; 
        [path stroke];
        }
            
       
    }
}

- (void)clearScreen
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

-(void)undo
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
    
}

- (void)setIamge:(UIImage *)image
{
    _image = image;
    [self.paths addObject:image];
    
    [self setNeedsDisplay];
}

@end
