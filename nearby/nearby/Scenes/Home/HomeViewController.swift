//
//  HomeViewController.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit
import TinyConstraints

final class HomeViewController: BaseViewController<HomeViewModel> {
   
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(VenueCell.self)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserLocation()
    }
    
    override func setupViews() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    override func setupLayouts() {
        collectionView.edgesToSuperview()
    }
    
    func setupNavBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Settings", style: .done, target: self, action: #selector(self.action(sender:)))
    }
    
    func getUserLocation() {
        LocationManager.shared.getUserLocation { [weak self] location in
            self?.getVenues(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        }
    }
    
    func getVenues(lat: Double, lng: Double) {
        viewModel.fetchVenues(lat: lat, lng: lng, radius: Constants.radius) { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VenueCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPathRow: indexPath.row))
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
}

// MARK: - Actions
@objc
extension HomeViewController {
    func action(sender: UIBarButtonItem) {
        viewModel.settingsTapped()
   }
}


