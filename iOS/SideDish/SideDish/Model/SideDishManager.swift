//
//  SideDishManager.swift
//  SideDish
//
//  Created by 신한섭 on 2020/04/22.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class SideDishManager {
    private var sideDish: [[SideDishInfo]]
    private var sections: [Section] = []
    
    init() {
        sideDish = [[SideDishInfo]]()
        for _ in 0..<3 {
            sideDish.append([SideDishInfo]())
        }
    }
    
    func insert(into section: Int, rows: [SideDishInfo]) {
        sideDish[section] = rows
        NotificationCenter.default.post(name: .ModelInserted,
                                        object: nil,
                                        userInfo: ["index" : section])
    }
    
    func insertSection(sections: [Section]) {
        self.sections = sections
        NotificationCenter.default.post(name: .SectionInserted,
                                        object: nil)
    }
    
    func sectionName(at index: Int) -> String{
        return sections[index].title
    }
    
    func sectionDescription(at index: Int) -> String {
        return sections[index].info
    }
    
    func sectionCount() -> Int {
        return sections.count
    }
    
    func sideDish(indexPath: IndexPath) -> SideDishInfo {
        return sideDish[indexPath.section][indexPath.row]
    }
    
    func numOfRows(at section: Int) -> Int {
        return sideDish[section].count
    }
}

extension Notification.Name {
    static let ModelInserted = Notification.Name("ModelInserted")
    static let SectionInserted = Notification.Name("SectionInserted")
}
