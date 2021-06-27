
s(s(NP,VP)) --> np(Number,subject,Person,A_I,NP),vp(Number,Person,_,A_I,VP).

np(Number,_,_,A_I,np(Det,N)) --> det(Number,Det),nbar(Number,A_I,N).
np(Number,_,_,A_I,np(Det,N,PP)) --> det(Number,Det),nbar(Number,A_I,N),pp(Number,PP).
np(Number,subject,Person,animate,np(PRO)) --> pro(Number,Person,subject,PRO).
np(Number,object,Person,animate,np(PRO)) --> pro(Number,Person,object,PRO).


nbar(Number,A_I,nbar(N)) --> n(Number,A_I,N).
nbar(Number,A_I,nbar(ADJ)) --> jp(Number,A_I,ADJ).

pp(_,pp(PP,NP)) --> prep(PP), np(_,whatever,whatever,inanimate,NP).

jp(Number,A_I,jp(ADJ,N)) --> adj(ADJ),n(Number,A_I,N).
jp(Number,A_I,jp(ADJ,N)) --> adj(ADJ),jp(Number,A_I,N).

vp(Number,Person,iv,A_I,vp(V)) --> v(iv,Number,Person,A_I,V).
vp(Number,Person,tv,A_I,vp(V,NP)) --> v(tv,Number,Person,A_I,V), np(_,whatever,whatever,_,NP).
vp(Number,Person,tv,A_I,vp(V,NP)) --> v(tv,Number,Person,A_I,V), np(Number,object,Person,_,NP).


det(Number,det(Det)) --> [Word], {lex(Word,det,Number,Det)}.
pro(Number,Person,S_O,pro(PRO)) --> [Word], {lex(Word,pro,Number,Person,S_O,PRO)}.
n(Number,A_I,n(N)) --> [Word], {lex(Word,n,Number,A_I,N)}.
v(I_T,Number,Person,A_I,v(V)) --> [Word], {lex(Word,I_T,Number,Person,A_I,V)}.
prep(prep(PREP)) --> [Word], {lex(Word,prep,PREP)}.
adj(adj(ADJ)) --> [Word], {lex(Word,adj,ADJ)}.


%PRONOUNS
lex(i,pro,singular,1,subject,i).
lex(you,pro,singular,2,subject,you).
lex(he,pro,singular,3,subject,he).
lex(she,pro,singular,3,subject,she).
lex(it,pro,singular,3,subject,it).
lex(we,pro,plural,1,subject,we).
lex(you,pro,plural,2,subject,you).
lex(they,pro,plural,3,subject,they).
lex(me,pro,singular,1,object,me).
lex(you,pro,singular,2,object,you).
lex(him,pro,singular,3,object,him).
lex(her,pro,singular,3,object,her).
lex(it,pro,singular,3,object,it).
lex(us,pro,plural,1,object,us).
lex(you,pro,plural,2,object,you).
lex(them,pro,plural,3,object,them).

%VERBS
lex(know,tv,singular,1,animate,know).
lex(know,tv,singular,2,animate,know).
lex(knows,tv,singular,3,animate,knows).
lex(know,tv,plural,_,animate,know).
lex(see,tv,singular,1,animate,see).
lex(see,tv,singular,2,animate,see).
lex(sees,tv,singular,3,animate,sees).
lex(see,tv,plural,_,animate,see).
lex(hire,tv,singular,1,animate,hire).
lex(hire,tv,singular,2,animate,hire).
lex(hires,tv,singular,3,animate,hires).
lex(hire,tv,plural,_,animate,hire).
lex(fall,iv,singular,1,_,fall).
lex(fall,iv,singular,2,_,fall).
lex(falls,iv,singular,3,_,falls).
lex(fall,iv,plural,_,_,fall).
lex(sleep,iv,singular,1,animate,sleep).
lex(sleep,iv,singular,2,animate,sleep).
lex(sleeps,iv,singular,3,animate,sleeps).
lex(sleep,iv,plural,_,animate,sleep).

%DETERMINERS
lex(the,det,_,the).
lex(a,det,singular,a).
lex(two,det,plural,two).

%NOUNS
lex(man,n,singular,animate,man).
lex(woman,n,singular,animate,woman).
lex(apple,n,singular,inanimate,apple).
lex(chair,n,singular,inanimate,chair).
lex(room,n,singular,inanimate,room).
lex(men,n,plural,animate,men).
lex(women,n,plural,animate,women).
lex(apples,n,plural,inanimate,apples).
lex(chairs,n,plural,inanimate,chairs).
lex(rooms,n,plural,inanimate,rooms).

%PREPOSITIONS
lex(on,prep,on).
lex(in,prep,in).
lex(under,prep,under).

%ADJECTIVES
lex(old,adj,old).
lex(young,adj,young).
lex(red,adj,red).
lex(short,adj,short).
lex(tall,adj,tall).

/*
s(Tree,[the,woman,sees,the,apples],[]).
Tree = s(np(det(the), nbar(n(woman))), vp(v(sees),
np(det(the),nbar(n(apples))))) .

s(Tree,[a,woman,knows,him],[]).
Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

s(Tree,[two,woman,hires,a,man],[]).
false.

s(Tree,[two,women,hire,a,man],[]).
Tree = s(np(det(two), nbar(n(women))), vp(v(hire), np(det(a),
nbar(n(man))))) .

s(Tree,[she,knows,her],[]).
Tree = s(np(pro(she)), vp(v(knows), np(pro(her)))) .

s(Tree,[she,know,the,man],[]).
false.

s(Tree,[us,see,the,apple],[]).
false.

s(Tree,[we,see,the,apple],[]).
Tree = s(np(pro(we)), vp(v(see), np(det(the), nbar(n(apple))))) .

s(Tree,[i,know,a,short,man],[]).
Tree = s(np(pro(i)), vp(v(know), np(det(a), nbar(jp(adj(short), n(man)))))) .

s(Tree,[he,hires,they],[]).
false.

s(Tree,[two,apples,fall],[]).
Tree = s(np(det(two), nbar(n(apples))), vp(v(fall))) .

s(Tree,[the,apple,falls],[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

s(Tree,[the,apples,fall],[]).
Tree = s(np(det(the), nbar(n(apples))), vp(v(fall))) .

s(Tree,[i,sleep],[]).
Tree = s(np(pro(i)), vp(v(sleep))) .

s(Tree,[you,sleep],[]).
Tree = s(np(pro(you)), vp(v(sleep))) .

s(Tree,[she,sleeps],[]).
Tree = s(np(pro(she)), vp(v(sleeps))) .

s(Tree,[he,sleep],[]).
false.

s(Tree,[them,sleep],[]).
false.

s(Tree,[a,men,sleep],[]).
false.

s(Tree,[the,tall,woman,sees,the,red],[]).
false.

s(Tree,[the,young,tall,man,knows,the,old,short,woman],[]).
Tree = s(np(det(the), nbar(jp(adj(young), jp(adj(tall), n(man))))), vp(v(knows), np(det(the), nbar(jp(adj(old), jp(adj(short), n(woman))))))) .

s(Tree,[a,man,tall,knows,the,short,woman],[]).
false.

s(Tree,[a,man,on,a,chair,sees,a,woman,in,a,room],[]).
Tree = s(np(det(a), nbar(n(man)), pp(prep(on), np(det(a), nbar(n(chair))))), vp(v(sees), np(det(a), nbar(n(woman)), pp(prep(in), np(det(a), nbar(n(room))))))) .

s(Tree,[a,man,on,a,chair,sees,a,woman,a,room,in],[]).
false.

s(Tree,[the,tall,young,woman,in,a,room,on,the,chair,in,a,room,in,the,room,sees,the,red,apples,under,the,chair],[]).
Tree = s(np(det(the), nbar(jp(adj(tall), jp(adj(young), n(woman)))), pp(prep(in), np(det(a), nbar(n(room)), pp(prep(on), np(det(the), nbar(n(chair)), pp(prep(in), np(det(a), nbar(n(...)), pp(prep(...), np(..., ...))))))))), vp(v(sees), np(det(the), nbar(jp(adj(red), n(apples))), pp(prep(under), np(det(the), nbar(n(chair))))))) .

s(Tree,[the,woman,sees,the,apples],[]).
Tree = s(np(det(the), nbar(n(woman))), vp(v(sees), np(det(the), nbar(n(apples))))) .

s(Tree,[a,woman,knows,him],[]).
Tree = s(np(det(a), nbar(n(woman))), vp(v(knows), np(pro(him)))) .

s(Tree,[the,man,sleeps],[]).
Tree = s(np(det(the), nbar(n(man))), vp(v(sleeps))) .

s(Tree,[the,room,sleeps],[]).
false.

s(Tree,[the,apple,sees,the,chair],[]).
false.

s(Tree,[the,rooms,know,the,man],[]).
false.

s(Tree,[the,apple,falls],[]).
Tree = s(np(det(the), nbar(n(apple))), vp(v(falls))) .

s(Tree,[the,man,falls],[]).
Tree = s(np(det(the), nbar(n(man))), vp(v(falls))) .

*/
