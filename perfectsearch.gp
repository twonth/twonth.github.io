sigpoly(A)=
 {
  if(A==Mod(1,2),return(Mod(1,2)));
  local(factA,numprimesA);
  factA=factor(A);
  numprimesA=matsize(factA)[1];
  prod(X=1,numprimesA,sum(Y=0,factA[X,2],factA[X,1]^Y));
 }
 
largestirred(A)=
 {
  local(factA,numprimesA,maxdegsofar,maxindex);
  factA=factor(A);
  numprimesA=matsize(factA)[1];
  maxdegsofar=0;
  for(X=1,numprimesA,
   if(poldegree(factA[X,1])>maxdegsofar,maxdegsofar=poldegree(factA[X,1]);maxindex=X);
  );
  return(factA[maxindex,1]);
 }

binarytopolynomial(n)={
 local(binrep,len);
 binrep=binary(n);
 len=length(binrep);
 sum(X=1,len,binrep[len-X+1]*x^(X-1));
}


HWalg(B,H)=
{
 local(D,P,sigB,maxk);
 sigB=sigpoly(B);
 if(sigB==B,print(B);break);
 D=sigB/gcd(B,sigB);
 if(gcd(B,D)!=Mod(1,2),break);
 P=largestirred(D);
 maxk=floor((H-poldegree(B))/(2*poldegree(P)));
 for(X=1,maxk,HWalg(B*P^(2*X),H));
}

search(degbound,H)=
{
 local(seed);
 for(k=1,degbound,
  print(k);
  for(j=2^k,2^(k+1)-1,
   seed=binarytopolynomial(j);
   if(Mod(seed,2)%Mod(x,2)!=Mod(0,2)&&Mod(seed,2)%Mod(x+1,2)!=Mod(0,2),HWalg(Mod(seed^2,2),H));
  );
 );
}

HWalgeven(B,H)=
{
 local(D,P,sigB,maxk);
 sigB=sigpoly(B);
 if(sigB==B,print(B);break);
 D=sigB/gcd(B,sigB);
 if(gcd(B,D)!=Mod(1,2),break);
 P=largestirred(D);
 maxk=floor((H-poldegree(B))/(poldegree(P)));
 for(X=1,maxk,HWalgeven(B*P^(X),H));
}

searcheven(degbound,H)=
{
 local(seed);
 for(k=1,degbound,
  print(k);
  HWalgeven(Mod(x^k,2),H);
 );
}

searchevenpar(degbound,H,par)=
{
 local(seed);
 for(k=1,degbound,
  if(Mod(k,2)==Mod(par,2),
   print(k);
   HWalgeven(Mod(x^k,2),H);
  );
 );
}


