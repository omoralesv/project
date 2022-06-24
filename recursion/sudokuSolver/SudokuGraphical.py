# This program solves a sudoku board and shows the solution
# in a visual form. Just adjust the "board" located in the Grid class before starting the program
# While the program is running, press space to activate the solver
import pygame

width,height=500,500
WINDOW = pygame.display.set_mode((width,height))
pygame.display.set_caption("Sudoku Solver")
start_img = pygame.image.load('start.png')
restart_img = pygame.image.load('restart.png')
FPS = 60





class Grid:
    board = [
        [5, 3, 4, 6, 7, 8, 9, 1, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9]
    ]



#class constructor
    def __init__(self, rows, cols, width, height, WINDOW):
         self.rows=rows
         self.cols=cols
         self.cubes=[[Cube(self.board[i][j],i,j,width,height) for j in range(cols)]for i in range(rows)]
         self.width=width
         self.height=height
         self.model = None
         self.update_model()
         self.selected=None
         self.window=WINDOW
        


# updates model after something is changed
    def update_model(self):
        self.model = [[self.cubes[i][j].value for j in range(self.cols)] for i in range(self.rows)]



# draws the grid on the window
    def drawWindow(self):
        WINDOW.fill((255,255,255))
    
        # set up font for the title
        pygame.font.init()
        my_font = pygame.font.SysFont('arial',35)
        title_text = my_font.render('Sudoku Solver',False,(0,0,0))
    
    
        gap = width /9;

        # draw lines for the board
        for i in range(10):
            if i % 3 == 0 and i !=0:
                thick = 4
            else:
                thick = 1

            pygame.draw.line(WINDOW,(0,0,0),(0,(i*gap)),(width,(i*gap)),thick)          #horizontal lines
            pygame.draw.line(WINDOW, (0, 0, 0), (i * gap, 0), (i * gap, height), thick)       #vertical lines
        
        pygame.draw.rect(WINDOW,(255,255,255),(0,600,500,100))
        
        # draw cubes
        for i in range(self.rows):
            for j in range(self.cols):
                self.cubes[i][j].draw(self.window)

        

#checks to see if the algorithm has finished
    def is_finished(self):
        for i in range(self.rows):
            for j in range(self.cols):
                if self.cubes[i][j].value == 0:
                    return False
        return True



# solves the sudoku puzzle in the grid
    def solve(self):
        find = find_empty(self.model)
        if not find:
            return True
        else:
            row, col = find

        for i in range(1, 10):
            if valid(self.model, i, (row, col)):
                self.model[row][col] = i

                if self.solve():
                    return True

                self.model[row][col] = 0

        return False



# shows the solution being created in graphical form
    def solve_gui(self):
        self.update_model()
        find = find_empty(self.model)
        if not find:
            return True
        else:
            row, col = find

        for i in range(1, 10):
            if valid(self.model, i, (row, col)):
                self.model[row][col] = i
                self.cubes[row][col].set(i)
                self.cubes[row][col].draw_change(self.window, True)
                self.update_model()
                pygame.display.update()
                if(row < 3):
                    pygame.time.delay(1)
                else: 
                    pygame.time.delay(100)

                if self.solve_gui():
                    return True

                self.model[row][col] = 0
                self.cubes[row][col].set(0)
                self.update_model()
                self.cubes[row][col].draw_change(self.window, False)
                pygame.display.update()
                if(row < 63):
                    pygame.time.delay(1)
                else: 
                    pygame.time.delay(100)

        return False





class Cube:

    rows = 9
    cols = 9


# class constructor
    def __init__(self, value, row, col, width, height):
        self.value = value
        self.temp = 0
        self.row = row
        self.col = col
        self.width = width
        self.height = height
        self.selected = False


# draws to the numbers on the board
    def draw(self, win):
        fnt = pygame.font.SysFont("arial", 40)

        gap = self.width / 9
        x = self.col * gap
        y = self.row * gap

        if self.temp != 0 and self.value == 0:
            text = fnt.render(str(self.temp), 1, (128,128,128))
            win.blit(text, (x+5, y+5))
        elif not(self.value == 0):
            text = fnt.render(str(self.value), 1, (0, 0, 0))
            win.blit(text, (x + (gap/2 - text.get_width()/2), y + (gap/2 - text.get_height()/2)))

        if self.selected:
            pygame.draw.rect(win, (4,131,181), (x,y, gap ,gap), 3)




    def draw_change(self, win, g=True):
        fnt = pygame.font.SysFont("arial", 40)

        gap = self.width / 9
        x = self.col * gap
        y = self.row * gap

        pygame.draw.rect(win, (255, 255, 255), (x, y, gap, gap), 0)

        text = fnt.render(str(self.value), 1, (0, 0, 0))
        win.blit(text, (x + (gap / 2 - text.get_width() / 2), y + (gap / 2 - text.get_height() / 2)))
        if g:
            pygame.draw.rect(win, (4, 181, 4), (x, y, gap, gap), 3)
        else:
            pygame.draw.rect(win, (255, 0, 0), (x, y, gap, gap), 3)

    def set(self, val):
        self.value = val

    def set_temp(self, val):
        self.temp = val



# finda the next empty spot on the board
def find_empty(bo):
    for i in range(len(bo)):
        for j in range(len(bo[0])):
            if bo[i][j] == 0:
                return (i, j)  # row, col

    return None



#checks to see if a certain move is valid
def valid(bo, num, pos):
    # Check row
    for i in range(len(bo[0])):
        if bo[pos[0]][i] == num and pos[1] != i:
            return False

    # Check column
    for i in range(len(bo)):
        if bo[i][pos[1]] == num and pos[0] != i:
            return False

    # Check box
    box_x = pos[1] // 3
    box_y = pos[0] // 3

    for i in range(box_y*3, box_y*3 + 3):
        for j in range(box_x * 3, box_x*3 + 3):
            if bo[i][j] == num and (i,j) != pos:
                return False

    return True



def redraw_window(win, board):
    win.fill((255,255,255))
    board.drawWindow()





def main():
    clock = pygame.time.Clock()
    run = True
    key=None
    board=Grid(9,9,500,540,WINDOW)

    while run:
        clock.tick(FPS)

        #set up controls for the game
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                run=False
            if event.type == pygame.KEYDOWN:
                

                if event.key == pygame.K_SPACE:
                    if board.solve_gui() == False:
                        print("No Solution possible")

                
        redraw_window(WINDOW, board)
        pygame.display.update()
    
   





if __name__ == "__main__":
    main()
    pygame.quit()