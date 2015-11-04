#Assignment 4
#Author: Gavin Rostar
#Version: 10.Date.2015
#Purpose:Pig Dice Game

use 5.14.1;
use warnings;
use strict;

my (@scorePlayer, @scoreCPU, @diceRoll, @diceReRoll, @choiceCPU);
my ($start, $diceRollCPU, $diceRoll, $score, $scorePlayer, $scoreCPU, $roll, $rolls, $choiceCPU, $choiceCPU2);
my ($counter, $continueInt, $continueIntCPU, $continue);

sub main {
     setStartScreen();
     use constant YES => 1;
     setDiceRoll_1();
     setDiceReRollCPU();
     setDiceReRoll();
     setDiceRollCPU1();
     setPlayerScore();
     setCPUScore();
     setWin();
}

main();

sub setStartScreen {
     print "Press Enter to start";
     chomp ($start = <STDIN>);
     @diceRoll = (1,2,3,4,5,6);
     @diceReRoll = (3,4,5,6);
     @choiceCPU = (0,1);
     setDiceRoll_1();
}

sub setDiceRoll_1 {
     system ("cls");
     $counter++;
     $roll = int (rand(@diceRoll));
     if ($roll == 1 || $roll == 2) {
          print "You rolled a $roll. Would you like to roll again? (0=No, 1=Yes)";
          chomp ($continueInt = <STDIN>);
          if ($continueInt == 1) {
               setDiceReRoll();
          }
          if($continueInt == 0) {
               setDiceRollCPU1();
          }
     }
     setDiceRollCPU1();
}

sub setDiceReRoll {
     if ($continueInt == 1) {
          $roll = int (rand(@diceReRoll));
          print "You rerolled a $roll. Hit enter to continue";
          chomp ($continue = <STDIN>);
          setDiceRollCPU1();
          }
}

sub setDiceRollCPU1 {
     $rolls = int(rand(@diceRoll));
     print "CPU rolled a $roll. Hit enter to continue.";
     chomp ($continue = <STDIN>);
     if ($roll == 1 || $roll == 2){
          $continueIntCPU = int(rand(@choiceCPU));
          if ($continueIntCPU == 1){
               print "CPU chose to roll again. Hit enter to continue.";
               chomp ($continue = <STDIN>);
               setDiceReRollCPU();
          }
          if ($continueIntCPU == 0) {
               print "CPU chose to not roll again. Hit enter to continue.";
               chomp ($continue = <STDIN>);
               setPlayerScore();
          }
     }
     setPlayerScore();
}

sub setDiceReRollCPU {
     if ($rolls == 1 || $rolls == 2) {
     $rolls = int(rand(@diceRoll));
     print "CPU rerolled a $roll. Hit enter to continue.";
     chomp ($continue = <STDIN>);
     setPlayerScore();
     }
}
sub setPlayerScore {
     system ("cls");
     $scorePlayer[0] += ($roll);
     if ($scorePlayer[0] == 100 || $scorePlayer[0] > 100) {
          setWin();
     }
     print "You rolled a $roll. Your score is @scorePlayer. Hit enter to continue.";
     chomp ($continue = <STDIN>);
     setCPUScore();
}
     

sub setCPUScore {
     system ("cls");
     $scoreCPU[0] += ($rolls);
     if ($scoreCPU[0] == 100 || $scoreCPU[0] > 100) {
          setWin();
     }
     print "CPU rolled a $roll. it's score is @scoreCPU. Hit enter to continue.";
     chomp ($continue = <STDIN>);
     setDiceRoll_1();
}

sub setWin {
     if ($scoreCPU[0] == 100 || $scoreCPU[0] > 100) {
          print "\n\n\n\t\tCPU won, you lost.";
          chomp ($continue = <STDIN>);
          die
     }
     if ($scorePlayer[0] == 100 || $scorePlayer[0] > 100) {
          print "\n\n\n\t\tYou've won!!! You're not a loser after all!";
          chomp ($continue = <STDIN>);
          die
     }
}