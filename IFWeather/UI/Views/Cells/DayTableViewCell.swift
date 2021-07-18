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
    
    // MARK: - Private properties
    private var task: URLSessionDataTask?
    
    // MARK: - Overrides
    override func prepareForReuse() {
        task?.cancel()
    }
    
    // MARK: - Public Methods
    func setupCell(_ day: DayViewModel.Output?) {
        dayLabel.text = day?.weekday
        tempLabel.attributedText = day?.minMaxTemp
        if let urlString = day?.iconURL, let url = URL(string: urlString) {
            task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.tempIconImageView.image = UIImage(data: data)
                }
            }

            task?.resume()
        }
    }
}
