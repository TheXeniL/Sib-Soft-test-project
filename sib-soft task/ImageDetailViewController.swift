//
//  ImageDetailViewController.swift
//  sib-soft task
//
//  Created by Никита Елизаров on 09/06/2017.
//  Copyright © 2017 Никита Елизаров. All rights reserved.
//

import UIKit
import Kingfisher

class ImageDetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var descriptionDetail: UILabel!
    @IBOutlet weak var changeDesriptionButton: UIButton!
    
    //MARK: Variables
    var images:ImageClass!
    var index = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Присваивается изображение и описание объекта из массива
        imageDetail.kf.setImage(with: images.image)
        descriptionDetail.text = images.description
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated);
        
        // При переходе на предыдущий view обновляется массив и перезагружается таблица
        if self.isMovingFromParentViewController
        {
            Data.ImageCollection[index].description = descriptionDetail.text!
            
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
    
    // MARK: Actions
    // Создается alert окно для ввода описания к изображению
    @IBAction func changeDescritption(_ sender: Any)
    {
        
        let alertController = UIAlertController(title: "Изменить описание", message: "Введите новое описание для изображения", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "Описание"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            self.descriptionDetail.text = alertController.textFields?.first?.text
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
}
