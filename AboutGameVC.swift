//
//  AboutGameVC.swift
//  HardcoreTap
//
//  Created by Богдан Быстрицкий on 24/11/2017.
//  Copyright © 2017 Bogdan Bystritskiy. All rights reserved.
//

import UIKit

class AboutGameVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var aboutGameLabel: UILabel!
  
   var sectionTitles = ["About GitHub"]
   var sectionContent = ["Repository on GitHub", "Feedback problem"]

//  var sectionTitles = ["Расскажите о нас", "Мы на GitHub"]
//  var sectionContent = [["Оцените приложение на App Store", "Репозиторий на GitHub"],
//                        ["Dunaev Sergey", "Bystritskiy Bogdan", "Anpleenko Pavel"]]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.view.backgroundColor = .clear
    view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    aboutGameLabel.text = "Catch the rhythm! Do not kill time just like that. Kill time with benefit. Click Precise is an excellent training of mindfulness, patience, a sense of rhythm and perseverance. Rise to the top of the rating of tappers. Press the screen at intervals of one second. The accuracy is up to hundredths. With the increase in the level of the game will be to you all stricter. Do you think this is so simple? Try it."
  }
  
}

extension AboutGameVC {
  
  //изменения цвета и шрифта в заголовках секции
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    let header = view as? UITableViewHeaderFooterView
    header?.textLabel?.font = UIFont(name: "OpenSans-Regular", size: 10)
    header?.textLabel?.textColor = UIColor(hue: 0.24, saturation: 0.75, brightness: 0.89, alpha: 1.00)
    header?.backgroundView?.backgroundColor = UIColor(hue: 0.24, saturation: 0.75, brightness: 0.89, alpha: 0.1)
  }
  
  // MARK: - Table view data source
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionTitles.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sectionContent.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection
    section: Int) -> String? {
    return sectionTitles[section]
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = sectionContent[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 0 :
        link(link: "https://github.com/summit1206/ClickPrecise")
      case 1 :
        link(link: "https://github.com/summit1206/ClickPrecise/issues")
      default:
        break
      }
//    case 1:
//      switch indexPath.row {
//      case 0:
//        link(link: "https://github.com/Dunaev")
//      case 1:
//        link(link: "https://github.com/bystritskiy")
//      case 2:
//        link(link: "https://github.com/allakin")
//      default:
//        break
//      }
    default:
      break
    }
    tableView.deselectRow(at: indexPath, animated: false)
  }
  
  func link(link: String) {
    if let url = URL(string: link) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            // Fallback on earlier versions
        }
    }
  }
  
}
