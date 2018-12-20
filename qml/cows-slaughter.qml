import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "service"

ApplicationWindow
{
    id: applicationWindow
    Dao { id: dao }

    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
