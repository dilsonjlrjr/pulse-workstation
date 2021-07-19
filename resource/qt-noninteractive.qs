// Emacs mode hint: -*- mode: JavaScript -*-

// EVERYTHING DOCUMENTED HERE http://doc.qt.io/qtinstallerframework/noninteractive.html#start-menu-directory-page

function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

// WELCOME -> NEXT
Controller.prototype.WelcomePageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

// LOGIN -> SKIP
Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
    // gui.clickButton(buttons.SkipButton);
}

// SETUP -> NEXT
Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

// INSTALLATION FOLDER -> NEXT
Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.clickButton(buttons.NextButton);
}

// SELECT COMPONENTS -> NEXT
Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();

    widget.selectAll();
    //widget.deselectAll();

    //widget.selectComponent("qt.55.gcc_64");
    //widget.selectComponent("qt.55.qtquickcontrols");
    // widget.deselectComponent("qt.tools.qtcreator");
    // widget.deselectComponent("qt.55.qt3d");
    // widget.deselectComponent("qt.55.qtcanvas3d");
    // widget.deselectComponent("qt.55.qtlocation");
    // widget.deselectComponent("qt.55.qtquick1");
    // widget.deselectComponent("qt.55.qtscript");
    // widget.deselectComponent("qt.55.qtwebengine");
    // widget.deselectComponent("qt.extras");
    // widget.deselectComponent("qt.tools.doc");
    // widget.deselectComponent("qt.tools.examples");

    gui.clickButton(buttons.NextButton);
}

// LICENSE AGREE -> RADIO IAGREE -> NEXT
Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
    gui.clickButton(buttons.CommitButton);
}

// Completing the Qt 5.6.2 Wizard Page (???) -> Uncheck "Launch Qt Creator" checkbox -> FINISH
Controller.prototype.FinishedPageCallback = function() {
    // THIS LINE DOESN'T SEEM TO WORK -- QTCREATOR OPENS
    gui.currentPageWidget().RunItCheckBox.setChecked(false);
    gui.clickButton(buttons.FinishButton);
}
