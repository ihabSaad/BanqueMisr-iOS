//
//  TransactionsTableViewCell.swift
//  Banque Misr
//
//  Created by ihab saad on 09/04/2026.
//

import UIKit
import CoreBankingAPI

class TransactionsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak private var senderNameLabel: UILabel!
    @IBOutlet weak private var cardInfoLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureTableView(model: Transaction) {
        senderNameLabel.text = model.senderName
        cardInfoLabel.text = model.cardInfo
        dateLabel.text = model.date
        amountLabel.text = model.amount
    }

    
}
