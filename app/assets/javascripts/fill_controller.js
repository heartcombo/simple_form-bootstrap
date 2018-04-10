$(document).ready(function() {
  'use strict';

  var User = {
    name:       'John Smith',
    email:      'john@smith.com',
    password:   'correct-horse-battery-staple',
    avatar:     '',
    bio:        'Everyone wants to enjoy the good parts - but you have to build the framework first. Now, we are going to fluff this cloud.',
    birthday:   '',
    color:      'blue',
    fruit:      ['cherry', 'lime', 'mango'],
    music:      ['pop', 'hip_hop', 'dance'],
    choises:    ['b', 'd'],
    language:   'en',
    pill:       'red',
    friends:    '99',
    mood:       '60',
    awake:      ['08', '30'],
    first_kiss: ['21', '30'],
    active:     'Yes',
    terms:      'true',
  };
  var date_today       = new Date(),
      date_today_day   = date_today.getDate().toString().slice(-2),
      date_today_month = (date_today.getMonth() + 1).toString().slice(-2),
      date_today_year  = date_today.getFullYear().toString();

  var date_tomorrow       = new Date();
      date_tomorrow.setDate(date_tomorrow.getDate() + 1);
  var date_tomorrow_day   = date_tomorrow.getDate().toString().slice(-2),
      date_tomorrow_month = (date_tomorrow.getMonth() + 1).toString().slice(-2),
      date_tomorrow_year  = date_tomorrow.getFullYear().toString();

  var $fill_bootstrap  = $('[data-fill="bootstrap"]');
  var $fill_simpleform = $('[data-fill="simpleform"]');

  $fill_bootstrap.click(function(event) {
    $('#exampleInputName').val(User.name);
    $('#exampleInputEmail').val(User.email);
    $('#exampleInputPassword').val(User.password);
    $('#exampleTextareaBio').val(User.bio);
    $('#exampleInputDateYear').val(date_tomorrow_year);
    $('#exampleInputDateMonth').val(date_tomorrow_month);
    $('#exampleInputDateDay').val(date_tomorrow_day);
    $('#exampleInlineRadio5').prop('checked', true);
    $('#exampleInlineCheckbox3, #exampleInlineCheckbox6, #exampleInlineCheckbox7').prop('checked', true);
    $('#exampleSelectMusic').val(User.music);
    $('#exampleCheckbox2, #exampleCheckbox4').prop('checked', true);
    $('#exampleSelectLanguage').val(User.language);
    $('#exampleRadiosPillRed').prop('checked', true);
    $('#exampleCheckActive').prop('checked', User.active);
    $('#exampleInputFriends').val(User.friends);
    $('#exampleRangeMood').val(User.mood);
    $('#exampleInputTimeHour').val(User.awake[0]);
    $('#exampleInputTimeMinute').val(User.awake[1]);
    $('#exampleInputDatetimeYear').val(date_today_year);
    $('#exampleInputDatetimeMonth').val(date_today_month);
    $('#exampleInputDatetimeDay').val(date_today_day);
    $('#exampleInputDatetimeHour').val(User.first_kiss[0]);
    $('#exampleInputDatetimeMinute').val(User.first_kiss[1]);
    $('#exampleBooleanRadioYes').prop('checked', true);
    $('#exampleCheckTerms').prop('checked', User.terms);
  });

  $fill_simpleform.click(function(event) {
    $('#user_name').val(User.name);
    $('#user_email').val(User.email);
    $('#user_password').val(User.password);
    $('#user_avatar').val(User.avatar);
    $('#user_bio').val(User.bio);
    $('#user_birthday').val(date_tomorrow);
    $('#user_birthday_1i').val(date_tomorrow_year);
    $('#user_birthday_2i').val(date_tomorrow_month);
    $('#user_birthday_3i').val(date_tomorrow_day);
    $('#user_color').val(User.color);
    $('#user_color_blue').prop('checked', true);
    $('#user_fruit').val(User.fruit[0]);
    $('#user_fruit_cherry, #user_fruit_lime, #user_fruit_mango').prop('checked', true);
    $('#user_music').val(User.music[0]);
    $('#user_language').val(User.language);
    $('#user_pill').val(User.pill);
    $('#user_pill_red').prop('checked', User.pill);
    $('#user_active').prop('checked', User.active);
    $('#user_choises').val(User.choises[0]);
    $('#user_choises_b, #user_choises_d').prop('checked', true);
    $('#user_friends').val(User.friends);
    $('#user_mood').val(User.mood);
    $('#user_awake').val(User.awake[0]);
    $('#user_awake_4i').val(User.awake[0]);
    $('#user_awake_5i').val(User.awake[1]);
    $('#user_first_kiss').val(User.first_kiss[0]);
    $('#user_first_kiss_4i').val(User.first_kiss[0]);
    $('#user_first_kiss_5i').val(User.first_kiss[1]);
    $('#user_active').val(User.active);
    $('#user_active_true').prop('checked', true);
    $('#user_terms').prop('checked', User.terms);

    if ( $('#user_avatar').attr('type') == 'hidden' ) {
      $('#user_avatar').val('file.png');
    } else {
      // $('#user_avatar').click();
    }
  });
});
