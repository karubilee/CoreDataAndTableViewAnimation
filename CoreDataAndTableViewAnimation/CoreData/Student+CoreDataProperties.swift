//
//  Student+CoreDataProperties.swift
//  CoreDataAndTableViewAnimation
//
//  Created by lb. on 2018/2/24.
//  Copyright © 2018年 karubi. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var age: Int64
    @NSManaged public var isMale: Bool

}
