//
//  FavoritesCollectionViewController.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 06.08.2021.
//

import UIKit

class FavoritesCollectionViewController: UICollectionViewController {
    
    //MARK: - Private Properties
    private var favoriteCats: [FavoriteCat] = []
    
    //MARK: - Override Methods
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? FavoritesDetailViewController else { return }
        guard let paths = collectionView.indexPathsForSelectedItems else { return }
        guard let indexPath = paths.first?.row else { return }
        detailVC.cat = favoriteCats[indexPath]
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteCats.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritesVCCell", for: indexPath) as! FavoritesCollectionViewCell
        let cat = favoriteCats[indexPath.row]
        cell.configure(with: cat)
        return cell
    }
    
    
    //MARK: - Private Methods
    private func fetchData() {
        StorageManager.shared.fetchData { result in
            switch result {
            case .success(let cats):
                self.favoriteCats = cats
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

//MARK: - Setup UICollectionView
extension FavoritesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
    }
}

