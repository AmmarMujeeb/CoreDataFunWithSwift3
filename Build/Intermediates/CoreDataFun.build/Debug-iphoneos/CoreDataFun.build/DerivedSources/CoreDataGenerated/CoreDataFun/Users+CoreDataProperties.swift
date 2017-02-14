//
//  Users+CoreDataProperties.swift
//  
//
//  Created by Ammar Mujeeb on 2/10/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users");
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?

}
