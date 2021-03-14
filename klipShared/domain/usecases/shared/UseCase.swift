//
//  UseCase.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

protocol UseCase {
    associatedtype Params
    associatedtype Result

    func invoke(_ params: Params) -> Result
}

typealias NoParams = Void
