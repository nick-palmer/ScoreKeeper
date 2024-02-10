import Toybox.Lang;
import Toybox.WatchUi;

var homeCount = 0;
var awayCount = 0;
var periodCount = 1;
var countState = 0;

class ScoreKeeperDelegate extends WatchUi.BehaviorDelegate {


    function initialize() {
        BehaviorDelegate.initialize();
        System.println( "delegate.initialize()" );
    }

    function onNextPage() as Boolean {
        System.println("delegate.onNextPage()");
        if(countState == 0) { awayCount = incrementCount(awayCount); }
        if(countState == 1) { awayCount = decrementCount(awayCount); }
        if(countState == 2) { periodCount = decrementCount(periodCount); }
        return true;
    }

    function onPreviousPage() as Boolean {
        System.println("delegate.onPreviousPage()");
        if(countState == 0) { homeCount = incrementCount(homeCount); }
        if(countState == 1) { homeCount = decrementCount(homeCount); }
        if(countState == 2) { periodCount = incrementCount(periodCount); }
        return true;
    }

    function onSelect() as Boolean {
        System.println("delegate.onSelect()");
        countState = (countState + 1) % 3;
        System.println("countState = " + countState);
        return true;
    }

    function onMenu() as Boolean {
        System.println("delegate.onMenu()");
        resetCounts();
        return true;
    }

    function incrementCount(value as Number) as Number {
        value++;
        if(value > 99) {
            return 0;
        }
        else {
            return value;
        }
    }

    function decrementCount(value as Number) as Number {
        value--;
        if(value < 0) {
            return 0;
        }
        else {
            return value;
        }
    }

    function resetCounts() as Void {
        if(homeCount == 0 && awayCount == 0) {
            periodCount = 1;
        }
        else {
            homeCount = 0;
            awayCount = 0;
        }
    }
}