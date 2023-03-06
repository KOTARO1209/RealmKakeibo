//
//  Test.swift
//  ToDoList
//
//  Created by まちだこうたろう on 2023/03/06.
//

import Foundation
import RealmSwift

public class DatabaseManager {

    static var realm: Realm {
        get {
            do {
                let realm = try Realm()
                return realm
            }
            catch {
                //NSLog("Could not access database: ", error)
                print(error)
            }
            return self.realm
        }
    }

    public static func write(realm: Realm, writeClosure: () -> ()) {
        do {
            try realm.write {
                writeClosure()
            }
        } catch {
            //NSLog("Could not write to database: ", error)
            print(error)
        }
    }
}
