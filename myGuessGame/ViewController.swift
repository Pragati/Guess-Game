//  AppDelegate.swift
//  myGuessGame
//
//  Created by Pragati on 05/13/16.


import UIKit

class ViewController: UIViewController {

    @IBOutlet var guessField: UITextField!
    
    @IBOutlet var guessLabel: UILabel!
    
    @IBOutlet var gamesLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var answerLabel: UILabel!
    
    
    var itemArray = ["Car", "House", "Boat", "Tree"]
    
    var gamesPlayed = 0
    
    var correctAnswer = ""
    
    var score = 0
    
    var numberOfGuesses = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newGameBtn(sender: AnyObject) {
        
        let randomNumber = Int(arc4random()) % itemArray.count
        let i = randomNumber
        
        
        correctAnswer = itemArray[i]
        
        print(correctAnswer)
        
        gamesPlayed = gamesPlayed + 1
        
        gamesLabel.text = "Games Played: \(gamesPlayed)"
        
       

        
    }
    
    
    
    

    @IBAction func checkAnswerBtn(sender: AnyObject) {
        
     
        
        //if a new game hasn't been started....
        
        if correctAnswer == "" {
            
            let alert = UIAlertController(title: "Please press new game button", message: "so we can play the game", preferredStyle: .Alert)
            
                let okAction = UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
                
                    })
                alert.addAction(okAction)
            
            presentViewController(alert, animated: true, completion: nil)
        
        
        
        //a new game has been started
        } else {
          
            numberOfGuesses = numberOfGuesses + 1
            guessLabel.text = "Number of Guesses: \(numberOfGuesses)"
            
            if guessField.text == correctAnswer {
            
                let alert = UIAlertController(title: "Congratulations!", message: "Do you want to play again?", preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
                   
                })
                
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
                
                
                if numberOfGuesses == 1 {
                    
                    score = score + 10
                
                }else if numberOfGuesses == 2 {
                
                    score = score + 5
                    
                }else if numberOfGuesses == 3 {
                
                    score = score + 1
                
                }
                
                
                answerLabel.text = ""
                scoreLabel.text = "Score: \(score)"
                guessLabel.text = "Number of Guesses: "
                correctAnswer = ""
                numberOfGuesses = 0
                
                
               // wrong answer code...
            } else {
            
                answerLabel.text = "Wrong Answer.  Guess again"
                answerLabel.textColor = UIColor.redColor()
                
            
            }
            
            guessField.resignFirstResponder()
            guessField.text = ""
            
        }
    }//end of checkAnswer func
    


}