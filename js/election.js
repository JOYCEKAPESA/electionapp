
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

var mainView = app.views.create('.view-main');

var loginScreen = app.loginScreen.create({
    el: '.login-screen'
});

loginScreen.open();

$$('#btn-sign-in').on('click', function(){
   //Call login function
   app.login('#login-form');
});

//Login function

app.login = function(formId){
//    var form = $$(formId);
    app.request({
        data:  {
            username: $$(formId).find('#username').val(),
            password: $$(formId).find('#password').val()
        },
        url: "http://localhost/election_panel/api.php?action=login",
        dataType: 'json',
        method: 'GET',
        beforeSend: function (xhr){
        },
        success: function (data, status, xhr){
            if(data.login_status === 'success'){
                loginScreen.close(); //Login details are valid so closing login form.
            }else {
               var toastBottom = app.toast.create({
                   text: 'Login failed, username or password is incorrect',
                   position: 'bottom',
                   closeTimeout: 6000
               });
               
               toastBottom.open();
            }
        },
        error: function (xhr, textStatus, errorThrouwn){
            console.log(errorThrouwn);
        }
        
    });
};

