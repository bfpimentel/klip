//
//  KlipsRepository.swift
//  klipboard
//
//  Created by Bruno Pimentel on 12/10/20.
//

import Foundation

protocol KlipsRepository {
    func getKlips() -> [KlipModel]
    func updateKlip(_ klip: Klip)
    func addKlip(_ klipValue: String)
}
