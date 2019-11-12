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
    @State private var staffDept = 0
    
    let inStaffDept = ["HR", "ITG","CORP"]
    
    var yearsOfSrvice = [1,2,3,4,5,6,7,8,9,10,11]
    
    //Get the value of the Picker
    var  bonusCal: Double {
        let totalYrOfService = Double(yrOfService)
        let totalStaffSal = Double(staffSal) ?? 0
        var bonusShare = 0.0
        
        //Calc value
        let yrSalaryAllocate = totalStaffSal / 12
    
        
    
        
        if (inStaffDept[0] == "HR") && (totalYrOfService > 0 && totalYrOfService < 6) {
            
            bonusShare = 500.00
            
            return bonusShare + yrSalaryAllocate
            
            
        } else if (inStaffDept[1] == "ITG") && (totalYrOfService >= 6 && totalYrOfService <= 9){
            
            bonusShare = 750.00
            
            return bonusShare + yrSalaryAllocate
            
        } else if (inStaffDept[2] == "CORP") && (totalYrOfService > 9) {
        
            bonusShare = 1000.00
            
            return bonusShare + yrSalaryAllocate
    }
    
    
        //return yrSalaryAllocate
       return bonusShare
    }
        
    
    
    var body: some View {
    
        
        NavigationView {
        
        Form {
            
     
            
            
            Section { //Section 2
                
                Picker("Enter Year of Service",selection: $yrOfService) {
                       ForEach( 0 ..< yearsOfSrvice.count) { yrOfSrv in
                        
                        VStack {
                            Text("\(yrOfSrv) Years")
                        
                        }
                    
                           
                        
                           
                       }

                   }
            
            }
            
            
            Section(header: Text("Select your department")) { //Section 1
                     
                     Picker("Department", selection: $staffDept) {
                        
                         ForEach(0 ..< inStaffDept.count) {
                             
                             
                                Text("\(self.inStaffDept[$0])")
                             
                             
                             
                         }
                     }
                     .pickerStyle(SegmentedPickerStyle())
                     
                     
                 }
            
            
            
            
            
            
            
            
            
            
            Section { //Section 3
                
                
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
