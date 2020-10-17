//
//  DataDI.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

enum DataDI {

    // MARK: Internal

    static var klipsRepository: KlipsRepository {
        KlipsRepositoryImpl(klipsLocalDataSource: klipsLocalDataSource)
    }

    // MARK: Private

    private static var jsonEncoder = JSONEncoder()
    private static var jsonDecoder = JSONDecoder()


    private static var userDefauts: UserDefaults {
        UserDefaults(suiteName: "dev.pimentel.klip") ?? .standard
    }

    private static var klipsLocalDataSource: KlipsLocalDataSource {
        KlipsLocalDataSource(
            userDefaults: userDefauts,
            jsonEncoder: jsonEncoder,
            jsonDecoder: jsonDecoder
        )
    }

}
