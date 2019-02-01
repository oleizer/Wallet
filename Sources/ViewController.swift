//
//  ViewController.swift
//  Wallet
//
//  Created by Олег Лейзер on 04/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!

    let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()
        view.backgroundColor = UIColor(named: "primary")

        NotificationCenter.default.addObserver(self, selector: #selector(changed), name: UserDefaults.didChangeNotification, object: nil)
    }

    deinit {

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startLoading()
    }
    @objc private func changed() {
        print("Changed")
        updateDisplay()
        startLoading()
    }

    private func updateDisplay() {
        segmented.selectedSegmentIndex = userDefault.integer(forKey: "WalletServerKey")
    }
}

extension ViewController: Loadable {

}
