//
//  AccountBalanceViewController.swift
//  ATM APP
//
//  Created by adex on 05/10/2019.
//  Copyright © 2019 adex. All rights reserved.
//

import UIKit

class AccountBalanceViewController: UIViewController {
    var atmResult:AtmResult?
    @IBOutlet weak var terminalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var cardNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    
    func initView() {
            terminalLabel.text = atmResult?.terminal
            dateLabel.text = atmResult?.date
            timeLabel.text = atmResult?.time
            balanceLabel.text = "\(atmResult?.balance ?? "")" 
            cardNameLabel.text = atmResult?.cardName
            cardNumberLabel.text = "**** **** ***\(atmResult?.cardNumber ?? "")"
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
