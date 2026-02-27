% Sudoku 4x4 — Question 1b
% Numbers and grid
num(1..4).
row(1..4).
col(1..4).

% Each cell must have exactly one number
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Rows contain unique numbers
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Columns contain unique numbers
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Include any given initial numbers
sudoku(X,Y,N) :- initial(X,Y,N).

% Subgrid mapping (4 subgrids)
subgrid(X,Y,1) :- X <= 2, Y <= 2.
subgrid(X,Y,2) :- X <= 2, Y > 2.
subgrid(X,Y,3) :- X > 2, Y <= 2.
subgrid(X,Y,4) :- X > 2, Y > 2.