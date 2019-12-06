//Napisati program koji pomocu vezanih listi simulira rad reda

#define CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define PRAZAN -4
#define OK 0
#define ERROR -1
#define KRIVOSLOVO -2

typedef struct cvor*red;
struct cvor{
    int el;
    red next;
};
//metode
red StvaranjeReda(red,int);
int StaviElement(red);
int SkiniElement(red);
//slucajni
int slucajni(int,int);


int main()
{
    
    struct cvor red;
    red.next=NULL;
    char c;
    
    int x=PRAZAN;
    int err=ERROR;
    
    
    printf("Prva struktura\n");
    
    // dok je odgovor sve razlicito od ne, vrti petlju
    do{
        err=StaviElement(&red);
        if(err==-1){
            printf("Greska");
            return err;
        }
        printf("Zelite li unijeti jos struktura u red?(D ili N)\n");
        scanf(" %c",&c);
        if(c!='D' && c!='N')
            printf("Neispravan unos "); 
            return KRIVOSLOVO;
        
        
    } while(c!='N'); 
    
    
    
    printf("Zelite li skiniti element sa reda?");
    scanf(" %c",&c);
    if(c!='D' && c!='N'){
            printf("Neispravan unos");
            return KRIVOSLOVO;
        }
    while(c!='N'){
        x=SkiniElement(&red);
        if(x==-4)
            return x;
        printf("zelite li skiniti element sa reda?");
        scanf(" %c",&c);
        if(c!='D' && c!='N'){
            printf("unijeli ste krivo slovo");
            return KRIVOSLOVO;
        }
    }
    
    
    return 0;
}
//slucajni
int slucajni(int min,int max)
{
    return rand() % (max-min) + min;
}


red StvaranjeReda(red R,int x)
{
    red novi=NULL;
    R=(struct cvor*)malloc(sizeof(struct cvor));
    novi=R;
    novi->el=x;
    novi->next=NULL;
    
    return novi;
}
int StaviElement(red R)
{
    int x;
    x=slucajni(10,100);
    red novi=NULL;
    red zadnji=NULL;
    
    if(R->next==NULL){
        novi=StvaranjeReda(R,x);
        if(novi==NULL){
            return ERROR;
        }
        R->next=novi;
    }
    else{
        while(R->next!=NULL)
            R=R->next;
            
        zadnji=R;
        novi=StvaranjeReda(R,x);
        if(novi==NULL)
            return ERROR;
            
        zadnji->next=novi;
    }
    return OK;
}
int SkiniElement(red R)
{
    red temp=NULL;
    if(R!=NULL){
        if(R->next==NULL){
            printf("red je prazan\n");
            return PRAZAN;
        }
            
        else{
            temp=R->next;
            R->next=temp->next;
            free(temp);
        }
    }
    return OK;
}
