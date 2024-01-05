//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var highScore: UILabel!
    
    let gameBrain = GameBrain.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if gameBrain.score != 0 {
            CoreDataManager.shared.addScore(score: gameBrain.score)
        } 
        
        let highScoreText = gameBrain.highScore
                
                highScore.text = "High Score:\(highScoreText)"
        
    }
   
//    @IBAction func startButton(_ sender: UIButton) {
//        let DMFindingGameViewController = DMFindingGameViewController()
//            navigationController?.pushViewController(DMFindingGameViewController, animated: true)
//
//    }
}
