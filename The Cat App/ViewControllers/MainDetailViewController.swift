//
//  DetailViewController.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 06.08.2021.
//

import UIKit

class MainDetailViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var catDetailImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    //MARK: - Public Properties
    var cat: Cat!
    
    //MARK: - Private Properties
    private var isFavorite = false
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActivityIndicator()
    }
    
    //MARK: - IB Actions
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonTapped() {
        guard let image = catDetailImage.image else { return }
        UIImageWriteToSavedPhotosAlbum(
            image,
            self,
            #selector(image(_:didFinishSavingWithError:contextInfo:)),
            nil
        )
    }
    
    @IBAction func isFavoriteButtonTapped() {
        StorageManager.shared.save(cat.url ?? "")
        isFavorite.toggle()
        setStatusForFavoriteButton()
        
        let alert = UIAlertController(
            title: "Готово!",
            message: "Выбранный котик сохранен в Избранное",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
    
    //MARK: - Private Methods
    private func setupActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private func setupUI() {
        ImageManager.shared.fetchImage(from: cat.url ?? "") { data in
            self.catDetailImage.image = UIImage(data: data)
            self.activityIndicator.stopAnimating()
        }
        setStatusForFavoriteButton()
    }
    
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let alert = UIAlertController(title: "Ошибка сохранения", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let alert = UIAlertController(title: "Готово!", message: "Изображение сохранено в медиатеку", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
    
}
