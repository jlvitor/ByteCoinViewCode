//
//  CoinScreen.swift
//  ByteCoinViewCode
//
//  Created by Jean Lucas Vitor on 03/05/22.
//

import UIKit

class CoinScreen: UIView {
    
    lazy var backgroundcolor: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Background Color")
        return view
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        text.textColor = UIColor(named: "Title Color")
        text.textAlignment = .center
        text.text = "ByteCoin"
        return text
    }()
    
    lazy var coinView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .tertiaryLabel
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        return view
    }()
    
    lazy var stackLabel: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    lazy var coinImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "bitcoinsign.circle.fill")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(named: "Icon Color")
        return image
    }()
    
    lazy var coinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "..."
        return label
    }()
    
    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "..."
        return label
    }()
    
    lazy var currencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configDelegate(delegate: UIPickerViewDelegate, dataSource: UIPickerViewDataSource) {
        self.currencyPicker.delegate = delegate
        self.currencyPicker.dataSource = dataSource
    }
    
    private func addElements() {
        self.addSubview(self.backgroundcolor)
        self.addSubview(self.mainStackView)
        self.mainStackView.addArrangedSubview(self.titleLabel)
        self.mainStackView.addArrangedSubview(self.coinView)
        self.coinView.addSubview(self.stackLabel)
        self.stackLabel.addArrangedSubview(self.coinImage)
        self.stackLabel.addArrangedSubview(self.coinLabel)
        self.stackLabel.addArrangedSubview(self.currencyLabel)
        self.addSubview(self.currencyPicker)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundcolor.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundcolor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundcolor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundcolor.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.mainStackView.topAnchor),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.coinView.leadingAnchor.constraint(equalTo: self.mainStackView.leadingAnchor),
            self.coinView.trailingAnchor.constraint(equalTo: self.mainStackView.trailingAnchor),
            self.coinView.heightAnchor.constraint(equalToConstant: 80),
            
            self.stackLabel.topAnchor.constraint(equalTo: self.coinView.topAnchor),
            self.stackLabel.leadingAnchor.constraint(equalTo: self.coinView.leadingAnchor),
            self.stackLabel.trailingAnchor.constraint(equalTo: self.coinView.trailingAnchor, constant: -10),
            self.stackLabel.bottomAnchor.constraint(equalTo: self.coinView.bottomAnchor),
            
            self.coinImage.topAnchor.constraint(equalTo: self.stackLabel.topAnchor),
            self.coinImage.bottomAnchor.constraint(equalTo: self.stackLabel.bottomAnchor),
            self.coinImage.heightAnchor.constraint(equalToConstant: 80),
            self.coinImage.widthAnchor.constraint(equalToConstant: 80),
            
            self.currencyPicker.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.currencyPicker.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.currencyPicker.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.currencyPicker.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
}
