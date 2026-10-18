% Author: Thomas Johnson
% Due Date: Thu, Oct 15
% Class: 342 Sec01


% Fortran Family
parent(fortran, algol60).
parent(fortran, fortran77).
%Algol60 Family
parent(algol60, smalltalk).
parent(algol60, cpp).
parent(algol60, tcl).
parent(algol60, c).
parent(algol60, pl/i).
parent(algol60, scheme).
parent(algol60, perl).
% Fortran77 Family
parent(fortran77,fortran90).
% Smalltalk Family
parent(smalltalk, smalltalk80).
% Smalltalk80 Famiy
parent(smalltalk80, go).
parent(smalltalk80, ruby).
% C Family
parent(c, cpp).
parent(c, python).
% C++ Family
parent(cpp, java).
parent(cpp, python).
parent(cpp, cpp_iso).
parent(cpp, rust).
% PL/I Family
parent(pl/i, pascal).
% Pascal Family
parent(pascal, ada83).
parent(pascal, perl).
% Ada83 Family
parent(ada83, eiffel).
% Eiffel Family
parent(eiffel, ruby).
% Perl Family
parent(perl, ruby).
parent(perl, perl_5).
% Python Family
parent(python, python_2_0).
parent(python, ruby).
% Python 2.0 Family
parent(python_2_0, go).
parent(python_2_0, swift).
% C++_ISO Family
parent(cpp_iso, csharp).
% C# Family
parent(csharp, csharp_2_0).
% C# 2.0 Family
parent(csharp_2_0, csharp_5_0).
parent(csharp_2_0, kotlin).
% C# 5.0 Family
parent(csharp_5_0, javascript_es2017).
parent(csharp_5_0, swift).
% Java Family
parent(java, csharp).
parent(java, javascript).
parent(java, java_5).
% JavaScript Family
parent(javascript, kotlin).
parent(javascript, javascript_es2017).
% Java 5 Family
parent(java_5, java_8).
parent(java_5, kotlin).
% Scheme Family
parent(scheme, scheme_r5rs).
parent(scheme, commonlisp).
% Scheme R5RS Family
parent(scheme_r5rs, rust).
% Rust Family
parent(rust, swift).
% Ruby Family
parent(ruby, swift).

born(fortran, 1956).
born(algol60, 1960).
born(pl/i, 1964).
born(smalltalk, 1968).
born(smalltalk80, 1980).
born(c, 1978).
born(cpp, 1984).
born(tcl, 1988).
born(scheme, 1974).
born(perl, 1986).
born(fortran77, 1976).
born(fortran90, 1990).
born(python, 1990).
born(commonlisp, 1984).
born(java, 1994).
born(javascript, 1994).
born(ruby, 1994).
born(perl_5, 1994).
born(scheme_r5rs, 1998).
born(cpp_iso, 1998).
born(csharp, 2000).
born(pascal, 1970).
born(ada83, 1982).
born(eiffel, 1986).
born(python_2_0, 2000).
born(go, 2008).
born(java_5, 2004).
born(kotlin, 2010).
born(java_8, 2014).
born(csharp_5_0, 2012).
born(swift, 2014).
born(rust, 2010).
born(csharp_2_0, 2004).

% Ancestors
ancestor(A, D) :- parent(A, D).
ancestor(A, D) :- parent(A, X), ancestor(X, D).

% Descendants
descendant(D, A) :- parent(A, D).
descendant(D, A) :- parent(A, X), descendant(D, X).

% Siblings
sibling(X, Y) :- parent(P, X), parent(P, Y), X\=Y.

% Cousins
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

% Older and younger comparisons
older(X, Y) :- born(X, Xborn), born(Y, Yborn), Xborn < Yborn.
olderThan2000(Language) :- born(Language, Year), Year < 2000.


:- use_module(library(lists)).
right_of(A, B, Tree):- append(_, [B, A|_], Tree).

% Besides
beside(A, B, Tree):- right_of(A, B, Tree).
beside(B, A, Tree):- right_of(B, A, Tree).


lang(fortran, algol60):-
solution([
         % Fortran Family
           c('Fortran', '-', 'Algol60', '-', '_', 1957),
           c('Algol60', 'Fortran', '', 'Fortran77', '_', 1960),
           % Algol Branch
           c('Smalltalk', 'Algol60', 'Smalltalk80', '-', '-', 1968),
           c('C(K&R)', 'Algol60', 'C++, Python', 'Smalltalk', '-', 1978),
           c('C++', 'Algol60', 'Python', 'C', '', 1984),
           c('Fortran77', 'Fortran', '', 'Algol60', '_', 1976)
]).


lang(fortran, algol60) :-
solution(Tree),
member(c(fortran, _, _, _, _, 1957), Tree),
member(c(algol60, _, _, _, _, 1960), Tree).
%member(c(Prolog, _, _, _, 1970), Tree),
%member(c(Fortran77, _, _, _, 1976), Tree).

% To run program
% ?- run
run :-
solution(Tree),
format("~w~t~12|~w~t~24|~w~t~36|~w~t~50|~w~t~62|~w~n",
['Language','Parent','Child', 'Sibling', 'Cousin', 'Year']),
forall(member(c(L, P, C, S, CS, Y), Tree),
format("~w~t~12|~w~t~24|~w~t~36|~w~t~50|~w~t~62|~w~n",[L, P, C, S, CS, Y])),
nl,
lang(fortran, algol60),
format("~w is a Parent with children.~n",[fortran]),
format("~w is a Child of Fortrant.~n",[algol60]).