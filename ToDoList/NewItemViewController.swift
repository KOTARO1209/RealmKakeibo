//
//  NewItemViewController.swift
//  RealmKakeibo
//
//  Created by まちだこうたろう on 2023/02/08.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!

    let realm = try! Realm()
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save( ) {
        let item = ShoppingItem()
        item.title = titleTextField.text ?? ""
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.isMarked = markSwitch.isOn
        //item.category = category
        createItem(item: item)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ItemViewController
        
        self.dismiss(animated: true)
    }
    
    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
