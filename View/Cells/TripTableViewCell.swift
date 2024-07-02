//
//  TripTableViewCell.swift
//  AluraTrips
//
//  Created by Gustavo Ferreira dos Santos on 02/07/24.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripTitleLabel: UILabel!
    @IBOutlet weak var tripSubtitleLabel: UILabel!
    @IBOutlet weak var tripDailyLabel: UILabel!
    @IBOutlet weak var priceWithoutDiscountLabel: UILabel!
    @IBOutlet weak var tripPriceLabel: UILabel!
    @IBOutlet weak var tripCancellationStatus: UILabel!
    
    func configCell(_ trip: Trip?) {
        tripImage.image = UIImage(named: trip?.asset ?? "")
        tripTitleLabel.text = trip?.titulo
        tripSubtitleLabel.text = trip?.subtitulo
        tripPriceLabel.text = "R$ \(trip?.preco ?? 0)"
        
        let stringAttribute: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(trip?.precoSemDesconto ?? 0)")
        stringAttribute.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, stringAttribute.length))
        priceWithoutDiscountLabel.attributedText = stringAttribute
        
        if let numberOfDays = trip?.diaria, let numberOfGuests = trip?.hospedes {
            let days = numberOfDays == 1 ? "Diária" : "Diárias"
            let guests = numberOfGuests == 1 ? "Pessoa" : "Pessoas"
            
            tripDailyLabel.text = "\(numberOfDays) \(days) - \(numberOfGuests) \(guests)"
        }
        
        DispatchQueue.main.async {
            self.backgroundViewCell.addShadow()
        }
    }
}
