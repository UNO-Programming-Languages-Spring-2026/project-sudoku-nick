% sudoku1b.lp -- 4x4 Sudoku: rows, columns + subgrid facts

row(1..4).
col(1..4).
num(1..4).

cell(X,Y) :- row(X), col(Y).
given(X,Y) :- initial(X,Y,_).

% Fill remaining cells
1 { sudoku(X,Y,N) : num(N) } 1 :- cell(X,Y), not given(X,Y).

% Rows unique
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 < Y2.

% Columns unique
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 < X2.

% Prefill initial values
sudoku(X,Y,N) :- initial(X,Y,N).

% Subgrid mapping for 4x4 board
subgrid(X,Y,1) :- row(X), col(Y), X <= 2, Y <= 2.
subgrid(X,Y,2) :- row(X), col(Y), X <= 2, Y > 2.
subgrid(X,Y,3) :- row(X), col(Y), X > 2, Y <= 2.
subgrid(X,Y,4) :- row(X), col(Y), X > 2, Y > 2.