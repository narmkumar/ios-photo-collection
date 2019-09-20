//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Niranjan Kumar on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // Add a didSet property observer to the photo variable. Call updateViews inside of it.

    func updateViews() {
        guard let imageInfo = photo?.imageData else { return }
        let image = UIImage(data: imageInfo)
        imageView.image = image
        textLabel.text = photo?.title
        
    }
}
