//
//  ViewController.swift
//  Test_2
//
//  Created by Peichun on 2018/2/12.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//

import UIKit

enum Result { 
    case PlayerWin, ComputerWin, WinWin
}

// protocol
protocol JudgeDelegate {
   
    func judgement(playerPoints: Int, computerPoints: Int, vcTag: Int) -> Result
    
}


class HomeVC: UIViewController, JudgeDelegate {
    
   // let crown = "crown"
    
    @IBOutlet weak var playerSceneOneResult: UILabel!
    @IBOutlet weak var computerSceneOneResult: UILabel!
    @IBOutlet weak var playerSceneTwoResult: UILabel!
    @IBOutlet weak var computerSceneTwoResult: UILabel!
    @IBOutlet weak var playerSceneThreeResult: UILabel!
    @IBOutlet weak var computerSceneThreeResult: UILabel!
    
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var playerPointsScenarioOne: UILabel!
    @IBOutlet weak var playerPointsScenarioTwo: UILabel!
    @IBOutlet weak var playerPointsScenarioThree: UILabel!
    @IBOutlet weak var computerPointsScenarioOne: UILabel!
    @IBOutlet weak var computerPointsScenarioTwo: UILabel!
    @IBOutlet weak var computerPointsScenarioThree: UILabel!
    
    
    func judgement(playerPoints: Int, computerPoints: Int, vcTag: Int) -> Result {
        
        switch vcTag {
            
        case 1:
        if playerPoints == 0 {
            computerPointsScenarioOne.text = "\(computerPoints)"
            computerSceneOneResult.textColor = .red
            computerSceneOneResult.text = "Win"
            playerPointsScenarioOne.text = "\(playerPoints)"
            return .ComputerWin
        }
        else if computerPoints == 0 {
            computerPointsScenarioOne.text = "\(computerPoints)"
            playerPointsScenarioOne.text = "\(playerPoints)"
            playerSceneOneResult.text = "Win"
            playerSceneOneResult.textColor = .red
            return .PlayerWin
        }
        else {
            computerPointsScenarioOne.text = "\(computerPoints)"
            playerPointsScenarioOne.text = "\(playerPoints)"
            return .WinWin
            }
        case 2:
            if playerPoints == 0 {
                computerPointsScenarioTwo.text = "\(computerPoints)"
                computerSceneTwoResult.textColor = .red
                computerSceneTwoResult.text = "Win"
                playerPointsScenarioTwo.text = "\(playerPoints)"
                return .ComputerWin
            }
            else if computerPoints == 0 {
                computerPointsScenarioTwo.text = "\(computerPoints)"
                playerPointsScenarioTwo.text = "\(playerPoints)"
                playerSceneTwoResult.text = "Win"
                playerSceneTwoResult.textColor = .red
                return .PlayerWin
            }
            else {
                computerPointsScenarioTwo.text = "\(computerPoints)"
                playerPointsScenarioTwo.text = "\(playerPoints)"
                return .WinWin
            }
        default:
            if playerPoints == 0 {
                computerPointsScenarioThree.text = "\(computerPoints)"
                computerSceneThreeResult.textColor = .red
                computerSceneThreeResult.text = "Win"
                playerPointsScenarioThree.text = "\(playerPoints)"
                return .ComputerWin
            }
            else if computerPoints == 0 {
                computerPointsScenarioThree.text = "\(computerPoints)"
                playerPointsScenarioThree.text = "\(playerPoints)"
                playerSceneThreeResult.text = "Win"
                playerSceneThreeResult.textColor = .red
                return .PlayerWin
            }
            else {
                computerPointsScenarioThree.text = "\(computerPoints)"
                playerPointsScenarioThree.text = "\(playerPoints)"
                return .WinWin
            }
        }
    }
    // protocol

 
    @IBAction func startCompetitionBtn(_ sender: Any) {
        
        startBtn.isEnabled = false
        let notificationName = Notification.Name(rawValue: "GettingStarted")
        
        //??????????????????????
        tabBarController?.viewControllers?.forEach({ (controller) in
            guard var ring = controller as? Ring else {
                return
            }
            let _ = controller.view
            ring.judge = self
        })
        
       
        
        NotificationCenter.default.post(name: notificationName, object: nil)
        
        // addObserver
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        
        startBtn.isEnabled = true
        
        computerPointsScenarioOne.text = "50"
        playerPointsScenarioOne.text = "50"
        computerPointsScenarioOne.textColor = .black
        playerPointsScenarioOne.textColor = .black
        
        computerPointsScenarioTwo.text = "50"
        playerPointsScenarioTwo.text = "50"
        computerPointsScenarioTwo.textColor = .black
        playerPointsScenarioTwo.textColor = .black
        
        computerPointsScenarioThree.text = "50"
        playerPointsScenarioThree.text = "50"
        computerPointsScenarioThree.textColor = .black
        playerPointsScenarioThree.textColor = .black
        
        playerSceneOneResult.text = ""
        computerSceneOneResult.text = ""
        playerSceneTwoResult.text = ""
        computerSceneTwoResult.text = ""
        playerSceneThreeResult.text = ""
        computerSceneThreeResult.text = ""
        
        let notificationReset = Notification.Name("Reset")
        NotificationCenter.default.post(name: notificationReset, object: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }


}

