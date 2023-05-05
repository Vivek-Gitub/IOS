//
//  LocalPushNotificationViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 02/05/23.
//

import UIKit

import UserNotifications

class LocalPushNotificationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkNotification()
        
        // Do any additional setup after loading the view.
    }
    
    // function of Check for notification Permisiion are we allowed to send notification or not
    func checkNotification()
    {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus{
            case .authorized:
                self.dispatchNotification() // here if user allow then dispatchNotification() function call
            case .denied:
                print("User Denied your notification Request")
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]){ didallow, error in // {} -> this is completion handler
                    if didallow{
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
        
    }
    
    //Function for send notification
    
    func dispatchNotification(){
        
        let identifier = "my-morning-notifiction"
        let titleNotification = "time to work out "
        let bodyNotification = "Don.t be lazy Get up for workout"
        let hoursNotification = 12
        let minuteNotification = 49
        let isDailyremainder = true
        
        let notificationCenetr = UNUserNotificationCenter.current()
        
        let contentOfnotification = UNMutableNotificationContent()
        contentOfnotification.title = titleNotification
        contentOfnotification.body = bodyNotification
        contentOfnotification.sound = .default
        
        let calender = Calendar.current
        print(calender)
        var dateComponent = DateComponents(calendar: calender, timeZone: TimeZone.current)
        dateComponent.hour = hoursNotification
        dateComponent.minute = minuteNotification
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDailyremainder)
        
        let request = UNNotificationRequest(identifier: identifier, content: contentOfnotification, trigger: trigger)
        
        notificationCenetr.removePendingNotificationRequests(withIdentifiers: [identifier]) // here we remove your previous notification reqest
        notificationCenetr.add(request)
    }
}
