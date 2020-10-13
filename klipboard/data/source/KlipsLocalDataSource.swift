//
//  KlipsLocalDataSource.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

final class KlipsLocalDataSource {
    
    private let KLIPS_KEY = "KLIPS"
    
    private let userDefaults: UserDefaults
    private let jsonEncoder: JSONEncoder
    private let jsonDecoder: JSONDecoder
    
    init(userDefaults: UserDefaults,
         jsonEncoder: JSONEncoder,
         jsonDecoder: JSONDecoder) {
        self.userDefaults = userDefaults
        self.jsonEncoder = jsonEncoder
        self.jsonDecoder = jsonDecoder
    }
    
    func getKlips() -> [KlipDTO] {
        if let result = userDefaults.object(forKey: KLIPS_KEY) as? Data {
            if let klips = try? jsonDecoder.decode([KlipDTO].self, from: result) {
                return klips
            }
        }
        return []
    }
    
    func addKlip(_ klipValue: String) {
        var klips = getKlips()
        let lastId = klips.last?.id
        let newId = lastId != nil ? lastId! + 1 : 0
        klips.append(KlipDTO(id: newId, value: klipValue))
        saveKlips(klips)
    }
    
    func updateKlip(_ klipToUpdate: Klip) {
        var klips = getKlips()
        let klipToUpdateIndex = klips.firstIndex(where: { klip in klip.id == klipToUpdate.id })
        klips[klipToUpdateIndex!] = KlipDTO(id: klipToUpdate.id, value: klipToUpdate.value)
        saveKlips(klips)
    }
    
    private func saveKlips(_ klips: [KlipDTO]) {
        let klipsJson = try! jsonEncoder.encode(klips)
        userDefaults.set(klipsJson, forKey: KLIPS_KEY)
    }
}
