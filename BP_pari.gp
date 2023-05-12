/* outputs all groups occurring in an odd degree n */
odddeg(n) = {
	local(groupssofar,cn,quot,delta,divlist,primelist);
	if(type(n)!="t_INT"||n%2!=1||n<0,error("n = ", n, " is not an odd positive integer !"));
	groupssofar=List([3,6]);
	primelist=List();
    divlist=divisors(n);
    for(X=1,length(divlist),
    	if(divlist[X]%2==1&isprime(2*divlist[X]+1),listput(primelist,2*divlist[X]+1))
    );
    for(X=1,length(primelist),
    l=primelist[X];
		cn=quadclassunit(-l)[1]*(l-1)/2;
		if(n%cn==0,
			quot=n/cn;delta=valuation(quot,l);
			if(l==3,
				for(X=2,2*delta/3+5/3,listput(groupssofar,l^X));
				for(X=2,2*delta/3+1,listput(groupssofar,2*l^X))
					);
			if(l>3&l%8==3,
				for(X=1,2*delta/3+1,listput(groupssofar,l^X));
					if(quot%3==0,
						for(X=1,2*delta/3+1,listput(groupssofar,2*l^X));
						);
					);
			if(l%8==7,
				for(X=1,2*delta/3+1,listput(groupssofar,2*l^X));
					);
					);
	);
print("The groups are Z/1Z, Z/2Z, Z/4Z, Z/2Z x Z/2Z and Z/nZ for n in");
groupssofar;
}
