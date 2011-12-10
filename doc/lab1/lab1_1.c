int  powerI(int pow, int base) {
     int acc,p;
     for (acc=1,p=0; p < pow; p++) {
       acc = acc * base;
     }
     return acc;
}

/* ADD code for the recursive style implementation
int  powerR(int pow, int base) {
}
*/

