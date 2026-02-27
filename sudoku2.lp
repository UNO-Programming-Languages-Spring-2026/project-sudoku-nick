% Sudoku 9x9 — Question 2
num(1..9).
row(1..9).
col(1..9).

1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Rows contain unique numbers
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Columns contain unique numbers
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Include any given initial numbers
sudoku(X,Y,N) :- initial(X,Y,N).

% 3x3 subgrid mapping
subgrid(X,Y,1) :- X<=3, Y<=3.
subgrid(X,Y,2) :- X<=3, Y>3, Y<=6.
subgrid(X,Y,3) :- X<=3, Y>6.
subgrid(X,Y,4) :- X>3, X<=6, Y<=3.
subgrid(X,Y,5) :- X>3, X<=6, Y>3, Y<=6.
subgrid(X,Y,6) :- X>3, X<=6, Y>6.
subgrid(X,Y,7) :- X>6, Y<=3.
subgrid(X,Y,8) :- X>6, Y>3, Y<=6.
subgrid(X,Y,9) :- X>6, Y>6.

% Numbers in each subgrid must be unique
:- sudoku(X1,Y1,N), sudoku(X2,Y2,N), subgrid(X1,Y1,G), subgrid(X2,Y2,G), (X1,Y1) != (X2,Y2).

#show sudoku/3.