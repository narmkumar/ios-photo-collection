//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Niranjan Kumar on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

/// PART 1 - MODEL LAYER SET UP: PHOTOCONTROLLER ✓

class PhotoController {
    var photos: [Photo] = []
    
    //    Add a "Create" method that initializes a new instance of Photo and appends it to the photos array.
    func create(photo: Photo) {
        photos.append(photo)
    }
    
    //    Add an "Update" method that takes in Photo,Data, and String parameters.
    func update(photo: Photo, data: Data, string: String){

        }
}
