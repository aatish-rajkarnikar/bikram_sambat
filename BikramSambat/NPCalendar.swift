//
//  ViewController.swift
//  BikramSambat
//
//  Created by Aatish Rajkarnikar on 10/30/16.
//  Copyright © 2016 iOSHub. All rights reserved.
//

import UIKit

class NPCalendar: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!{
        didSet{
            collectionView.dataSource = self
            let layout = NPCalendarFlowLayout()
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            let itemWidth = UIScreen.main.bounds.width / 7
            layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
            collectionView.collectionViewLayout = layout
            collectionView.isPagingEnabled = true
        }
    }
    
    let numberOfDaysInNepaliMonth = [
        2000:[30,32,31,32,31,30,30,30,29,30,29,31],
        2001:[31,31,32,31,31,31,30,29,30,29,30,30],
        2002:[31,31,32,32,31,30,30,29,30,29,30,30],
        2003:[31,32,31,32,31,30,30,30,29,29,30,31],
        2004:[30,32,31,32,31,30,30,30,29,30,29,31],
        2005:[31,31,32,31,31,31,30,29,30,29,30,30],
        2006:[31,31,32,32,31,30,30,29,30,29,30,30],
        2007:[31,32,31,32,31,30,30,30,29,29,30,31],
        2008:[31,31,31,32,31,31,29,30,30,29,29,31],
        2009:[31,31,32,31,31,31,30,29,30,29,30,30],
        2010:[31,31,32,32,31,30,30,29,30,29,30,30],
        2011:[31,32,31,32,31,30,30,30,29,29,30,31],
        2012:[31,31,31,32,31,31,29,30,30,29,30,30],
        2013:[31,31,32,31,31,31,30,29,30,29,30,30],
        2014:[31,31,32,32,31,30,30,29,30,29,30,30],
        2015:[31,32,31,32,31,30,30,30,29,29,30,31],
        2016:[31,31,31,32,31,31,29,30,30,29,30,30],
        2017:[31,31,32,31,31,31,30,29,30,29,30,30],
        2018:[31,32,31,32,31,30,30,29,30,29,30,30],
        2019:[31,32,31,32,31,30,30,30,29,30,29,31],
        2020:[31,31,31,32,31,31,30,29,30,29,30,30],
        2021:[31,31,32,31,31,31,30,29,30,29,30,30],
        2022:[31,32,31,32,31,30,30,30,29,29,30,30],
        2023:[31,32,31,32,31,30,30,30,29,30,29,31],
        2024:[31,31,31,32,31,31,30,29,30,29,30,30],
        2025:[31,31,32,31,31,31,30,29,30,29,30,30],
        2026:[31,32,31,32,31,30,30,30,29,29,30,31],
        2027:[30,32,31,32,31,30,30,30,29,30,29,31],
        2028:[31,31,32,31,31,31,30,29,30,29,30,30],
        2029:[31,31,32,31,32,30,30,29,30,29,30,30],
        2030:[31,32,31,32,31,30,30,30,29,29,30,31],
        2031:[30,32,31,32,31,30,30,30,29,30,29,31],
        2032:[31,31,32,31,31,31,30,29,30,29,30,30],
        2033:[31,31,32,32,31,30,30,29,30,29,30,30],
        2034:[31,32,31,32,31,30,30,30,29,29,30,31],
        2035:[30,32,31,32,31,31,29,30,30,29,29,31],
        2036:[31,31,32,31,31,31,30,29,30,29,30,30],
        2037:[31,31,32,32,31,30,30,29,30,29,30,30],
        2038:[31,32,31,32,31,30,30,30,29,29,30,31],
        2039:[31,31,31,32,31,31,29,30,30,29,30,30],
        2040:[31,31,32,31,31,31,30,29,30,29,30,30],
        2041:[31,31,32,32,31,30,30,29,30,29,30,30],
        2042:[31,32,31,32,31,30,30,30,29,29,30,31],
        2043:[31,31,31,32,31,31,29,30,30,29,30,30],
        2044:[31,31,32,31,31,31,30,29,30,29,30,30],
        2045:[31,32,31,32,31,30,30,29,30,29,30,30],
        2046:[31,32,31,32,31,30,30,30,29,29,30,31],
        2047:[31,31,31,32,31,31,30,29,30,29,30,30],
        2048:[31,31,32,31,31,31,30,29,30,29,30,30],
        2049:[31,32,31,32,31,30,30,30,29,29,30,30],
        2050:[31,32,31,32,31,30,30,30,29,30,29,31],
        2051:[31,31,31,32,31,31,30,29,30,29,30,30],
        2052:[31,31,32,31,31,31,30,29,30,29,30,30],
        2053:[31,32,31,32,31,30,30,30,29,29,30,30],
        2054:[31,32,31,32,31,30,30,30,29,30,29,31],
        2055:[31,31,32,31,31,31,30,29,30,29,30,30],
        2056:[31,31,32,31,32,30,30,29,30,29,30,30],
        2057:[31,32,31,32,31,30,30,30,29,29,30,31],
        2058:[30,32,31,32,31,30,30,30,29,30,29,31],
        2059:[31,31,32,31,31,31,30,29,30,29,30,30],
        2060:[31,31,32,32,31,30,30,29,30,29,30,30],
        2061:[31,32,31,32,31,30,30,30,29,29,30,31],
        2062:[30,32,31,32,31,31,29,30,29,30,29,31],
        2063:[31,31,32,31,31,31,30,29,30,29,30,30],
        2064:[31,31,32,32,31,30,30,29,30,29,30,30],
        2065:[31,32,31,32,31,30,30,30,29,29,30,31],
        2066:[31,31,31,32,31,31,29,30,30,29,29,31],
        2067:[31,31,32,31,31,31,30,29,30,29,30,30],
        2068:[31,31,32,32,31,30,30,29,30,29,30,30],
        2069:[31,32,31,32,31,30,30,30,29,29,30,31],
        2070:[31,31,31,32,31,31,29,30,30,29,30,30],
        2071:[31,31,32,31,31,31,30,29,30,29,30,30],
        2072:[31,32,31,32,31,30,30,29,30,29,30,30],
        2073:[31,32,31,32,31,30,30,30,29,29,30,31],
        2074:[31,31,31,32,31,31,30,29,30,29,30,30],
        2075:[31,31,32,31,31,31,30,29,30,29,30,30],
        2076:[31,32,31,32,31,30,30,30,29,29,30,30],
        2077:[31,32,31,32,31,30,30,30,29,30,29,31],
        2078:[31,31,31,32,31,31,30,29,30,29,30,30],
        2079:[31,31,32,31,31,31,30,29,30,29,30,30],
        2080:[31,32,31,32,31,30,30,30,29,29,30,30],
        2081:[31,31,32,32,31,30,30,30,29,30,30,30],
        2082:[30,32,31,32,31,30,30,30,29,30,30,30],
        2083:[31,31,32,31,31,30,30,30,29,30,30,30],
        2084:[31,31,32,31,31,30,30,30,29,30,30,30],
        2085:[31,32,31,32,30,31,30,30,29,30,30,30],
        2086:[30,32,31,32,31,30,30,30,29,30,30,30],
        2087:[31,31,32,31,31,31,30,30,29,30,30,30],
        2088:[30,31,32,32,30,31,30,30,29,30,30,30],
        2089:[30,32,31,32,31,30,30,30,29,30,30,30],
        2090:[30,32,31,32,31,30,30,30,29,30,30,30]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(getCurrentMonth())
    }
    
    func convertADToBS(date:Date)->NPDate{
        var nepaliYear = 2000
        var nepaliMonth = 9
        var nepaliDay = 17
        var weekDay = 7
        let calendar = Calendar(identifier: .gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let initialEnglishDate = dateFormatter.date(from: "1944-01-01")
        
        var interval = DateComponents()
        interval.day = 1
        
        var numberOfDays = date.days(from: initialEnglishDate!)
        var gregorianDate = initialEnglishDate!
        while numberOfDays != 0 {
            gregorianDate = calendar.date(byAdding: interval, to: gregorianDate)!
            let daysInMonth = numberOfDaysInNepaliMonth[nepaliYear]![nepaliMonth - 1]
            nepaliDay = nepaliDay + 1
            if nepaliDay > daysInMonth {
                nepaliMonth = nepaliMonth + 1
                nepaliDay = 1
            }
            if nepaliMonth > 12 {
                nepaliYear = nepaliYear + 1
                nepaliMonth = 1
            }
            
            weekDay = weekDay + 1
            if weekDay > 7 {
                weekDay = 1
            }
            
            numberOfDays = numberOfDays - 1
        }
        return NPDate(day: nepaliDay, month: nepaliMonth, year: nepaliYear, weekDay: Weekday(rawValue:weekDay)! , gregorianDate: gregorianDate)
    }
    
    func getCurrentMonth()->[NPDate]{
        var dates = [NPDate]()
        let currentDate = convertADToBS(date: Date())
        let calendar = Calendar(identifier: .gregorian)
        let day1 = calendar.date(byAdding: .day, value: -currentDate.day, to: currentDate.gregorianDate)
        var weekday = calendar.component(.weekday, from: day1!)
        guard let numberOfDays = numberOfDaysInNepaliMonth[currentDate.year]?[currentDate.month - 1] else{return dates}
        for i in 1...numberOfDays {
            let gregorianDate = calendar.date(byAdding: .day, value: i, to: day1!)
            let weekday = calendar.component(.weekday, from: gregorianDate!)
            let date = NPDate(day: i, month: currentDate.month, year: currentDate.year, weekDay: Weekday(rawValue: weekday)!, gregorianDate: gregorianDate!)
            dates.append(date)
        }
        return dates
    }

}

extension NPCalendar:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var year:Int = section/12
        year = 2000 + year
        return self.numberOfDaysInNepaliMonth[year]![section%12]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.numberOfDaysInNepaliMonth.count * 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NPCalendarCell
        cell.dateLabel.text = String(indexPath.row + 1)
        return cell
    }
}

class NPCalendarCell:UICollectionViewCell{
    @IBOutlet weak var dateLabel:UILabel!
}

extension Date{
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}

