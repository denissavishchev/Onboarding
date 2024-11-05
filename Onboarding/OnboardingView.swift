import SwiftUI

struct OnboardingStep{
    let image: String
    let title: String
    let description: String
    let color: Color
}

struct OnboardingView: View {
    
    @State var currentStep: Int = 0
    @State var isFinished: Bool = false
    let onboardingSteps: [OnboardingStep] = [
        OnboardingStep(image: "Computer", title: "I'm the Programmer", description: "This world is programmable", color: .blue),
        OnboardingStep(image: "Draw", title: "I'M the Creator", description: "I creatw my own world", color: .yellow),
        OnboardingStep(image: "Kid", title: "I'm the Father", description: "I love my sons", color: .pink),
        OnboardingStep(image: "Bike", title: "I love my bike", description: "50 km is not a distance", color: .orange),
        OnboardingStep(image: "Forest", title: "I love a Nature", description: "Enhale", color: .green)
    ]
    
    var body: some View {
        ZStack{
            if isFinished{
                HomeView()
                    .transition(.move(edge: .trailing))
            }else{
                VStack{
                    ContentView(steps: onboardingSteps.count, currentStep: $currentStep)
                    Spacer()
                    DetailsView(onboardingSteps: onboardingSteps, currentStep: currentStep)
                    Spacer()
                }
                .padding()
                
                NextButton(currentStep: $currentStep, color: onboardingSteps[currentStep].color) {
                    if currentStep < onboardingSteps.count - 1 {
                        currentStep += 1
                    }else{
                        withAnimation(.linear.delay(0.5)){
                            isFinished = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}

struct HomeView: View {
    var body: some View {
        VStack{
            Text("Welcome to the Home!")
                .font(.largeTitle)
                .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

struct DetailsView:View {
    
    var onboardingSteps: [OnboardingStep]
    var currentStep: Int
    
    var body: some View {
        VStack{
            Image(onboardingSteps[currentStep].image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Text(onboardingSteps[currentStep].title)
                .bold()
                .font(.title)
            Text(onboardingSteps[currentStep].description)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
        }
        .id(currentStep)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        .animation(.linear, value: currentStep)
        .frame(maxWidth: .infinity)
    }
}
