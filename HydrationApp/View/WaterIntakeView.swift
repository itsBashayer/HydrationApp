import SwiftUI

struct WaterIntakeView: View {
    @StateObject private var viewModel = WaterIntakeViewModel()

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Today's Water Intake")
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.leading)

            HStack {
                Text("\(viewModel.model.currentWaterIntake, specifier: "%.1f") liter")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(viewModel.model.currentWaterIntake >= viewModel.model.dailyWaterIntakeGoal ? Color.green : Color(red: 0.1, green: 0.1, blue: 0.1))
                Text(" / \(viewModel.model.dailyWaterIntakeGoal, specifier: "%.1f") liter")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                Spacer()
            }
            .padding(.leading)

            Spacer()

            WaterIntakeProgressView(
                currentWaterIntake: $viewModel.model.currentWaterIntake,
                dailyWaterIntakeGoal: viewModel.model.dailyWaterIntakeGoal,
                currentIcon: viewModel.getCurrentIcon(),
                currentColor: Color.yellow
            )
            .padding(.top, 70)

            VStack {
                Text("\(viewModel.model.currentWaterIntake.formatted(.number.precision(.fractionLength(1)))) L")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    .foregroundColor(Color.black)

                HStack {
                    Button(action: viewModel.decreaseWaterIntake) {
                        Text("-")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50)
                    }
                    Divider().frame(height: 50)
                    Button(action: viewModel.increaseWaterIntake) {
                        Text("+")
                            .font(.title)
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50)
                    }
                }
                .frame(width: 100, height: 10)
                .padding()
                .background(Color(red: 0.933, green: 0.933, blue: 0.942))
                .cornerRadius(10)
                Spacer()
            }
        }
        .padding()
    }
}

struct WaterIntakeProgressView: View {
    @Binding var currentWaterIntake: Double
    let dailyWaterIntakeGoal: Double
    let currentIcon: String
    let currentColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 29)
                .frame(width: 313, height: 313)

            Image(systemName: currentIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 110)
                .foregroundColor(currentColor)

            Circle()
                .trim(from: 0, to: currentWaterIntake / dailyWaterIntakeGoal)
                .stroke(Color(red: 0.192, green: 0.68, blue: 0.903), style: StrokeStyle(lineWidth: 28, lineCap: .round))
                .frame(width: 313, height: 313)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut, value: currentWaterIntake)
        }
    }
}
