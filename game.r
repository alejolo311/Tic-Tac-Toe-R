table = matrix( 
  c(0, 0, 0, 0, 0, 0, 0, 0, 0),
  nrow=3,
  ncol=3)

dimnames(table) = list( 
  c("A", "B", "C"),
  c("1", "2", "3"))


checkWinner <- function(table, player){
  winnerCounter <- 0
  win_mov1 <- c(1, 1, 1, 0, 0, 0, 0, 0, 0)
  win_mov2 <- c(0, 0, 0, 1, 1, 1, 0, 0, 0)
  win_mov3 <- c(0, 0, 0, 0, 0, 0, 1, 1, 1)
  win_mov4 <- c(1, 0, 0, 1, 0, 0, 1, 0, 0)
  win_mov5 <- c(0, 1, 0, 0, 1, 0, 0, 1, 0)
  win_mov6 <- c(0, 0, 1, 0, 0, 1, 0, 0, 1)
  win_mov7 <- c(1, 0, 0, 0, 1, 0, 0, 0, 1)
  win_mov8 <- c(0, 0, 1, 0, 1, 0, 1, 0, 0)
  allmoves <- list()
  allMoves <- c(allmoves, list(win_mov1, win_mov2, win_mov3, win_mov4, win_mov5, win_mov6, win_mov7, win_mov8))
  for(move in allMoves) {
      for (i in 1:9){
        if(table[i] != 0 && move[i] != 0 && player == table[i]){
          winnerCounter <- winnerCounter + 1
        }
      }
      if (winnerCounter == 3){
        return (TRUE)
      }
      winnerCounter <- 0
  }
  return (FALSE)
}
clc <- function() cat(rep("\n", 50))
zeros <- function (table) {
  for(i in 1:9) {
    if (table[i] == 0)
      return (TRUE)
  }
  return (FALSE)
}
clc()
print(table)
while(zeros(table)){
print("What is the column you want to choose: 1, 2 or 3")
column <- readLines("stdin",n=1);
print("What is the row you want to choose: A, B or C")
row <- readLines("stdin",n=1);
position <- paste(row, column, sep="", collapse = NULL) 
flag <- 0
winState <- 0
clc()
switch(position, 
      "A1" = if(table[1] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[1] <- 1 
                flag <- 1
              },
      "A2" = if(table[4] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[4] <- 1 
                flag <- 1
              },
      "A3" = if(table[7] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[7] <- 1 
                flag <- 1
              },
      "B1" = if(table[2] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[2] <- 1 
                flag <- 1
              },
      "B2" =if(table[5] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[5] <- 1 
                flag <- 1
              },
      "B3" = if(table[8] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[8] <- 1 
                flag <- 1
              },
      "C1" = if(table[3] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[3] <- 1 
                flag <- 1
              },
      "C2" = if(table[6] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[6] <- 1 
                flag <- 1
              },
      "C3" = if(table[9] != 0){
                print("------------- That is positions is taken - Play again -------------")
              } 
              else{
                table[9] <- 1 
                flag <- 1
              })
if(checkWinner(table, 1)){
  winState <- 1
  print("the player wins")
  print(table)
  break
}
if (flag){
  while(TRUE) {
    random <- sample(1:9, 1)
    if (table[random] == 0)
    {
      table[random] <- 2
      break
    }
  }
  
}
if(checkWinner(table, 2)){
  winState <- 1
  print("the computer wins")
  print(table)
  break
}
print(table)
}
if (winState == 0){
  print("the game finish in draw, thanks for playing")
} 
print("Cohort - 10 Holberton Cali")
