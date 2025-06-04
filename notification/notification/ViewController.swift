//
//  ViewController.swift
//  notification
//
//  Created by HTS-MAC on 26/02/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    
    @IBOutlet weak var Notes: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextView!
    
    var latestnotification : String = ""
    
        // Outlets for UI element
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Request notification permission
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    print("Notification permission granted.")
                } else {
                    print("Notification permission denied.")
                }
            }
        }

        // Action for the "Schedule Reminder" button
    @IBAction func scheduleReminder(_ sender: Any) {
        guard let reminderTitle = titleTextField.text, !reminderTitle.isEmpty else {
            showAlert(message: "Please enter a reminder title.")
            return
        }
        guard let remindernotes = Notes.text, !remindernotes.isEmpty else {
            showAlert(message: "Please enter notes.")
            return
        }
        // Get the selected date and time from the date picker
        let reminderDate = datePicker.date

        // Schedule the notification
        scheduleNotification(title: reminderTitle, date: reminderDate, notes: remindernotes)
        print(reminderTitle)
        let vc = mainViewController()
        vc.olderNotifications = reminderTitle
        
    }

        // Function to schedule the notification
    func scheduleNotification(title: String, date: Date, notes: String) {
            // Create the notification content
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = notes
            content.sound = .default

            // Create a trigger for the specified date and time
            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

            // Create a request
            let request = UNNotificationRequest(identifier: "reminderNotification", content: content, trigger: trigger)

            // Add the request to the notification center
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully for \(date).")
                    DispatchQueue.main.async {
                        self.showAlert(message: "Reminder scheduled for \(date).")
                    }
                }
            }
        }

        // Helper function to show an alert
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Reminder", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    @IBAction func backbt(_ sender: Any) {
        print(latestnotification)
        
        let nextVC = mainViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
}

