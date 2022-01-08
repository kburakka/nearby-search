//
//  SettingsViewController.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit
import TinyConstraints

final class SettingsViewController: BaseViewController<SettingsViewModel> {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(radiusStackView)
        stackView.addArrangedSubview(slider)
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var radiusStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(radiusTitleLabel)
        stackView.addArrangedSubview(radiusLabel)
        stackView.spacing = 5
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        stackView.alignment = .leading
        return stackView
    }()
    
    let radiusTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Radius:"
        return label
    }()
    
    let radiusLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Constants.radius)"
        return label
    }()
    
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSlider()
    }
    
    override func setupViews() {
        view.addSubview(stackView)
        stackView.edgesToSuperview(excluding: .bottom, insets: .init(top: 20, left: 20, bottom: 20, right: 20), usingSafeArea: true)
    }
    
    override func setupLayouts() {
        slider.height(30)
        slider.trailingToSuperview()
    }
    
    func setupSlider() {
        slider.minimumValue = 100
        slider.maximumValue = 5000
        slider.tintColor = .green
        UIView.animate(withDuration: 0.8) {
            self.slider.setValue(Float(Constants.radius), animated: true)
        }
        slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!) {
        radiusLabel.text = "\(Constants.radius)"
        Constants.radius = Int(sender.value)
    }
}
