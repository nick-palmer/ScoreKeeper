import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;

class ScoreKeeperView extends WatchUi.View {
    private var _homeScore;
    private var _awayScore;
    private var _periodCount;
    private var _selectLabel;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        _homeScore = findDrawableById("home_score");
        _awayScore = findDrawableById("away_score");
        _periodCount = findDrawableById("period_count");
        _selectLabel = findDrawableById("select_label");
        System.println("view.onLayout()");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        updateHomeScore(homeCount);
        updateAwayScore(awayCount);
        updatePeriod(periodCount);
        updateSelectLabel(countState);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function updateHomeScore(value as Number) as Void {
        _homeScore.setText(value.toString());
        WatchUi.requestUpdate();
    }

    function updateAwayScore(value as Number) as Void {
        _awayScore.setText(value.toString());
        WatchUi.requestUpdate();
    }

    function updatePeriod(value as Number) as Void {
        _periodCount.setText(value.toString());
        WatchUi.requestUpdate();
    }

    function updateSelectLabel(value as Number) as Void {
        if(value == 0) {
             _selectLabel.setText("+");
        }
        else if(value == 1) {
            _selectLabel.setText("-");
        }
        else if(value == 2) {
            _selectLabel.setText("p");
        }
        else {
            _selectLabel.setText(":(");
        }
        WatchUi.requestUpdate();
    }
}
