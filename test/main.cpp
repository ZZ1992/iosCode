//
//  main.cpp
//  test
//
//  Created by YaguangZhu on 15/6/25.
//  Copyright (c) 2015年 YaguangZhu. All rights reserved.
//

#include <stdio.h>

int main()
{
        int fab[100001]={0};
    fab[0]=1;
    fab[1]=1;
    for(int i=2;i<=100001;i++)
    {
        fab[i]=fab[i-1]+fab[i-2];
        fab[i]=fab[i]%1000000;
    }
    
    
    int num;
    while(scanf("%d",&num)!=EOF)
    {
        if (num<29)
        {
            printf("%d\n",fab[num]);
        }
        else printf("%06d\n",fab[num]);
    }
    
    return 0;
    
    
}
