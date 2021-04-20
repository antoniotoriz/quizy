//
//  ViewController.swift
//  quizy
//
//  Created by Antonio Toriz on 1/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerOption1: UIButton!
    @IBOutlet weak var answerOption2: UIButton!
    @IBOutlet weak var answerOption3: UIButton!
    var quizBrain = QuizBrain();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButton(_ sender: UIButton) {
        let userAnswer: String = sender.currentTitle!
        let userGotItRight: Bool = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answerOptions = quizBrain.getAnswers()
        answerOption1.setTitle(answerOptions[0], for: .normal)
        answerOption2.setTitle(answerOptions[1], for: .normal)
        answerOption3.setTitle(answerOptions[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        answerOption1.backgroundColor = .clear
        answerOption2.backgroundColor = .clear
        answerOption3.backgroundColor = .clear
    }
}
