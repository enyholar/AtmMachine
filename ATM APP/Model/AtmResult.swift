//
//  AtmResult.swift
//  ATM APP
//
//  Created by adex on 06/10/2019.
//  Copyright © 2019 adex. All rights reserved.
//

import Foundation
class AtmResult {
    var terminal : String?
    var balance : String?
    var cardNumber : String?
    var date : String?
    var time : String?
    var cardName : String?
    
   init(term:String,bal:String,cardno:String,dat:String,tim:String,cardnam:String) {
        terminal = term
        balance = bal
        cardNumber = cardno
        date = dat
        time = tim
        cardName = cardnam
    }
}
