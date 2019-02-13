//
//  ViewController.swift
//  Wallet
//
//  Created by Олег Лейзер on 04/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit
import Starscream
import SocketIO

extension ViewController: WebSocketDelegate {
    // MARK: Websocket Delegate Methods.

    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
        periodicPing()
    }

    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        if let err = error as? WSError {
            print("websocket is disconnected: \(err.message)")
        } else if let err = error {
            print("websocket is disconnected: \(err.localizedDescription)")
        } else {
            print("websocket disconnected")
        }
    }

    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Received text: \(text)")
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data.count)")
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    let manager = WebSocket(url: URL(string: "wss://ws.blockchain.info/inv")!)

//    let manager = SocketManager(socketURL: URL(string: "wss://coinapi.io/v1/")!, config: [.log(true), .compress])

    let userDefault = UserDefaults.standard

    @objc
    private func ping() -> Bool {
        let msg = dictionaryToJSONString(true, dict: ["op": "ping"])
        return sendMessage(msg)
    }
    func periodicPing() {
        let interval = 5.0
        DispatchQueue.main.async {

            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.ping), object: nil)
            Timer.scheduledTimer(timeInterval: interval, target: self,
                                 selector: #selector(self.ping), userInfo: nil, repeats: true)
        }
    }
    func sendMessage(_ msg: String) -> Bool {
        print("StealthWebSocket sendMessage: \(msg)")
        if manager.isConnected {
            manager.write(string: msg)
            return true
        } else {
            print("StealthWebSocket Error: not connect to websocket server")
            return false
        }
    }
    func dictionaryToJSONString(_ prettyPrint: Bool, dict: NSDictionary) -> String {
        let jsonData: Data?
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dict,
                                                  options: (prettyPrint ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)) as JSONSerialization.WritingOptions)
        } catch _ as NSError {
            jsonData = nil
        }
        assert(jsonData != nil, "jsonData not valid")
        return NSString(data: jsonData!, encoding: String.Encoding.utf8.rawValue)! as String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()

        var request = URLRequest(url: URL(string: "wss://ws.blockchain.info/inv")!)
        request.timeoutInterval = 5
        request.setValue("76B497FE-7707-4728-81A2-3B9CF54CAE44", forHTTPHeaderField: "X-CoinAPI-Key")
//        request.setValue("14", forHTTPHeaderField: "Sec-WebSocket-Version")
//        request.setValue("Everything is Awesome!", forHTTPHeaderField: "My-Awesome-Header")
        manager.request = request

        view.backgroundColor = UIColor(named: "primary")
        NotificationCenter.default.addObserver(self, selector: #selector(changed), name: UserDefaults.didChangeNotification, object: nil)
        manager.delegate = self
//        //let socket = manager.defaultSocket
        manager.disableSSLCertValidation = true

        manager.connect()
//        socket.connect()

    }

    deinit {

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startLoading()
        do {
            let image = try QRService().createQR(fromString: "hui", size: CGSize(width: 16, height: 16))

            view.addSubview(UIImageView(image: image))
        } catch {
            print("error")
        }

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
