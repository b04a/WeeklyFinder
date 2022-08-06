//  ViewController.swift
//  WeeklyFinder
//  Created by Danil Bochkarev on 05.08.2022.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var MonthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    

    
    @IBAction func findDate(_ sender: UIButton) {
        guard let day = dateTF.text, let month = MonthTF.text, let year = yearTF.text else { return }

        //календарь
        let calendar = Calendar.current
        var dateComponents = DateComponents()

        //собираем даты
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
      
        //объект для даты + формат + индификатор для русского вывода
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"

        //вставляем в стрик и константу weekday
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekday = dateFormatter.string(from: date)
      
        //Делаем первую буквы заглавную
        let cWeekday = weekday.capitalized
        resultLabel.text = cWeekday
    }

    

    //при написании текста можно было убрать клавиатуру
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
