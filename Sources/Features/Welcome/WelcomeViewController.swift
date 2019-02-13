//
//  WelcomeViewController.swift
//  Wallet
//
//  Created by Олег Лейзер on 09/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var interactor: WelcomeBusinessLogic
    var router: WelcomeRouter
//    @IBOutlet weak var titleLabel: UILabel!
//
//    @IBOutlet weak var subtitleLabel: UILabel!
//
//    @IBOutlet weak var importButton: UIButton!
//    @IBOutlet weak var newButton: UIButton!

    private lazy var contentView = self.view as? WelcomeView

    init(interactor: WelcomeBusinessLogic, router: WelcomeRouter) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = WelcomeView(delegate: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
    }

//    private func setupView() {
//        titleLabel.text = Localized.Welcome.Labels.title
//        subtitleLabel.text = Localized.Welcome.Labels.subtitle
//
//        //newButton.setTitle(Localized.Welcome.Buttons.new, for: .normal)
//        //importButton.setTitle(Localized.Welcome.Buttons.import, for: .normal)
//
//    }
    private func showImportSheet() {
        let controller = UIAlertController(title: Localized.Welcome.Import.title, message: Localized.Welcome.Import.subtitle, preferredStyle: .actionSheet)

        let jsonAction = UIAlertAction(title: Localized.Welcome.Import.json, style: .default) { [unowned self] _ in
            print("Json action")

            let viewController = ImportAssembly().set(initialState: .initial(import: .mnemonic)).assembly()
            self.present(viewController, animated: true, completion: nil)
        }
        let privateAction = UIAlertAction(title: Localized.Welcome.Import.private, style: .default) { [unowned self] _ in
            print("Private action")
        }
        let mnemonicAction = UIAlertAction(title: Localized.Welcome.Import.mnemonic, style: .default) { [unowned self] _ in
            print("Mnemonic action")
        }
        let cancelAction = UIAlertAction(title: Localized.Common.cancel, style: .cancel, handler: nil)
        [jsonAction, privateAction, mnemonicAction, cancelAction].forEach { controller.addAction($0) }
        present(controller, animated: true, completion: nil)

    }
    @IBAction private func newButtonTouched(_ sender: Any) {
        print("next ction")
        router.presentPin(from: self) { [unowned self] pin, routing in
            self.interactor.createWallet(request: .init(passcode: pin))
        }
        
    }
    @IBAction private func importButtonTouched(_ sender: Any) {
        showImportSheet()

    }

}

extension WelcomeViewController: WelcomeViewDelegate {
    func welcomeAction(with action: WelcomeView.WelcomeAction) {
        switch action {
        case .new:
            print("new")
        case .import:
            showImportSheet()

        }
    }
    
    
}
