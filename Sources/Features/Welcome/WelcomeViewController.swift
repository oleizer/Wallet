//
//  WelcomeViewController.swift
//  Wallet
//
//  Created by Олег Лейзер on 09/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let interactor: WelcomeBusinessLogic
    private let router: WelcomeRouter

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
    }

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
}

extension WelcomeViewController: WelcomeViewDelegate {
    func welcomeAction(with action: WelcomeView.WelcomeAction) {
        switch action {
        case .new:
            print("hui")
            router.presentPin(from: self) { [unowned self] pin, routing in
                self.interactor.createWallet(request: .init(passcode: pin))
            }
        case .import:
            showImportSheet()

        }
    }
    
    
}
