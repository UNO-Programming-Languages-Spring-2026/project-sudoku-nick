% 4x4 Sudoku — Question 1a
num(1..4).
row(1..4).
col(1..4).

% Each cell has exactly one number
1 { sudoku(X,Y,N) : num(N) } 1 :- row(X), col(Y).

% Each row contains unique numbers
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Each column contains unique numbers
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Include initial numbers
sudoku(X,Y,N) :- initial(X,Y,N).