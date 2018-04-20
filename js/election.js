
var app = new Framework7({
// App root element
    root: '#app',
    // App Name
    name: 'Election',
    // App id
    id: 'com.myapp.test',
    // Enable swipe panel
    panel: {
        swipe: 'left'
    }
// Add default routes
//    routes: [
//        {
//            path: '/about/',
//            url: 'about.html'
//        }
//    ]
// ... other parameters
});
var $$ = Dom7;
//Compile templates into javaScript functions
var voteSheet = Template7.compile($$('#vote-sheet').html());
var mainView = app.views.create('.view-main');
var loginScreen = app.loginScreen.create({
    el: '.login-screen'
});
//loginScreen.open();// for now

//kwa sasa tuoneshe tu wagombea ila uhalisia inatakiwa waonekane baada ya kulogin


$$('#btn-sign-in').on('click', function () {
//Call login function
    app.login('#login-form');
});
//Login function

app.login = function (formId) {
//    var form = $$(formId);
    app.request({
        data: {
            username: $$(formId).find('#username').val(),
            password: $$(formId).find('#password').val()
        },
        url: "http://localhost/election_panel/api.php?action=login",
        dataType: 'json',
        method: 'GET',
        beforeSend: function (xhr) {
        },
        success: function (data, status, xhr) {
            if (data.login_status === 'success') {
                loginScreen.close(); //Login details are valid so closing login form.

//                 app.getVoteSheet();
            } else {
                var toastBottom = app.toast.create({
                    text: 'Login failed, username or password is incorrect',
                    position: 'bottom',
                    closeTimeout: 6000
                });
                toastBottom.open();
            }
        },
        error: function (xhr, textStatus, errorThrouwn) {
            console.log(errorThrouwn);
        }

    });
};
//Get vote sheet
app.getVoteSheet = function () {
    app.request({
        url: "http://localhost/election_panel/api.php?action=vote_sheet",
        dataType: 'json',
        success: function (data, status, xhr) {
            var html = voteSheet(data);
            $$('#vote-sheet-content').html(html);
        },
        error: function (xhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
};
app.castVotes = function () {
    app.request({
        data: app.form.convertToData('#vote-form'), //get votes
        url: 'http://localhost/election_panel/api.php?action=cast_votes',
        dataType: 'json',
        success: function (data, status, xhr) {
        },
        error: function (xhr, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
};


function onHomeInit() {
    app.getVoteSheet();

    $$(document).on('click', '#btn-vote', function (e) {
        app.castVotes();
//        console.log(JSON.stringify(form));
    });
}
;
app.on('pageInit', function (page) {
    if (page.name === 'index')
        onHomeInit();
});
//trigger it
onHomeInit();
