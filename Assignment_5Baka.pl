%--------------------------Main run-------------------
run:-
	write('<<WELCOME TO THE LAPTOP PICKER>>'),
	nl,
	write('Answer the following question below.'),
	nl,
	laptop(Laptop).

% if not found laptop
run:-
	nl,
	write('Sorry, I dont seem to be able to find a suitable laptop'),nl.

%--------------------------LAPTOP-----------------------------------
laptop(azuz_zephy) :- azuz_zephy, !.
laptop(jade) :- jade,!.
laptop(msi) :- msi,!.
laptop(ivm) :- ivm,!.
laptop(joi) :- joi,!.

%--------------------------LAPTOP IDENTIFICATION---------------------
azuz_zephy :-
	spec(gaming),
	spec(small_battery),
	spec(expensive),
	spec(heavy),
	spec(screen),
	write('The laptop i will recommend you: Azuz Zephy').

jade :-
	spec(gaming),
	spec(big_battery),
	spec(budget_cheap),
	spec(light),
	spec(webcam),
	spec(screen),
	write('The laptop i will recommend you: Jade').

msi :-
	spec(gaming),
	spec(small_battery),
	spec(expensive),
	spec(heavy),
	spec(webcam),
	write('The laptop i will recommend you: MSI').


ivm :-
	spec(work_study),
	spec(big_battery),
	spec(budget),
	spec(light),
	spec(webcam),
	write('The laptop i will recommend you: IVM').

joi :-
	spec(work_study),
	spec(big_battery),
	spec(expensive),
	spec(light),
	spec(webcam),
	spec(screen),
	write('The laptop i will recommend you: JOI').


%-------------------------ASK ----------------------
% To ask whether or not user uses laptop for work
spec(work_study):-
	nl,
	verify("Are you using your laptop for your work and/or study?").

% To ask whether or not user are looking for gaming laptop
spec(gaming):-
	nl,
	verify("Are you looking for a gaming laptop?").

% To ask whether or not user want a laptop with big battery
spec(big_battery):-
	nl,
	verify("Are you always outside and need big battery?").

% To ask whether or not user want a laptop with small battery
spec(small_battery):-
	nl,
	verify("Do u not mind a laptop with smaller battery?").

% To ask whether or not user wants a heavy laptop
spec(heavy):-
	nl,
	verify("Do you not mind a heavy laptop?").

% To ask whether or not user wants a lightweight laptop
spec(light):-
	nl,
	verify("Do you want a light laptop?").


% To ask whether or not user is rich 
spec(expensive):-
	nl,
	verify("Do u have a high budget?").


% To ask whether the user budget is withn range
spec(budget_cheap):-
	nl,
	verify("Is your laptop budget below RM3000?").

% To ask whether or not user wants a webcam
spec(webcam):-
	nl,
	verify("Do you want your laptop to have a webcam?").


% To ask whether the user wants a color accurate screen
spec(screen):-
	nl,
	verify("Do you want your laptop to have a color accurate screen?").
	

%------------------------FUNCTION-------------------
ask(Question) :-
	write(Question),
	write('(y/n)'), nl,
	write('>:'),
	read(Answer),
	nl,
	( (Answer == yes ; Answer == y)
	 ->
	assert(yes(Question)) ;
	assert(no(Question)), fail).

:- dynamic yes/1,no/1.

verify(Question) :-
   	(yes(Question) -> true ;
	(no(Question) -> fail ;
	ask(Question))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.