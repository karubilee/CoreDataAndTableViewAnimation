//
//  ViewController.swift
//  CoreDataAndTableViewAnimation
//
//  Created by lb. on 2018/2/24.
//  Copyright © 2018年 karubi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entityName = "Student"
        let oneStudent = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Student
        oneStudent.name = "Liweibin"
        oneStudent.id = 629
        oneStudent.age = 28
        oneStudent.isMale = true
        app.saveContext()
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.fetchLimit = 10
        fetchRequest.fetchOffset = 0
        
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        fetchRequest.entity = entity
        
//        let predicate = NSPredicate.init(format: "name = 'nnn'", "")
//        fetchRequest.predicate = predicate
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as! [Student]
            for one: Student in fetchedObjects {
                print(one.name)
            }
        } catch {
            let error = error as NSError
            fatalError("查询错误： \(error), \(error.userInfo)")
        }
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func deleteLastOne(_ sender: Any) {
    }
    
    @IBAction func editClick(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "justCell") as! JustTableViewCell
        
        return  cell
    }
}

