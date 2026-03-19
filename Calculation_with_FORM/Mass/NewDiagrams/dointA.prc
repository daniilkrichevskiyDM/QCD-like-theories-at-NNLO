#procedure dointA(PP)
* using some integral identities;* at most two powers of PP extra here

id prop(mp2?,`PP')*`PP'.QRS1?*`PP'.QRS1? = 
         1/dim*`PP'.`PP'*QRS1.QRS1*prop(mp2,`PP');
id prop(mp2?,`PP')*`PP'.QRS1?*`PP'.QRS2? = 
         1/dim*`PP'.`PP'*QRS1.QRS2*prop(mp2,`PP');
id prop(mp2?,`PP')*`PP'.`PP' = mp2*prop(mp2,`PP');
id prop(mp2?,`PP')*`PP'.QRS1?=0;
id prop(mp2?,`PP') = A(mp2);

#endprocedure
