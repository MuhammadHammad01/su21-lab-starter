#include <stdio.h>
#include <string.h>

struct student
{
    char name[40];
    int ID;
    int age;
};


void main()
{
    struct student s1;
    printf("Enter your name:\n");
    fgets(s1.name, 40 , stdin);
    printf("Enter your ID:\n");
    scanf("%d",&s1.ID);
    printf("Enter your age:\n");
    scanf("%d",&s1.age);
    ///////////////////////////////

    printf("The name of student is:");
    puts(s1.name);
    printf("The ID is %d",s1.ID);
    printf("\nThe age is %d\n",s1.age);
}
