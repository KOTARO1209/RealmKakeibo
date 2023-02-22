//
//  Category.swift
//  RealmKakeibo
//
//  Created by まちだこうたろう on 2023/02/08.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var title: String = ""
}
