% 4x4 Sudoku — Question 1a (rows and columns only)
num(1..4).
row(1..4).
col(1..4).

% Fill each cell with exactly one number
sudoku(X,Y,N) :- row(X), col(Y), num(N), not other_num(X,Y,N).
other_num(X,Y,N) :- sudoku(X,Y,M), M != N.

% Rows must have unique numbers
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Columns must have unique numbers
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

% Include initial numbers
sudoku(X,Y,N) :- initial(X,Y,N).

#show sudoku/3.