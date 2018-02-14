//
//  FirstVC.swift
//  Test_2
//
//  Created by Peichun on 2018/2/12.
//  Copyright © 2018年 Peichun Tsai. All rights reserved.
//


// let vc = FirstVC()
// vc.delegate = ...

import UIKit
import GameplayKit

protocol Ring {
    var judge: JudgeDelegate? { get set }
    
}

class FirstVC: UIViewController, Ring{
    
    // delegate:
    var judge: JudgeDelegate?


    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var computerPointsLabel: UILabel!
    @IBOutlet weak var playerPointsLabel: UILabel!
    
    let vcTag = 1
    var playerRandomStatus: Int?
    var computerRandomStatus: Int?
    var computerPoints = 50 {
        didSet {
            computerPointsLabel.text = "\(computerPoints)"
        }
    }
    var playerPoints = 50 {
        didSet {
            playerPointsLabel.text = "\(playerPoints)"
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        //start -observer
        let notificationName = Notification.Name(rawValue: "GettingStarted")
        NotificationCenter.default.addObserver(self, selector: #selector(getStatus), name: notificationName, object: nil)
        
        //reset -observer
        let notificationReset = Notification.Name(rawValue: "Reset")
        NotificationCenter.default.addObserver(self, selector: #selector(resetGame), name: notificationReset, object: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @objc func getStatus() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            
            guard let result = self.startGame() else {
                return
            }
            
            switch result {
            case .PlayerWin:
                timer.invalidate()
            case .ComputerWin:
                timer.invalidate()
            case .WinWin:
                return
            }
        }
    }

    @objc func resetGame() {
        computerImage.image = #imageLiteral(resourceName: "Paper")
        playerImage.image = #imageLiteral(resourceName: "Paper")
        computerPoints = 50
        playerPoints = 50
        computerPointsLabel.text = "50"
        playerPointsLabel.text = "50"
    }
    
    func startGame() -> Result? {
            playerRandomStatus = GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()
            computerRandomStatus = GKRandomDistribution(lowestValue: 0, highestValue: 2).nextInt()

            if playerRandomStatus == 0 {
                //平手
                if computerRandomStatus == 0 {
                    playerImage.image = #imageLiteral(resourceName: "Paper")
                    computerImage.image = #imageLiteral(resourceName: "Paper")
                    
                }
                    //電腦贏
                else if computerRandomStatus == 1 {
                    playerImage.image = #imageLiteral(resourceName: "Paper")
                    computerImage.image = #imageLiteral(resourceName: "Scissos")
                    playerPoints = playerPoints - 10
                }
                    //玩家贏
                else {
                    playerImage.image = #imageLiteral(resourceName: "Paper")
                    computerImage.image = #imageLiteral(resourceName: "Stone")
                    computerPoints = computerPoints - 10
                }
            }
            else if playerRandomStatus == 1 {
                //玩家贏
                if computerRandomStatus == 0 {
                    playerImage.image = #imageLiteral(resourceName: "Scissos")
                    computerImage.image = #imageLiteral(resourceName: "Paper")
                    computerPoints = computerPoints - 10
                }
                    //平手
                else if computerRandomStatus == 1 {
                    playerImage.image = #imageLiteral(resourceName: "Scissos")
                    computerImage.image = #imageLiteral(resourceName: "Scissos")
                }
                    //電腦贏
                else {
                    playerImage.image = #imageLiteral(resourceName: "Scissos")
                    computerImage.image = #imageLiteral(resourceName: "Stone")
                    playerPoints = playerPoints - 10
                }
            }
            else {
                //電腦贏
                if computerRandomStatus == 0 {
                    playerImage.image = #imageLiteral(resourceName: "Stone")
                    computerImage.image = #imageLiteral(resourceName: "Paper")
                    playerPoints = playerPoints - 10
                }
                    //玩家贏
                else if computerRandomStatus == 1 {
                    playerImage.image = #imageLiteral(resourceName: "Stone")
                    computerImage.image = #imageLiteral(resourceName: "Scissos")
                    computerPoints = computerPoints - 10
                }
                    //平手
                else {
                    playerImage.image = #imageLiteral(resourceName: "Stone")
                    computerImage.image = #imageLiteral(resourceName: "Stone")
                }
            }
        
        // notify
        return judge?.judgement(playerPoints: playerPoints, computerPoints: computerPoints, vcTag: vcTag)
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
