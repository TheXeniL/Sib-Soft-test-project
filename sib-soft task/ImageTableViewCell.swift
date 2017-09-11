//
//  ImageTableViewCell.swift
//  sib-soft task
//
//  Created by Никита Елизаров on 09/05/2017.
//  Copyright © 2017 Никита Елизаров. All rights reserved.
//

import UIKit


class ImageTableViewCell: UITableViewCell {
    
    // MARK: Variables
    var onButtonTapped : (() -> Void)? = nil

    // MARK: Outlets
    @IBOutlet weak var cellDescription: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // MARK: Actions
    // Данный Action позволяет создавать нотификацию для перезагрузки таблицы и использовать метод onButtonTapped
    @IBAction func addToFavourites(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        if let onButtonTapped = self.onButtonTapped {
            onButtonTapped()
        }
    }
    

}
