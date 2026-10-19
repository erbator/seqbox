pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  // start in whichever mode theme.sh last set
  FileView {
    id: savedTheme
    path: Quickshell.env("HOME") + "/.cache/rumda-theme"
    blockLoading: true
    printErrors: false
  }
  readonly property bool cShowLightBar: savedTheme.text().trim() !== "dark"

  // User Configuration
  readonly property string cUsername: Quickshell.env("USER") || "user"
  readonly property string cConfigPath: Quickshell.env("HOME") + "/.config/rumda/flavours/pixel-rumda/quickshell"
  readonly property string cProfilePathLight: Quickshell.env("HOME") + "/.config/quickshell/pictures/profile.png"  // profile pic in the dashboard
  readonly property string cProfilePathDark: Quickshell.env("HOME") + "/.config/quickshell/pictures/profile-dark.png"  // profile pic in the dashboard
  readonly property string cGifPath: Quickshell.env("HOME") + "/.config/rumda/flavours/pixel-rumda/walk2.gif"  // profile pic in the dashboard
  readonly property string cGithubUsername: "erbator"   // obviously, if you aren't me, which you aren't, just change this into you github username
  readonly property string cFileManager: "thunar" // or change it to "yazi", or "thunar" or whatever file manager you like
  readonly property string cBrowser: "brave-origin" // or whatever browser you like
  readonly property string cTerminal: "kitty" // same thing here

  // tweak this if your dashboard has weird proportions because of screen size
  readonly property int cDashboardWidth: 580
  readonly property int cDashboardHeight: 500

  readonly property bool cEnableCat: true // set this to true to have the cat at the top of the bar
  // I disabled the cat by default because it looks weird when I theme-switch, but
  // you can also just kick it off by clicking on it, before switching themes.
}
