//
//  OnBoarding.swift
//  OnBoardingAnimation0901
//
//  Created by 张亚飞 on 2021/9/1.
//

import SwiftUI

struct OnBoarding: View {
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        OffsetPageTabView(offset: $offset) {
            
            HStack(spacing: 0) {
                
                ForEach(boardingScreens) {screen in
                    
                    VStack(spacing: 15) {
                        
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                            .offset(y: -120)
                        
                        VStack (alignment: .leading, spacing: 12) {
                            
                            Text(screen.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .padding(.top, 20)
                            
                            Text(screen.description)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth:.infinity,  alignment:.leading)
                        .offset(y: -70)
                    }
                    .padding()
                    .frame(width:getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                }
            }
            .ignoresSafeArea(.container, edges: .all)
            
            
        }
        // animation...
        .background(
            
            RoundedRectangle(cornerRadius: 50)
                .fill(.white)
                .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 25))
                .rotationEffect(.init(degrees: getRotation()))
                .offset(y: -getScreenBounds().width + 20)
        )
        .background(
            Color("screen\(getIndex() + 1)")
                .animation(.easeInOut, value: getIndex())
        )
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
        
            VStack {
                HStack(spacing: 25){
                        
                        Button {
                            
                        } label: {
                            
                            Text("Login as iJustine")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                        }

                        Button {
                            
                        } label: {
                            
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .offset(x: -5)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                        }
                        
                }
            
                HStack{
                    
                    Button {
                        
                        offset = max(offset - getScreenBounds().width, 0)
                        
                    } label: {
                        
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    
                    //indicators...
                    HStack(spacing: 8) {
                        
                        ForEach(boardingScreens.indices, id: \.self) { index in
                            
                            Circle()
                                .fill(.white)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == getIndex() ? 1.3 : 0.85)
                                .animation(.easeInOut, value: getIndex())
                        }
                    }
                    .frame(maxWidth:.infinity)
                    
                    
                    Button {
                        
                        offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                    } label: {
                        
                        Text("Next")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }

                }
                .padding(.top, 30)
                .padding(.horizontal, 8)
            }
                .padding()
            
            ,alignment: .bottom
        )
    }
    
    //getting rotation...
    func getRotation() ->Double {
        
        let progress = offset / (getScreenBounds().width * 4)
        
        let rotation = Double(progress) * 360
        
        return rotation
    }
    
    
    
    // changing bg color based on offset ...
    func getIndex() -> Int {
        
        let progress = (offset / getScreenBounds().width).rounded()
        
        return  Int(progress)
    }
    
    
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}

//extension view  to get screen bounds...
extension View {
    
    func getScreenBounds() -> CGRect {
        
        return UIScreen.main.bounds
    }
}
