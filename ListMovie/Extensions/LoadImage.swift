//
//  LoadImage.swift
//  ListMovie
//
//  Created by Josh JR Reynaldo on 15/08/24.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    print("Unable to create image from data")
                }
            } catch {
                print("Failed to load image data: \(error.localizedDescription)")
            }
        }
    }
}
