//
//  AppDelegate.swift
//  Wallet
//
//  Created by Олег Лейзер on 04/12/2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    class var shared: AppDelegate {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { fatalError("AppDelegate: Invalid delegate") }
        return delegate
    }
    var window: UIWindow?

    private let app = Application()

    private lazy var configurators: [ConfiguratorProtocol] = {
        return [AppearanceConfigurator(),
                ApplicationConfigurator(),
                ThirdPartiesConfigurator()
        ]
    }()

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        runStartupSequenceWithLaunchOptions(launchOptions)
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions state: \(application.applicationState)")

        configurators.forEach { $0.configure() }

        let window = UIWindow(frame: UIScreen.main.bounds)

        let welcome = WelcomeAssembly().assembly()
        window.rootViewController = welcome
        window.makeKeyAndVisible()
        self.window = window
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        app.screenLocker.lock(true)

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        app.screenLocker.lock(true)

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        app.screenLocker.unlock(true)

        print("applicationWillEnterForeground ")

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        app.screenLocker.unlock(true)
        print("applicationDidBecomeActive ")

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    private func runStartupSequenceWithLaunchOptions(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {

    }

}

extension AppDelegate {
    static var currentWindow: UIWindow {
        return shared.window ?? UIWindow()
    }
}
