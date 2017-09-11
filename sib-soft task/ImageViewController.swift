//
//  ImageViewController.swift
//  sib-soft task
//
//  Created by Никита Елизаров on 09/05/2017.
//  Copyright © 2017 Никита Елизаров. All rights reserved.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    @IBOutlet weak var imageTableView: UITableView!
    
    // MARK: Varibles
    
    // Переменная определяющая добавлен ли объект в избранное
    public var isAddedToFavourites = [IndexPath: Bool]()
    
    
    // MARK: TableView
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (Data.ImageCollection.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        
        // Изменение текста кнопки при добавлении изображения в избранное
        if isAddedToFavourites[indexPath] ?? false {
            cell.cellButton.setTitle("Добавленно в избранное", for: .normal)

        } else {
            cell.cellButton.setTitle("Добавить в избранное", for: .normal)
        }
        
        // Заполнение таблицы, заполняется описание и изображение из массива, заполнение изображение происходит с помощью стороннней библотеки Kingfisher позволяющее загружать изображение в память и использовать офлайн
        cell.cellDescription.text = Data.ImageCollection[indexPath.row].description
        cell.cellImage.kf.indicatorType = .activity
        cell.cellImage.kf.setImage(with: Data.ImageCollection[indexPath.row].image, options: [.transition(.fade(0.2))])
        
        // Стиль ячейки
        cell.accessoryType = .disclosureIndicator

        // При нажатии на кнопку Добавить в избранное объект добавляется в массив FavoriteImageCollection
        cell.onButtonTapped = {
            if self.isAddedToFavourites[indexPath] ?? false {
            }
            else {
                self.isAddedToFavourites[indexPath] = true
                Data.FavoriteImageCollection.append(Data.ImageCollection[indexPath.row])
            }
        }
        
        return (cell)
    }
    
    // MARK: View
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageTableView.reloadData()
        
        // Создается наблюдатель, который вызывает метод loadList
         NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
    }
    
    override func didReceiveMemoryWarning()
    {
        
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: Functions
    
    // Метод для обновления таблицы
    func loadList(notification: NSNotification){
        self.imageTableView.reloadData()
    }
    
    
    
    // MARK: Segue
    // На ImageDetailViewController передаются атрибуты объекта, по IndexPath определяется какой объект будет передан
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImageDetail" {
            if let indexPath = imageTableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                ImageDetailViewController
                destinationController.images = Data.ImageCollection[indexPath.row]
                let indexOfObject = indexPath.row
                destinationController.index = indexOfObject
            }
        }
    }
}

