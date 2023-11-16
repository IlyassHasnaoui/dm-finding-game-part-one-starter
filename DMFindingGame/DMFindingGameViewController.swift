//
//  DMFindingGameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

/**
 1.1 Create the user interface in the `Main` file. See the provided screenshot for how the UI should look. Feel free to customize the colors, font, etc.
 */
class DMFindingGameViewController: UIViewController {
    
    /**
     2.1 Create IBOutlets for the target letter label and the score label.
     2.2 Create an IBOutlet collection for the letter buttons.
     */
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLetterLabel: UILabel!
    @IBOutlet var lettersLabel: [UIButton]!

    
    var timer: Timer!
    let gameBrain = GameBrain.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    
    func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: fireTimer(timer:))
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func fireTimer(timer: Timer) {
//        gameBrain.secondsRemaining -= 1
//        updateUI()
        
//        if gameBrain.secondsRemaining <= 0 {
//            timer.invalidate()
        
//        }
    }
   
//    func newRound() {
//        let randomIndex: String = letters.randomElement() ?? "Letter"
//
//        targetLetter = randomIndex
//        randomLetters = generateRandomLetters(numLetters: lettersLabel.count)
//        updateTargetLetterLabel()
//        updateLetterButtons()
//    }
//    /**
//     4.1 Return an array of letters. There should be as many letters as `numLetters`.
//     The array should include the target letter. The rest of the letters should be random. A letter should show up in the array only once. The order of the letters should be random.
//
//     This is a tricky function, but feel free to run the provided test in `DMFindingGameTests` to know if your code is correct. Let your Tech Lead know if you need help. :)
//     */
//    func generateRandomLetters(numLetters: Int) -> [String] {
//        var randomLetterArr: [String] = [targetLetter]
//
//        while randomLetterArr.count < numLetters {
//            let randomLet = letters.randomElement()!
//
//            if !randomLetterArr.contains(randomLet) {
//                randomLetterArr.append(randomLet)
//            }
//        }
//
//        return randomLetterArr.shuffled()
//    }
//    //The letters are checked for uniqueness and added to the array directly. The result is then shuffled before returning it.
//
//
//    /**
//     5.1 Check if the `selectedLetter` is equal to the `targetLetter` and update the `score` variable accordingly.
//     Feel free to run the provided test in `DMFindingGameTests` to know if your code is correct.
//     */
//    func calculateNewScore(selectedLetter: String) {
//        if selectedLetter == targetLetter {
//            score += 1
//        }
//    }
   
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
  
     }
}
