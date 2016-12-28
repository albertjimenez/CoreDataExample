//
//  ViewController.swift
//  Core Data Fun
//
//  Created by Albert Jiménez Fuentes on 28/12/16.
//  Copyright © 2016 es.uji. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    
    let entityCD = "Users"
    let usernameCD = "username"
    let passwordCD = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = getContext()
        
        //saveContext(appDelegate: appDelegate, context: context)
        
        //loadContext(context: context)
        
        
    }
    
    func getContext () -> NSManagedObjectContext {
        //ONLY iOS 10
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    
    func saveContext(appDelegate : AppDelegate, context : NSManagedObjectContext) -> Void {
        //SAVING METHOD
        //
        let newUser = NSEntityDescription.insertNewObject(forEntityName: entityCD, into: context)
        
        newUser.setValue("Nuria", forKey: usernameCD)
        newUser.setValue("Nuria123", forKey: passwordCD)
        
        do {
            try
                context.save()
            print("SAVED SUCCESSFULLY")
        }
        catch {
            print("Error saving Core Data")
        }
        
        
    }
    
    func loadContext(context : NSManagedObjectContext) -> Void {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityCD)
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let userName = result.value(forKey: usernameCD) as? String , let passwd = result.value(forKey: passwordCD) as? String {
                        
                        print("Username: " + userName + " Password: " + passwd)
                        
                    }
                }
            }
            
            
        } catch  {
            print("Error loading data")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

