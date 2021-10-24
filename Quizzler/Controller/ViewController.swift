    //
    //  ViewController.swift
    //  Quizzler
    //
    //  Created by Amangeldiev Kutman on 25/10/21.
    //

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let userAnswer = sender.currentTitle{
            let gotRightAnswer = quizBrain.checkAnswer(userAnswer)
            
            if gotRightAnswer{
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score:\(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

