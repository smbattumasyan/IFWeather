//
//  DayTableViewCell.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 18.07.21.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempIconImageView: UIImageView!
    
    // MARK: - Public properties
    static let id = "DayTableViewCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public Methods
    func setupCell(_ day: DayViewModel.Output?) {
        dayLabel.text = day?.weekday
        tempLabel.attributedText = day?.minMaxTemp
    }
}
