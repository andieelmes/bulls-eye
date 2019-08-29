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
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    @IBAction func showHitMeAlert() {
        calcDifference()
        
        let title = "Almost"
        let message = "Your value was \(currentSliderValue)" +
        "\n The target value is \(targetValue)" +
        "\n You missed by \(difference)"
        let CTA = "Play again"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: CTA, style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentSliderValue = Int(roundedValue);
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentSliderValue = 50
        slider.value = Float(currentSliderValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
    }
    
    func calcDifference(){
        difference = abs(currentSliderValue - targetValue)
    }
}

