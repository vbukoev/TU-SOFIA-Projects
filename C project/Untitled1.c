#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define SIZE 256
#define size 1000
void ff(char* s1, char* s2);
void fs(char* s1);
void kf(char* s2);
void ks();
void my_line_flush()
{
 int ch;
 while ((ch = getchar()) != '\n' && ch != EOF);
}
int main()
{
 char file1[SIZE], file2[SIZE], tmp[3];
 int cod, n, fl;
 do {
 printf("\n1-File to File\n"); 
 printf("2-File to Screen\n");
 printf("3-Keyboard to File\n");
 printf("4-Keyboard to Screen\n");
 printf("5-Exit\n");
 printf("Vavedete kod na operacia 1-5:");
 scanf("%d", &cod);
 switch (cod) {
 case 1:
 fl = 0;
 do {
 puts("File za chetene:");
 my_line_flush();
 fgets(file1,sizeof(file1),stdin);
 file1[strlen(file1)-1] = '\0';
 n = strlen(file1);tmp[0] = file1[n - 2];
tmp[1] = file1[n - 1];
 if (strncmp(tmp, ".c",2) == 0) fl = 1;
 else printf("Nepravilno razshirenie za faila!\n");
 } while (fl == 0);
 puts("File za zapis:");
 fgets(file2, sizeof(file2),stdin);
 file2[strlen(file2)-1] = '\0';
 ff(file1, file2);
 break;
 case 2:
 fl = 0;
 do {
 puts("File za chetene:");
 my_line_flush();
 fgets(file1,sizeof(file1),stdin);
 file1[strlen(file1)-1] = '\0';
 n = strlen(file1);tmp[0] = file1[n - 2];
tmp[1] = file1[n - 1];
 if (strncmp(tmp, ".c",2) == 0) fl = 1;
 else printf("Nepravilno razshirenie za faila!\n");
 } while (fl == 0);
 fs(file1); 
 break;
 case 3:
 puts("File za zapis:");
 my_line_flush();
 fgets(file2,sizeof(file2),stdin);
 file2[strlen(file2)-1] = '\0';
 kf(file2);
 break;
 case 4:
 ks();
 break;
 case 5:
 return 0;break;
 default:
 printf("Nekorekten kod!\n");
 }
 } while (cod != 5);
 return 0;
}
void ff(char* s1, char* s2)
{
 FILE* f1, * f2;
 char c;
 char st[80];
 char search[]="if";
 char search2[]="switch";
int  ct = 0, max = 0,row=0,n,i=0,operators=0;
 if (!(f1 = fopen(s1, "rt"))) 
 {
 fprintf(stderr, "input file not found\n");
 exit(1);
 }
while ( (c = getc(f1)) != EOF)
{
if (c != ' ' && c != '\t')
{
ct++;
}
if (c == '\n')
{
row++;
if (ct > max)
{
max = ct;
n=row;
}
ct = 0;
}
} 
rewind (f1);
while ( fgets ( st, 80, f1 ) != NULL )
{
 if ((strstr(st, "+")) && (!(st[1]=='+'))) operators++;
	if ((strstr(st, "-")) && (!(st[1]=='-'))) operators++;
	if ((strstr(st, "=")) && (!(st[1]=='='))) operators++;
	if (strstr(st, "*")) operators++;
	if ((strstr(st, "/")) && (!(st[1]=='/')) && (!(st[1]=='*')))  operators++;
	if ((strstr(st, "/")) && ((st[1]=='*')))  operators++;
	if (strstr(st, "%")) operators++;
	if (strstr(st, "+=")) operators++;
	if (strstr(st, "-=")) operators++;
	if (strstr(st, "*=")) operators++;
	if (strstr(st, "*/=")) operators++;
	if (strstr(st, "%=")) operators++;
	if (strstr(st, ">>=")) operators++;
	if (strstr(st, "<<=")) operators++;
	if (strstr(st, "&=")) operators++;
	if (strstr(st, "^=")) operators++;
	if (strstr(st, "|=")) operators++;
	if (strstr(st, "++")) operators++;  
	if (strstr(st, "--")) operators++;
	if (strstr(st, "==")) operators++;
	if (strstr(st, "!=")) operators++;
	if ((strstr(st, ">")) && (!(st[1]=='>'))) operators++;
	if ((strstr(st, "<")) && (!(st[1]=='<'))) operators++;
	if (strstr(st, ">=")) operators++;
	if (strstr(st, "<=")) operators++;
	if (strstr(st, "!")) operators++;
	if ((strstr(st, "|")) && (!(st[1]=='|'))) operators++;
	if ((strstr(st, "&")) && (!(st[1]=='&'))) operators++; 
	if (strstr(st, "&&")) operators++;
	if (strstr(st, "||")) operators++;
	if (strstr(st, "?")) operators++;
	if (strstr(st, ",")) operators++;
	if (strstr(st, "^")) operators++;
	if (strstr(st, "~")) operators++;
	if (strstr(st, "<<")) operators++;
	if (strstr(st, ">>")) operators++;
	}         
 if (!(f2 = fopen(s2, "wt"))) {
 fprintf(stderr, "input file not found\n");
 exit(1);
 }
 printf ("Transfering results...");
 fprintf(f2, "Line with max characters: %d\n",n);// ????? ?? ????????? ? f2
 fprintf(f2, "Splitting operators: %d\n",operators);
 fclose(f2); // ????????? ?? ???? f2
 fclose(f1);
}
void fs(char* s1)
{
 FILE* f1; char c;
 char st[80];
 char search[]="if";
 char search2[]="switch";
 int ct=0,max=0,row=0,n,i=0,s=0,operators=0;
 if (!(f1 = fopen(s1, "rt"))) { // ???????? ?? ???? f1
 fprintf(stderr, "input file not found\n");
 exit(1);
}
 while ( (c = getc(f1)) != EOF)
{
if (c != ' ' && c != '\t')
{
ct++;
}
if (c == '\n')
{
row++;
if (ct > max)
{
max = ct;
n=row;
}
ct = 0;
}
} 
    rewind (f1);
    while ( fgets ( st, 80, f1 ) != NULL )
    {
     if ((strstr(st, "+")) && (!(st[1]=='+'))) operators++;
	if ((strstr(st, "-")) && (!(st[1]=='-'))) operators++;
	if ((strstr(st, "=")) && (!(st[1]=='='))) operators++;
	if (strstr(st, "*")) operators++;
	if ((strstr(st, "/")) && (!(st[1]=='/')) && (!(st[1]=='*')))  operators++;
	if ((strstr(st, "/")) && ((st[1]=='*')))  operators++;
	if (strstr(st, "%")) operators++;
	if (strstr(st, "+=")) operators++;
	if (strstr(st, "-=")) operators++;
	if (strstr(st, "*=")) operators++;
	if (strstr(st, "*/=")) operators++;
	if (strstr(st, "%=")) operators++;
	if (strstr(st, ">>=")) operators++;
	if (strstr(st, "<<=")) operators++;
	if (strstr(st, "&=")) operators++;
	if (strstr(st, "^=")) operators++;
	if (strstr(st, "|=")) operators++;
	if (strstr(st, "++")) operators++;  
	if (strstr(st, "--")) operators++;
	if (strstr(st, "==")) operators++;
	if (strstr(st, "!=")) operators++;
	if ((strstr(st, ">")) && (!(st[1]=='>'))) operators++;
	if ((strstr(st, "<")) && (!(st[1]=='<'))) operators++;
	if (strstr(st, ">=")) operators++;
	if (strstr(st, "<=")) operators++;
	if (strstr(st, "!")) operators++;
	if ((strstr(st, "|")) && (!(st[1]=='|'))) operators++;
	if ((strstr(st, "&")) && (!(st[1]=='&'))) operators++; 
	if (strstr(st, "&&")) operators++;
	if (strstr(st, "||")) operators++;
	if (strstr(st, "?")) operators++;
	if (strstr(st, ",")) operators++;
	if (strstr(st, "^")) operators++;
	if (strstr(st, "~")) operators++;
	if (strstr(st, "<<")) operators++;
	if (strstr(st, ">>")) operators++;
	}
    printf("Line with max characters: %d\n",n);
    printf("Splitting operators: %d\n",operators);
 fclose(f1); // ????????? ?? ???? f1
}
void kf(char* s2) 
{
 FILE* f2;
 char st[1000];
 char search[]="if";
 char search2[]="switch";
 char ch;
 int ct=0,max=0,row=0,n,i,j,operators=0;
 if (!(f2 = fopen(s2, "wt"))) { // ???????? ?? ???? f2
 fprintf(stderr, "input file not found\n");
 exit(1);
 }
 puts("Vavedete kod na programa:");
while (fgets(st, 1000, stdin) != NULL)
 {
 	  if ((strstr(st, "+")) && (!(st[1]=='+'))) operators++;
	if ((strstr(st, "-")) && (!(st[1]=='-'))) operators++;
	if ((strstr(st, "=")) && (!(st[1]=='='))) operators++;
	if (strstr(st, "*")) operators++;
	if ((strstr(st, "/")) && (!(st[1]=='/')) && (!(st[1]=='*')))  operators++;
	if ((strstr(st, "/")) && ((st[1]=='*')))  operators++;
	if (strstr(st, "%")) operators++;
	if (strstr(st, "+=")) operators++;
	if (strstr(st, "-=")) operators++;
	if (strstr(st, "*=")) operators++;
	if (strstr(st, "*/=")) operators++;
	if (strstr(st, "%=")) operators++;
	if (strstr(st, ">>=")) operators++;
	if (strstr(st, "<<=")) operators++;
	if (strstr(st, "&=")) operators++;
	if (strstr(st, "^=")) operators++;
	if (strstr(st, "|=")) operators++;
	if (strstr(st, "++")) operators++;  
	if (strstr(st, "--")) operators++;
	if (strstr(st, "==")) operators++;
	if (strstr(st, "!=")) operators++;
	if ((strstr(st, ">")) && (!(st[1]=='>'))) operators++;
	if ((strstr(st, "<")) && (!(st[1]=='<'))) operators++;
	if (strstr(st, ">=")) operators++;
	if (strstr(st, "<=")) operators++;
	if (strstr(st, "!")) operators++;
	if ((strstr(st, "|")) && (!(st[1]=='|'))) operators++;
	if ((strstr(st, "&")) && (!(st[1]=='&'))) operators++; 
	if (strstr(st, "&&")) operators++;
	if (strstr(st, "||")) operators++;
	if (strstr(st, "?")) operators++;
	if (strstr(st, ",")) operators++;
	if (strstr(st, "^")) operators++;
	if (strstr(st, "~")) operators++;
	if (strstr(st, "<<")) operators++;
	if (strstr(st, ">>")) operators++;
 for(j = 0; j < strlen(st); j++)
{
  if (st[j] != ' ')
{
 ct++;
}
else if (st[j] != '\t') 
 {
ct++;
}
if (st[j] == '\n')
{
	row++;
 if (ct > max)
{
max = ct;
n=row;
}
 ct = 0;
}
 }
}
 printf ("Transfering results...");
 fprintf(f2, "Line with max characters: %d\n",n);
 fprintf(f2, "Splitting operators: %d\n",operators);
 fclose(f2);
}
void ks()
{
char st[1000];
 char search[]="if";
 char search2[]="switch";
 int ct=0,max=0,row=0,n,i=0,operators=0,j;
 puts("Vavedete kod na programa:");
while (fgets(st, 1000, stdin) != NULL)
 {
 	 if ((strstr(st, "+")) && (!(st[1]=='+'))) operators++;
	if ((strstr(st, "-")) && (!(st[1]=='-'))) operators++;
	if ((strstr(st, "=")) && (!(st[1]=='='))) operators++;
	if (strstr(st, "*")) operators++;
	if ((strstr(st, "/")) && (!(st[1]=='/')) && (!(st[1]=='*')))  operators++;
	if ((strstr(st, "/")) && ((st[1]=='*')))  operators++;
	if (strstr(st, "%")) operators++;
	if (strstr(st, "+=")) operators++;
	if (strstr(st, "-=")) operators++;
	if (strstr(st, "*=")) operators++;
	if (strstr(st, "*/=")) operators++;
	if (strstr(st, "%=")) operators++;
	if (strstr(st, ">>=")) operators++;
	if (strstr(st, "<<=")) operators++;
	if (strstr(st, "&=")) operators++;
	if (strstr(st, "^=")) operators++;
	if (strstr(st, "|=")) operators++;
	if (strstr(st, "++")) operators++;  
	if (strstr(st, "--")) operators++;
	if (strstr(st, "==")) operators++;
	if (strstr(st, "!=")) operators++;
	if ((strstr(st, ">")) && (!(st[1]=='>'))) operators++;
	if ((strstr(st, "<")) && (!(st[1]=='<'))) operators++;
	if (strstr(st, ">=")) operators++;
	if (strstr(st, "<=")) operators++;
	if (strstr(st, "!")) operators++;
	if ((strstr(st, "|")) && (!(st[1]=='|'))) operators++;
	if ((strstr(st, "&")) && (!(st[1]=='&'))) operators++; 
	if (strstr(st, "&&")) operators++;
	if (strstr(st, "||")) operators++;
	if (strstr(st, "?")) operators++;
	if (strstr(st, ",")) operators++;
	if (strstr(st, "^")) operators++;
	if (strstr(st, "~")) operators++;
	if (strstr(st, "<<")) operators++;
	if (strstr(st, ">>")) operators++;
 for(j = 0; j < strlen(st); j++)
{
  if (st[j] != ' ')
{
 ct++;
}
else if (st[j] != '\t') 
 {
ct++;
}
if (st[j] == '\n')
{
 if (ct > max)
{
max = ct;
n=row;
}
 ct = 0;
 row++;
}
 }
}
 printf("Line with max characters: %d\n",n);
 printf("Splitting operators: %d\n",operators);
}
