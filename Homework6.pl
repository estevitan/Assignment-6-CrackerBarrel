% HOMEWORK6.PL
% SOLVES THE CRACKER BARREL PEG PUZZLE BY CREATING A BOARD
% AND MOVING PEGS IN PROLOG


% FIRST WE CREATE THE PEG PUZZLE BOARD
% THE 14 REPRESENTS THE TRIANGLE SHAPE
% CONTAINING 14 PEG SPACES

board(N) :-
  remove_peg(N,Startingboard),
  solve_board(14,[Startingboard],Solution),
  reverse(Solution,[],OrderedSolution),
  nl,nl,
  show_boards(OrderedSolution).

%
% FUNCTION FOR SOLVING THE PUZZLE
% 
solve_board(1,Solution,Solution).
solve_board(Count,[Currentboard|Priorboards],Solution):-
  move(Currentboard,Nextboard),
  NewCount is Count -1,
  write(NewCount),nl,
  solve_board(NewCount,
      [Nextboard,Currentboard|Priorboards],
      Solution).
%
remove_peg(1,board(0,1,1,1,1,1,1,1,1,1,1,1,1,1,1)).
remove_peg(2,board(1,0,1,1,1,1,1,1,1,1,1,1,1,1,1)).
remove_peg(3,board(1,1,0,1,1,1,1,1,1,1,1,1,1,1,1)).
remove_peg(4,board(1,1,1,0,1,1,1,1,1,1,1,1,1,1,1)).
remove_peg(5,board(1,1,1,1,0,1,1,1,1,1,1,1,1,1,1)).
remove_peg(6,board(1,1,1,1,1,0,1,1,1,1,1,1,1,1,1)).
remove_peg(7,board(1,1,1,1,1,1,0,1,1,1,1,1,1,1,1)).
remove_peg(8,board(1,1,1,1,1,1,1,0,1,1,1,1,1,1,1)).
remove_peg(9,board(1,1,1,1,1,1,1,1,0,1,1,1,1,1,1)).
remove_peg(10,board(1,1,1,1,1,1,1,1,1,0,1,1,1,1,1)).
remove_peg(11,board(1,1,1,1,1,1,1,1,1,1,0,1,1,1,1)).
remove_peg(12,board(1,1,1,1,1,1,1,1,1,1,1,0,1,1,1)).
remove_peg(13,board(1,1,1,1,1,1,1,1,1,1,1,1,0,1,1)).
remove_peg(14,board(1,1,1,1,1,1,1,1,1,1,1,1,1,0,1)).
remove_peg(15,board(1,1,1,1,1,1,1,1,1,1,1,1,1,1,0)).

%
move(board(1,
		1,C,
	  0,E,F,
	 G,H,I,J,
	K,L,M,N,P),
board(0,
0,C,
1,E,F,
G,H,I,J,
K,L,M,N,P)).
move(board(1,B,1,D,E,0,G,H,I,J,K,L,M,N,P),
board(0,B,0,D,E,1,G,H,I,J,K,L,M,N,P)).
move(board(A,1,C,1,E,F,0,H,I,J,K,L,M,N,P),
board(A,0,C,0,E,F,1,H,I,J,K,L,M,N,P)).
move(board(A,1,C,D,1,F,G,H,0,J,K,L,M,N,P),
board(A,0,C,D,0,F,G,H,1,J,K,L,M,N,P)).
move(board(A,B,1,D,1,F,G,0,I,J,K,L,M,N,P),
board(A,B,0,D,0,F,G,1,I,J,K,L,M,N,P)).
move(board(A,B,1,D,E,1,G,H,I,0,K,L,M,N,P),
board(A,B,0,D,E,0,G,H,I,1,K,L,M,N,P)).
move(board(0,1,C,1,E,F,G,H,I,J,K,L,M,N,P),
board(1,0,C,0,E,F,G,H,I,J,K,L,M,N,P)).
move(board(A,B,C,1,1,0,G,H,I,J,K,L,M,N,P),
board(A,B,C,0,0,1,G,H,I,J,K,L,M,N,P)).
move(board(A,B,C,1,E,F,G,1,I,J,K,L,0,N,P),
board(A,B,C,0,E,F,G,0,I,J,K,L,1,N,P)).
move(board(A,B,C,1,E,F,1,H,I,J,0,L,M,N,P),
board(A,B,C,0,E,F,0,H,I,J,1,L,M,N,P)).
move(board(A,B,C,D,1,F,G,1,I,J,K,0,M,N,P),
board(A,B,C,D,0,F,G,0,I,J,K,1,M,N,P)).
move(board(A,B,C,D,1,F,G,H,1,J,K,L,M,0,P),
board(A,B,C,D,0,F,G,H,0,J,K,L,M,1,P)).
move(board(0,B,1,D,E,1,G,H,I,J,K,L,M,N,P),
board(1,B,0,D,E,0,G,H,I,J,K,L,M,N,P)).
move(board(A,B,C,0,1,1,G,H,I,J,K,L,M,N,P),
board(A,B,C,1,0,0,G,H,I,J,K,L,M,N,P)).
move(board(A,B,C,D,E,1,G,H,1,J,K,L,0,N,P),
board(A,B,C,D,E,0,G,H,0,J,K,L,1,N,P)).
move(board(A,B,C,D,E,1,G,H,I,1,K,L,M,N,0),
board(A,B,C,D,E,0,G,H,I,0,K,L,M,N,1)).
move(board(A,0,C,1,E,F,1,H,I,J,K,L,M,N,P),
board(A,1,C,0,E,F,0,H,I,J,K,L,M,N,P)).
move(board(A,B,C,D,E,F,1,1,0,J,K,L,M,N,P),
board(A,B,C,D,E,F,0,0,1,J,K,L,M,N,P)).
move(board(A,B,0,D,1,F,G,1,I,J,K,L,M,N,P),
board(A,B,1,D,0,F,G,0,I,J,K,L,M,N,P)).
move(board(A,B,C,D,E,F,G,1,1,0,K,L,M,N,P),
board(A,B,C,D,E,F,G,0,0,1,K,L,M,N,P)).
move(board(A,0,C,D,1,F,G,H,1,J,K,L,M,N,P),
board(A,1,C,D,0,F,G,H,0,J,K,L,M,N,P)).
move(board(A,B,C,D,E,F,0,1,1,J,K,L,M,N,P),
board(A,B,C,D,E,F,1,0,0,J,K,L,M,N,P)).
move(board(A,B,0,D,E,1,G,H,I,1,K,L,M,N,P),
board(A,B,1,D,E,0,G,H,I,0,K,L,M,N,P)).
move(board(A,B,C,D,E,F,G,0,1,1,K,L,M,N,P),
board(A,B,C,D,E,F,G,1,0,0,K,L,M,N,P)).
move(board(A,B,C,0,E,F,1,H,I,J,1,L,M,N,P),
board(A,B,C,1,E,F,0,H,I,J,0,L,M,N,P)).
move(board(A,B,C,D,E,F,G,H,I,J,1,1,0,N,P),
board(A,B,C,D,E,F,G,H,I,J,0,0,1,N,P)).
move(board(A,B,C,D,0,F,G,1,I,J,K,1,M,N,P),
board(A,B,C,D,1,F,G,0,I,J,K,0,M,N,P)).
move(board(A,B,C,D,E,F,G,H,I,J,K,1,1,0,P),
board(A,B,C,D,E,F,G,H,I,J,K,0,0,1,P)).
move(board(A,B,C,D,E,F,G,H,I,J,0,1,1,N,P),
board(A,B,C,D,E,F,G,H,I,J,1,0,0,N,P)).
move(board(A,B,C,0,E,F,G,1,I,J,K,L,1,N,P),
board(A,B,C,1,E,F,G,0,I,J,K,L,0,N,P)).
move(board(A,B,C,D,E,0,G,H,1,J,K,L,1,N,P),
board(A,B,C,D,E,1,G,H,0,J,K,L,0,N,P)).
move(board(A,B,C,D,E,F,G,H,I,J,K,L,1,1,0),
board(A,B,C,D,E,F,G,H,I,J,K,L,0,0,1)).
move(board(A,B,C,D,E,F,G,H,I,J,K,0,1,1,P),
board(A,B,C,D,E,F,G,H,I,J,K,1,0,0,P)).
move(board(A,B,C,D,0,F,G,H,1,J,K,L,M,1,P),
board(A,B,C,D,1,F,G,H,0,J,K,L,M,0,P)).
move(board(A,B,C,D,E,F,G,H,I,J,K,L,0,1,1),
board(A,B,C,D,E,F,G,H,I,J,K,L,1,0,0)).
move(board(A,B,C,D,E,0,G,H,I,1,K,L,M,N,1),
board(A,B,C,D,E,1,G,H,I,0,K,L,M,N,0)).
%
%
show_boards([]) :- !.
show_boards([
board(A,
	B,C,
	D,E,F,
	G,H,I,J,
	K,L,M,N,P)|Nextboards]) :-
sp(4),write(A),nl,
sp(3),write(B),sp(1),write(C),nl,
sp(2),write(D),sp(1),write(E),sp(1),write(F),nl,
sp(1),write(G),sp(1),write(H),sp(1),write(I),sp(1),write(J),nl,
write(K),sp(1),write(L),sp(1),write(M),sp(1),
write(N),sp(1),write(P),nl,
write('Solving peg board'),
get0(_),
nl,nl,
show_boards(Nextboards).
sp(0).
sp(N) :- write(' '),
M is N - 1,
sp(M).
