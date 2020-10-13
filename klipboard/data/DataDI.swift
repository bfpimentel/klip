//
//  DataDI.swift
//  klipboard
//
//  Created by Bruno Pimentel on 13/10/20.
//

import Foundation

final class DataDI {
    
    private static var userDefauts: UserDefaults {
        return UserDefaults(suiteName: "dev.pimentel.klip")!
    }
    
    private static var jsonEncoder = JSONEncoder()
    private static var jsonDecoder = JSONDecoder()
    
    static var klipsRepository: KlipsRepository {
        return KlipsRepositoryImpl(klipsLocalDataSource: klipsLocalDataSource)
    }
    
    private static var klipsLocalDataSource: KlipsLocalDataSource {
        return KlipsLocalDataSource(userDefaults: userDefauts,
                                    jsonEncoder: jsonEncoder,
                                    jsonDecoder: jsonDecoder)
    }
    
    private init() {
    }
}
