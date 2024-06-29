//
//  HomeTableViewHeader.swift
//  AluraTrips
//
//  Created by Gustavo Ferreira dos Santos on 29/06/24.
//

import UIKit

class HomeTableViewHeader: UIView {

    // MARK: -IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    
    func configView() {
        headerView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
}
