//
//  ViewController.swift
//  Kuş Yakalamaca
//
//  Created by BERKAY TURAN on 9.08.2025.
//

import UIKit

class LevelBoard: UIViewController {

    @IBOutlet weak var level1: UIButton!
    @IBOutlet weak var level2: UIButton!
    @IBOutlet weak var level3: UIButton!
    @IBOutlet weak var level4: UIButton!
    @IBOutlet weak var level5: UIButton!
    @IBOutlet weak var level6: UIButton!
    @IBOutlet weak var level7: UIButton!
    @IBOutlet weak var level8: UIButton!
    @IBOutlet weak var level9: UIButton!
    @IBOutlet weak var level10: UIButton!
    @IBOutlet weak var level11: UIButton!
    @IBOutlet weak var level12: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.integer(forKey: "unlockedLevel") == 0 {
            UserDefaults.standard.set(1, forKey: "unlockedLevel")
        }
        
        updateLevelButtons()
    }
    
    func updateLevelButtons() {
        let unlockedLevel = UserDefaults.standard.integer(forKey: "unlockedLevel")
        
        let buttons = [
            level1, level2, level3, level4,
            level5, level6, level7, level8,
            level9, level10, level11, level12
        ]
        
        for (index, button) in buttons.enumerated() {
            if let btn = button {
                if index + 1 <= unlockedLevel {
                    btn.isEnabled = true
                    btn.alpha = 1.0
                } else {
                    btn.isEnabled = false
                    btn.alpha = 0.5
                }
            }
        }
    }
}

