//
//  MainCollectionViewCell.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 06.08.2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catImage: UIImageView!
    
    let offlineImageURL = "https://softikbox.com/uploads/images/c0/80/59/c080593d-4efc-4fdf-b646-10c496a5ea28_880x400_fit.png"
    
    func configure(with cat: Cat) {
        guard let url = URL(string: cat.url ?? offlineImageURL) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        DispatchQueue.main.async {
            self.catImage.image = UIImage(data: imageData)
        }
    }
    
}
