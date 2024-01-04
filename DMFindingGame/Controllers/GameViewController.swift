//
//  DMFindingGameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit


class DMFindingGameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLetterLabel: UILabel!
    @IBOutlet var lettersLabel: [UIButton]!
    
    @IBOutlet weak var seconds: UILabel!
    
    var timer: Timer!
    let gameBrain = GameBrain.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let length = lettersLabel.count
        
        gameBrain.newGame(numLetters: length)
        updateUI()
        configureTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    
    func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: fireTimer(timer:))
        RunLoop.current.add(timer, forMode: .common)
    }
    
    
    
    
    func updateUI() {
        targetLetterLabel.text = gameBrain.targetLetter
        var scoreText = String(gameBrain.score)
        var secondsText = String(gameBrain.secondsRemaining)
        
        scoreLabel.text = "Score:\(scoreText)"
        seconds.text = "Seconds:\(secondsText)"
        
        for i in 0..<lettersLabel.count {
            lettersLabel[i].setTitle( gameBrain.randomLetters[i], for: .normal)
        }
    }
        
        
        func fireTimer(timer: Timer) {
            gameBrain.secondsRemaining -= 1
            updateUI()
            
            if gameBrain.secondsRemaining <= 0 {
                timer.invalidate()
                navigationController?.popToRootViewController(animated: true)
            }

    }
    
    
            @IBAction func letterButtonTapped(_ sender: UIButton) {
                sender.backgroundColor = UIColor.systemRed
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    sender.backgroundColor = UIColor.systemBlue
                }
                
                
                if let letterKey = sender.titleLabel?.text{
                    
                    gameBrain.letterSelected(letterPressed: letterKey)
                    
                }
                
                
                updateUI()
                
            
        
    }
}
