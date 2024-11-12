//
//  ViewController.swift
//  Counter
//
//  Created by Victor Kim on 12.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var history: UITextView!
    
    private enum ActionType {
        case decrement
        case invalidDecrement
        case increment
        case reset
    }
    
    private var counterValue: Int = 0 {
        didSet {
            label.text = "Значение счетчика: \(counterValue)"
        }
    }
    
    @IBAction func decrementButtonDidTap() {
        let action: ActionType = counterValue > 0 ? .decrement : .invalidDecrement
        handleAction(action)
    }
    
    @IBAction func incrementButtonDidTap() {
        handleAction(.increment)
    }
    
    @IBAction func resetButtonDidTap() {
        handleAction(.reset)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func handleAction(_ action: ActionType) {
        let currentTime = Date().formatted(date: .numeric, time: .shortened)
        
        var change = "\n\(currentTime): "
        switch action {
        case .decrement:
            counterValue -= 1
            change += "значение изменено на -1"
        case .invalidDecrement:
            change += "попытка уменьшить значение счетчика ниже 0"
        case .increment:
            counterValue += 1
            change += "значение изменено на +1"
        case .reset:
            counterValue = 0
            change += "значение сброшено"
        }
        
        history.text.append(change)
    }
}
