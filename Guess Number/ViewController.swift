//
//  ViewController.swift
//  Guess Number
//
//  Created by Ramil on 11/09/2018.
//  Copyright © 2018 Ramil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inGame = false
    var randomValue: Int!
    var playerValue = ""
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var firstPickerView: UIPickerView!
    @IBOutlet weak var secondPickerView: UIPickerView!
    @IBOutlet weak var thirdPickerView: UIPickerView!
    @IBOutlet weak var fourthPickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondPickerView.isHidden = true
        thirdPickerView.isHidden = true
        fourthPickerView.isHidden = true
        
        firstPickerView.dataSource = self
        firstPickerView.delegate = self
        secondPickerView.dataSource = self
        secondPickerView.delegate = self
        thirdPickerView.dataSource = self
        thirdPickerView.delegate = self
        fourthPickerView.dataSource = self
        fourthPickerView.delegate = self
        gameButton.setTitle("Начать игру!", for: .normal)
    }

    @IBAction func segmentControlSelect(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: secondPickerView.isHidden = true
                thirdPickerView.isHidden = true
                fourthPickerView.isHidden = true
        case 1: secondPickerView.isHidden = false
                thirdPickerView.isHidden = true
                fourthPickerView.isHidden = true
        case 2: thirdPickerView.isHidden = false
                secondPickerView.isHidden = false
                fourthPickerView.isHidden = true
        case 3: fourthPickerView.isHidden = false
                secondPickerView.isHidden = false
                thirdPickerView.isHidden = false
        default:
            break
        }
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if inGame == false {
            switch segmentController.selectedSegmentIndex {
            case 0: randomValue = Int(arc4random_uniform(10))
            case 1: randomValue = Int(arc4random_uniform(100))
            case 2: randomValue = Int(arc4random_uniform(1000))
            case 3: randomValue = Int(arc4random_uniform(10000))
            default:
                break
            }
            inGame = true
            gameButton.setTitle("Попытаться!", for: .normal)
            segmentController.isEnabled = false
        } else {
            gameButton.setTitle("Начать игру!", for: .normal)
            inGame = false
            segmentController.isEnabled = true
            
            switch segmentController.selectedSegmentIndex {
            case 0: playerValue = "\(firstPickerView.selectedRow(inComponent: 0))"
                
            case 1: let first = firstPickerView.selectedRow(inComponent: 0)
                    let second = secondPickerView.selectedRow(inComponent: 0)
                    playerValue = "\(first)\(second)"
            case 2: let first = firstPickerView.selectedRow(inComponent: 0)
                    let second = secondPickerView.selectedRow(inComponent: 0)
                    let third = thirdPickerView.selectedRow(inComponent: 0)
                    playerValue = "\(first)\(second)\(third)"
            case 3: let first = firstPickerView.selectedRow(inComponent: 0)
                    let second = secondPickerView.selectedRow(inComponent: 0)
                    let third = thirdPickerView.selectedRow(inComponent: 0)
                    let fourth = fourthPickerView.selectedRow(inComponent: 0)
                    playerValue = "\(first)\(second)\(third)\(fourth)"
            default:
                print("ERROR")
            }
            
            if randomValue == Int(playerValue) {
                Result.win(view: self.view)
                print(randomValue)
                print(playerValue)
            } else {
                Result.lose(view: self.view)
                print(randomValue)
                print(playerValue)
            }
        }
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let numbersArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        return "\(numbersArray[row])"
    }
}














