# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = cows-slaughter

CONFIG += sailfishapp

SOURCES += src/cows-slaughter.cpp

DISTFILES += qml/cows-slaughter.qml \
    qml/cover/CoverPage.qml \
    rpm/cows-slaughter.changes.in \
    rpm/cows-slaughter.changes.run.in \
    rpm/cows-slaughter.spec \
    rpm/cows-slaughter.yaml \
    translations/*.ts \
    cows-slaughter.desktop \
    qml/pages/GamePage.qml \
    qml/pages/MainMenu.qml \
    qml/pages/GameOverPage.qml \
    qml/pages/YouWonPage.qml \
    qml/pages/RatingsPage.qml \
    qml/DB.js \
    qml/pages/AuthPage.qml \
    qml/pages/AboutPage.qml \

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/cows-slaughter-de.ts
