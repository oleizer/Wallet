//
//  ImportViewController.swift
//  Wallet
//
//  Created by Олег Лейзер on 10/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

class ImportViewController: UIViewController {
    var state: State = .initial(import: .jsonKey) {
        didSet { updateState() }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        state = { state }()
        // Do any additional setup after loading the view.
    }
    private func updateState() {
        print("update state")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImportViewController {
    enum State {
        case initial(import: ImportState)
    }
}
