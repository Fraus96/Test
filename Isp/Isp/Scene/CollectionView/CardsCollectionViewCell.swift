//
//  CardsCollectionViewCell.swift
//  Isp
//
//  Created by Ribes on 29/11/22.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    
    var allData : AllData?
 
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    static let identifier: String = "CardsCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
            cardView.layer.cornerRadius = 10
            cardView.layer.shadowRadius = 3
            cardView.layer.shadowOpacity = 0.5
            cardView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }

    func configure(cards : Card) {
        cardNameLabel.text = cards.rawValue
        cardView.backgroundColor = cards.cardsColor()
//        cardNameLabel.text = allData?.listaCarte[IndexPath.row].nome
    }
//    func configure(cards : Card, colors : Color) {
//        cardNameLabel.text = cards.rawValue
//        cardView.backgroundColor = colors.cardColor
//
//    }

}

