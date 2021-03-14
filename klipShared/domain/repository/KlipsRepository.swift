//
//  KlipsRepository.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

protocol KlipsRepository {
    func getKlips() -> [KlipModel]
    func addKlip(withValue value: String)
    func removeKlip(withId id: Int)
    func updateKlip(_ klip: Klip)
}
