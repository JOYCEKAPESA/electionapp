
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

//Custom template helpers
Template7.registerHelper("removeSpace", function (str) {
    return str.replace(" ", "_");
});

//Compile templates into javaScript functions
var voteSheet = Template7.compile($$('#vote-sheet').html());
var mainView = app.views.create('.view-main');
var loginScreen = app.loginScreen.create({
    el: '.login-screen'
});




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
                localStorage.election = JSON.stringify(data); //Store user login details
                loginScreen.close(); //Login details are valid so closing login form.

                app.getVoteSheet();
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

    var login_details = JSON.parse(localStorage.election);
    var faculty_id = login_details.faculty_id;
    var course_id = login_details.course_id;
    var batch_id = login_details.batch_id;
    
    app.request({
        url: "http://localhost/election_panel/api.php?action=vote_sheet" + '&faculty_id=' + faculty_id + '&course_id=' + course_id + '&batch_id=' + batch_id,
        dataType: 'json',
        success: function (data, status, xhr) {
            var html = voteSheet(data);
            $$('#vote-sheet-content').html(html);
        },
        error: function (xhr, textStatus, errorThrown) {
            console.log(errorThrown);
            console.log(xhr);
            console.log(textStatus);
        }
    });
};

app.castVotes = function () {
    //Get user details from local storage

    var login_details = JSON.parse(localStorage.election);
    var user_id = login_details.user_id;

    app.request({
        data: app.form.convertToData('#vote-form'), //get votes
        url: 'http://localhost/election_panel/api.php?action=cast_votes&user_id=' + user_id,
        dataType: 'json',
        success: function (data, status, xhr) {
            if (data.cast_status === "success") {
                var toastBottom = app.toast.create({
                    text: 'Thank you. Votes casted successfully!',
                    position: 'bottom',
                    closeTimeout: 6000
                });
                toastBottom.open();
            } else {
                $$('#btn-vote').show(); // Since the vote was not succeffully, enable vote button

                var toastBottom = app.toast.create({
                    text: "Can't cast votes please try again later.",
                    position: 'bottom',
                    closeTimeout: 6000
                });
                toastBottom.open();
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            console.log(errorThrown);
            console.log(textStatus);
            console.log(xhr);
        }
    });
};


function onHomeInit() {
//    app.getVoteSheet();

//Check if a user is already logged in
    if (localStorage.election) {
//        var login_details = JSON.parse(localStorage.election) //get ligin details from web storage
//        if (login_details.login_status === 'success') {
        //user is logged in, show candidates
        app.getVoteSheet();
//        } else {
//          
//        }
    } else {
        //User not logged in
        loginScreen.open(); //Show login screen
    }


    $$(document).on('click', '#btn-vote', function (e) {
        $$(this).hide();//remove vote buttono so a user can't vote more than once
        app.castVotes();
//        console.log(JSON.stringify(form));
    });
}
app.on('pageInit', function (page) {
    if (page.name === 'index')
        onHomeInit();
});
//trigger it
onHomeInit();
