//
//  SuccessfulWithdrawViewController.swift
//  ATM APP
//
//  Created by adex on 06/10/2019.
//  Copyright © 2019 adex. All rights reserved.
//

import UIKit

class SuccessfulWithdrawViewController: UIViewController {
    var atmResult:AtmResult?
    var atmBalance = 10000
    var withdrawAmount = 0
    @IBOutlet weak var amountBalanceLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var terminalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        let b = atmBalance - withdrawAmount
        terminalLabel.text = atmResult?.terminal
        dateLabel.text = atmResult?.date
        timeLabel.text = atmResult?.time
        balanceLabel.text = "\(atmResult?.balance ?? "")"
        cardNameLabel.text = atmResult?.cardName
        cardNumberLabel.text = "**** **** ***\(atmResult?.cardNumber ?? "")"
        balanceLabel.text = String(b)
        amountBalanceLabel.text = String(withdrawAmount)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
