//
//  ControlGroupBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 13.07.2024.
//

import SwiftUI

struct ControlGroupBootcamp: View {
    var body: some View {
        VStack(spacing: 30) {
            Menu("My Menu") {
                Menu("Three") {
                    Button("3.3") {
                        
                    }
                    
                    Button("3.2") {
                        
                    }
                    
                    Button("3.1") {
                        
                    }
                }
                
                Button("Two") {
                    
                }
                
                ControlGroup("One") {
                    Button("1.1") {
                        
                    }
                    
                    Button("1.2") {
                        
                    }
                    
                    Button("1.3") {
                        
                    }
                }
            }
            
            // Can be used seperatelly as well rather than with menu.
            ControlGroup("One") {
                Button("1.1") {
                    
                }
                
                Button("1.2") {
                    
                }
                
                Button("1.3") {
                    
                }
            }
        }
    }
}

#Preview {
    ControlGroupBootcamp()
}
