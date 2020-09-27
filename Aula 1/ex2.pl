pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

team(lamb,breitling).
team(besenyei,"Red Bull").
team(chambliss,"Red Bull").
team(maclean,"Mediterranean Racing Team").
team(mangold,cobra).
team(jones,matador).
team(bonhomme,matador).

plane(lamb,mx2).
plane(besenyei,edge540).
plane(chambliss,edge540).
plane(maclean,edge540).
plane(mangold,edge540).
plane(jones,edge540).
plane(bonhomme,edge540).

circuit(istanbul).
circuit(budapest).
circuit(porto).

win(jones,porto).
win(mangold,budapest).
win(mangold,istanbul).

gates(istanbul,9).
gates(budapest,6).
gates(porto,5).

team_win(X,Y) :- 
    team(Z,X),
    win(Z,Y).

/* Queries
a) win(A,porto).
b) team_win(B,porto).
c) win(C,D),win(C,E),D\=E.
d) gates(F,G),G>8.
e) plane(H,I),I\=edge540.
*/