💧 Hydration Tracking App

<img width="854" alt="Screenshot 1446-05-03 at 11 17 01 AM" src="https://github.com/user-attachments/assets/2c6db8c0-e28e-470a-9163-89da3cd31dd2">






An iOS application designed to assist users in monitoring their daily water consumption based on their body weight. The app allows users to set notification reminders, helping them stay motivated to meet their hydration goals. Whether you're at home, at work, or on the go, the Hydration Tracker App makes it easy to maintain healthy drinking habits. Start your journey towards better hydration today and feel the difference!

---

### 🚀 Features

- **Water Intake Calculation:** Input your weight, and the app calculates the optimal amount of water you need daily, helping you meet your hydration goals.
  
- **Custom Reminders:** Schedule notifications to remind you to drink water throughout the day, ensuring you never forget to stay hydrated.

- **User-Friendly Interface:** An easy-to-navigate design allows you to quickly input data and access the information you need clearly.

- **Progress Tracking:** Monitor how much water you consume each day and check your progress toward achieving your goals.

---

### 📱 Screens

- **Onboarding Screens:** Users can input their body weight and set initial preferences for daily intake tracking.
  
- **Notification Preferences:** Allows users to set the start and end hours for reminders and the interval between notifications.
  
- **Water Tracker:** The main screen that shows the current water intake, daily target, and visual progress.

---

### 🛠️ Tech Stack

- **Xcode**
- **MVVM Pattern**

---

### 🔔 Notifications

The app includes three types of notifications:

- **Reminder Notification:** When no water intake is recorded.
  
- **Motivational Notification:** Sent when halfway to the target.
  
- **Achievement Notification:** Sent when close to reaching the target.

*Note: Notifications will only work if the user grants permission.*

---

### 📂 Project Structure

```
├── HydrationApp.swift               # Entry point and main app file
├── Models
│   ├── HydrationData.swift          # Data model for water intake tracking
│   └── NotificationSettings.swift   # Data model for notification settings
├── ViewModels
│   └── HydrationViewModel.swift     # Business logic for tracking and notifications
├── Views
│   ├── OnboardingScreenOne.swift    # First onboarding screen
│   ├── NotificationPreferencesView.swift  # View for setting notification preferences
│   └── WaterTrackerView.swift       # Main view for tracking water intake
```
If you have any questions or suggestions, feel free to reach out to me!
### 📞 Contact me:
Email: alfuhaidbashayeer@gmail.com

Linkedin: https://www.linkedin.com/in/bashaer-a-665b86325?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app
