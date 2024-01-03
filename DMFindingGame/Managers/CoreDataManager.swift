//
//  CoreDataManager.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/24/23.
//
import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Main")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    /**
     Add the passed score to CoreData.
     */
    func addScore(score: Int) {
           let context = persistentContainer.viewContext
          
           let newScore = Score(context: context)
           
           newScore.score = Int16(score)
           
           do{
               try context.save()
           } catch{
               print("Error saving context\(error)")
           }
       }
    
    /**
     Retrieve all the scores from CoreData.
     */
    func fetchScores() -> [Score] {
            let context = persistentContainer.viewContext
            let request: NSFetchRequest<Score> = Score.fetchRequest()
            
            let sortDescriptor = NSSortDescriptor(key: "score", ascending: false)
                request.sortDescriptors = [sortDescriptor]
            
            var returnArray: [Score] = []
            
            do{
            returnArray = try context.fetch(request)
            } catch{
                print("Error fetching context\(error)")
            }
            
            
            return returnArray
        }
    
    /**
     Calculate the high score.
     */
    func calculateHighScore() -> Int {
           let highScoreArr = fetchScores()
           
           let returnNum = highScoreArr.first?.score ?? 0
           
           return Int(returnNum)
       }
   }
