//
//  KlipsLocalDataSource.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

final class KlipsLocalDataSource {

    // MARK: Lifecycle

    init(
        userDefaults: UserDefaults,
        jsonEncoder: JSONEncoder,
        jsonDecoder: JSONDecoder
    ) {
        self.userDefaults = userDefaults
        self.jsonEncoder = jsonEncoder
        self.jsonDecoder = jsonDecoder
    }

    // MARK: Internal

    func getKlips() -> [KlipDTO] {
        userDefaults
            .data(forKey: KLIPS_KEY)
            .flatMap { try? jsonDecoder.decode([KlipDTO].self, from: $0) } ?? []
    }

    func addKlip(withValue klipValue: String) {
        var klips = getKlips()
        let lastId = klips.last?.id
        let newId = lastId.map { $0 + 1 } ?? 0
        klips.append(KlipDTO(id: newId, value: klipValue))
        saveKlips(klips)
    }

    func removeKlip(withId id: Int) {
        var klips = getKlips()

        guard let klipToRemoveIndex = klips.firstIndex(where: { $0.id == id }) else {
            return
        }

        klips.remove(at: klipToRemoveIndex)
        saveKlips(klips)
    }
    
    func updateKlip(_ klipToUpdate: Klip) {
        var klips = getKlips()

        guard let klipToUpdateIndex = klips.firstIndex(where: { $0.id == klipToUpdate.id }) else {
            return
        }

        klips[klipToUpdateIndex] = KlipDTO(id: klipToUpdate.id, value: klipToUpdate.value)
        saveKlips(klips)
    }

    // MARK: Private

    private let KLIPS_KEY = "KLIPS"

    private let userDefaults: UserDefaults
    private let jsonEncoder: JSONEncoder
    private let jsonDecoder: JSONDecoder

    private func saveKlips(_ klips: [KlipDTO]) {
        guard let data = try? jsonEncoder.encode(klips) else {
            return
        }

        userDefaults.set(data, forKey: KLIPS_KEY)
    }
}
