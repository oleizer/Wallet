//
//  Either.swift
//  Wallet
//
//  Created by Олег Лейзер on 11/02/2019.
//  Copyright © 2019 Олег Лейзер. All rights reserved.
//

public enum Either<L, R> {
    case left(L)
    case right(R)
}

public extension Either {
    /// Determines if this `Either` value is a `Left`.
    public var isLeft: Bool {
        return left != nil
    }
    
    /// Determines if this `Either` value is a `Left`.
    public var isRight: Bool {
        return right != nil
    }
    
    /// Returns the value of `Right` if it exists otherwise nil.
    public var right: R? {
        switch self {
        case let .right(success): return success
        default: return nil
        }
    }
    
    /// Returns the value of `Left` if it exists otherwise nil.
    public var left: L? {
        switch self {
        case let .left(failure): return failure
        default: return nil
        }
    }
    
    @discardableResult
    public func flatMap<T>(_ transform: (R) -> Either<L, T>) -> Either<L, T> {
        switch self {
        case let .right(right):
            return transform(right)
        case let .left(left):
            return .left(left)
        }
    }
    
    @discardableResult
    public func map<T>(_ transform: (R) -> T) -> Either<L, T> {
        switch self {
        case let .right(right):
            return .right(transform(right))
        case let .left(left):
            return .left(left)
        }
    }
}
