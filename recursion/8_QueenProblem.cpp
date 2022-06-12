/* This program uses recursion to solve the 8 queens problem.
* In this problem 8 queens are to be placed on a chess board.
* The goal is to place all queens on a chess board in such a way 
* that no queen is in the path of another queen.
* The program then prints a solution to the console
*/
#include <iostream>
#include <vector>
using namespace std;


class Queen {
public:
    void setRow(int inRow);
    int getRow() const;
private:
    int row;
};




int Queen::getRow() const
{
    return row;
}




void Queen::setRow(int inRow)
{
    row = inRow;
}




class Board {
public:
    static const int BOARD_SIZE = 8;
    Board();
    void doQueens();
    void display() const;
private:
    bool placeQueens(int row, int col);
    bool findNextSafeSquare(int& row, int col);
    bool isUnderAttack(int row, int col);
    vector<Queen> queens;
};




Board::Board()
{
    queens.resize(BOARD_SIZE);
}





// tries to find a solution or fails if no solution is possible
void Board::doQueens()
{
    if (placeQueens(0, 0))
    {
        display();
    }
    else
    {
        cout << "No solution found." << endl;
    }
}





//places a queen on the board
bool Board::placeQueens(int row, int col)
{

    findNextSafeSquare(row, col);
    while (findNextSafeSquare(row, col))
    {
        queens[col].setRow(row);
        if (col >= 7 || placeQueens(0, col + 1))
            return true;
        else
            row = queens[col].getRow();
        findNextSafeSquare(row, col);
    }
    return false;

}





//Checks to see if the queen placement is valid.
// the placement is valid if the queen is not under attack
bool Board::isUnderAttack(int testRow, int testCol)
{
    if (testCol == 0)
        return false;
    for (int i = testCol;i >= 0;i--)
    {
        if (queens[i].getRow() == testRow)
        {
            return true;
        }
    }

    int counter = 0;

    for (int i = testCol;i >= 0;i--)
    {
        if (queens[i].getRow() == testRow + counter)
            return true;
        if ((testRow + counter) >= BOARD_SIZE)
            break;
        counter++;
    }

    counter = 0;

    for (int i = testCol;i >= 0;i--)
    {
        if (queens[i].getRow() == testRow - counter)
            return true;
        if ((testRow - counter) < 0)
            break;
        counter++;
    }

    return false;
}





// Sets "row" to the row of the next safe square in column col. 
// Starts with the given row and col.  In other words, the given row and col may
// be the "next safe square". 
// returns true if a safe square is found, false if no safe square is found.  If 
// return value is false, row is undefined.

bool Board::findNextSafeSquare(int& row, int col)
{

    for (int i = 0;i < BOARD_SIZE && row < BOARD_SIZE;i++)
    {
        if (!isUnderAttack(row, col))
            return true;
        row++;
    }
    return false;

}





// Displays a visual representation of the current state of the board.  For each position
// on the board, displays "X" if a queen is located at that position, otherwise displays
// "_" (underscore).

void Board::display() const
{
    for (int i = 0;i < BOARD_SIZE;i++)
    {
        for (int j = 0;j < BOARD_SIZE;j++)
        {
            if (queens[j].getRow() == i)
                cout << "X  ";
            else
                cout << "_  ";
        }
        cout << endl;
    }

}







int main()
{
    Board board;
    board.doQueens();
}