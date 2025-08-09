//
//  level3ViewController.swift
//  Catch The Bird
//  Created by BERKAY TURAN on 11.08.2025.
//

import UIKit

class level3ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var birdArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0

    @IBOutlet weak var bird1: UIImageView!
    @IBOutlet weak var bird2: UIImageView!
    @IBOutlet weak var bird3: UIImageView!
    @IBOutlet weak var bird4: UIImageView!
    @IBOutlet weak var bird5: UIImageView!
    @IBOutlet weak var bird6: UIImageView!
    @IBOutlet weak var bird7: UIImageView!
    @IBOutlet weak var bird8: UIImageView!
    @IBOutlet weak var bird9: UIImageView!
    @IBOutlet weak var bird10: UIImageView!
    @IBOutlet weak var bird11: UIImageView!
    @IBOutlet weak var bird12: UIImageView!
    
    @IBOutlet weak var extratime1: UIImageView!
    @IBOutlet weak var extratime2: UIImageView!
    @IBOutlet weak var extratime3: UIImageView!
    @IBOutlet weak var extratime4: UIImageView!
    @IBOutlet weak var extratime5: UIImageView!
    @IBOutlet weak var extratime6: UIImageView!
    @IBOutlet weak var extratime7: UIImageView!
    @IBOutlet weak var extratime8: UIImageView!
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score : \(score)"
        let extraTimeArray = [extratime1, extratime2, extratime3, extratime4, extratime5, extratime6, extratime7, extratime8]
        
        for extraTime in extraTimeArray {
            extraTime?.isHidden = true
            extraTime?.isUserInteractionEnabled = true
            let extraRecognizer = UITapGestureRecognizer(target: self, action: #selector(addExtraTime))
            extraTime?.addGestureRecognizer(extraRecognizer)
        }
        startExtraTimeTimer()
        
        let storedHighScore = UserDefaults.standard.integer(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore : \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore : \(highScore)"
            
            // Kuşlar için zaten hideTimer var
            hideTimer = Timer.scheduledTimer(timeInterval: 0.63, target: self, selector: #selector(hideBird), userInfo: nil, repeats: true)

            startExtraTimeTimer()

        }

    
    // Images
    bird1.isUserInteractionEnabled = true
    bird2.isUserInteractionEnabled = true
    bird3.isUserInteractionEnabled = true
    bird4.isUserInteractionEnabled = true
    bird5.isUserInteractionEnabled = true
    bird6.isUserInteractionEnabled = true
    bird7.isUserInteractionEnabled = true
    bird8.isUserInteractionEnabled = true
    bird9.isUserInteractionEnabled = true
    bird10.isUserInteractionEnabled = true
    bird11.isUserInteractionEnabled = true
    bird12.isUserInteractionEnabled = true
        
    let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
    
    bird1.addGestureRecognizer(recognizer1)
    bird2.addGestureRecognizer(recognizer2)
    bird3.addGestureRecognizer(recognizer3)
    bird4.addGestureRecognizer(recognizer4)
    bird5.addGestureRecognizer(recognizer5)
    bird6.addGestureRecognizer(recognizer6)
    bird7.addGestureRecognizer(recognizer7)
    bird8.addGestureRecognizer(recognizer8)
    bird9.addGestureRecognizer(recognizer9)
 
    
    birdArray = [bird1, bird2, bird3, bird4, bird5, bird6, bird7,bird8, bird9, bird10, bird11, bird12]
        
        
    counter = 22
    timeLabel.text = String(counter)

    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    hideTimer = Timer.scheduledTimer(timeInterval: 0.63, target: self, selector: #selector(hideBird), userInfo: nil, repeats: true)
    
    hideBird()
}
    
    
    func startExtraTimeTimer() {
        
        let randomInterval = Double(Int.random(in: 1...10))
        
        Timer.scheduledTimer(timeInterval: randomInterval, target: self, selector: #selector(extraTimeTimerFired), userInfo: nil, repeats: false)
    }

    @objc func extraTimeTimerFired() {
        showExtraTime()
        startExtraTimeTimer()
    }


    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score : \(score)"
    }
    
    @objc func hideBird() {
        for bird in birdArray{
            bird.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(birdArray.count - 1)))
        birdArray[random].isHidden = false
        
    }
    
    @objc func addExtraTime(_ sender: UITapGestureRecognizer) {
        counter += 5
        timeLabel.text = String(counter)
        sender.view?.isHidden = true
    }

    @objc func showExtraTime() {
        let extraTimeArray = [extratime1, extratime2, extratime3, extratime4, extratime5, extratime6, extratime7, extratime8]

        
        for extra in extraTimeArray {
            extra?.isHidden = true
        }

        
        let randomIndex = Int(arc4random_uniform(UInt32(extraTimeArray.count)))
        let extra = extraTimeArray[randomIndex]
        extra?.isHidden = false

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            extra?.isHidden = true
        }
    }


    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for bird in birdArray {
                bird.isHidden = true
            }
            
            // Highscore
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore : \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            if self.score >= 50 {
                let unlockedLevel = UserDefaults.standard.integer(forKey: "unlockedLevel")
                if unlockedLevel < 3 {
                    UserDefaults.standard.set(3, forKey: "unlockedLevel")
                }
            }
            
            let alertMessage: String
            if self.score >= 50 {
                alertMessage = "What a great game! You scored \(self.score) points."
            } else {
                let missingPoints = 50 - self.score
                alertMessage = """
                You need at least 50 points to reach the next level.
                You scored \(self.score) points.
                You need \(missingPoints) more points.
                """
            }

            let alert = UIAlertController(
                title: "Time's Up!",
                message: alertMessage,
                preferredStyle: .alert
            )

            if self.score >= 50 {
                let level4 = UIAlertAction(title: "Next Level", style: .default) { _ in
                    self.performSegue(withIdentifier: "level4", sender: self)
                }
                alert.addAction(level4)
            }

            let replayButton = UIAlertAction(title: "Try Again", style: .default) { _ in
                self.score = 0
                self.scoreLabel.text = "Score : \(self.score)"
                self.counter = 25
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.63, target: self, selector: #selector(self.hideBird), userInfo: nil, repeats: true)
            }

            let mainMenuButton = UIAlertAction(title: "Main Menu", style: .cancel) { _ in
                self.performSegue(withIdentifier: "main3", sender: self)
            }

            alert.addAction(replayButton)
            alert.addAction(mainMenuButton)

            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func pauseButtonClicked(_ sender: Any) {
        
        timer.invalidate()
        hideTimer.invalidate()
        
        let alert = UIAlertController(
            title: "Game Paused",
            message: "What do you want to do?",
            preferredStyle: .alert
        )
        
        let resumeAction = UIAlertAction(title: "Resume", style: .default) { _ in
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.63, target: self, selector: #selector(self.hideBird), userInfo: nil, repeats: true)
        }
        
        let tryAgainAction = UIAlertAction(title: "Try Again", style: .default) { _ in
            
            self.score = 0
            self.scoreLabel.text = "Score : \(self.score)"
            self.counter = 25
            self.timeLabel.text = String(self.counter)
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.63, target: self, selector: #selector(self.hideBird), userInfo: nil, repeats: true)
        }
        
        let mainMenuAction = UIAlertAction(title: "Main Menu", style: .cancel) { _ in
            self.performSegue(withIdentifier: "main3", sender: self)
        }
        
        alert.addAction(resumeAction)
        alert.addAction(tryAgainAction)
        alert.addAction(mainMenuAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
