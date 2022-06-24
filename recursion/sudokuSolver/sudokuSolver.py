# This program solves a given sudoku board using
# backrtacking/recursion 
# The solved board is then printed to the console 

startingBoard = [
    [0,8,0,7,0,1,0,3,0],
    [4,0,9,0,0,0,0,0,0],
    [0,5,0,0,6,0,4,1,8],
    [7,0,0,0,0,9,0,0,0],
    [8,0,0,6,1,0,5,0,0],
    [0,3,5,0,0,0,0,2,9],
    [0,6,0,4,0,7,0,9,0],
    [1,0,0,0,0,8,0,0,4],
    [0,2,0,0,5,0,0,7,0]
]



# solves the given sudoku board using backtracking 
def solve(board):

    find = find_empty(board)
    if find:
        row, col = find
    else:
        return True

    for i in range(1,10):
        if valid(board, (row, col), i):
            board[row][col] = i

            if solve(board):
                return True

            board[row][col] = 0

    return False




# checks to see if the move is valid
# returns true if it is or Fasle if it
# is invalid
def valid(board, coordinate, num):

    # Check row for duplicate
    for i in range(0, len(board)):
        if board[coordinate[0]][i] == num and coordinate[1] != i:
            return False

    # Check Col for duplicate
    for i in range(0, len(board)):
        if board[i][coordinate[1]] == num and coordinate[1] != i:
            return False

    # Check box for duplicate

    boxRow = coordinate[1]//3
    boxCol = coordinate[0]//3

    for i in range(boxCol*3, boxCol*3 + 3):
        for j in range(boxRow*3, boxRow*3 + 3):
            if board[i][j] == num and (i,j) != coordinate:
                return False

    return True




# finds an empty space in the sudoku board
# and returns the cordinates of the empty space
# returns none if no empty space is found 
def find_empty(board):

    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j] == 0:
                return (i, j)

    return None




# prints the sudoku board in its current state
# the board is formated to look more like a traditional
# sudoku board
def printBoard (board):
    row=0
    col=0
    
    print("\t=======================")
    print("\t  Solved Sudoku Board ")
    print("\t=======================\n\n")
    while(row<9):
        col=0
        while(col<9):
            print(board[row][col],end='')
            print("  ",end='')
            if ((col+1) % 3) == 0:
                print("| ",end='')
            col+=1
        
        print("")
        if ((row+1) % 3) == 0:
                print("--------------------------------")
        row+=1



solve(startingBoard)
printBoard(startingBoard)