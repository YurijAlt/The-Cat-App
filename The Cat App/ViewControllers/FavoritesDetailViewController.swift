//
//  FavoritesDetailViewController.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 18.08.2021.
//

import UIKit

class FavoritesDetailViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var catDetailImage: UIImageView!
    
    //MARK: - Public Properties
    var cat: FavoriteCat!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        setupUI()
    }
    
    //MARK: - IB Actions
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped() {
        guard let image = catDetailImage.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @IBAction func dislikeButtonTapped() {
        dislikeCat()
        dismiss(animated: true)
    }
    
    
    //MARK: - Private Methods
    private func setupUI() {
        ImageManager.shared.fetchImage(from: cat.catImage ?? "") { data in
            self.catDetailImage.image = UIImage(data: data)
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func dislikeCat() {
        StorageManager.shared.delete(cat)
    }
    
    private func setupActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let ac = UIAlertController(title: "Saved", message: "Image has been saved to your photos", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

}
