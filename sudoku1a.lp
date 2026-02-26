% sudoku1a.lp  -- 4x4 Latin square constraints (rows/cols), respecting initial/3.

row(1..4).
col(1..4).
num(1..4).

cell(X,Y) :- row(X), col(Y).

given(X,Y) :- initial(X,Y,_).

% Prefill givens
sudoku(X,Y,N) :- initial(X,Y,N).

% Fill the remaining cells with exactly one number
1 { sudoku(X,Y,N) : num(N) } 1 :- cell(X,Y), not given(X,Y).

% Row uniqueness: same number can't repeat in a row
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 < Y2.

% Column uniqueness: same number can't repeat in a column
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 < X2.
