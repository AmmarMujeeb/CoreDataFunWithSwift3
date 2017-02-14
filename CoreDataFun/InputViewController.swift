//
//  InputViewController.swift
//  CoreDataFun
//
//  Created by Ammar Mujeeb on 2/9/17.
//  Copyright © 2017 Ammar Mujeeb. All rights reserved.
//

import UIKit
import CoreData
class InputViewController: UIViewController {

    @IBOutlet var nameTxt: UITextField!
    @IBOutlet var emailTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddRecord(_ sender: Any) {
        let appd = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let mycontext = appd.persistentContainer.viewContext
            //retrieve the entity that we just created
            let entity =  NSEntityDescription.entity(forEntityName: "Users", in: mycontext)
            
            let transc = NSManagedObject(entity: entity!, insertInto: mycontext)
            //let User = NSEntityDescription.entity(forEntityName: "Users", in: mycontext)
        transc.setValue(nameTxt.text, forKey: "name")
        transc.setValue(emailTxt.text, forKey: "email")
            do {
            try mycontext.save()
            print("SAVED")
        } catch {
            print("Error Saving Record")
        }
        
        } else {
            // Fallback on earlier versions
        }
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
