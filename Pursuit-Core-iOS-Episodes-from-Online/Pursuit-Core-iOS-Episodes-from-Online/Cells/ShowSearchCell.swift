//
//  ShowSearchCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Gregory Keeley on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowSearchCell: UITableViewCell {
    
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    func configureCell(for show: Show) {
        showNameLabel.text = show.name
        ratingLabel.text = show.rating.average.description
        ImageClient.getImage(for: show.image.medium) { (result) in
            switch result {
            case .failure(let appError):
                print("error: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.showImage.image = image
                    
                }
            }
        }
    }
}
