//
//  VenueCell.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit
import TinyConstraints

class VenueCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: VenueCellProtocol?
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        return UIImageView(image: UIImage (systemName: "arrow.right"))
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        contentView.addSubview(containerView)
        containerView.edgesToSuperview(insets: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        containerView.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .trailing, insets: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        containerView.addSubview(arrowIcon)
        arrowIcon.height(20)
        arrowIcon.width(20)
        arrowIcon.centerYToSuperview()
        arrowIcon.trailingToSuperview().constant = -5
        arrowIcon.leadingToTrailing(of: stackView).constant = 5
    }
    
    func set(viewModel: VenueCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.venue.poi?.name ?? "n/a"
        phoneLabel.text = viewModel.venue.poi?.phone ?? "n/a"
        addressLabel.text = viewModel.venue.address?.freeformAddress ?? "n/a"
    }
    
}
