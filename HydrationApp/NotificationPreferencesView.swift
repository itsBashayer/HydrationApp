import SwiftUI

struct NotificationPreferencesView: View {
    @State private var startHour: String = "3:00"
    @State private var endHour: String = "3:00"
    @State private var isStartAM: Bool = true
    @State private var isEndAM: Bool = true
    @State private var selectedBox: Int?

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer().frame(width: 10)
                    Text("Notification Preferences")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 20)
                }
                .padding(.top, 30)

                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Spacer().frame(width: 10)
                        Text("The start and End hour")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.leading)
                            .bold()
                    }
                    HStack {
                        Spacer().frame(width: 10)
                        Text("Specify the start and end date to receive the notifications")
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 0.365, green: 0.365, blue: 0.378))
                    }
                }
                .padding(.bottom, 10)

                startAndEndHourSection

                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Spacer().frame(width: 10)
                        Text("Notification interval")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 10)
                    }
                    .padding(.top, 10)
                
                    HStack {
                        Spacer().frame(width: 10)
                        Text("How often would you like to receive notifications within the specified time interval")
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
                            .multilineTextAlignment(.leading)
                    }
                }

                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        Spacer()
                        smallBox(number: 15, label: "Mins", index: 0)
                        smallBox(number: 30, label: "Mins", index: 1)
                        smallBox(number: 60, label: "Mins", index: 2)
                        smallBox(number: 90, label: "Mins", index: 3)
                        Spacer()
                    }
                    HStack(spacing: 20) {
                        Spacer()
                        smallBox(number: 2, label: "Hours", index: 4)
                        smallBox(number: 3, label: "Hours", index: 5)
                        smallBox(number: 4, label: "Hours", index: 6)
                        smallBox(number: 5, label: "Hours", index: 7)
                        Spacer()
                    }
                }
                .padding(.top, 20)

                Spacer()

                HStack {
                    Spacer()
                    NavigationLink(destination: DestinationView()) {
                        Text("Start")
                            .padding(.vertical, 10)
                            .frame(width: 360, height: 50)
                            .background(Color(red: 0.192, green: 0.68, blue: 0.903))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
    }

    private var startAndEndHourSection: some View {
        VStack(spacing: 0) {
            startHourInput
            Divider()
            endHourInput
        }
        .padding()
        .background(Color(red: 0.949, green: 0.949, blue: 0.971))
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }

    private var startHourInput: some View {
        HStack {
            Text("Start hour")
                .font(.body)
                .padding(.bottom, 20)
            Spacer()

            TextField("HH:mm", text: $startHour)
                .keyboardType(.decimalPad)
                .padding(3)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .frame(width: 60, height: 30)

            Picker("", selection: $isStartAM) {
                Text("AM").tag(true)
                Text("PM").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 100)
        }
        .frame(height: 40)
    }

    private var endHourInput: some View {
        HStack {
            Text("End hour")
                .font(.body)
                .padding(.top, 10)
            Spacer()

            TextField("HH:mm", text: $endHour)
                .keyboardType(.decimalPad)
                .padding(3)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .frame(width: 60, height: 30)

            Picker("", selection: $isEndAM) {
                Text("AM").tag(true)
                Text("PM").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 100)
        }
        .frame(height: 40)
    }

    private func smallBox(number: Int, label: String, index: Int) -> some View {
        let isSelected = selectedBox == index
        let textColor = isSelected ? Color.white : Color.black
        let numberColor = isSelected ? Color.white : Color(red: 0.192, green: 0.68, blue: 0.903)

        return VStack {
            Text("\(number)")
                .font(.headline)
                .foregroundColor(numberColor)
            Text(label)
                .font(.subheadline)
                .foregroundColor(textColor)
        }
        .frame(width: 70, height: 70)
        .background(isSelected ? Color(red: 0.192, green: 0.68, blue: 0.903) : Color(red: 0.949, green: 0.949, blue: 0.971))
        .cornerRadius(10)
        .onTapGesture {
            selectedBox = index
        }
    }
}

struct NotificationPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreferencesView()
    }
}
