% establish facts and rules
%    define covid symptoms as facts 
          
%    generate rules from the  facts
    %  a person has covid if  : 
    %       1. has fever true
    %       2. has cold true 

    %       3.has lost taste or smell true 

    %       4 breathing defficulties  true.
    %       5. muscle_pain true.

    % REM: ISOLATION , Antiviral treatments ,MONOCLONAL ANTIBODIES
     %  a person has cold if  : 
    %       1. has  cough true
    %       2. has sore_throat true 
     
    %       3.has   fever true 
    % REM:  SYRUPS , PAINKILLERS
      %  a person has fever if  : 
    %         has chills
                % higH_body temp.  
    % REM : Rest and drink plenty of fluids

          
%  get symptoms from user

%  give recomendations 


% BASE SYMPTOMS 
:- dynamic patient/2.
symptom('cough').
symptom('sore throat').
symptom('high  body temperature').
symptom('has chills').
symptom('cold').
symptom('lost taste smell').
symptom('dufficulty breathing').
symptom('muscle pain').



treatment('cold','take cold capsules').
treatment('lost taste smell','inhale  steam').
treatment('dufficulty breathing','use inhalers or ').
treatment('muscle pain','use painkillers').
treatment('sore throat','use strepsils').
treatment('has chills','keep warm and take a rest').
treatment('cough','use cough treatments ').


% get user response 

diagnose :- dynamic(patient/2),
    repeat,
    write('WELCOME TO MMU COVID TEST :) '),nl,
    symptom(X),
    write('Does the patient have '),
    write(X),
    write('? '),
    read(Y),
    assert(patient(X,Y)),
    \+ not(X='muscle pain'),
    not(output),
    write('Diagnosis completed :) ').

%  disease  rules 
disease(covid) :- 
patient('high  body temperature',yes),
patient('cold',yes),
patient('lost taste smell',yes),
patient('dufficulty breathing' ,yes),
patient('muscle pain',yes),
patient('sore throat',yes),
patient('has chills',yes),
patient('cough',yes).


disease(cold) :-
not(disease(covid)),
patient('sore throat',yes), 
patient('cough',yes). 


   

disease(fever) :-
not(disease(covid)),
not(disease(cold)),
patient('high  body temperature',yes),
patient('has chills',yes).

output:-
    nl,
    possible_diseases,
    nl,
    advice.

possible_diseases :- disease(X), write('The patient may suffer from '), write(X),nl,
write('RECCOMENDATIONS'),nl.
advice :- symptom(X), patient(X,yes), treatment(X,Y), write(Y),nl, \+ not(X='muscle pain'),nl.