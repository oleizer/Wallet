//
//  UITableViewExtensions.swift
//  Business
//
//  Created by Олег Лейзер on 11.01.2018.
//  Copyright © 2018 Олег Лейзер. All rights reserved.
//

import UIKit
// MARK: - Methods

public extension UITableView {
    public func removeTableFooterView() {
        tableFooterView = nil
    }
    public func clearTableFooterView() {
        tableFooterView = UIView()
    }
    /// Reload data with a completion handler.
    ///
    /// - Parameter completion: completion handler to run after reloadData finishes.
    public func reload(with completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }) { _ in
            completion()
        }
    }

    ///  Register UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: cellClass.identifier)
    }

    /// Register UITableViewCell using class name
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the tableView cell.
    ///   - name: UITableViewCell type.
    public func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
        register(nib, forCellReuseIdentifier: name.identifier)
    }
    /// Dequeue reusable UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    /// - Returns: UITableViewCell object with associated class name.
    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type) -> T? {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellClass.identifier) as? T else {
            fatalError("Couldn't find UITableViewCell for: \(cellClass.identifier)")
        }
        return cell
    }
}

//public extension UITableView {
//    // Remove TableFooterView.
//    public func removeTableFooterView() {
//        tableFooterView = nil
//    }
//
//    // Clear TableFooterView.
//    public func clearTableFooterView() {
//        tableFooterView = UIView()
//    }
//
//    // register
//    func register<T: UITableViewCell>(_ cellClass: T.Type) {
//        if Bundle.main.path(forResource: cellClass.identifier, ofType: "nib") != nil {
//            register(UINib(nibName: cellClass.identifier, bundle: nil), forCellReuseIdentifier: cellClass.identifier)
//        } else {
//            register(cellClass, forCellReuseIdentifier: cellClass.identifier)
//        }
//    }
//
//    func register<T: UITableViewHeaderFooterView>(_ headerClass: T.Type) {
//        if Bundle.main.path(forResource: headerClass.identifier, ofType: "nib") != nil {
//            register(UINib(nibName: headerClass.identifier, bundle: nil),
//                     forHeaderFooterViewReuseIdentifier: headerClass.identifier)
//        } else {
//            register(headerClass, forHeaderFooterViewReuseIdentifier: headerClass.identifier)
//        }
//    }
//
//    func dequeueReusableCellWithRegistration<T: UITableViewCell>(_ cellClass: T.Type) -> T? {
//        register(cellClass)
//        let cell = dequeueReusableCell(cellClass)
//        return cell
//    }
//
//    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type) -> T {
//        guard let cell = self.dequeueReusableCell(withIdentifier: cellClass.identifier) as? T else {
//            fatalError("Error: cannot dequeue cell with identifier: \(cellClass.identifier)")
//        }
//        return cell
//    }
//
//    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
//        guard let cell = self.dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as? T else {
//            fatalError("Error: cannot dequeue cell with identifier: \(cellClass.identifier) " +
//                "for index path: \(indexPath)")
//        }
//        return cell
//    }
//    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerClass: T.Type) -> T {
//        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: headerClass.identifier) as? T else {
//            fatalError("Error: cannot dequeue header with identifier: \(headerClass.identifier)")
//        }
//        return header
//    }
//}
//
//extension UITableView {
////
////    func register<Header: UITableViewHeaderFooterView>(_: Header.Type) where Header: ReusableView,
////          Header: NibLoadableView {
////        let nib = UINib(nibName: Header.NibName, bundle: nil)
////        register(nib, forHeaderFooterViewReuseIdentifier: Header.reuseIdentifier)
////    }
//
//    // register
//
////    func register<Cell: UITableViewCell>(_: Cell.Type) where Cell: ReusableView, Cell: NibLoadableView {
////        let nib = UINib(nibName: Cell.NibName, bundle: nil)
////        register(nib, forCellReuseIdentifier: Cell.reuseIdentifier)
////    }
////
//    func dequeueReusableHeader<T: HeaderViewModel>(withModel model: T) -> UITableViewHeaderFooterView {
//        let identifier = String(describing: T.HeaderType.self)
//        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) else {
//            fatalError("Error: cannot dequeue header with identifier: \(identifier)")
//        }
//        if let header = header as? T.HeaderType {
//            model.setup(header: header)
//        } else {
//            assertionFailure("Error: cell model")
//        }
//
//        return header
//    }
//    func dequeueReusableCell<T: CellViewModel>(withModel model: T, for indexPath: IndexPath) -> UITableViewCell {
//        let identifier = String(describing: T.CellType.self)
//        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        if let cell = cell as? T.CellType {
//            model.setup(cell: cell)
//        } else {
//            assertionFailure("Error: cell model")
//        }
//        return cell
//    }
//
//}
//
//extension UITableViewCell: ReusableView, NibLoadableView { }
//extension UITableViewHeaderFooterView: ReusableView, NibLoadableView { }
//
//protocol ReusableView: class {}
//extension ReusableView where Self: UIView {
//    static var reuseIdentifier: String {
//        return String(describing: self)
//    }
//}
//protocol NibLoadableView: class {}
//extension NibLoadableView where Self: UIView {
//    static var NibName: String {
//        return String(describing: self)
//    }
//}
