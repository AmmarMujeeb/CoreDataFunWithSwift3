//
//  ViewController.swift
//  CoreDataFun
//
//  Created by Ammar Mujeeb on 2/7/17.
//  Copyright © 2017 Ammar Mujeeb. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var results:[NSManagedObject] = [] //var results:[NSManagedObject] = [] //Both correct //var results:[NSManagedObject] also fine in method
override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
        fetch();
    }
    
    func fetch(){
        print("fetch")
        let appdel = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let context = appdel.persistentContainer.viewContext
            //        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
            let trans:NSFetchRequest<Users> = NSFetchRequest(entityName: "Users")
            do {
                self.results = try context.fetch(trans)
                print("Results count = \(results.count)")
            } catch  {
                print("Error")
            }

        } else {
            // Fallback on earlier versions
        }
    }
    
    @IBAction func btnTap(_ sender: Any) {
        print("btn Tapped");
       /* 
        let appdel = UIApplication.shared.delegate as! AppDelegate
        let context = appdel.persistentContainer.viewContext
        let newUser = NSEntityDesctiption
        */
 
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let trans:NSManagedObject = results[indexPath.row]
//        let ent:NSEntityDescription = trans.entity
        cell.textLabel?.text = "\(trans.value(forKey: "email")!)"
        return cell
    }
    
}
