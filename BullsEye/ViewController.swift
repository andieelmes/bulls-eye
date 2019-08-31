//
//  ViewController.swift
//  BullsEye
//
//  Created by Зульфия Салихкулова on 29/08/2019.
//  Copyright © 2019 Зульфия Салихкулова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var round: Int = 0
    var difference: Int = 0
    var score: Int = 0
    var points: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)

        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        slider.setMaximumTrackImage(trackRightImageResizable, for: .normal)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentSliderValue = Int(roundedValue);
    }

    @IBAction func showHitMeAlert() {
        let difference = calcDifference(a: currentSliderValue, b: targetValue)
        
        points = calcPoints(difference: difference);
        
        let title = getTitle(score: points)
        let message = "You scored \(points)"
        let CTA = "Play again"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: CTA, style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver() {
        round = 0
        points = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentSliderValue = 50
        slider.value = Float(currentSliderValue)
        round += 1
        score += points
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
    }
    
    func calcDifference(a: Int, b: Int) -> Int {
        return abs(a - b)
    }
    
    func calcPoints(difference: Int) -> Int {
        var points = 100 - difference;
        if difference == 0 {
            points += 100
        } else if difference == 1 {
            points += 50
        }
        
        return points
    }
    
    func getTitle(score: Int) -> String {
        if score == 100 {
            return "Bingo!"
        } else if score == 99 {
            return "Off by one error"
        } else if score >= 80 {
            return "Almost"
        } else if score >= 40 {
            return "Nice"
        } else {
            return "You didn't even try!"
        }
    }
}

