import SwiftUI

struct OnboardingStep{
    let image: ImageResource
    let title: String
    let description: String
    let color: Color
}

struct OnboardingView: View {
    
    @State var currentStep: Int = 0
    @State var isFinished: Bool = false
    let onboardingSteps: [OnboardingStep] = [
        OnboardingStep(image: <#T##ImageResource#>, title: "Send", description: <#T##String#>, color: .red),
        OnboardingStep(image: <#T##ImageResource#>, title: "Send", description: <#T##String#>, color: .yellow),
        OnboardingStep(image: <#T##ImageResource#>, title: "Send", description: <#T##String#>, color: .blue),
        OnboardingStep(image: <#T##ImageResource#>, title: "Send", description: <#T##String#>, color: .green),
        OnboardingStep(image: <#T##ImageResource#>, title: "Send", description: <#T##String#>, color: .orange)
    ]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    OnboardingView()
}
