//
//  MainCollectionViewController.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 05.08.2021.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    //MARK: IB Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Public Properties
    var cats: [Cat] = []
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        getCats()
    }
    
    //MARK: Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? MainDetailViewController else { return }
        guard let paths = collectionView.indexPathsForSelectedItems else { return }
        guard let indexPath = paths.first?.row else { return }
        detailVC.cat = cats[indexPath]
    }
    
    //MARK: Private Methods
    private func getCats() {
        NetworkManager.shared.fetchData() { cats in
            self.cats = cats
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func setupActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainVCCell", for: indexPath) as! MainCollectionViewCell
        let cat = cats[indexPath.row]
        cell.configure(with: cat)
        return cell
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        setupActivityIndicator()
        cats.removeAll()
        collectionView.reloadData()
        getCats()
    }
    
}

//MARK: Setup UICollectionView
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.width / 5)
    }
}
