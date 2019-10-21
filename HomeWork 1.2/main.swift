//
//  main.swift
//  HomeWork 1.2
//
//  Created by Владимир Воронов on 10/20/19.
//  Copyright © 2019 Vladimir Oleinikov. All rights reserved.
//

import Foundation

var choise:Int?
let months = [31, 28, 31, 30, 31, 30, 31, 30, 31, 30, 31, 30]

func pr_full_help(a: inout Int? ) {
    print("""
        Если у работника 1 января была дневная смена,введите 1;
        Если у работника 1 января была ночная смена,введите 2;
        Для завершения работы программнажмите 3;
    """)
    
    a = Int(readLine()!)
}

func pr_short_help (a: inout Int?) {
    print("Выберите смену, либо введите 3 для завершеия работы")
    a = Int(readLine()!)
}

func witch_change (day: Int?, month: Int?) -> String {
        
    guard day != nil || month != nil else {
        return "День и дата некорртектны"
    }
    guard day! <= 31 && day! >= 1 && month! <= 12 && month! >= 1 else {
        return "День и дата некорректны"
    }
    
    var days = 0
    for index in stride(from: 2, to: month!, by: +1) {
        days += months[index]
    }
    days += day!
    days = days % 4
    
    switch days {
    case 1:
        if choise == 1 {
            return "Дневная смена"}
        else {
            return "Ночная смена"
        }
    case 2:
        if choise == 1 {
            return "Выходной"}
        else {
            return "Выходгой"
            }
    case 3:
        if choise == 1 {
            return "Ночная смена"}
        else {
            return "Выходной"
            }
    case 4:
        if choise == 1 {
            return "Выходной"}
        else {
            return "Дневная Смена"
        }
    default:
        return "Oops!"
    }
}

pr_full_help(a: &choise)

while choise != 3  {
     if choise != nil {
        
        switch choise! {
        case 1:
            print("Выбрана дневная смена.")
            print("Введите день, затем месяц")
            
            print(witch_change(day: Int(readLine()!), month: Int(readLine()!)))
            
            pr_short_help(a: &choise)
        case 2:
            print("Выбрана ночная смена")
            print("Введите день, затем месяц")
            
            
            pr_short_help(a: &choise)
        default :
            print("Вам следует ввести данные еще раз")
            pr_full_help(a: &choise)
        }
    }
     else {
        print("Вам следует ввести данные еще раз")
        pr_full_help(a: &choise)
        
    }
}



