//
//  WelcomeView.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit
import SnapKit

protocol WelcomeViewDelegate: class {
    func welcomeAction(with action: WelcomeView.WelcomeAction)
}

class WelcomeView: UIView {
    weak var delegate: WelcomeViewDelegate?

    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: Asset.logo.image)
        imageView.tintColor = ColorName.secondary.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var importButton: UIButton = {
        let button = StyledButton<BlueClearButtonStyle>(frame: .zero)
        button.setTitle(Localized.Welcome.Buttons.import, for: .normal)
        button.addTarget(self, action: #selector(importButtonTouched), for: .touchUpInside)
        return button
    }()
    
    lazy var newButton: UIButton = {
        let button = StyledButton<BlueButtonStyle>(frame: .zero)
        button.setTitle(Localized.Welcome.Buttons.new, for: .normal)
        button.addTarget(self, action: #selector(newButtonTouched), for: .touchUpInside)

        return button
    }()
    convenience init(delegate: WelcomeViewDelegate) {
        self.init(frame: .zero)
        self.delegate = delegate

    }
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = ColorName.background.color
        [logoImageView, titleLabel, subtitleLabel, newButton, importButton].forEach { addSubview($0) }
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(128)
            make.top.equalToSuperview().inset(96)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
        
        newButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(56)
            make.bottom.equalTo(importButton.snp.top).offset(-24)
        }
        
        importButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(56)
            make.bottom.equalToSuperview().inset(50)
        }
        
        titleLabel.text = Localized.Welcome.Labels.title
        subtitleLabel.text = Localized.Welcome.Labels.subtitle

    }
    
    @objc
    private func newButtonTouched() {
        delegate?.welcomeAction(with: .new)
    }
    @objc
    private func importButtonTouched() {
        delegate?.welcomeAction(with: .import)

    }
    enum WelcomeAction {
        case new
        case `import`
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
