//
//  NewItemViewController.swift
//  RealmKakeibo
//
//  Created by まちだこうたろう on 2023/02/08.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet weak var Picker: UIDatePicker!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!

    let realm = try! Realm()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Realmへの保存をしている
    @IBAction func save( ) {
        let item = ShoppingItem()
        item.title = titleTextField.text ?? ""
        //item.price = priceTextField.text ?? ""
        item.contents = priceTextField.text ?? ""
        item.isMarked = markSwitch.isOn
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        item.date = dateFormatter.string(from: Picker.date)
        createItem(item: item)
        
        print(Picker.date)
        self.dismiss(animated: true)
    }
    
    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }

}
