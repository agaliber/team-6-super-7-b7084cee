*** Settings ***
Documentation     I want to move my character. If they attempt to move past a boundary, the move results in no change in position. Test start of game. Let's play \n\n https://github.com/level-up-program/team-6-super-7-b7084cee/blob/syncpoint-code-complete/tests/robot/images/IMG_3821.jpg
Test Template     Move character
Library           MoveLibrary.py

*** Test Cases ***                  StartingX     StartingY     StartingMoveCount     Direction     EndingX     EndingY     EndingMoveCount
Move in the middle of the board     0             0             1                     NORTH         0           1           2
Move on the edge of the board       0             0             5                     SOUTH         0           0           6
test 1                              6             5             1                     NORTH         6           6           2
test 2                              6             6             2                     SOUTH         6           5           3
test 3                              6             5             3                     WEST          5           5           4
test 4                              0             0             10                    SOUTH         0           0           11
test 5                              0             9             15                    NORTH         0           9           16
test 6                              0             9             19                    WEST          0           9           20
test 7                              9             9             25                    NORTH         9           9           26
test 8                              9             8             32                    EAST          9           8           33
test 9                              9             0             45                    SOUTH         9           0           46
test 10                             9             1             97                    EAST          9           1           98
test 11                             4             5             105                   NORTH         4           6           106
test 12                             5             4             5                     SOUTH         5           3           6
test 13                             6             5             35                    EAST          7           5           36
test 14                             5             6             63                    WEST          4           6           64
test 15                             8             4             115                   NORTH         8           5           116
test 16                             1             7             175                   SOUTH         1           6           176
test 17                             3             2             800                   EAST          4           2           801
test 18                             0             5             1                     WEST          0           5           2
test 19                             4             8             5                     NORTH         4           9           6
test 20                             6             0             76                    SOUTH         6           0           77

*** Keywords ***
Move character
    [Arguments]    ${startingX}    ${startingY}    ${startingMoveCount}    ${direction}    ${endingX}    ${endingY}    ${endingMoveCount}
    Initialize character xposition with  ${startingX}
    Initialize character yposition with  ${startingY}
    Initialize character moveCount with  ${startingMoveCount}
    Move in direction                    ${direction}
    Character xposition should be        ${endingX}
    Character yposition should be        ${endingY}
    Character moveCount should be        ${endingMoveCount}