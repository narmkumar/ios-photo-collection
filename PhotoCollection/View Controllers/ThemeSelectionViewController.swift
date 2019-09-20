//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Niranjan Kumar on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferencetoDark()
        dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func SelectYourColorHereTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToNavy()
        dismiss(animated: true, completion: nil)
    }

}
