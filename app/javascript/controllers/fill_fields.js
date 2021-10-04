(function() {
  'use strict';

  const User = {
    name:       'John Smith',
    email:      'john@smith.com',
    password:   'correct-horse-battery-staple',
    avatar:     '',
    bio:        'Everyone wants to enjoy the good parts - but you have to build the framework first. Now, we are going to fluff this cloud. \n–Bob Ross',
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
    terms:      true,
  };
  const date_today       = new Date(),
        date_today_day   = date_today.getDate().toString().slice(-2),
        date_today_month = (date_today.getMonth() + 1).toString().slice(-2),
        date_today_year  = date_today.getFullYear().toString();

  const date_tomorrow       = new Date();
        date_tomorrow.setDate(date_tomorrow.getDate() + 1);
  const date_tomorrow_day   = date_tomorrow.getDate().toString().slice(-2),
        date_tomorrow_month = (date_tomorrow.getMonth() + 1).toString().slice(-2),
        date_tomorrow_year  = date_tomorrow.getFullYear().toString();

  const fill_bootstrap  = document.querySelector('[data-fill="bootstrap"]');
  const fill_simpleform = document.querySelector('[data-fill="simpleform"]');

  const fillElement = (element, value) => {
    let el = document.querySelector(element);
    if (el && (el.matches('[type="checkbox"]') || el.matches('[type="radio"]'))) {
      el.checked = value
    }
    else if (el) { el.value = value; }
  };

  if (fill_bootstrap) {
    fill_bootstrap.addEventListener("click", (e) => {
      fillElement('#exampleInputName', User.name);
      fillElement('#exampleInputEmail', User.email);
      fillElement('#inline-email', User.email);
      fillElement('#exampleInputPassword', User.password);
      fillElement('#inline-password', User.password);
      fillElement('#exampleTextareaBio', User.bio);
      fillElement('#exampleInputDateYear', date_tomorrow_year);
      fillElement('#exampleInputDateMonth', date_tomorrow_month);
      fillElement('#exampleInputDateDay', date_tomorrow_day);
      fillElement('#exampleInlineRadio5', true);
      fillElement('#exampleInlineCheckbox3', true);
      fillElement('#exampleInlineCheckbox6', true);
      fillElement('#exampleInlineCheckbox7', true);
      fillElement('#exampleSelectMusic', User.music[0]);
      fillElement('#exampleCheckbox2', true);
      fillElement('#exampleCheckbox4', true);
      fillElement('#exampleSelectLanguage', User.language);
      fillElement('#exampleRadiosPillRed', true);
      fillElement('#exampleInputFriends', User.friends);
      fillElement('#exampleRangeMood', User.mood);
      fillElement('#exampleInputTimeHour', User.awake[0]);
      fillElement('#exampleInputTimeMinute', User.awake[1]);
      fillElement('#exampleInputDatetimeYear', date_today_year);
      fillElement('#exampleInputDatetimeMonth', date_today_month);
      fillElement('#exampleInputDatetimeDay', date_today_day);
      fillElement('#exampleInputDatetimeHour', User.first_kiss[0]);
      fillElement('#exampleInputDatetimeMinute', User.first_kiss[1]);
      fillElement('#exampleBooleanRadioYes', true);
      fillElement('#exampleCheckTerms', User.terms);
      fillElement('#inline-check', User.terms);
      fillElement('#flexSwitchCheckDefault', User.terms);
    });
  }

  if (fill_simpleform) {
    fill_simpleform.addEventListener("click", (e) => {
      fillElement('#user_name', User.name);
      fillElement('#user_email', User.email);
      fillElement('#user_password', User.password);
      fillElement('#user_avatar', User.avatar);
      fillElement('#user_bio', User.bio);
      fillElement('#user_birthday_1i', date_tomorrow_year);
      fillElement('#user_birthday_2i', date_tomorrow_month);
      fillElement('#user_birthday_3i', date_tomorrow_day);
      fillElement('#user_color_blue', true);
      fillElement('#user_fruit_cherry', true);
      fillElement('#user_fruit_lime', true);
      fillElement('#user_fruit_mango', true);
      fillElement('#user_music', User.music[0]);
      fillElement('#user_language', User.language);
      fillElement('#user_pill_red', User.pill);
      fillElement('#user_choises_b', true);
      fillElement('#user_choises_d', true);
      fillElement('#user_friends', User.friends);
      fillElement('#user_mood', User.mood);
      fillElement('#user_awake_4i', User.awake[0]);
      fillElement('#user_awake_5i', User.awake[1]);
      fillElement('#user_first_kiss_4i', User.first_kiss[0]);
      fillElement('#user_first_kiss_5i', User.first_kiss[1]);
      fillElement('#user_active_true', true);
      fillElement('#user_terms', User.terms);
    });
  }
})();
