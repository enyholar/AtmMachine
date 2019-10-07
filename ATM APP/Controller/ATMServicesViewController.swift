//
//  ATMServicesViewController.swift
//  ATM APP
//
//  Created by adex on 05/10/2019.
//  Copyright © 2019 adex. All rights reserved.
//

import UIKit

class ATMServicesViewController: UIViewController {
    var userCardpin = ""
    let pin = "2345"
    var atmR:AtmResult?
    var totalAccountAmount = 10000
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getcurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    func getCurrentTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let result = formatter.string(from: date)
        return result
    }
    
    @IBAction func withDrawMoney(_ sender: Any) {
        if userCardpin == pin {
            self.openWithdrawScreen()
        }else{
            let  alert = UIAlertController(title: "Enter your code", message: nil, preferredStyle: .alert)
            alert.addTextField { (textF) in
                textF.placeholder = "4 digit pin"
            }
            
            let sendAction = UIAlertAction(title: "Proceed", style: .default) { (action) in
                let textfield = alert.textFields![0] as UITextField
                if  textfield.text != "" && textfield.text!.count == 4  && textfield.text! == self.pin{
                    self.openWithdrawScreen()
                } else{
                    self.showOkayableMessage("Error", message: "Invalid pin")
                    alert.dismiss(animated: true, completion: {
                    })
                }
                
            }
            
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                
            }
            
            alert.addAction(sendAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func checkAccountBalance(_ sender: Any) {
        if userCardpin == pin {
            self.openBalanceEnquiryScreen()
        }else{
            let  alert = UIAlertController(title: "Enter your atm pin", message: nil, preferredStyle: .alert)
            alert.addTextField { (textF) in
                textF.placeholder = "4 digit pin"
            }
            
            let sendAction = UIAlertAction(title: "Proceed", style: .default) { (action) in
                let textfield = alert.textFields![0] as UITextField
                if  textfield.text != "" && textfield.text!.count == 4  && textfield.text! == self.pin{
                    self.openBalanceEnquiryScreen()
                } else{
                    self.showOkayableMessage("Error", message: "Invalid pin")
                    alert.dismiss(animated: true, completion: {
                        })
                }
                
                }
           
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in
                
            }
            
            alert.addAction(sendAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func showOkayableMessage(_ title: String, message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func openBalanceEnquiryScreen(){
        let atm =  AtmResult.init(term: generateRandomDigits(8), bal: "10000", cardno: generateRandomDigits(4), dat: getcurrentDate(), tim: getCurrentTime(), cardnam: "Gideon Eniola")
        atmR = atm
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "accountBalanceVc") as! AccountBalanceViewController
        controller.atmResult = atmR
        let appNav = UINavigationController(rootViewController: controller)
        self.present(appNav, animated: true, completion: nil)
    }
    
    
    func openWithdrawScreen(){
        
        let  alert = UIAlertController(title: "Enter your amount", message: nil, preferredStyle: .alert)
        alert.addTextField { (textF) in
            textF.placeholder = "Input your amount"
        }
        
        let sendAction = UIAlertAction(title: "Proceed", style: .default) { (action) in
            let textfield = alert.textFields![0] as UITextField
            if  textfield.text != "" {
                let withdrawAmount = Int(textfield.text!)
                
                if withdrawAmount! > self.totalAccountAmount{
                    self.showOkayableMessage("Note", message: "Insufficient Balance")
                    alert.dismiss(animated: true, completion: {
                    })
                }else{
                    if Double(withdrawAmount!).truncatingRemainder(dividingBy: 500) == 0 && Double(withdrawAmount!).truncatingRemainder(dividingBy: 1000) == 0 {
                        self.timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { [weak self] timer in
                            self!.openRecieptScreen(withdrawAmount: withdrawAmount!)
                        }
                     
                    }else{
                         self.showOkayableMessage("Note", message: "You can only withdraw in mulitple of 500 and 1000")
                    }
                }
            } else{
                self.showOkayableMessage("Error", message: "Invalid amount")
                alert.dismiss(animated: true, completion: {
                })
            }
            
        }
        
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            self.timer!.invalidate()
            alert.dismiss(animated: true, completion: {
            })
        }
        
        alert.addAction(sendAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        

    }
    
    
    func openRecieptScreen(withdrawAmount:Int){
        let atm =  AtmResult.init(term: generateRandomDigits(8), bal: "10000", cardno: generateRandomDigits(4), dat: getcurrentDate(), tim: getCurrentTime(), cardnam: "Gideon Eniola")
        atmR = atm
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "recieptVc") as! SuccessfulWithdrawViewController
        controller.atmResult = atmR
        controller.withdrawAmount = withdrawAmount
        let appNav = UINavigationController(rootViewController: controller)
        self.present(appNav, animated: true, completion: nil)
    }
    
    
    func generateRandomDigits(_ digitNumber: Int) -> String {
        var number = ""
        for i in 0..<digitNumber {
            var randomNumber = arc4random_uniform(10)
            while randomNumber == 0 && i == 0 {
                randomNumber = arc4random_uniform(10)
            }
            number += "\(randomNumber)"
        }
        return number
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
