#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define PI 3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825
#define PI2 (PI*2)
#define SQ2 1.414213562373095048801688724209698078569671875376948073176679737990732478462
#define SQ3 1.732050807568877293527446341505872366942805253810380628055806979451933016909
#define FI 1.618033988749894848204586834365638117720309179805762862135448622705260462818902449707207204

#define SX 1111
#define SY 1111

//////////////////MAKE PRETTY PATTERNS HERE. DPOLY must be POLY differentiated.

#define POLY(z)  z*z*z*z*z + (-1)
#define DPOLY(z) 5*z*z*z*z

//#define POLY(z)  z*z*z*z*z*z*z*z*z + (-1)
//#define DPOLY(z) 9*z*z*z*z*z*z*z*z

//#define POLY(z)  z*z*z*z*z + (-3i) * z*z*z + (-5-2i) * z*z + (3) * z + (1)
//#define DPOLY(z) 5*z*z*z*z + (-3i) * 3*z*z + (-5-2i) * 2*z + (3) * 1

//#define POLY(z)  z*z*z*z*z*z + (2-4i) * z*z*z*z*z + (-1) * z + (2+4i)
//#define DPOLY(z) 6*z*z*z*z*z + (2-4i) * 5*z*z*z*z + (-1) * 1

//#define POLY(z)  z*z*z*z*z + (-1) * z + (-1)
//#define DPOLY(z) 5*z*z*z*z + (-1) * 1

//#define POLY(z)  z*z*z*z*z + (-1) - (cos(__imag__ z)+1i*sin(__imag__ z))*exp(__real__ z)
//#define DPOLY(z) 5*z*z*z*z        - (cos(__imag__ z)+1i*sin(__imag__ z))*exp(__real__ z)

#define RSD 1923879


#define BPL ((SX*3+3)&~3)

void seedr(unsigned int);
unsigned int rnd();
unsigned int rndm(unsigned int);

unsigned char bhdr[54]={
0x42, 0x4D, 0x36, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x28, 0x00,
0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x01, 0x00, 0x18, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x12, 0x0B, 0x00, 0x00, 0x12, 0x0B, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

unsigned char po[BPL];

double gr[SY][SX][3];

void drawit();

int main(int a, char **b) {
  FILE *o;
  int x, y, c;
  double t;
  char *p;

  srand(time(0));
  drawit();
  
  p=bhdr+2; *p++=x=54+BPL*SY; *p++=x>>=8; *p++=x>>=8; *p=x>>=8;
  p=bhdr+18; *p++=x=SX; *p++=x>>=8; *p++=x>>=8; *p++=x>>=8;
  *p++=x=SY; *p++=x>>=8; *p++=x>>=8; *p=x>>=8;

  if(!(o=fopen("newtroot.bmp", "wb"))) {
    fclose(o);
    printf("Couldn't open output file.\n");
    return(0);
  }
  
  fwrite(bhdr, 54, 1, o);

  for(x=SX*3;x<BPL;++x) po[x]=0;
  
  for(y=SY-1;~y;--y) {
    for(x=0,p=po;x<SX;++x) for(c=2;~c;--c) *p++=(t=gr[y][x][c])<=0?0:(t>=1?255:t*255);
    fwrite(po, BPL, 1, o);
  }

  fclose(o);
  return(0);
}


void drawit() {
  int x, y, c, n, bn, dx, dy, dz;
  unsigned int m, p;
  _Complex double z, w;
  double f, s;
  seedr(RSD);
  for(y=0;y<SY;++y) for(x=0;x<SX;++x) {
    z=(x*(10./SX)-5)-(y*(10./SY)-5)*1i;

    for(f=s=1;f>.01&&(__real__((w=(POLY(z)))*~w))>.01;f*=.95,s=-s) z=z-w/(DPOLY(z));

    for(n=0;n<10;++n) z=z-(POLY(z))/(DPOLY(z));

    z=f*(z*z)/(z*~z);

    gr[y][x][0]=.5*f/*+.02*s*f*/+.24*(__real__(z))-(SQ3*.24)*(__imag__(z));
    gr[y][x][1]=.5*f/*+.02*s*f*/+.24*(__real__(z))+(SQ3*.24)*(__imag__(z));
    gr[y][x][2]=.5*f/*+.02*s*f*/-.48*(__real__(z));
  }
}

unsigned int rseeda[624];
int rseedu;

void seedr(unsigned int s) {
  int n;
  rseedu=624; rseeda[0]=s; for(n=1;n<624;++n) rseeda[n]=s*=69069u;
}

#define TEMPBLAH(x,y,z) { v=(rseeda[x]&0x80000000)|(rseeda[y]&0x7fffffff);\
                          rseeda[x]=rseeda[z]^(v>>1)^(0x9908b0df&(0-(v&1)));}
void gennewr() {
  int n;
  unsigned int v;
  for(n=0;n<227;++n) TEMPBLAH(n, n+1, n+397);
  for(;n<623;++n) TEMPBLAH(n, n+1, n-227);
  TEMPBLAH(623, 0, 396);
  rseedu=0;
}
#undef TEMPBLAH

unsigned int rnd() {
  if(rseedu>=624) gennewr();
  unsigned int v=rseeda[rseedu++];
  v^=v>>11;
  v^=(v<<7)&0x9d2c5680;
  v^=(v<<15)&0xefc60000;
  v^=v>>18;
  return(v);
}

unsigned int rndm(unsigned int m) {
  unsigned int v, c=(0u-m)/m;
  while((v=rnd())/m>c);
  return(v%m);
}

//

