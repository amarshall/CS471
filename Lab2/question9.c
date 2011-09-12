/*
 * This is based on the code in Figure 4.12, pages 105-107 from Kenneth
 * C. Louden, Programming Languages Principles and Practice 2nd Edition
 * Copyright (C) Brooks-Cole/ITP, 2003
 *
 * Operators (+,*):: are right associative.
 * Precedence:: (*,+) highest --> lowest
 */
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>

int token;

void command();
int expr();
int minus();
int term();
int factor();
int number();
int digit();

void error() {
  printf("parse error\n");
  exit(1);
}

void getToken() {
  token = getchar();
  if (token == '\t' || token ==' ') getToken();
}

void  match(char c) {
  if (token == c) {
    getToken();
  } else {
    error();
  }
}

/* command -> expr '\n' */
void command() {
  int result = expr();
  if (token == '\n') /* end the parse and print the result */
     printf("The result is: %d\n",result);
  else error();
}

int expr()
/* expr -> term '+' expr | term  */
{ int result = term();
  if (token == '+') {
      match('+');
      result += expr();
  }
  return result;
}

int term()
/* term -> factor | factor '*' term  */
{ int result = factor();
     if (token == '*') {
      match('*');
      result *= term();
     }

  return result;
}

int factor()
/* factor -> '(' expr ')' | number */
{ int result;
  if (token == '(')
  { match('(');
    result = expr();
    match(')');
  }
  else
    result = number();
  return result;
}

int number()
/* number -> digit { digit } */
{ int result = digit();
  while (isdigit(token))
  /* the value of a number with a new trailing digit
    is its previous value shifted by a decimal place
    plus the value of the new digit
  */
    result = 10 * result + digit();
  return result;
}

int digit()
/* digit -> '0' | '1' | '2' | '3' | '4'
                | '5' | '6' | '7' | '8' | '9' */
{ int result;
  if (isdigit(token))
  { /* the numeric value of a digit character
       is the difference between its ascii value and the
       ascii value of the character '0'
    */
    result = token - '0';
    match(token);
  }
  else
    error();
  return result;
}

void parse()
{ getToken(); /* get the first token */
  command(); /* call the parsing procedure for the start symbol */
}

int main()
{ parse();
  return 0;
}

