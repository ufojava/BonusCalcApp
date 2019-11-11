//
//  ContentView.swift
//  BonusCalcApp
//
//  Created by Ufuoma Okoro on 11/11/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

/*
 This app is going to be a Company Bonus Calculator
 Staff Name
 Department
 Year of Service
 Salary
 */
 

import SwiftUI




struct ContentView: View {
    
    @State private var yrOfService = 0
    @State private var staffSal = ""
    
    var yearsOfSrvice = [1,2,3,4,5,6,7,8,9,10]
    
    //Get the value of the Picker
    var  bonusCal: Double {
        let totalYrOfService = Double(yrOfService)
        let totalStaffSal = Double(staffSal) ?? 0
        
        //Calc value
        let totalCalc = totalYrOfService * totalStaffSal
        
        return totalCalc
    }
        
    
    
    var body: some View {
    
        
        NavigationView {
        
        Form {
            
            Section { //Section 1
                
                Picker("Enter Year of Service",selection: $yrOfService) {
                       ForEach( 0 ..< yearsOfSrvice.count) { yrOfSrv in
                        
                           
                           Text("This is the number \(yrOfSrv)")
                        
                           
                       }

                   }
            
            }
            
            Section { //Section 2
                
                TextField("Enter Your salary",text: $staffSal)
            
                Text("Year of Service: \(yrOfService)")
                Text("Total bonus calc: £\(bonusCal, specifier: "%.2f")")
                
            }
            
            
            
            
            
            
            
        }
        .navigationBarTitle("Bonus Calc")
        }
       

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
