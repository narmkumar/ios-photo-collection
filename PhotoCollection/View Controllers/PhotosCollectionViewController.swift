//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Niranjan Kumar on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func setTheme() {
        guard let themeColor  = themeHelper.themePreference else { return }
        
        if themeColor == "Dark" {
            collectionView.backgroundColor = .black
        } else if themeColor == "Navy" {
            collectionView.backgroundColor = .blue
        }
    }

    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectThemeSegue" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = self.themeHelper
            }
        } else if segue.identifier == "createPhotosegue" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = self.themeHelper
                photoDetailVC.photoController = self.photoController
            }
        } else if segue.identifier == "ShowDetail" {
            if let photoDetailVC = segue.destination as? PhotoDetailViewController {
                photoDetailVC.themeHelper = self.themeHelper
                photoDetailVC.photoController = self.photoController
                photoDetailVC
                // not sure how to pull the third element (the photo)
            }
        
        }
    }

    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    
    // Fill in the cellForItemAt method. This should pass an instance of Photo to the custom cell. Note: You will need to cast the cell as PhotoCollectionViewCell.

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        // Configure the cell
        let photos = photoController.photos[indexPath.item]
        cell.photo = photos
        return cell
    }
    
    //    Create a function called setTheme(). This function should:
    //       Get the current themePreference from the themeHelper. Make sure that it has a value, or return out of the function.
    //       Based on the value, change the collection view's background color depending on whether the theme is dark or the other color you selected.
    


}
