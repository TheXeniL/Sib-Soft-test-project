//
//  Data.swift
//  sib-soft task
//
//  Created by Никита Елизаров on 09/07/2017.
//  Copyright © 2017 Никита Елизаров. All rights reserved.
//

import Foundation

// Класс Data создан для удобсвта доуступа к двум массивам ImageCollection и FavoriteImageCollection
class Data {
    
    // ImageCollection содержит в себе объекты класса ImageClass, этими объектами будет заполнятся таблица
    static var ImageCollection:[ImageClass] = [
        ImageClass(description: "Some random description about image",image: URL(string:"http://cdn.images.express.co.uk/img/dynamic/130/590x/Mountains-625882.jpg")!),
        ImageClass(description: "",image: URL(string:"http://i2.cdn.cnn.com/cnnnext/dam/assets/170407220921-07-iconic-mountains-pitons-restricted-super-169.jpg")!),
        ImageClass(description: "",image: URL(string:"http://images2.fanpop.com/image/photos/10000000/Great-Mountains-mountains-and-waterfalls-10022482-1920-1200.jpg")!),
        ImageClass(description: "",image: URL(string:"https://www.atlasandboots.com/wp-content/uploads/2015/09/Non-technical-mountains-whitney.jpg")!),
        ImageClass(description: "",image: URL(string:"http://www.telegraph.co.uk/content/dam/Travel/galleries/travel/activityandadventure/The-worlds-most-beautiful-mountains/mountains-stetind_3374095a.jpg")!)
    ]
    // FavoriteImageCollection представляет собой второй массив, который будет содержать только те объекты что пользователь добавил в избранное
    static var FavoriteImageCollection:[ImageClass] = []
}
