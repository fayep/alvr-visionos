//
//  Extensions/SwiftUI.swift
//

import SwiftUI
import CompositorServices

extension Scene {
  // Low and to the side of the view, rather than in the middle of it.
  func placeAsUtilityPanelForVisionOS2() -> some Scene {
#if XCODE_BETA_16
    if #available(visionOS 2.0, *) {
      return self.defaultWindowPlacement { _, _ in WindowPlacement(.utilityPanel) }
    } else {
      return self
    }
#else
    return self
#endif
  }

  func disableRestorationForVisionOS26() -> some Scene {
#if XCODE_BETA_26
    if #available(visionOS 26.0, *) {
      return self.restorationBehavior(.disabled)
    } else {
      return self
    }
#else
    return self
#endif
  }

  func disablePersistentSystemOverlaysForVisionOS2(shouldDisable: Visibility) -> some Scene {
#if XCODE_BETA_16
    if #available(visionOS 2.0, *) {
      return self.persistentSystemOverlays(shouldDisable)
    } else {
      return self
    }
#else
    return self
#endif
  }
}

extension View {

  @ViewBuilder
    func newGameControllerSupportForVisionOS2() -> some View {
#if XCODE_BETA_16
        if #available(visionOS 2.0, *) {  // Replace with the actual version where .handlesGameControllerEvents is available
            self.handlesGameControllerEvents(matching: .gamepad)
        } else {
            self
        }
#else
        self
#endif
    }
}
