paciente(jonisson, 36, 90, 16, 110, 98, 0, 24, 0).
paciente(gilson, 36, 90, 16, 110, 98, 0, 24, 0).
paciente(marlon, 38, 110, 25, 112, 97, 0, 63, 1).
paciente(claudia, 40, 120, 26, 95, 95, 0, 82, 2).
paciente(glauco, 41, 126, 32, 87, 94, 1, 40, 2).

light_case :-
    paciente(A,B,C,D,E,F,G,H,I),
    B >= 35,
    B =< 37,
    C < 100,
    D < 18,
    E > 100,
    F >= 95,
    G =:= 0,
    H < 60,
    I < 1,
    write('Caso Leve: Deve ficar em casa, em observação por 14 dias!'),
    format('nome: ~w \t temperatura: ~d \t freqcardio: ~d \t freqrespiratoria: ~d \t pasistolica: ~d \t sao2: ~d \t dispineia: ~w \t idade: ~d \t comorbidades: ~d',[A,B,C, D,E,F,G,H,I]),
    nl, fail.


%Não consegui usar a condição OU (;) para (B < 35;) que é uma condição para casos médios
average_case :- 
    paciente(A,B,C,D,E,F,G,H,I),
    (B < 35; B >= 37, B =< 39),
    C > 100,
    D >= 19,
    D =< 30,
    H >= 60,
    H =< 79,
    I =:= 1,
    write('Caso Médio: Deve ficar em casa, em observação por 14 dias!'),
    format('nome: ~w \t temperatura: ~d \t freqcardio: ~d \t freqrespiratoria: ~d \t pasistolica: ~d \t sao2: ~d \t dispineia: ~w \t idade: ~d \t comorbidades: ~d',[A,B,C, D,E,F,G,H,I]),
    nl, fail.


severe_case :-
    paciente(A,B,C,D,E,F,G,H,I),
    B >= 39,
    E >= 90,
    E =< 100,
    H > 80,
    I >= 2,
    write('Caso Grave: Deve ser encaminhado para o hospital!'),
    format('nome: ~w \t temperatura: ~d \t freqcardio: ~d \t freqrespiratoria: ~d \t pasistolica: ~d \t sao2: ~d \t dispineia: ~w \t idade: ~d \t comorbidades: ~d',[A,B,C, D,E,F,G,H,I]),
    nl, fail.

gravissimo_case :-
    paciente(A,B,C,D,E,F,G,H,I),
    D > 30,
    E < 90,
    F < 95,
    G =:= 1,
    write('Caso Gravíssimo: Deve ser encaminhado para o hospital com urgência!'),
    format('nome: ~w \t temperatura: ~d \t freqcardio: ~d \t freqrespiratoria: ~d \t pasistolica: ~d \t sao2: ~d \t dispineia: ~w \t idade: ~d \t comorbidades: ~d',[A,B,C, D,E,F,G,H,I]),
    nl, fail.


%Regras
%Leve() :-
%    Temperatura >= 35 ; Temperatura <=37 , FreqCardio < 100, FreqRespiratoria <18, PaSistolica >100, SaO2 >= 95, Dispineia == N, Idade < 60, Comorbidades < 1.
%Medio() :-
%    Temperatura < 35 ; Temperatura >=37 , Temperatura < 39, FreqCardio > 100, FreqRespiratoria >= 19 ; FreqRespiratoria <= 30, Idade >=60 , Idade <=79, Comorbidades == 1.
%Grave() :-
%    Temperatura >39 ; PaSistolica >= 90 , PaSistolica <=100, Idade >80 Comorbidade >= 2.
%Gravissimo() :-
%    FreqRespiratoria >30, PaSistolica <90, SaO2 <95, Dispineia == S.