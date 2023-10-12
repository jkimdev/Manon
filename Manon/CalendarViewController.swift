//
//  CalendarViewController.swift
//  Manon
//
//  Created by Jimmy on 2023/10/12.
//

import UIKit

class CalendarViewController: UIViewController {
    var selectedDate: DateComponents?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }

    let dateView: UICalendarView = {
        var view = UICalendarView()
        view.availableDateRange = DateInterval(start: .now, end: .distantFuture)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.wantsDateDecorations = true

        return view
    }()

    func setCalendar() {
        dateView.delegate = self
        let dateSelection = UICalendarSelectionMultiDate(delegate: self)
        dateView.selectionBehavior = dateSelection
    }

    func reloadDateView(date: Date?) {
        guard let date = date else { return }
        let calendar = Calendar.current
        dateView.reloadDecorations(forDateComponents: [calendar.dateComponents([.day, .month, .year], from: date)], animated: true)
    }

    func showSheet() {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                context.maximumDetentValue * 0.3
            }), .large()]
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
        }

        present(vc, animated: true)
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

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionMultiDateDelegate {
//    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//        print(selectedDate)
//        print(dateComponents)
//        if let selectedDate = selectedDate, selectedDate == dateComponents {
    ////            return .customView {
    ////                let label = UILabel()
    ////                label.text = "🐶"
    ////                label.textAlignment = .center
    ////                return label
    ////            }
//            presentActionSheet()
//        }
//        return nil
//    }

    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
        guard let temp = selection.selectedDates.last else { return }
        selectedDate = temp
        selection.selectedDates = [temp]
        reloadDateView(date: Calendar.current.date(from: temp))
        showSheet()
    }

    func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
        selection.selectedDates = [dateComponents]
        showSheet()
    }
}
