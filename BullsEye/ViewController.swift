//
//  ViewController.swift
//  BullsEye
//
//  Created by Зульфия Салихкулова on 29/08/2019.
//  Copyright © 2019 Зульфия Салихкулова. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentSliderValue: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.alert
    }

    @IBAction func showHitMeAlert() {
        let alert = UIAlertController(title: "Hello, World!", message: "Your slider value is \(currentSliderValue)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentSliderValue = Int(roundedValue);
    }
}

