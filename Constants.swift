import Foundation
import UIKit
enum LapType: String {
    case Lap = "Lap"
    case Mile = "Mile"
    case Kilometer = "Km"
    var description: String {
        get {
            return self.rawValue
        }
    }
}
let kMetricPaceKey = "metricPaceUnitsKey"
let kMetricDistanceKey = "metricDistanceUnitsKey"
let kDidLaunchBeforeKey = "didLaunchBefore"
struct Storyboard {
    struct Pace {
        static let Row    = 0          
        static let CellID = "paceCell" 
        static let Tag    = 1          
        struct UnitLabel {
            static let Imperial = "min/mi"
            static let Metric = "min/km"
        }
        struct Picker {
            static let CellID          = "pacePickerCell" 
            static let Key             = "pace"           
            static let Tag             = 20               
            static let MinuteComponent = 0
            static let SecondComponent = 1
        }
    }
    struct Duration {
        static let Row    = 1              
        static let CellID = "durationCell" 
        static let Tag    = 2          
        struct Picker {
            static let CellID          = "durationPickerCell" 
            static let Key             = "duration"           
            static let Tag             = 30                   
            static let HourComponent   = 0
            static let MinuteComponent = 1
            static let SecondComponent = 2
        }
    }
    struct Distance {
        static let Row    = 2              
        static let CellID = "distanceCell" 
        static let Tag = 10                
        static let Key = "distance"        
        static let Rounding = 10.0           
        struct UnitLabel {
            static let Imperial = "mi"
            static let Metric = "km"
        }
    }
    static let RowHeight: CGFloat = 55.0
    static let PickerComponentWidth = CGFloat(100.0)              
    static let PickerStaticLabelPadding = CGFloat(30.0)           
    static let PickerDefaultSpaceBetweenComponents = CGFloat(4.0) 
    static let SettingsSegue = "settingsSegue"  
}
struct DurationTimeFormat {
    var Hours:   Int = 0
    var Minutes: Int = 0
    var Seconds: Int = 0
    var TotalSeconds: Int {
        get {
            return ((Hours * 3600) + (Minutes * 60) + Seconds)
        }
        set
        {
            var total = newValue
            Hours = total / 3600
            total = total - (Hours * 3600)
            Minutes = total / 60
            total = total - (Minutes * 60)
            Seconds = total
        }
    }
    var Print: String {
        get {
            return description()
        }
    }
    func description() -> String {
        var minFormatted = Minutes.description
        var secFormatted = Seconds.description
        if Minutes < 10 { minFormatted = "0\(minFormatted)" }
        if Seconds < 10 { secFormatted = "0\(secFormatted)" }
        return "\(Hours):\(minFormatted):\(secFormatted)"
    }
}
struct PaceTimeFormat {
    var Minutes: Int = 0
    var Seconds: Int = 0
    var TotalSeconds: Int {
        get {
            return ((Minutes * 60) + Seconds)
        }
        set
            {
                var total = newValue
                Minutes = total / 60
                total = total - (Minutes * 60)
                Seconds = total
        }
    }
    var Print: String {
        get {
            return description()
        }
    }
    func description() -> String {
        var secFormatted = Seconds.description
        if Seconds < 10 { secFormatted = "0\(secFormatted)" }
        return "\(Minutes):\(secFormatted)"
    }
}
struct Increment {
    static let Points = 50
    static let Seconds = 300
}
struct Colors {
    static let Tint: UIColor = UIColor(red: CGFloat(57.0/255.0), green: CGFloat(149.0/255.0), blue: CGFloat(148.0/255.0), alpha: CGFloat(1.0)) 
    static let DarkTint: UIColor = UIColor(red: CGFloat(58.0/255.0), green: CGFloat(51.0/255.0), blue: CGFloat(53.0/255.0), alpha: CGFloat(1.0)) 
}
let REALM_QUEUE = DispatchQueue(label: "realmQueue")
let REALM_RUN_CONFIG = "realmRunConfig"
