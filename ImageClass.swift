//
//  ImageClass.swift
//  sib-soft task
//
//  Created by Никита Елизаров on 09/06/2017.
//  Copyright © 2017 Никита Елизаров. All rights reserved.
//

import Foundation

// Класс для представления изображений с описанием
class ImageClass {
    var description = ""
    var image:URL
    
    init (description:String, image:URL){
        self.description = description
        self.image = image
    }
}
