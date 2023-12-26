//
//  ContentView.swift
//  Monjed
//
//  Created by Bana Alshabib on 07/06/1445 AH.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isSheetPresented = false
    @State private var selectedRectangleIndex: Int?
    @State var searchTerm = ""
    
    
    

    var body: some View {
      
        let customGradient = LinearGradient(
                  gradient: Gradient(colors: [Color("BlueStart"), Color("BlueEnd")]),
                  startPoint: .leading,
                  endPoint: .trailing
              )
        
        let imageNameArray = ["eyeUpdate", "bandage.fill 1", "burns", "drowning", "bone", "choking", "epilepsy", "bites"]
            
        let textArray = ["Eye injury", "Cuts", "Burns", "Drowning", "Bone fracture", "Choking", "Epilepsy", "Bites"]
        
        
        var filteredIndices: [Int] {
                   if searchTerm.isEmpty {
                       return Array(0..<textArray.count)
                   } else {
                       return textArray.indices.filter {
                           textArray[$0].lowercased().contains(searchTerm.lowercased())
                       }
                   }
               }


        VStack() {
            Text("Get well soon!")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
             
            
            Text("{He said, “Do not fear, I am with you, I hear and I see.}")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
             
            
            
        } .navigationBarHidden(true)
        
            .padding()
  
        NavigationView {
            
                  ScrollView {
                      
                      HStack {
                                               TextField("search first aid...", text: $searchTerm)
                                                   .padding(.leading, 27)
                                               
                                           } .padding(6)
                                             .background(Color(.systemGray6))
                                             .cornerRadius(10)
                                             .padding(.horizontal)
                                             .overlay(
                                                 
                                                 HStack {
                                                     Image(systemName: "magnifyingglass")
                                                     Spacer()
                                                     Button(action: {}, label: {
                                                         Image(systemName: "mic.fill") })
                                                     
                                                 }.padding(.horizontal, 25)
                                                  .foregroundColor(.gray)
                                                 
                                                     
                                                 )
                                           
                                             .padding(.vertical, 10)
                      
                  
                      LazyVGrid(columns: [GridItem(.flexible(), spacing:-30), GridItem(.flexible(), spacing: -30)]) {
                          
                          ForEach(filteredIndices, id: \.self) { index in
                              
                              HStack {
                                  Rectangle()
                                      .fill(customGradient)
                                      .frame(width: 171, height: 117)
                                      .padding(1)
                                      .cornerRadius(10)
                                      .overlay (
                                        
                                        VStack (alignment: .leading){
                                            Image(imageNameArray[index])
                                                .scaleEffect(1.5)
                                                .foregroundColor(.white)
                                                .bold()
                                                .frame(alignment: .leading)
                                                .padding()
                                            
                                            
                                            Text(textArray[index])
                                                .foregroundColor(.white)
                                                .bold()
                                                .padding()
                                            
                                               }
                                        
                                        ,alignment: .topLeading   )
                                  
                                    }
                                  .onTapGesture {
                                      selectedRectangleIndex = index
                                      isSheetPresented.toggle()  }
                                 
                          } //index end bracket
                      } //lazy vgrid end bracket
                      
                  } //scrollView end bracket
                  .sheet(isPresented: $isSheetPresented) {
                      if let index = selectedRectangleIndex {
                          RectangleDetailSheet(index: index)
                      }
                  }
            
        } //navigationView end bracket
        
          } //body end bracket
      } //struct end bracket

//---------------------------------------------------------
// new struct for the text :

struct RectangleDetailSheet: View {
    let index: Int

    let contentArray: [AnyView] = [
        AnyView(SegmentedControlView1()),
        AnyView(Text("Cuts")),
        AnyView(Text("Burns")),
        AnyView(Text("Drowning")),
        AnyView(Text("Bone fracture")),
        AnyView(Text("Chocking")),
        AnyView(Text("Epilepsy")),
        AnyView(SegmentedControlView2())
    ]

    var body: some View {
        
        ScrollView {
            
            VStack (alignment:.center){
                contentArray[index]
                    .font(.title)
                    .bold()
                
                
                
                if index == 1 {
                    ScrollView {
                        VStack(alignment: .leading){
                     
                           
                            Text("First aid for wounds: ")
                                .font(.headline)
                                .padding(5)
                                .padding(.horizontal)
                                .underline()
                            
                            Text("* Wash your hands well with clean water and soap before dealing with the wound, avoiding touching it with your fingers while treating it if possible.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            
                            Text("* It is recommended to use disposable rubber gloves.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            
                            
                            
                            Text("* Remove jewelry from the affected body part.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            
                            Text("* Direct pressure on the wound to stop bleeding, while avoiding binding around the wound site. This can lead to tissue damage.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            
                            Text("* Cleaning the wound after the bleeding stops; This is done using a saline solution if possible, and if it is not available, bottled drinking water can be used.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            Text("* Examine the wound and remove any contamination or foreign body inside it.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            Text("* Cover the wound with a clean, sterile bandage. However, if the wound is contaminated or caused by a bite (such as a dog bite), or caused by a contaminated needle, it must be left open.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            
                            
                            Text("* Take painkillers to relieve pain and change the bandage every 24 hours.")
                                .font(.subheadline)
                                .padding(5)
                                .padding(.horizontal)
                            
                            Spacer()
                        }
                    }
                }
            }
            
            if index == 2 {
                
                VStack(alignment: .leading) {
                    
                  
                    
                    
                    Text("First Aid Measures (First degree burns): ")
                        .font(.subheadline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    
                    Text("Do's ✔️:")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Text("* Cool the burn wound to alleviate the pain by holding the burned area under cool (not freezing) running water for 10 to 15 minutes.\n\n* Remove any accessories (such as: rings, watches or belts) if any, and remove shoes or clothes quickly and gently before the area swells.\n\n* Cover the burn using a damp sterile bandage or a cool clean cloth, to reduce the risk of infection.\n Take painkillers to relieve the pain if necessary.")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
               
                    
                    Text("Don'ts ✖️: ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Text("* Don't try touching the blister bubbles resulting from the burn.\n\n* Don't apply any ointments or use butter or toothpaste or any other burn remedies.\n\n* Do not put ice directly on the burned area.")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    
                    Text("First Aid Measures (Second degree burns): ")
                        .font(.subheadline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("Do's ✔️:")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    Text("* Protect the burned person from further harm.\n\n* Remove jewelry, belts and other restrictive items, especially from around burned areas like the neck.\n\n* Take painkillers to relieve the pain if necessary.\n\n* Cover the burn using a damp sterile bandage or a cool clean cloth.\n\n* Cover opened blisters with a dry, sterile bandage. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                  
                    
                    Text("Don'ts ✖️: ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    Text("* Don't remove burned clothing stuck to the skin.\n\n* Don't cover the burn with adhesive bandage.\n\n* Avoid placing larger burned areas of the body in cold water as this may cause shock.\n\n* Do not put ice directly on the burned area.\n\n* Don't apply any ointments or use butter or toothpaste or any other burn remedies.\n\n* Avoid touching the blister bubbles resulting from the burn.\n\n* Don't place thin cotton on the burned area as it could irritate the skin. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    
                    Text("First Aid Measures (Third degree burns): ")
                        .font(.subheadline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("Do's ✔️:")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    Text("Contact the Red Crescent immediately and take the following measures until they arrive: ")
                        .font(.caption)
                        .padding(5)
                        .padding(.horizontal)
                        .bold()
                        .foregroundColor(.red)
                    
                    Text("* Check the patient's vital signs like breathing.\n\n* Elevate the burned area above the patient's heart level, if possible.\n\n* Cover the burn using a damp sterile bandage or a cool clean cloth. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
               
                    
                    Text("Don'ts ✖️: ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    Text("* Don't remove burned clothing stuck to the skin.\n\n* Don't place larger burned areas of the body in cold water as this may cause shock (sudden drop in body temperature).\n\n* Don't cover the burn with adhesive bandage.\n\n* Don't apply any ointments or use butter or toothpaste or any other burn remedies.\n\n* Don't place thin cotton on the burned area as it could irritate the skin. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                        }
            
            if index == 3 {
                
                VStack(alignment: .leading) {
                    
                 
                    
                    Text("First Aid Measures: ")
                        .font(.subheadline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("* Place the drowning person on their back on a flat surface, and be careful when handling them as they may be unconscious after bumping their head against something.\n\n* Try to call the drowning person and shake their shoulders to make sure they are responding.\n\n* If the person does not respond, check their breathing.\n\n* Red Crescent (997).\n\n* If the person is breathing: Place them in the recovery position and warm them up with clothes or blankets. Change their wet clothes while waiting for the ambulance. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)


        Text("If the drowning person is not breathing:")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.red)
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
        Text("* Elevate the head by placing a hand on the forehead and another hand down the chin and lifting it gently to clear the airway.\n\n* Check their pulse by placing two fingers on the windpipe (Adam's apple).\n\n* Start artificial respiration (mouth-to-mouth resuscitation) straight away by slowly blowing into the mouth of the person 5 times (for 1.5 to 2 seconds) while observing their chest as it rises with each blow. Wait until the chest drops back before you blow into their mouth again.\n\n* Start cardiopulmonary resuscitation CPR (30 chest compressions).\n\n* Repeat mouth-to-mouth resuscitation twice then do CPR once, until the person wakes up or until the ambulance arrives.\n\n* If the drowning person starts breathing again before the ambulance arrives, they must be warmed up with clothes or blankets and their wet clothes must be changed.\n\n* Monitor the patient and keep checking their pulse and breathing until the ambulance arrives.")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                }
                        }
           
            if index == 4 {
                VStack(alignment: .leading) {
                    
                  
                    
                    
                    Text("Symptoms: ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("The symptoms of a bone fracture vary greatly according to the affected area and its severity, and according to the affected bone, in addition to the patient’s age and general health. However, symptoms are often: ")
                        .font(.caption)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    
                    Text("* Severe pain, swelling and bruising.\n\n* Discoloration of the skin around the affected area (in the form of a bruise).\n\n* A curvature may occur in the affected area as a result of the fracture.\n\n* Inability to move the affected area.\n\n* If the fracture is open, bleeding will occur as a result of skin laceration.\n\n* If the fracture occurs to large bones (such as: the femur or the pelvis), other symptoms will occur (such as: pale skin, feeling nauseous, and fainting).    ")
                        .font(.subheadline)
                        .padding(10)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    
                    Text("First aid for fractures: ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                
                    
                    Text("* Stop the bleeding if the fracture has a laceration of the skin by applying pressure on the wound using a sterile bandage or a clean piece of cloth.\n\n* The affected area should not be moved; Because moving it can lead to severe complications, especially if the fracture is in the neck or spine.\n\n* The affected area should be cooled by placing ice cubes with a clean cloth and then placed on the affected area in order to reduce swelling and pain.\n\n* When the patient feels faint or is breathing short and rapid breaths, the injured person should be placed in a suitable position so that his head is slightly lower than the torso. If possible, his legs can be raised in order to overcome the symptoms of shock.​\n\n* Call an ambulance to request help and transfer the injured person to the emergency department to take the necessary measures, such as examinations and treatment.")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    Text("Splint care:")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("Fractures may be treated with splints to stabilize them, in order to facilitate correct bone healing, and reduce pain resulting from movement, so care must be taken with this splint to reduce complications and occurrence of infection, and to avoid this, the following must be followed: ")
                        .font(.caption)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Text("* The area affected by the fracture often has swelling, where the patient feels tight at first, and to reduce the swelling, the splint must be lifted by placing it on pillows and raising it above the level of the heart for a period of 24-48 hours.\n\n* Make ice packs on swelling places; By placing a bag of ice or a clean piece of cloth with ice inside it and applying compresses for 20 minutes every two hours, while avoiding placing ice directly on the skin.\n\n* Take pain relievers for at least 48 hours (such as: acetaminophen or ibuprofen) to relieve pain.\n\n* Keep the splint dry while showering and do not allow water to pass through it, by covering it with two plastic bags, wrapping each bag separately, and affixing it with adhesive tape to the skin outside the splint.\n\n* When the splint gets wet, it must be dried quickly with a hair dryer, and set on a cold setting, not hot, to avoid skin burns.\n\n* Keep the splint clean and avoid contamination with sand or dirt. to avoid infection.\n\n* Avoid placing any object inside the splint when feeling itchy (such as: a pen, etc.) so that it does not get stuck inside the splint and harm the skin and thus cause infection. But when feeling itchy inside the splint, a hair dryer can be used on the cold mode to reduce this feeling.\n\n* Avoid pulling out the lining parts of the splint. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    
                }
                        }

            
            if index == 5 {
                VStack(alignment: .leading) {
                    
                  
                    
                    
                    Text("First aid for choking (children under one year old):")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                   
                    Text("* If he cannot cough, place the child face down on the thigh and support the head of the face with one hand.\n\n* Slapping (hitting) the middle of the back five times consecutively, using the heel of the hand.\n\n* Raising the child so that his face is up while keeping the child's head low, using the index and middle fingers, pressing on the middle of the breastbone five times consecutively.\n\n* Repeating the process until the body comes out or the child loses consciousness. ")
                        .font(.subheadline)
                        .padding(10)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    
                    Text("First aid for choking (children over a year old): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                
                    
                    Text("* If the child is still conscious, encourage the child to cough.\n\n* If he cannot cough, the child is bent forward and one arm is placed on the chest to support him and the other hand is on the back.\n\n* Slapping (hitting) the back five times consecutively.\n\n* If the body does not come out, stand behind the child, put the arms around the child's abdomen, make a fist with one hand, hold the fist with the other hand, and direct five pressures on the upper abdomen by pushing the hand upwards. This will create an artificial cough and increase pressure in the chest and help expel the body.\n\n* Repeating the process until the body comes out or the child loses consciousness. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    Text("First aid for choking (adults):")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("*If the person is conscious and able to cough,they must be encouraged to cough to expel the object that is causing the choking.\n\n* If he cannot cough, the person bends forward and then stands behind him and is supported with one hand, let it be the right, then use the left hand to hit the back with the heel of the hand (the last part of the palm between the palm and the wrist) five consecutive times.\n\n* If the body does not come out, stand behind the person, put the arms around the abdomen, make a fist with one hand, hold the fist with the other hand, and direct five pressures on the abdomen by pushing the hand upwards.\n\n* The process is repeated until the body is excreted or the person loses consciousness")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    

                    
                    Text("Abdominal compressions are not performed for children under one year of age or pregnant women")
                        .font(.caption)
                        .padding(5)
                        .padding(.horizontal)
                        .foregroundColor(.red)
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    Text("First aid for choking (pregnant):")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    Text("*If she is able to breathe or cough, encourage her to cough.\n\n* if she cannot cough, she is bent forward.\n\n* Slapping (hitting) the back five times consecutively with the heel of the hand.\n\n* If the body does not come out, stand behind it, put the arms around the chest area, make a fist with one hand, hold the fist with the other hand, and direct five pressures on the chest area by pushing the hand upwards.\n\n* Repeating the process until the body comes out or until she loses consciousness. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    

                    
                    
                    
                    
                }

                        }
       
            
            if index == 6 {
                VStack(alignment: .leading) {
                    
                    
               
                    Text("First Aid Measures: ")
                        .font(.subheadline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    
                    Text("Do's ✔️:")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Text("* Try to keep track of how long a seizure lasts.\n\n* Any harmful objects should be removed from the vicinity of the patient during seizures, and the patient should be moved away form anything that can put them in danger such as stairways.\n\n* Remove glasses if the patient wears them.\n\n* Support the patient's head to protect it from hitting the ground by placing a cloth or a jacket. ")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color(.systemGray))
                        .padding(.horizontal)
                    
                    
                    Text("Don'ts ✖️: ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                    
                    
                    Text("* Do not restrain the patient during seizures.\n\n* Do not gather around the patient.\n\n* Do not put anything in the patient's mouth or between their teeth.\n\n* Do not attempt to move the patient during a seizure.\n\n* Do not panic and do not assume that the victim is aware of what is happening or what has happened.\n\n* Do not give the patient any kind of food or drink until they wake up completely.")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                    
                    Text("Seek immediate medical help if the seizure lasts longer than 5 minutes.")
                        .font(.caption)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .foregroundColor(.red)
                    
                    
                    
                    
                }
             }

        }.padding(.all)
    }
}

//______________________________________________
// new struct for the segment sheet (eye)


struct SegmentedControlView1: View {
    @State private var selectedSegment = 0

    var body: some View {
        VStack (alignment:.center){
            Text("Eye injury")
                .font(.title)
                
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("Hit").tag(0)
                Text("Puncture").tag(1)
                Text("Burn").tag(2)
            } .padding()
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            if selectedSegment==0 {
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (eye hit): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* Gently apply cold compresses to relieve pain and swelling, while avoiding using frozen food bags to make compresses to prevent bacterial eye infections.\n\n* Avoid pressure on the eye.\n\n* Eye strikes should not be taken lightly; Because a mild blow can lead to retinal detachment and loss of vision.\n\n*  In the event of eye darkening, severe pain, or blurred vision, call 911.")
                            .font(.subheadline)
                            .padding(5)
                            .padding(.horizontal)
                            .fontWeight(.regular)
                   
                }
                    
                
            }
            
            if selectedSegment==1{
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (eye Puncture): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* The eye must be covered with a clean protective cover until arriving to the doctor.\n\n* Avoid pressure on the eye lid.\n\n* Avoid rinsing the eyes with water.\n\n* Avoid removing anything stuck in the eye.\n\n* Avoid rubbing or putting pressure on the eye.\n\n* Do not take aspirin or any anti-inflammatory medications; Because it will increase bleeding. ")
                            .font(.subheadline)
                            .padding(5)
                            .padding(.horizontal)
                            .fontWeight(.regular)
               
                        
                }
                    
                
            }
           
            if selectedSegment==2{
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (eye burn): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* Immediately wash the eye with clean water.\n\n* You must know the type of chemical causing the injury and inform the doctor about it. Because some substances hurt the eye more than others.")
                        .font(.subheadline)
                        .padding(5)
                        .padding(.horizontal)
                        .fontWeight(.regular)
                }
                
            }
            Spacer()
        }.padding(.leading)
    }
}


//______________________________________________
// new struct for the segment sheet (bites)


struct SegmentedControlView2: View {
    @State private var selectedSegment = 0
    

    var body: some View {
        VStack (alignment:.center) {
            Text("Bites")
                .font(.title)
                .padding(.bottom)

            Picker(selection: $selectedSegment, label: Text("")) {
                Text("Bee").tag(0)
                Text("Spider").tag(1)
                Text("Snake").tag(2)
                Text("Scorpion").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding()
        
            if selectedSegment==0{
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (Bee Sting): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* Remove the remaining sting (bee sting) using sterile gauze, or by scraping the fingernail on the affected area, avoiding pressure on the affected area, or using tweezers.\n\n* Wash the sting site with soap and water.\n\n* Apply cold compresses to reduce swelling.\n\n* Avoid scratching the bite as this may increase swelling and increase the possibility of infection.\n\n* Take a painkiller to relieve the pain.\n\n* When the swelling spreads to other parts of the body, or when the injured person feels difficulty breathing, nausea, or dizziness, this means that the injured person is suffering from a severe allergic reaction to bee stings, call 911 immediately.")
                            .font(.subheadline)
                            .padding(5)
                            .padding(.horizontal)
                            .fontWeight(.regular)
                    
                }
                
            }
       
            if selectedSegment==1{
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (Spider Bite): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* Stay as calm as possible and identify the type of spider if possible.\n\n* Wash the sting with soap and water.\n\n* Apply cold compresses to reduce swelling.\n\n* Raise the bite area as much as possible.\n\n* Avoid trying to remove the poison, and go immediately to the nearest emergency room.\n\n* When there is suspicion of being bitten by a black or red spider; Call 911 immediately.")
                            .font(.subheadline)
                            .padding(5)
                            .padding(.horizontal)
                            .fontWeight(.regular)
            
                }
           
            }
         
            if selectedSegment==2{
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (Snake Bite): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* Calm down the injured person; This can slow the spread of the poison in the body\n\n*  Trying to remember the shape and color of the snake to aid treatment.\n\n* Wash the sting with soap and water immediately.\n\n* Lying down or sitting, trying to put the affected limb in a comfortable position.\n\n* Remove anything tight around the affected body part (eg: rings or bracelets) as they can cause damage if swelling occurs.\n\n* Cover the sting site with a clean, dry bandage.\n\n* Do not bind any area close to the affected area.\n\n* Avoid trying to remove the poison, and go immediately to the nearest emergency room.\n\n* Avoid wounding the affected area or sucking the poison.\n\n*  Do not apply ice or immerse the wound in water.\n\n* Call 911 immediately.")
                            .font(.subheadline)
                            .padding(5)
                            .padding(.horizontal)
                            .fontWeight(.regular)
            
              
                    
                }
                    
           
            }
            if selectedSegment==3{
                
                VStack(alignment: .leading) {
                    
                    Text("First Aid Measures (Scorpion Sting): ")
                        .font(.headline)
                        .bold()
                        .padding(5)
                        .padding(.horizontal)
                        .underline()
                    
                    
                    Text("* Apply ice directly to the affected area, but avoid immersing the affected limb in cold water.\n\n* Calm down and Calm the injured person.\n\n* Calm down and Calm the injured person.\n\n*  Do not take tranquilizers.\n\n* If possible, take Scorpio to the emergency room while taking caution.")
                            .font(.subheadline)
                            .padding(5)
                            .padding(.horizontal)
                            .fontWeight(.regular)
                    
           
                    
                }
                
            }
            Spacer()
        }.padding(.leading)
    }
}
#Preview {
    ContentView()
}
