//
//  AppDelegate.swift
//  Banque Misr
//
//  Created by ihab saad on 31/12/2025.
//

import UIKit
import CoreData
import MOLH

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
   
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

        let viewDetailsAction = UNNotificationAction(
            identifier: "VIEW_DETAILS",
            title: "View Receipt 📄",
            options: .foreground
        )

        let okAction = UNNotificationAction(
            identifier: "CONFIRM_OK",
            title: "Got it! 👍",
            options: [])

        let commentAction = UNTextInputNotificationAction(
            identifier: "ADD_COMMENT",
            title: "Add Note 📝",
            options: [],
            textInputButtonTitle: "Save",
            textInputPlaceholder: "Write a note for this transaction...")

        let transferCategory = UNNotificationCategory(
            identifier: "TRANSACTION_SUCCESS_CATEGORY",
            actions: [viewDetailsAction, commentAction, okAction],
            intentIdentifiers: [],
            options: [])
        
        
        
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.delegate = self
        notificationCenter.setNotificationCategories([transferCategory])
        
        notificationCenter.requestAuthorization(options: [.alert,.badge,.sound]) { isGranted, error in
            if isGranted {
                        print(" User granted notification permissions.")
                    } else if let error = error {
                        print("Notification permission error: \(error.localizedDescription)")
                    }
        }
        

        
        UIView.appearance().semanticContentAttribute = .unspecified
        UIFont.fontSwizzling()
        
        MOLH.shared.activate(true)
        
        return true
        // Override point for customization after application launch.
     
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "ADD_COMMENT",
           let textResponse = response as? UNTextInputNotificationResponse {
            
            let userNote = textResponse.userText
            
            UserDefaults.standard.set(userNote, forKey: "latest_transaction_note")
            
            NotificationCenter.default.post(name: NSNotification.Name("ShowNote"), object: userNote)
        }
        
        completionHandler()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Banque_Misr")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

