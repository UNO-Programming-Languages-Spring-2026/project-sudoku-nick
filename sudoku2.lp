% sudoku2.lp -- 9x9 Sudoku: rows/cols/subgrids, respecting initial/3.

row(1..9).
col(1..9).
num(1..9).

cell(X,Y) :- row(X), col(Y).
given(X,Y) :- initial(X,Y,_).

% Subgrid mapping (3x3 blocks)
bx(X,BX) :- row(X), BX = (X-1) / 3.
by(Y,BY) :- col(Y), BY = (Y-1) / 3.
subgrid(X,Y,G) :- cell(X,Y), bx(X,BX), by(Y,BY), G = 3*BX + BY + 1.

% Prefill givens
sudoku(X,Y,N) :- initial(X,Y,N).

% Fill remaining cells
1 { sudoku(X,Y,N) : num(N) } 1 :- cell(X,Y), not given(X,Y).

% Row uniqueness
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 < Y2.

% Column uniqueness
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 < X2.

% Subgrid uniqueness
:- subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   sudoku(X1,Y1,N), sudoku(X2,Y2,N),
   (X1,Y1) < (X2,Y2).

#show sudoku/3.