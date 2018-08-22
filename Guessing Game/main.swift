//
//  main.swift
//  Guessing Game
//
//  Created by Sawyer Shirley on 8/20/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

//Variable that determines whether or not we are still playing the game.
var playingGame = true

//This is our game loop, will run while playing the game.
repeat {
    let randomNumber = Int(arc4random_uniform(101))
    
    //This is the number of guesses
    var numberOfGuesses = 5
    
    //Welcome the user and prompt them for input
    print("Welcome to the game...")
    print("Please, take a seat. Guess a number between 0 and 100. Take your time. But don't take too long, I don't have all day.")
    
    var userGuess = Int(readLine()!)
    
    //Input Validation
    while userGuess == nil {
        print("Wrong. Try using a number this time, stupid.")
        userGuess = Int(readLine()!)
    }
    
    //Answer is too high or too low
    if userGuess != randomNumber {
        while userGuess! != randomNumber && numberOfGuesses > 1 {
            numberOfGuesses -= 1
            print("You have \(numberOfGuesses) chances remaining.")
            if userGuess! < randomNumber {
                print("Aim higher.")
            } else if userGuess! > randomNumber {
                print("Too high, pretend like it's your future and go low.")
            }
            
            userGuess = Int(readLine()!)
            
            //If the user enters a value that can't be converted to an integer, userGuess will equal int
            while userGuess == nil {
                print("Wrong. Try using a number this time, stupid.")
                userGuess = Int(readLine()!)
            }
        }
    }
    
    if numberOfGuesses == 1 && userGuess != randomNumber {
        print("You are an absolute failure of a human being. The correct answer was \(randomNumber).")
        print("Feeling frisky? Try again? Y/N")
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("USE A Y OR N!")
            stillPlaying = readLine()!
        }
        
        if stillPlaying == "N" {
            print("Ha! Knew you were a failure.")
            playingGame = false
        }
        
    }
    
    if userGuess == randomNumber {
        print("You aren't as dumb as you look.")
        print("Want to risk it all again? Y/N")
        
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("ITS A YES OR NO QUESTION! Y OR N")
            stillPlaying = readLine()!.uppercased()
        }
        if stillPlaying == "N" {
            print("K, bye.")
            playingGame = false
        }
    }
    
} while playingGame == true
