//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Niranjan Kumar on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    @IBOutlet weak var imageViewDetail: UIImageView!
    
    @IBOutlet weak var addTitleTextField: UITextField!
    
    @IBAction func addPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    //The "Save" bar button item's action should either update the photo if it has a value, or create a new instance of photo using the methods in the photoController. "Pop" the view controller afterwards.

    @IBAction func savePhoto(_ sender: Any) {
        guard let image = imageViewDetail.image,
            let title = addTitleTextField.text,
            let imageData = image.pngData() else { return }
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData, string: title)
        } else {
            let photo = Photo(imageData: imageData, title: title)
            guard let photoController = photoController else { return }
            photoController.create(photo: photo)
        }
        navigationController?.popViewController(animated: true)
    
    
    }
    
    func setTheme() {
        guard let themeColor = themeHelper?.themePreference else { return }
        
        if themeColor == "Dark" {
            view.backgroundColor = .black
        } else if themeColor == "Navy" {
            view.backgroundColor = .blue
        }
    }
    
    
    // Create an updateViews function. Call the setTheme function at the first of this function. that takes the values in the photo (if it isn't nil) and sets them in the appropriate UI element. You will need to use the UIImage(data: Data) initializer to convert the photo's imageData to a UIImage. You can then put that UIImage in the image view. Call it in the viewDidLoad method of the view controller.

    func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
            imageViewDetail.image = UIImage(data: photo.imageData)
            addTitleTextField.text = photo.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageViewDetail.image = image
            dismiss(animated: true, completion: nil)
        }
    }
}
