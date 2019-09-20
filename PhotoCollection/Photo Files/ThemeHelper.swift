//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Niranjan Kumar on 9/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

/// PART 2 - THEME HELPER ✓

class ThemeHelper {
    
    let themePreferenceKey = "themePreferenceKey"
    
    // Create a function called setThemePreferenceToDark(). Using the set method of UserDefaults (remember that in order to access set, you have to use the standard property on UserDefaults), set the string "Dark" as the value, and the themePreferenceKey as the key.
    
    func setThemePreferencetoDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    // Create another function that does the same thing, but with a different color. Call the function setThemePreferenceToYourColorHere.

    func setThemePreferenceToNavy() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Navy", forKey: themePreferenceKey)
    }
    
    // Finally, create a computed property called themePreference of type String?. This should simply return the string value that you stored from either of the two methods you wrote above. Use the UserDefaults string(forKey: ...) method to get that value. The method should return an optional string because if the user's theme preference hasn't been saved, the value returned from UserDefaults will be nil.

    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    // In the initializer for this class (you will have to call it), check if the themePreference value is nil. If it is, then call one of the setThemePreference functions you just created. This will make it so the first time the user opens the app a preference will be set for them until they choose to change it.
    
    init() {
        if themePreference == nil {
        setThemePreferencetoDark()
        }
    }
}

