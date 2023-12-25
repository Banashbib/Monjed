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
        
        let imageNameArray = ["eye", "bandage.fill", "burns", "drowning", "bone", "choking", "epilepsy", "bites"]
            
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


        VStack {
            Text("Get well soon!")
                .font(.largeTitle)
                .bold()
                .offset(x: -67)
             
            
            Text("{He said, “Do not fear, I am with you, I hear and I see.}")
                .font(.caption)
                .offset(x: -25)
            
            
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
                      
                  }
                 
                  .sheet(isPresented: $isSheetPresented) {
                      if let index = selectedRectangleIndex {
                          RectangleDetailSheet(index: index)
                      }
                  }
            
        }/*.searchable(text: $searchTerm, placement: .automatic, prompt: "search first aid...")*/
        
          }
      }

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
        VStack (alignment:.leading){
            contentArray[index]
                .font(.title)
                .bold()
                //.padding()
                
                
            if index == 1 {
                            Text("- Wash your hands well with clean water and soap before dealing with the wound, avoiding touching it with your fingers while treating it if possible.")
                    .font(.caption)
                    
                   
                Text("- It is recommended to use disposable rubber gloves.")
                                .font(.caption)
                Text("- Remove jewelry from the affected body part.")
                                .font(.caption)
                Text("- Direct pressure on the wound to stop bleeding, while avoiding binding around the wound site. This can lead to tissue damage.")
                                .font(.caption)
                Text("- Cleaning the wound after the bleeding stops; This is done using a saline solution if possible, and if it is not available, bottled drinking water can be used.")
                                .font(.caption)
                Text("- Examine the wound and remove any contamination or foreign body inside it.")
                                .font(.caption)
                Text("- Cover the wound with a clean, sterile bandage. However, if the wound is contaminated or caused by a bite (such as a dog bite), or caused by a contaminated needle, it must be left open.")
                                .font(.caption)
                Text("- Take painkillers to relieve pain and change the bandage every 24 hours.")
                                .font(.caption)
               Spacer()
                        }

            
            if index == 2 {
                            Text("First degree burns (mild):")
                    .font(.caption)
                    .bold()
                   
                Text("- Cool the burn by placing it under running water for 10-15 minutes.")
                                .font(.caption)
                Text("- Remove accessories and clothing surrounding the burned area.")
                                .font(.caption)
                Text("- Cover the affected area with a moist bandage or cool cloth.")
                                .font(.caption)
                Text("- Use a pain reliever if necessary.")
                                .font(.caption)
                Text("- Seek help if the burn is severe or shows signs of infection.")
                                .font(.caption)
                Text("Second degree burns:")
        .font(.caption)
        .bold()
       
    Text("- Protect the injured person.")
                    .font(.caption)
    Text("- Remove jewelry, belts, etc.")
                    .font(.caption)
    Text("- Cover the affected area with a moist bandage or cool cloth.")
                    .font(.caption)
    Text("- Cover the affected area with a moist bandage or cool cloth.")
                    .font(.caption)
   
                Text("Third degree burns:")
        .font(.caption)
        .bold()
       
    Text("- Call 911 immediately.")
                    .font(.caption)
    Text("- Protect the injured person.")
                    .font(.caption)
    Text("- Elevate the affected area above the level of the heart if possible.")
                    .font(.caption)
    Text("- Cover the affected area with a moist bandage or cool cloth.")
                    .font(.caption)
               Spacer()
                        }
            
            if index == 3 {
                            Text("If the drowning person is breathing:")
                    .font(.caption)
                    .bold()
                   
                Text("- Put him/her in recovery mode.")
                                .font(.caption)
                Text("- Warm him/her with clothes or a blanket.")
                                .font(.caption)
                Text("- Change the wet clothes.")
                                .font(.caption)
                Text("If the drowning person is not breathing:")
                                .font(.caption)
                                .bold()
                Text("- Call 911 immediately.")
                                .font(.caption)
                Text("- Raise the drowning person's head and open the airway.")
                                .font(.caption)
                Text("- Check for a pulse by feeling the larynx in the neck.")
                                .font(.caption)
                Text("- Perform artificial respiration by blowing into the victim's mouth and performing cardiopulmonary resuscitation.")
                                .font(.caption)
                Text("- Continue artificial respiration and cardiopulmonary resuscitation until the drowned person regains his breathing or the ambulance arrives.")
                                .font(.caption)
               Spacer()
                        }
            /**/
            
            if index == 4 {
                            Text("- Stop bleeding if the fracture involves skin lacerations; By applying pressure on the wound using a sterile bandage or clean cloth.")
                    .font(.caption)
                   
                Text("- The affected area should not be moved; Because moving it can lead to serious complications; Especially if the fracture is in the neck or spine.")
                                .font(.caption)
                Text("- The affected area should be cooled by placing ice cubes with a clean cloth, then placing them on the affected area. This is to reduce swelling and pain.")
                                .font(.caption)
                Text("- When the patient feels faint, or is breathing short and rapid breaths, the injured person must be placed in an appropriate position. So that his head is slightly lower than the torso, and if possible, his legs can be raised; This is to overcome the symptoms of shock.")
                                .font(.caption)
                Text("- Cleaning the wound after the bleeding stops; This is done using a saline solution if possible, and if it is not available, bottled drinking water can be used.")
                                .font(.caption)
                Text("- Call an ambulance to request assistance, and to transfer the injured person to the emergency department to take the necessary measures, including examinations and treatment.")
                                .font(.caption)
                
                Spacer()
                        }
            /*If the person is able to breathe forcefully, he should continue coughing.
             If the person is suffocating and unable to speak, cry, or laugh forcefully, the following must be done:
             Stand behind the injured person.
             Place one foot slightly in front of the other for balance.
             Wrap the arms around the injured person's waist.
             Lean the affected person forward slightly.
             Make a fist with the other hand and then place it above the navel area.
             Hold the fist with the other hand, then apply strong pressure on the abdomen, quickly upward.
             Perform 6 to 10 abdominal thrusts until the stuck object is removed.
             If the injured person has lost consciousness, perform cardiopulmonary resuscitation with chest compressions and rescue breaths.
             Call 911 if the condition deteriorates.*/
            
            if index == 5 {
                            Text("If the person is able to breathe forcefully, he should continue coughing.")
                    .font(.caption)
                    .bold()
                Text("If the person is suffocating and unable to speak, cry, or laugh forcefully, the following must be done:")
        .font(.caption)
        .bold()
                   
                Text("- Stand behind the injured person.")
                                .font(.caption)
                Text("- Place one foot slightly in front of the other for balance.")
                                .font(.caption)
                Text("- Wrap the arms around the injured person's waist.")
                                .font(.caption)
                Text("- Lean the affected person forward slightly.")
                                .font(.caption)
                Text("- Make a fist with the other hand and then place it above the navel area.")
                                .font(.caption)
                Text("- Hold the fist with the other hand, then apply strong pressure on the abdomen, quickly upward.")
                                .font(.caption)
                Text("- Perform 6 to 10 abdominal thrusts until the stuck object is removed.")
                                .font(.caption)
                Text("If the injured person has lost consciousness, perform cardiopulmonary resuscitation with chest compressions and rescue breaths, Call 911 if the condition deteriorates.")
        .font(.caption)
        .bold()
                Spacer()
                        }
            /**I do :
             Monitor the time spent having a seizure.
             Protect the injured person by removing any harmful objects and keeping him away from sources of danger.
             Remove glasses if the injured person uses them.
             Support the injured person's head to prevent hitting the ground.
             Don't:
             Stabilize the injured person.
             Gathering around the injured person.
             Putting any object in the injured person's mouth or between his teeth.
             Transporting the casualty during a seizure.
             Panic and assumptions.
             Giving the injured person food or drink before regaining consciousness.
             After the seizure ends:
             Place the injured person in the recovery position and wipe off excess saliva.
             Reassure the injured person gently and calmly.
             Stay with the injured person until he regains consciousness.
             Gently check the victim's mouth to make sure there is no obstruction to breathing.
             Call 911 if the seizure lasts for 5 minutes or more or if breathing becomes difficult after the seizure stops*/
            
            if index == 6 {
                            Text("Do")
                    .font(.caption)
                    .bold()
                   
                Text("- Monitor the time spent having a seizure.")
                                .font(.caption)
                Text("- Protect the injured person by removing any harmful objects and keeping him away from sources of danger.")
                                .font(.caption)
                Text("- Remove glasses if the injured person uses them.")
                                .font(.caption)
                Text("- Support the injured person's head to prevent hitting the ground.")
                                .font(.caption)
                Text("Don't")
        .font(.caption)
        .bold()
                Text("- Stabilize the injured person.")
                                .font(.caption)
                Text("- Gathering around the injured person.")
                                .font(.caption)
                Text("- Putting any object in the injured person's mouth or between his teeth.")
                                .font(.caption)
                Text("- Transporting the casualty during a seizure.")
                                .font(.caption)
                Text("- Panic and assumptions.")
                                .font(.caption)
                Text("- Giving the injured person food or drink before regaining consciousness.")
                                .font(.caption)
                Text("After the seizure ends:")
        .font(.caption)
        .bold()
                Text("- Place the injured person in the recovery position and wipe off excess saliva..")
                                .font(.caption)
                Text("- Reassure the injured person gently and calmly.")
                                .font(.caption)
                Text("- Stay with the injured person until he regains consciousness.")
                                .font(.caption)
                Text("- Gently check the victim's mouth to make sure there is no obstruction to breathing.")
                                .font(.caption)
                Text("- Call 911 if the seizure lasts for 5 minutes or more or if breathing becomes difficult after the seizure stops")
                                .font(.caption)
                Spacer()
                        }

        }.padding(.all)
    }
}

struct SegmentedControlView1: View {
    @State private var selectedSegment = 0

    var body: some View {
        VStack (alignment:.leading){
            Text("Eye injury")
                .font(.title)
                
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("Hit").tag(0)
                Text("Puncture").tag(1)
                Text("Burn").tag(2)
            } .padding()
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            if selectedSegment==0{
                Text("- Gently apply cold compresses to relieve pain and swelling, while avoiding using frozen food bags to make compresses to prevent bacterial eye infections.")
                    .font(.caption)
                    
                Text("- Avoid pressure on the eye.")
                    .font(.caption)
        
                Text("- Eye strikes should not be taken lightly; Because a mild blow can lead to retinal detachment and loss of vision.")
                    .font(.caption)
                    
                Text("- In the event of eye darkening, severe pain, or blurred vision, call 911.")
                    .font(.caption)
                    .bold()
                    
                
            }
            
            if selectedSegment==1{
                Text("- The eye must be covered with a clean protective cover until arriving to the doctor.")
                    .font(.caption)
                    
                Text("- Avoid pressure on the eye lid.")
                    .font(.caption)
                Text("- Avoid rinsing the eyes with water.")
                    .font(.caption)
                    
                Text("- Avoid removing anything stuck in the eye.")
                    .font(.caption)
                    
                Text("- Avoid rubbing or putting pressure on the eye.")
                    .font(.caption)
                    
                Text("- Do not take aspirin or any anti-inflammatory medications; Because it will increase bleeding.")
                    .font(.caption)
                    
                Text("- Call 911 immediately.")
                    .font(.caption)
                    .bold()
                    
                
            }
           
            if selectedSegment==2{
                Text("- Immediately wash the eye with clean water.")
                    .font(.caption)
                    
                Text("- You must know the type of chemical causing the injury and inform the doctor about it. Because some substances hurt the eye more than others.")
                    .font(.caption)
                    
                Text("- Call 911 immediately.")
                    .font(.caption)
                    .bold()
                    
                
            }
            Spacer()
        }.padding(.leading)
    }
}
struct SegmentedControlView2: View {
    @State private var selectedSegment = 0
    

    var body: some View {
        VStack (alignment:.leading) {
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
                Text("- Remove the remaining sting (bee sting) using sterile gauze, or by scraping the fingernail on the affected area, avoiding pressure on the affected area, or using tweezers.")
                    .font(.caption)
                    
                Text("- Wash the sting site with soap and water.")
                    .font(.caption)
                    
                Text("- Apply cold compresses to reduce swelling.")
                    .font(.caption)
                    
                Text("- Avoid scratching the bite as this may increase swelling and increase the possibility of infection.")
                    .font(.caption)
                
                Text("- Take a painkiller to relieve the pain.")
                    .font(.caption)
                
                Text("- When the swelling spreads to other parts of the body, or when the injured person feels difficulty breathing, nausea, or dizziness, this means that the injured person is suffering from a severe allergic reaction to bee stings, call 911 immediately.")
                    .bold()
                    .font(.caption)
               
                
            }
       
            if selectedSegment==1{
                Text("- Stay as calm as possible and identify the type of spider if possible.")
                    .font(.caption)
                    
                Text("- Wash the sting with soap and water.")
                    .font(.caption)
                    
                Text("- Apply cold compresses to reduce swelling.")
                    .font(.caption)
                    
                Text("- Raise the bite area as much as possible.")
                    .font(.caption)
                
                Text("- Avoid trying to remove the poison, and go immediately to the nearest emergency room.")
                    .font(.caption)
                
                Text("- When there is suspicion of being bitten by a black or red spider; Call 911 immediately.")
                    .bold()
                    .font(.caption)
                
                    
           
            }
         
            if selectedSegment==2{
                Text("- Calm down the injured person; This can slow the spread of the poison in the body.")
                    .font(.caption)
                    
                Text("- Trying to remember the shape and color of the snake to aid treatment.")
                    .font(.caption)
                    
                Text("- Wash the sting with soap and water immediately.")
                    .font(.caption)
                    
                Text("- Lying down or sitting, trying to put the affected limb in a comfortable position.")
                    .font(.caption)
                
                Text("- Remove anything tight around the affected body part (eg: rings or bracelets) as they can cause damage if swelling occurs.")
                    .font(.caption)
                
                Text("-Cover the sting site with a clean, dry bandage.")
                    .font(.caption)
                
                
                Text("- Do not bind any area close to the affected area.")
                    .font(.caption)
                
                
                Text("- Avoid trying to remove the poison, and go immediately to the nearest emergency room.")
                    .font(.caption)
                
                Text("- Avoid wounding the affected area or sucking the poison.")
                    .font(.caption)
                
                Text("- Do not apply ice or immerse the wound in water.")
                    .font(.caption)
                
                Text("- Call 911 immediately.")
                    .bold()
                    .font(.caption)
                
                    
           
            }
            if selectedSegment==3{
                Text("- Apply ice directly to the affected area, but avoid immersing the affected limb in cold water.")
                    .font(.caption)
                    
                Text("- Calm down and Calm the injured person.")
                    .font(.caption)
                    
                Text("- Do not take tranquilizers.")
                    .font(.caption)
                    
                Text("- If possible, take Scorpio to the emergency room while taking caution.")
                    .font(.caption)
                
                Text("- Call 911 immediately.")
                    .font(.caption)
                
            }
            Spacer()
        }.padding(.leading)
    }
}
#Preview {
    ContentView()
}
