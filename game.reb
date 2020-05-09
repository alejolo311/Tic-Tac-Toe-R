#!/usr/local/bin/r3 -cs
REBOL []
A: make vector![integer! 32 [0 0 0]]
B: make vector![integer! 32 [0 0 0]]
C: make vector![integer! 32 [0 0 0]]
player: make integer! 1
robot: make integer! 2
print [
  " " "1" "2" "3" #"^/" "A" A #"^/" "B" B #"^/" "C" C #"^/"
]
table: [
  [0 0 0]
  [0 0 0]
  [0 0 0]
]

check: func[] [
  winnerCounter: 0
  allmoves: [
    [1 1 1 0 0 0 0 0 0]
    [0 0 0 1 1 1 0 0 0]
    [0 0 0 0 0 0 1 1 1]
    [1 0 0 1 0 0 1 0 0]
    [0 1 0 0 1 0 0 1 0]
    [0 0 1 0 0 1 0 0 1]
    [1 0 0 0 1 0 0 0 1]
    [0 0 1 0 1 0 1 0 0]
  ]
  vectorWay: array 9 
  poke vectorWay 1 table/1/1
  poke vectorWay 2 table/1/2
  poke vectorWay 3 table/1/3
  poke vectorWay 4 table/2/1
  poke vectorWay 5 table/2/2
  poke vectorWay 6 table/2/3
  poke vectorWay 7 table/3/1
  vectorWay/8: table/3/2
  vectorWay/9: table/3/3
  foreach move allmoves[
    winnerCounter: 0
    for i 1 9 1[
      if all [player == vectorWay/:i vectorWay/:i != 0 move/:i != 0]
      [
        winnerCounter: winnerCounter + 1
      ]
    ]
      either equal? winnerCounter 3 [
        either [player = 1][
          print "the player wins"
          probe table
          quit
      ]
      [
        print "the computer wins"
        probe table
        quit
      ]
    ][]
  ]
]
checkRobot: func[] [
  winnerCounter: 0
  allmoves: [
    [1 1 1 0 0 0 0 0 0]
    [0 0 0 1 1 1 0 0 0]
    [0 0 0 0 0 0 1 1 1]
    [1 0 0 1 0 0 1 0 0]
    [0 1 0 0 1 0 0 1 0]
    [0 0 1 0 0 1 0 0 1]
    [1 0 0 0 1 0 0 0 1]
    [0 0 1 0 1 0 1 0 0]
  ]
  vectorWay: array 9 
  poke vectorWay 1 table/1/1
  poke vectorWay 2 table/1/2
  poke vectorWay 3 table/1/3
  poke vectorWay 4 table/2/1
  poke vectorWay 5 table/2/2
  poke vectorWay 6 table/2/3
  poke vectorWay 7 table/3/1
  vectorWay/8: table/3/2
  vectorWay/9: table/3/3
  foreach move allmoves[
    winnerCounter: 0
    for i 1 9 1[
      if all [robot == vectorWay/:i vectorWay/:i != 0 move/:i != 0]
      [
        winnerCounter: winnerCounter + 1
      ]
    ]
      either equal? winnerCounter 3 [
        either [robot = 1][
          print "the robot wins"
          probe table
          quit
      ]
      [
        print "the computer wins"
        probe table
        quit
      ]
    ][]
  ]
]

zeros: func [] [
  for i 1 3 1 [
    for j 1 3 1 [
      if all [table/:i/:j == 0 table/:i/:j != 1 table/:i/:j != 2][
        return 20
      ]
  ]
  ]
  print "the game finish in draw, thanks for playing"
  quit
]

while [TRUE][
  print "What is the postion that you want to choose ex: A1"
  position: input 
  flag: 0

  switch position [    ; words
          "A1" [
            either table/1/1 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
            ]
            [
              table/1/1: 1
              flag: 1
            ]
              
          ]
          "A2" [
            either table/1/2 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
            ]
            [
              table/1/2: 1
              flag: 1
            ]
              
          ]
          "A3" [
            either table/1/3 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
            ]
            [
              table/1/3: 1
              flag: 1
            ]
              
          ]
          "B1" [
            either table/2/1 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
              
            ]
            [
              table/2/1: 1
              flag: 1
            ]
              
          ]
          "B2" [
            either table/2/2 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
            ]
            [
              table/2/2: 1
              flag: 1
            ]
              
          ]
          "B3" [
            either table/2/3 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
              
            ]
            [
              table/2/3: 1
              flag: 1
            ]
              
          ]
          "C1" [
            either table/3/1 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
             
            ]
            [
              table/3/1: 1
              flag: 1
            ]
              
          ]
          "C2" [
            either table/3/2 == 1
            [
              print "------------- That is positions is taken - Play again -------------"
              
            ]
            [
              table/3/2: 1
              flag: 1
            ]
              
          ]
          "C3" [
            either table/3/3 == 1
            [
              print "------------- That is positions is taken - Play again -------------" 
            ]
            [
              table/3/3: 1
              flag: 1
            ]
              
          ]
      ]
  check []
  zeros
  either flag == 1 
  [
    while [TRUE][
      random/seed now
      row: random 3
      random/seed now
      column: random 3
      if all [table/:row/:column == 0 table/:row/:column != 2][
        table/:row/:column: 2
        BREAK
      ]
    ]
  ][]
  checkRobot []
  probe table

]
print "the game finish in draw, thanks for playing"