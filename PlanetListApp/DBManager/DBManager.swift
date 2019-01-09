//
//  DBManager.swift
//  PlanetListApp
//
//  Created by iSparshiT on 09/01/19.
//  Copyright © 2019 Samarjeet. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class DBManager : NSObject {
    
    static let sharedInstance = DBManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlanetListApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
            }
        }
    }
    
    //Mark: - Save Method Planet Names in CoreData
    func savePlanetData(planets:[Result]){
        
        for item in planets {
            
            let context = persistentContainer.viewContext
            
            let task = Planet(context: context)
            task.name = item.name
            task.orbitalPeriod = item.orbital_period
            task.rotationPeriod = item.orbital_period
            
            
            do {
                try context.save()
            } catch {
                
            }
        }
        
    }
    //Mark: - Fetch Method Planet NamesFrom CoreData
    func getPlanetData() -> [Result]{
    
       var allPlanet = [Result]()
        
        let context = persistentContainer.viewContext
        
        let fRequest:NSFetchRequest<Planet> = Planet.fetchRequest()
        
        do {
            let records = try context.fetch(fRequest)
            records.forEach { (planet) in
                var item = Result()
                item.name = planet.name
                item.orbital_period = planet.orbitalPeriod
                item.rotation_period = planet.rotationPeriod
                
                allPlanet.append(item)
            }
            
        } catch {
            
        }
        
        return allPlanet
    }
    
}
