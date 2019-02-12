//
//  PinViewController.swift
//  Wallet
//
//  Created by Олег Лейзер on 10/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

import UIKit

class PinViewController: UIViewController {
    private var nextScene: PinNextScene?
    private var postProcess: PinPostProcess?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorName.background.color
        // Do any additional setup after loading the view.
    }
    @IBAction private func numberButtonTouched(_ sender: UIButton) {
        print("Button: \(sender.tag) was touched")
        if sender.tag == 9 {
            postProcess?("Pass") { result in
                switch result {
                    
                case .left(_):
                    print("success")
                case .right(_):
                    print("failure")

                }
            }
            self.dismiss(animated: true, completion: nil)

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func present(from viewController: UIViewController, postProcess: PinPostProcess?, nextScene: PinNextScene?){
        self.nextScene = nextScene
        self.postProcess = postProcess
        viewController.present(self, animated: true, completion: nil)
    }
}
