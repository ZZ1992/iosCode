//
//  main.cpp
//  test
//
//  Created by YaguangZhu on 15/6/25.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#include <stdio.h>
#include "stdlib.h"
#define MAX(X,Y)(((X)>(Y))?(X):(Y))
#define MAX(X,Y)(((X)<(Y))?(X):(Y))
#define SQR(X) (X*X)
#define DEBUG

int main()
{
    int a,b =3;
    a = SQR(b+2);
    printf("a = %d\n",a);
    
    
    return 0;
    
    
}
