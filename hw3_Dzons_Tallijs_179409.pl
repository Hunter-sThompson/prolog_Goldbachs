is_prime(N) :-
    integer(N),
    N > 3,
    N mod 2 =\= 0,
    \+ has_factor(N,3).

has_factor(N,Factor) :-
    N mod Factor =:= 0.
has_factor(N,Factor) :-
    Factor*Factor < N,
    NextFactor is Factor + 2,
    has_factor(N,NextFactor).

goldbach(N, [P,Q]) :-
    N > 2,
    N mod 2 =:= 0,
    Max is floor(N/2),
    between(2, Max, P),
    is_prime(P),
    Q is N - P,
    is_prime(Q).

goldbach_list(N1, N3) :-
    between(N1, N3, N),
    N mod 2 =:= 0,
    goldbach(N, [P,Q]),
    format('~w = ~w + ~w~n', [N, P, Q]),
    fail.
goldbach_list(_, _).
