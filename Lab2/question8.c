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
int term();
int factor();
int gfactor();
int number();
int digit();

int power(int base, int power) {
  int result = 1;
  for(int i = 0; i < power; i++) {
    result *= base;
  }
  return result;
}

void error() {
  printf("parse error\n");
  exit(1);
}

void getToken() {
  token = getchar();
  if (token == '\t' || token ==' ') getToken();
}

void match(char c) {
  if(token == c) {
    getToken();
  } else {
    error();
  }
}

/* command -> expr '\n' */
void command() {
  int result = expr();
  if(token == '\n') {
    printf("The result is: %d\n",result);
  } else {
    error();
  }
}

/* expr -> term |expr '+' term */
/* expr -> term { '+' term } */
int expr() {
  int result = term();
  while(token == '+') {
    match('+');
    result += term();
  }
  return result;
}

/* term -> factor | term '*' factor  */
/* term -> factor { '*' factor } */
int term() {
  int result = factor();
  while(token == '*') {
    match('*');
    result *= factor();
  }
  return result;
}

/* factor -> gfactor | factor '^' gfactor  */
/* factor -> gfactor { '^' gfactor } */
int factor() {
  int result = gfactor();
  while(token == '^') {
    match('^');
    result = power(term(), result);
  }
  return result;
}

/* gfactor -> '(' expr ')' | number */
int gfactor() {
  int result;
  if(token == '(') {
    match('(');
    result = expr();
    match(')');
  } else {
    result = number();
  }
  return result;
}

/* number -> digit | number digit  */
/* number -> digit { digit } */
int number() {
  int result = digit();
  while(isdigit(token)) {
    // The value of a number with a new trailing digit is its previous
    // value shifted by a decimal place plus the value of the new digit
    result = 10 * result + digit();
  }
  return result;
}

/* digit -> '0' | '1' | '2' | '3' | '4'
                | '5' | '6' | '7' | '8' | '9' */
int digit() {
  int result;
  if(isdigit(token)) {
    // The numeric value of a digit character is the difference between
    // its ascii value and the ascii value of the character '0'
    result = token - '0';
    match(token);
  } else {
    error();
  }
  return result;
}

void parse() {
  getToken(); /* get the first token */
  command(); /* call the parsing procedure for the start symbol */
}

int main() {
  parse();
  return 0;
}

