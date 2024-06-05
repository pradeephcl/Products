//
//  SwiftDataStorage.swift
//  LululemonAssessment
//
//  Created by Pradeep Kumar on 10/04/24.
//

import Foundation
import SwiftData

final class SwiftDataStorage {
    private let sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            //TODO: Log to Crashlytics
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    private let modelContext: ModelContext

    @MainActor
    static let shared = SwiftDataStorage()

    @MainActor
    private init() {
        self.modelContext = sharedModelContainer.mainContext
    }
    
    func saveContext() {
        if modelContext.hasChanges {
            do {
                try modelContext.save()
            } catch {
                // TODO: - Log to Crashlytics
                fatalError(error.localizedDescription)
            }
        }
    }
    
    func isRecordExistFor(username: String) -> Bool{
        do {
            return try modelContext.fetch(FetchDescriptor<Product>(predicate: #Predicate { product in
                product.username == username
            })).count > 0
        } catch {
            // TODO: - Log to Crashlytics
            fatalError(error.localizedDescription)
        }
        
    }
    
    func deleteRecordsFor(username: String) {
        do {
            try modelContext.delete(model: Product.self, where: #Predicate { item in
                item.username == username
            })
            saveContext()
        } catch {
            // TODO: - Log to Crashlytics
            fatalError(error.localizedDescription)
        }
    }
    
    func insertRecords(products: [Product]) {
        products.forEach { product in
            modelContext.insert(product)
        }
        saveContext()
    }
    
    func fetchItems(userName: String, sortDescriptor: SortDescriptor<Product>) -> [Product] {
        do {
            return try modelContext.fetch(FetchDescriptor<Product>(predicate: #Predicate { item in
                item.username == userName
            }, sortBy: [sortDescriptor]))
        } catch {
            // TODO: - Log to Crashlytics
            fatalError(error.localizedDescription)
        }
    }
}
