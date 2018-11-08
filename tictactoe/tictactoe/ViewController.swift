//  ViewController.swift
//  tictactoe
//  Iftikhar Tapadar

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1
    //Array to keep track of the state of the box of each grid
    var gameState = [0,0,0,0,0,0,0,0,0]
    //Array of combinations
    var winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        //Check if player box is empty
        if gameState [(sender as AnyObject).tag - 1] == 0{
        //Update the selected box's value in the array to reflect the player
        gameState[(sender as AnyObject).tag - 1] = currentPlayer
        //If its's player 1's tur, place an x, if its player 2's turn, place an O
        if currentPlayer == 1 {
            (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: UIControl.State())
            currentPlayer = 2
        }else {
            (sender as AnyObject).setImage(UIImage(named: "circle.png"), for: UIControl.State())
            currentPlayer = 1
        }
      }
        for combination in winningCombos {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                if gameState[combination[0]] == 1 {
                    statusLabel.text = "X Wins!"
                }else {
                    statusLabel.text = "O Wins!"
                }
        }
    }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}



